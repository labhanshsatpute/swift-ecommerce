import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack(alignment: .center) {
                    
                    VStack(alignment: .center) {
                        Text("Forgot Password")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.ascentDark)
                            .padding(.bottom, 3)
                        Text("Enter your email to get verification OTP")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(Color.gray)
                    }.padding(.bottom, 20)
                    
                    VStack {
                        InputBox(text: $email, placeHolder: "Enter Email", label: "Email Address")
                            .padding(.bottom, 10)
                        ButtonPrimary(rightIcon: "paperplane", text: "Send OTP")
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
                        NavigationLink(destination: LoginView()) {
                            Text("Already have an account ?")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .padding(.bottom, 10)
                                .foregroundColor(Color.black)
                        }
                    }

                }.padding(50)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ForgotPasswordView()
}
