//
//  TaskRepository.swift
//  Done
//
//  Created by Oğuz Karatoruk on 13.07.2022.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    var isFirstLaunch = false
    @Published var tasks = [Task]()
    
    init() {
        //FirebaseApp.configure()
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { result, error in
                self.loadData(userId: result?.user.uid)
            }
        } else {
            loadData(userId: Auth.auth().currentUser?.uid)
        }
        isFirstLaunch = UserDefaults.isFirstLaunch()
    }
    
    func loadData(userId: String?){
        //guard let userId = Auth.auth().currentUser?.uid else { return }
        db.collection("tasks")
            .whereField("userId", isEqualTo: userId)
            .order(by: "completed")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do {
                        let data = try document.data(as: Task.self)
                        return data
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addTask(_ task: Task) {
        do {
            var addedTask = task
            let userId = Auth.auth().currentUser?.uid
            addedTask.userId = userId
            let _ = try db.collection("tasks").addDocument(from: addedTask)
        } catch {
            fatalError("unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task) {
        if let taskId = task.id, let userId = Auth.auth().currentUser?.uid {
            do {
                var updatedTask = task
                updatedTask.userId = userId
                try db.collection("tasks").document(taskId).setData(from: updatedTask)
            }  catch {
                fatalError("unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteTask(_ task: Task) {
        if let taskId = task.id, let userId = Auth.auth().currentUser?.uid {
            var taskToRemove = task
            let userId = Auth.auth().currentUser?.uid
            taskToRemove.userId = userId
            db.collection("tasks").document(taskId).delete() { err in
              if let err = err {
                print("Error removing document: \(err)")
              }
              else {
                print("Document successfully removed!")
              }
            }
        }

    }
}
