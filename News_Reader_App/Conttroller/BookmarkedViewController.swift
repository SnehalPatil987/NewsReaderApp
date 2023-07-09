//
//  BookmarkedViewController.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 06/07/23.
//

import UIKit

class BookmarkedViewController: UIViewController {
    @IBOutlet weak var bookmarkTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseHandler.getCoreData()
    }
    override func viewDidAppear(_ animated: Bool) {
        databaseHandler.getCoreData()
        bookmarkTV.reloadData()
    }

}


