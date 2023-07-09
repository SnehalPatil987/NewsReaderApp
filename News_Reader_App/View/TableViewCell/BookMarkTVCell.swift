//
//  BookMarkTVCell.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 06/07/23.
//

import UIKit

class BookMarkTVCell: UITableViewCell {

    // Outlets
    
    @IBOutlet weak var bookmarkImg: UIImageView!
    @IBOutlet weak var bookmaerkDetailedPage: UIButton!
    @IBOutlet weak var bookmarkLBL: UILabel!
    @IBOutlet weak var deletBtn: UIButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
}
