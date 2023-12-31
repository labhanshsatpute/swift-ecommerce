import SwiftUI


struct LoginData: Encodable {
    let email: String
    let password: String
}

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var redirectToSignUp = false
    @State private var errorMessage: String = ""
    @State private var redirectToHome: Bool = false
    
    func handleLogin() {
        
        let data = LoginData(
            email: email,
            password: password
        )
        
        let url = URL(string: "\(apiBaseUrl)/api/user/login")!

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
                        UserDefaults.standard.set(apiResponse.data!.token, forKey: "accessToken")
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
                    
                    VStack(alignment: .center) {
                        Text("SignIn")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.ascentDark)
                            .padding(.bottom, 3)
                        Text("Please fill your credentials to login")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(Color.gray)
                    }.padding(.bottom, 20)
                    
                    if !errorMessage.isEmpty {
                        HStack {
                            Image(systemName: "exclamationmark.circle")
                            Text(errorMessage)
                        }
                        .padding(.bottom, 20)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.red)

                    }
                    
                    VStack {
                        InputBox(text: $email, placeHolder: "Enter Email", label: "Email Address")
                            .padding(.bottom, 10)
                            .autocapitalization(.none)
                        InputBox(text: $password, placeHolder: "Enter Password", label: "Password")
                            .padding(.bottom, 10)
                            .autocapitalization(.none)
                        
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forgot password?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.black)
                        }
                        ButtonPrimary(handleClick: {
                            self.handleLogin()
                        }, rightIcon: "chevron.right", text: "Login")
                            .padding(.bottom, 10)
                        HStack {
                            VStack {
                                Divider()
                            }.padding(.trailing, 5)
                            Text("OR")
                                .font(.footnote)
                                .foregroundColor(Color.gray)
                            VStack {
                                Divider()
                            }.padding(.leading, 5)
                        }.padding(.bottom, 10)
                        
                        
                        NavigationLink(destination: RegisterView(), isActive: $redirectToSignUp ,  label: {
                            
                            ButtonSecondary(handleClick: {
                                redirectToSignUp = true
                            },text: "Dosen't have an account ?")
                            .padding(.bottom, 10)
                        })
                        
                    }.textInputAutocapitalization(.never)
                    
                }.padding(50)
                
                NavigationLink(destination: ContentView(selectedTab: "Home"), isActive: $redirectToHome) {
                    
                }
                
            }
        }.navigationBarBackButtonHidden(true)
        
        

    }
}

#Preview {
    LoginView()
}
