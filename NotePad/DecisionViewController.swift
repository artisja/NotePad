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
    var firebaseUser: Auth? = nil
    @IBOutlet weak var userLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(noteList)
        userLabel.text = firebaseUser?.currentUser?.email
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindSegue"{
            print("segue")
            if let oldNewNote = segue.destination as? AddNoteViewController{
                let newNote = oldNewNote.createdNote
                noteList.append(newNote)
                
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
