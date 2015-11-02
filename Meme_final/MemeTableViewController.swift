//
//  MemeTableViewController.swift
//  Meme_final
//
//  Created by greymatter-home on 10/23/15.
//  Copyright © 2015 greymatter-home. All rights reserved.
//

import UIKit


class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]!
    let cellIdentifier = "MemeTableViewCell"
    let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
