import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var redirectToSignUp = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.ascent.ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.3))
                
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white)
                
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
                    
                    VStack {
                        InputBox(text: $email, placeHolder: "Enter Email", label: "Email Address")
                            .padding(.bottom, 10)
                        InputBox(text: $password, placeHolder: "Enter Password", label: "Password")
                            .padding(.bottom, 10)
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forgot password?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.black)
                        }
                        ButtonPrimary(rightIcon: "chevron.right", text: "Login")
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
                        
                        
                    }
                    
                }.padding(50)


            }
        }.navigationTitle("")

    }
}

#Preview {
    LoginView()
}
