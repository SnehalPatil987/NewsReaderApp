//
//  BookmarkedViewController+TableView.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 07/07/23.
//

import Foundation
import UIKit

extension BookmarkedViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookmarkedNewsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookMarkTVCell", for: indexPath)as! BookMarkTVCell
        
        
        
        cell.bookmarkImg.image  = UIImage(data: bookmarkedNewsArr[indexPath.row].urlToImage!)
        cell.bookmarkLBL.text = bookmarkedNewsArr[indexPath.row].title
        cell.deletBtn.tag = indexPath.row
        cell.deletBtn.addTarget(self, action: #selector(deletBtnPress), for: .touchUpInside)
        cell.bookmaerkDetailedPage.tag = indexPath.row
        cell.bookmaerkDetailedPage.addTarget(self, action: #selector(pressedDetailedPage), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @objc func deletBtnPress(sender: UIButton){
        databaseHandler.deleteRow(rowNo: sender.tag)
        databaseHandler.getCoreData()
        bookmarkTV.reloadData()
    }
    @objc func pressedDetailedPage(sender: UIButton){
        displayDescription = newsModel?.articles[sender.tag].description ?? "No News"
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailedNews") as? DetailedNewsViewController
              self.navigationController?.pushViewController(vc!, animated: true)
              
        
    }
}

