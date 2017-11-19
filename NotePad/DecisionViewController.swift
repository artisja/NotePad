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
    var firebaseUser: Auth? = nil
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
        userLabel.text = firebaseUser?.currentUser?.email
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getNoteList() -> Void {
        setUpData()
        //add retrieval from database
//        for note in noteList{
//        self.ref.child("Users").child((firebaseUser?.currentUser?.uid)!).child(note.noteTitle).setValue(note.noteInfo)
//        }
    }
    
    func setUpData() -> Void{
        var i = 0
        while i<10{
            noteList.append(Note(title: "Duke",info: "University in Durham, North Carolina"));
            i += 1
        }
    }
    
    func getDatabaseInfo(completionHandler:@escaping ([Any]?) -> Void){
        ref = Database.database().reference()
        var currUser = firebaseUser?.currentUser?.uid
        ref = ref.child("Users").child(currUser!)
        ref.child("Note Repo").observeSingleEvent(of: .value, with: { snapshot  in
            var dictValue = snapshot.value as? NSDictionary
            var notes = [Note]()
            var keys = dictValue?.allKeys
            self.noteRefList = (dictValue?.allKeys) as! [String]
            for noteKey in self.noteRefList {
                self.ref.child(String(noteKey)).observeSingleEvent(of: .value, with: { snapshot in
                if let note = snapshot.value as? NSDictionary{
                  var madeNote = Note(title: note.value(forKey: "Title") as! String, info: note.value(forKey: "Info") as! String)
                    self.noteList.append(madeNote)
                    }
                })
                // var infoData = self.ref.child(String(noteKey)).value(forKey: "Info")
               //var titleData = self.ref.child(String(noteKey)).value(forKey: "Title")
              // print(infoData)
              // print(titleData)
            }
            completionHandler(notes)
        })
        
        
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
