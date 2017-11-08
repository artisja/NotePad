//
//  AddNoteViewController.swift
//  NotePad
//
//  Created by Justin Artis on 10/28/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import Firebase

class AddNoteViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    var createdNote = Note(title: "", info: "")
    @IBOutlet weak var newTitleLabel: UITextField!
    @IBOutlet weak var newWordingField: UITextField!
    var ref: DatabaseReference!
    var user = Auth.auth()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmitClicked(_ sender: Any){
     createdNote.noteInfo = newWordingField.text!
     createdNote.noteTitle = newTitleLabel.text!
     print(createdNote.noteTitle)
     print(createdNote.noteInfo)
     var noteKey = String(arc4random())
     self.ref.child("Users").child((user.currentUser?.uid)!).child(noteKey).child("Info").setValue(createdNote.noteInfo)
     self.ref.child("Users").child((user.currentUser?.uid)!).child(noteKey).child("Title").setValue(createdNote.noteTitle)
     self.ref.child("Users").child((user.currentUser?.uid)!).child("Note Repo").child(noteKey).setValue(noteKey)
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
