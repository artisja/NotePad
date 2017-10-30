//
//  NotesCollectionController.swift
//  NotePad
//
//  Created by Justin Artis on 10/19/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NotesCell"

class NotesCollectionController: UICollectionViewController {

    @IBOutlet var notesCollectionView: UICollectionView!
    var currentNotes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        currentNotes.append(Note(title: "Manchester City",info: "A English club in Manchester"))
        currentNotes.append(Note(title: "Manchester United",info: "A English club in Manchester"))
        currentNotes.append(Note(title: "Chelsea",info: "A English club in London"))
        currentNotes.append(Note(title: "Everton",info: "A English club in Liverpool"))
        print("Manchester City")
        
        
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
        return currentNotes.count
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
                print(currentNotes[(button?.tag)!])
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
