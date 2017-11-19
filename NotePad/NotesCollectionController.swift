//
//  NotesCollectionController.swift
//  NotePad
//
//  Created by Justin Artis on 10/19/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "NotesCell"

class NotesCollectionController: UICollectionViewController {

    @IBOutlet var notesCollectionView: UICollectionView!
    var currentNotes = [Note]()
    var ref: DatabaseReference!
    let currUser = Auth.auth().currentUser?.uid
    var noteReferences = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        //add way to get keys so you can iterate through and add to note
        
//        ref.child("Users").child(currUser!).observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let title = value?["Title"] as? String ?? ""
//            let info  = value?["Info"] as? String ?? ""
//            let note = Note(title: title, info:info)
//            print(note.noteInfo)
//            print(note.noteTitle)
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }

//        self.collectionView?.backgroundColor = UIColor(hue: 0.8556, saturation: 0.18, brightness: 1, alpha: 1.0) /* #ffd1f8 */

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "NotesCell")
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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.noteReferences.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell: NotesCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotesCell", for: indexPath) as! NotesCollectionCell
        // Configure the cell
        cell.noteTitleButton.setTitle(currentNotes[indexPath.row].noteTitle, for: .normal)
//        cell.notesTitleButton.setTitleColor(UIColor.black, for: .normal)
        cell.noteTitleButton.tag = indexPath.row
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromTitleSegue"{
            if let noteVC = segue.destination as? NoteViewController{
                let button = sender as? UIButton
                //currentNotes[(button?.tag)!]
                noteVC.selectedNote = currentNotes[(button?.tag)!]
            }
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
