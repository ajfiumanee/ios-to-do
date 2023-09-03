//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by Alberto Oliveira Jr on 02/09/23.
//

import FirebaseFirestore
import Foundation


/// ViewModel for list of items view
/// primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    ///  - Parameter id: item id to delete
    func delete(id: String) {
        guard !id.isEmpty else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}