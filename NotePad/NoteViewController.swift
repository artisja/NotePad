//
//  NoteViewController.swift
//  NotePad
//
//  Created by Justin Artis on 10/20/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class NoteViewController: UIViewController {

    var selectedNote = Note(title: "", info: "")
    var noteList = [Note]()
    var noteRefList = [String]()
    var noteNumber = 0
    var user = Auth.auth().currentUser!
    var ref: DatabaseReference!
    var noteKey = String()
    var currUser = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var noteTitleLabel: UILabel!
    @IBOutlet weak var noteDescriptLabel: UITextView!
    @IBOutlet weak var noteNavItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTitleLabel.text = selectedNote.noteTitle
        noteDescriptLabel.text = selectedNote.noteInfo
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        updateNote()
    }
    
    
    func updateNote(){
        self.ref = Database.database().reference()
        var noteDescript = noteDescriptLabel.text
        self.ref = self.ref.child("Users")
        self.ref.child("Users").child((user.uid)).child(noteKey).child("Info").setValue(noteDescript)
        self.ref.child("Users").child((user.uid)).child(noteKey).child("Title").setValue(noteTitleLabel.text)
        self.ref = Database.database().reference()
        self.ref.child((user.uid)).child(noteKey).child("Info").setValue(noteDescript)
        self.ref.child((user.uid)).child(noteKey).child("Title").setValue(noteTitleLabel.text)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
