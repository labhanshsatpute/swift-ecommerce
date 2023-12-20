import SwiftUI


struct RegisterData: Encodable {
    let email: String
    let phone: String
    let name: String
    let password: String
    let password_confirmation: String
}

struct RegisterView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var number: String = ""
    @State private var choosePassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String = ""
    @State private var redirectToHome: Bool = false
    
    func handleRegister() {
        
        let data = RegisterData(
            email: email,
            phone: number,
            name: name,
            password: choosePassword,
            password_confirmation: confirmPassword
        )
        
        let url = URL(string: "\(apiBaseUrl)/api/user/register")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(data)
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode(AuthDataResponse.self, from: data)
                    if apiResponse.status == false {
                        errorMessage = apiResponse.message
                    }
                    else {
                        errorMessage = ""
                        redirectToHome = true
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    var body: some View {
        NavigationStack {
                
            ZStack {
                
                VStack(alignment: .center) {
                    Text("SignUp")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ascentDark)
                        .padding(.bottom, 3)
                    Text("Please fill your credentials to login")
                        .padding(.bottom)
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                    
                    if !errorMessage.isEmpty {
                        HStack{
                            Image(systemName: "exclamationmark.circle")
                            Text(errorMessage)
                        }
                        .padding(.bottom, 20)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.red)

                    }
                    
                    VStack {
                        InputBox(text: $name, placeHolder: "Enter Name", label: "Name")
                            .padding(.bottom, 10)
                        InputBox(text: $email, placeHolder: "Enter Email", label: "Email")
                            .padding(.bottom, 10)
                        InputBox(text: $number, placeHolder: "Enter Number", label: "Phone Number")
                            .keyboardType(.numberPad)
                            .padding(.bottom, 10)
                        InputBox(text: $choosePassword, placeHolder: "Choose Password", label: "Choose Password")
                            .padding(.bottom, 10)
                        InputBox(text: $confirmPassword, placeHolder: "Confirg Password", label: "Confirg Password")
                            .padding(.bottom, 10)
                        
                        ButtonPrimary(handleClick: {
                            self.handleRegister()
                        }, rightIcon: "chevron.right", text: "SignUp")
                            .padding(.bottom, 10)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Already have an account ?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.black)
                        }
                    }.textInputAutocapitalization(.never)
                    
                }.padding(.horizontal, 40)
                
                NavigationLink(destination: ContentView(), isActive: $redirectToHome) {
                    
                }

            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisterView()
}
