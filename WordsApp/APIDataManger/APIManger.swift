//
//  APIManger.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import Foundation
class APIManger{
    static let shared = APIManger()
    private init(){}
    
    func getRequest(url:String , comilation:@escaping(Data?)->Void){
        guard let requesUrl = URL(string:url) else{return}
        var request = URLRequest(url: requesUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        request.cachePolicy = .useProtocolCachePolicy
        request.setValue("8a47dda633mshc50d0d1f4c16f9fp1cab33jsn7b7ecb0ee4a6", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        let task = URLSession.shared.dataTask(with:request ){data,response,error in
            if data != nil {
                comilation(data)
            }else{
                comilation(nil)
            }
            
        }
        task.resume()
    }
}
