//
//  AuthView.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import SwiftUI

struct AuthView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            // App Logo
            Image("YourAppLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)

            // Email Input Field
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            // Password Input Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 20)

            // Login Button
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal, 20)
            }

            // Divider
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                Text("or")
                    .foregroundColor(.gray)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 30)

            // Apple Login Button
            Button(action: {
                // Handle Apple login action
            }) {
                HStack {
                    Image(systemName: "applelogo")
                        .font(.title)
                    Text("Sign in with Apple")
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(8)
                .padding(.horizontal, 20)
            }

            // Google Login Button
            Button(action: {
                // Handle Google login action
            }) {
                HStack {
                    Image("googleLogo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Sign in with Google")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal, 20)
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    AuthView()
}
