//
//  API.swift
//  AbsoluteMinds
//
//  Created by Abdullah Bajaman on 23/11/2021.
//

import Foundation
import UIKit


class Api{
    func getData() {
        
        let headers = [
            "x-rapidapi-host": "google-books.p.rapidapi.com",
            "x-rapidapi-key": "ef0d0f69cbmsh71b92f587dcbfbfp1a7701jsn5f5fae649978"
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "google-books.p.rapidapi.com"
        urlComponents.path = "/volumes"
        

      
        
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.allHTTPHeaderFields = headers
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: urlRequest as URLRequest) { (data: Data?, res: URLResponse?, err: Error?) in
            do {
                let jsonDecoder = JSONDecoder()
                let decodedRes = try jsonDecoder.decode(Library.self, from: data!)
                
                print(decodedRes.items.map{ $0.volumeInfo })
            }catch {
                print("data not found \(error)")
            }
        }
        task.resume()
        
//        // request for image
//        let imageUrl =  "https://books.google.com/books/content?id=hdMuBQAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api"
//
//        var urlImageRequest = URLRequest(url: URL(string: imageUrl)!)
//        //urlRequest.allHTTPHeaderFields = headers
//
        print(urlRequest.url!)
//
//
//
//        let urlImageSession = URLSession.shared
//
//
//        let imageTask = urlImageSession.dataTask(with: urlImageRequest as URLRequest) { (data: Data?, res: URLResponse?, err: Error?) in
//            do {
//                let imageBook = UIImage(data: data!)
//                print (imageBook)
//
//            } catch {
//                print("data not found \(error)")
//            }
//        }
//        imageTask.resume()
    }
    
}
    

class Library : Codable {
var items : [Source]!
var totalItems : Double

}

struct Source: Codable{
var volumeInfo : BookInfo
var id : String
}

struct BookInfo : Codable{
var title: String
var authors : [String]?
var publishedDate : String
var description: String
    var imageLinks: [String: String]?
}
