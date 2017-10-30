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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var navigationBarAppearace = UINavigationBar.appearance()
        
        self.title = "Add Note"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmitClicked(_ sender: Any){
    
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Its has been unwinded")
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
