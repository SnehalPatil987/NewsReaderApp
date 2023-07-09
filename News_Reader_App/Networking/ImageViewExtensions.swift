//
//  ImageViewExtensions.swift
//  News_Reader_App
//
//  Created by Snehal Shrikant Patil on 05/07/23.
//

import Foundation
import UIKit

    
    extension UIImageView {
        func downloadImage(from url: URL){
            
            contentMode = .scaleToFill
            
            
            URLSession.shared.dataTask(with: url, completionHandler: {
                (data, response, error) in
                guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200, let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                      let data = data , error == nil ,
                      let image = UIImage(data: data)
                        
                else{
                    return
                }
                
                DispatchQueue.main.async {
                    self.image  = image
                }
                
                
                
            }).resume()
            
        }
    }



