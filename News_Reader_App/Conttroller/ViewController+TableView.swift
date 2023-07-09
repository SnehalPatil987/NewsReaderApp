//
//  ViewController+TableView.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 07/07/23.
//

import Foundation
import UIKit



extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsModel?.articles.count ?? 0
    
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsTVCell
   
    cell.article = newsModel?.articles[indexPath.row]
    cell.bookmarkBTN.tag = indexPath.row
    cell.detailedpageClicked.tag = indexPath.row
    
    cell.bookmarkBTN.addTarget(self, action: #selector(bookmarkBtnpress), for: .touchUpInside)
    
    cell.detailedpageClicked.addTarget(self, action: #selector(detailedBtnpress), for: .touchUpInside)
    return cell
    
}
@objc func bookmarkBtnpress(sender:UIButton){
    
    let indexPath = IndexPath(row: sender.tag, section: 0)
    let cell = NewsTV.cellForRow(at: indexPath) as! NewsTVCell
    if cell.bookmarkBTNImg.image == UIImage(named: "black" ) {
        cell.bookmarkBTNImg.image = UIImage(named: "white" )
        
    }
    else {
        cell.bookmarkBTNImg.image = UIImage(named: "black" )
        
    }
    
    let image = cell.newsImg
    let data = (image!.image)!.pngData()
    let title = newsModel?.articles[sender.tag].title
    let desc = newsModel?.articles[sender.tag].description
    databaseHandler.save(title: title! , desc: desc!, urlToImage: data!)
    
}

@objc func detailedBtnpress(sender: UIButton){
    
    displayDescription = newsModel?.articles[sender.tag].description ?? "No News"
    
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailedNews") as? DetailedNewsViewController
          self.navigationController?.pushViewController(vc!, animated: true)
          
}
}
