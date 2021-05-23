//
//  StorageService.swift
//  iChat
//
//  Created by MacBookPro on 23.05.2021.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class StorageService {
    static let shared = StorageService()
    
    let storageRef = Storage.storage().reference()
    
    private var avatarRef: StorageReference {
        return storageRef.child("avatars")
    }
    
    private var currentUserId: String {
        return Auth.auth().currentUser!.uid
    }
    
    func upload(photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let scaleImage = photo.scaledToSafeUploadSize, let imageData = scaleImage.jpegData(compressionQuality: 0.4) else { return }
        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        avatarRef.child(currentUserId).putData(imageData, metadata: metaData) { (metaData, error) in
            guard let _ = metaData else {
                completion(.failure(error!))
                return
            }
            self.avatarRef.child(self.currentUserId).downloadURL { (url, error) in
                guard let downloadURL = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(downloadURL))
            }
        }
        
    }
}
