//
//  ListenerService.swift
//  iChat
//
//  Created by MacBookPro on 24.05.2021.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class ListenerService {
    static let shared = ListenerService()
    
    private let db = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return db.collection("users")
    }
    private var currentUserId: String {
        return Auth.auth().currentUser!.uid
    }
    
    func userObserve(users: [MUser], completion: @escaping (Result<[MUser], Error>) -> Void) -> ListenerRegistration? {
        var users = users
        let usersListener = userRef.addSnapshotListener { (querySnapshot, error) in
            guard let snapshot = querySnapshot else {
                completion(.failure(error!))
                return
            }
            snapshot.documentChanges.forEach { (diff) in
                guard let muser = MUser(document: diff.document) else { return }
                switch diff.type {
                case .added:
                    guard !users.contains(muser) else { return }
                    guard muser.id != self.currentUserId else { return }
                    users.append(muser)
                case .modified:
                    guard let index = users.firstIndex(of: muser) else { return }
                    users[index] = muser
                case .removed:
                    guard let index = users.firstIndex(of: muser) else { return }
                    users.remove(at: index)
                }
            }
            completion(.success(users))
        }
        return usersListener
    }

}
