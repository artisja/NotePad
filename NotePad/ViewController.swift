//
//  ViewController.swift
//  NotePad
//
//  Created by Justin Artis on 10/18/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var signInCheckButton: UIButton!
    var switchBool = false
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submitLogin(_ sender: Any) {
        var email = usernameField.text
        var password = passwordField.text
        Auth.auth().signIn(withEmail: email!, password: password!) { (User, Error) in}

        if Auth.auth().currentUser !== nil {
            switchBool = true
            switchButton()
            performSegue(withIdentifier: "decisionSegue", sender: sender)
        }
        let firebaseAuth = Auth.auth()
//        do{
//            try firebaseAuth.signOut()
//        }catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)}
    }
    
    func switchButton() -> Void {
        if !switchBool {
            switchBool = false
            signInCheckButton.backgroundColor = UIColor.brown
                    }else{
            switchBool = true
            signInCheckButton.backgroundColor = UIColor.green
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "decisionSegue"{
            if let decisionVC = segue.destination as? DecisionViewController{
                decisionVC.firebaseUser = Auth.auth()
            }
        }
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

