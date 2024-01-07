//
//  ChengePasswordView.swift
//  SwiftEcommerce
//
//  Created by kundan kapgate on 07/01/24.
//

struct PasswordUpdateDetails: Decodable, Encodable {
    let current_password: String
    let password: String
    let password_confirmation: String
}

struct UpdateResponse: Decodable {
    let status: Bool
    let message: String
}


import SwiftUI

struct ChangePasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var current_password: String = ""
    @State private var password: String = ""
    @State private var password_confirmation: String = ""
    
    @State private var successMessage: String = ""
    @State private var errorMessage: String = ""
    
    @State private var showAlert: Bool = false
    
    func handleUpdatePassword() {
        
        let data = PasswordUpdateDetails(
            current_password: current_password,
            password: password,
            password_confirmation: password_confirmation
        )
        
        let url = URL(string: "\(apiBaseUrl)/api/user/update/details")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(data)
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.setValue("Bearer \(UserDefaults.standard.string(forKey: "accessToken")!)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode(UserUpdateResponse.self, from: data)
                    if apiResponse.status == false {
                        errorMessage = apiResponse.message
                    }
                    else {
                        successMessage = apiResponse.message
                        showAlert = true
                        errorMessage = ""
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }


    
    var body: some View {
        NavigationStack{
            
            ScrollView{
                VStack {
                    
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
                   
                    InputBox(text: $current_password, placeHolder: "Enter Current Password", label: "Current Password")
                        .padding(.bottom, 10)
                        .autocapitalization(.none)
                        
                    InputBox(text: $password, placeHolder: "Enter password", label: "Password")
                        .padding(.bottom, 10)
                        .autocapitalization(.none)
                    
                    InputBox(text: $password_confirmation, placeHolder: "Enter Password Confirmation", label: "Password Confirmation")
                        .padding(.bottom, 10)
                        .autocapitalization(.none)

                    
                    ButtonPrimary(handleClick: {
                        handleUpdatePassword()
                    }, text: "Save Changes")
                    
                }.padding()
            }.onAppear()
            .alert(successMessage, isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    dismiss()
                }
            }
        
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }, label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                            .font(.subheadline)
                    }).foregroundColor(Color.ascentDark)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Change Password")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.ascentDark)
                }
            }

    }
}

#Preview {
    ChangePasswordView()
}

