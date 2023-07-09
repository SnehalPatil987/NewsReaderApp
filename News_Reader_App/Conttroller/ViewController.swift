//
//  ViewController.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 05/07/23.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NewsTV: UITableView!
    
    var apiObj = APIHandler()
    var tvCell = NewsTVCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetch()
    }
    
    
    func fetch() {
        URLSession.shared.request(url: URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=01a857e9fb8548faab23fc8a11440996")!,
                                  expecting: NewsModel.self)
        {[weak self] result in
            
            switch result{
            case .success(let news):
                DispatchQueue.main.async {
                    newsModel = news
                    print(newsModel?.articles)
                    self?.NewsTV.reloadData()
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
    
    
