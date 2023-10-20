//
//  AuthenticationFirebaseDatasource.swift
//  Care
//
//  Created by ximena juana mejia jacobo on 19/10/23.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
    
}
final class AuthenticationFirebaseDatasource {
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else{
            return nil
        }
        return .init(email: email)
    }
    func createNewUser(email: String, password: String, completionBlok: @escaping (Result<User, Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password){ authDataResult, error in
            if let error = error {
                print("Error al crear el nuevo usuario\(error.localizedDescription)")
                completionBlok(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("New User Created With info \(email)")
            completionBlok(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completionBlok: @escaping (Result<User, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password){ authDataResult, error in
            if let error = error {
                print("Error login user\(error.localizedDescription)")
                completionBlok(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("User login With info \(email)")
            completionBlok(.success(.init(email: email)))
        }
    }
    
    
    
    
    
    func logout() throws{
        try Auth.auth().signOut()
    }
}
