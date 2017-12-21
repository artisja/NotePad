//
//  DecisionViewController.swift
//  NotePad
//
//  Created by Justin Artis on 10/28/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import Firebase

class DecisionViewController: UIViewController {

    var noteList = [Note]()
    var ref: DatabaseReference!
    var noteRefList = [String]()
    var firebaseUser: Auth! = Auth.auth()
    @IBOutlet weak var userLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getNoteList()
        getDatabaseInfo{ (notes) in
            if let notes = notes{
                self.noteList = notes as! [Note]
            }
        }
        self.title = "Home"//firebaseUser?.currentUser?.email
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getNoteList() -> Void {
       //setUpData()
        //add retrieval from database
        self.ref.child((firebaseUser.currentUser?.uid)!).child("Note Repo").observeSingleEvent(of: .value, with: {snapshot in
        
        var dict = snapshot.value as! NSDictionary
        //print(dict)
        for item in dict{
                var tempNote = item.value
                self.noteRefList.append(tempNote as! String)
        }
            
            for noteKey in self.noteRefList {
                var tempRef = Database.database().reference().child((self.firebaseUser.currentUser?.uid)!)
                tempRef.child(noteKey).observeSingleEvent(of: .value, with: { snapshot in
                    if let note = snapshot.value as? NSDictionary{
                            var madeNote = Note(title: note.value(forKey: "Title") as! String, info: note.value(forKey: "Info") as! String)
                            print(madeNote)
                            self.noteList.append(madeNote)
            }
            //     completionHandler(notes)
            })
            
        }

        })
    }
    
    func getDatabaseInfo(completionHandler:@escaping ([Any]?) -> Void){
        var currUser = firebaseUser?.currentUser?.uid
        self.ref = self.ref.child("Users").child(currUser!)
        var notes = [Note]()
        //print(self.noteRefList)
                //print(self.ref.child(noteKey).key)
                //print(noteKey)
                //self.ref.child(noteKey).observeSingleEvent(of: .value, with: { snapshot in
                //if let note = snapshot.value as? NSDictionary{
                 //print(note)
                //  var madeNote = Note(title: note.value(forKey: "Title") as! String, info: note.value(forKey: "Info") as! String)
                    //print(madeNote)
                //    self.noteList.append(madeNote)
                //    notes.append(madeNote)
                //    }
               //     completionHandler(notes)
                //})
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindSegue"{
            print("segue")
//            if let oldNewNote = segue.destination as? AddNoteViewController{
//                let newNote = oldNewNote.createdNote
//                noteList.append(newNote)
//            }
           //add note database
        }else if segue.identifier == "fromTitleSegue"{
            if let NotesVC = segue.destination as? NotesCollectionController{
                NotesVC.noteReferences = self.noteRefList
                NotesVC.currentNotes = self.noteList
                }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
