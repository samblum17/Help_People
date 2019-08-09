//
//  ViewController.swift
//  Notes App
//
//  Created by Dylan Li on 8/6/19.
//  Copyright © 2019 Dylan Li. All rights reserved.
//

import UIKit

class DetialViewController: UIViewController {

    var note: Note?
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let unwrappable = note {
            note?.content = textView.text
        }
    }
    
    func configureView() {
        if let unwrappedNote = note {
            textView.text=unwrappedNote.content
        }
    }
    
    
}

