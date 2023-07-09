//
//  NewsTVCell.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 05/07/23.
//

import UIKit

class NewsTVCell: UITableViewCell {
    
    //outlets
    
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var bookmarkBTN: UIButton!
    @IBOutlet weak var bookmarkBTNImg: UIImageView!
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var detailedpageClicked: UIButton!
    
    var article:Article?{
        didSet {
            newsTitleLbl.text = article?.title
            newsImg.downloadImage(from: URL(string: article?.urlToImage ??  "https://fdn.gsmarena.com/imgroot/news/23/07/zte-new-camera-phone-teaser/-952x498w6/gsmarena_000.jpg")!)
           
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
