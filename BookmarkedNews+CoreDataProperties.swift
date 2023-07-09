//
//  BookmarkedNews+CoreDataProperties.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 06/07/23.
//
//

import Foundation
import CoreData


extension BookmarkedNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookmarkedNews> {
        return NSFetchRequest<BookmarkedNews>(entityName: "BookmarkedNews")
    }

    @NSManaged public var urlToImage: Data?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?

}

extension BookmarkedNews : Identifiable {

}
