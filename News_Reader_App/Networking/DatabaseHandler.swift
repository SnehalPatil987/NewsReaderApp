//
//  DatabaseHandler.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 06/07/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHandler {
    
    func save(title: String,desc:String,urlToImage: Data)
    {
        let appDel = (UIApplication.shared.delegate) as? AppDelegate
        let context = appDel?.persistentContainer.viewContext
        let newsTable = NSEntityDescription.insertNewObject(forEntityName: "BookmarkedNews", into: context!) as! BookmarkedNews
        
        newsTable.title = title
        newsTable.desc = desc
        newsTable.urlToImage = urlToImage
        
        do {
            try context?.save()
            print("Data stored successfully")
            
        }
        catch {
            print("Data stored Error")
        }
    }
    
    func getCoreData() {
        print("Fetching Data from Bookmarked News")
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        do{
            bookmarkedNewsArr = try context.fetch(BookmarkedNews.fetchRequest()) as [BookmarkedNews]
        }
        catch{

        }
        
    }
    func deleteRow(rowNo: Int) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        do{
           var newsTable = try context.fetch(BookmarkedNews.fetchRequest()) as [BookmarkedNews]
            
            context.delete(newsTable[rowNo] as NSManagedObject)
            newsTable.remove(at: rowNo)
            
            try context.save()
            
        }
        catch{

        }
      
    }
    
}
