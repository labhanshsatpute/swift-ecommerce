import SwiftUI

struct RegisterView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var number: String = ""
    @State private var choosePassword: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationStack {
                
            ZStack {
                Color.ascent.ignoresSafeArea()
                
                Circle()
                    .scale(1.9)
                    .foregroundColor(.white)
                
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
                        
                        ButtonPrimary(rightIcon: "chevron.right", text: "SignUp")
                            .padding(.bottom, 10)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Already have an account ?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.black)
                        }
                    }
                    
                }.padding(.horizontal, 20)
            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisterView()
}
