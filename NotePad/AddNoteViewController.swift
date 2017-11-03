//
//  AddNoteViewController.swift
//  NotePad
//
//  Created by Justin Artis on 10/28/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    var createdNote = Note(title: "", info: "")
    @IBOutlet weak var newTitleLabel: UITextField!
    @IBOutlet weak var newWordingField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
