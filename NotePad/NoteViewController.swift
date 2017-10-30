//
//  NoteViewController.swift
//  NotePad
//
//  Created by Justin Artis on 10/20/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    var selectedNote = Note(title: "", info: "")
    var noteList = [Note]()
    var noteNumber = 0
    
    
    @IBOutlet weak var noteDescriptLabel: UILabel!
    @IBOutlet weak var noteNavItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noteNavItem.title = selectedNote.noteTitle
        noteDescriptLabel.text = selectedNote.noteInfo
        noteDescriptLabel.numberOfLines = 0
        // Do any additional setup after loading the view.
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
