//
//  Note.swift
//  NotePad
//
//  Created by Justin Artis on 10/19/17.
//  Copyright © 2017 Justin Artis. All rights reserved.
//

import Foundation

class Note{
    var noteTitle: String
    var noteInfo: String
    
    init(title: String,info: String) {
        self.noteTitle = title
        self.noteInfo = info
    }
}
