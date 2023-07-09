//
//  NewsModel.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 05/07/23.


import Foundation

struct NewsModel: Codable{
        var status: String
        var totalResults: Int
        var articles: [Article]
}
struct Article: Codable {
   
    
    var title: String
    var urlToImage: String?
    var description: String?
    
}

var newsModel: NewsModel?
var articles =  [Article]()
var displayDescription = String()
let databaseHandler = DatabaseHandler()
var bookmarkedNewsArr = [BookmarkedNews]()
