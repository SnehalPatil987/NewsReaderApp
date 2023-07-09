//
//  DetailedNewsViewController.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 06/07/23.

import UIKit
import WebKit

class DetailedNewsViewController: UIViewController {
    
    @IBOutlet weak var DescriptionLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DescriptionLBL.text = displayDescription
    }
    
    
}
