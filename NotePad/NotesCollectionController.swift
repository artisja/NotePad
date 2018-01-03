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
private let currUser = Auth.auth().currentUser?.uid

class NotesCollectionController: UICollectionViewController {

    @IBOutlet var notesCollectionView: UICollectionView!
    var currentNotes = [Note]()
    var noteRefList = [String]()
    var noteList = [Note]()
    var noteReferences = [String]()
    var ref = Database.database().reference().child((currUser)!).child("Note Repo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        self.navigationItem.backBarButtonItem?.title = "Decision"
        print("Enter")
       
        //add way to get keys so you can iterate through and add to note

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
        return self.currentNotes.count
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
                noteVC.selectedNote = currentNotes[(button?.tag)!]
                noteVC.noteKey = self.noteReferences[(button?.tag)!]
            }
        }
    }

    
    func getNoteList() -> Void {
        //add retrieval from database
        self.noteRefList = [String]()
        self.ref.observeSingleEvent(of: .value, with: {snapshot in
            print(self.ref)
            var dict = snapshot.value as! NSDictionary
            for item in dict{
                var tempNote = item.value
                self.noteRefList.append(tempNote as! String)
            }
            
            for noteKey in self.noteRefList {
                var tempRef = Database.database().reference().child((currUser)!)
                tempRef.child(noteKey).observeSingleEvent(of: .value, with: { snapshot in
                    if let note = snapshot.value as? NSDictionary{
                        var madeNote = Note(title: note.value(forKey: "Title") as! String, info: note.value(forKey: "Info") as! String)
                        self.noteList.append(madeNote)
                    }
                    //     completionHandler(notes)
                })
                
            }
            
        })
    }
    
    func getDatabaseInfo(completionHandler:@escaping ([Any]?) -> Void){
        //self.ref = self.ref.child("Users").child(currUser!)
        var notes = [Note]()
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
