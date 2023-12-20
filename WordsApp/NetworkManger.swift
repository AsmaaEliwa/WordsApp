//
//  NetworkManger.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import Foundation
class NetworkManger:ObservableObject{
    
    static let shared = NetworkManger()
    private init(){}
    
    func fetch(query:String,comilation:@escaping(WordModel?)->Void){
        let url = "https://wordsapiv1.p.rapidapi.com/words/\(query)"
        let decoder = JSONDecoder()
        
        APIManger.shared.getRequest(url: url) {data in
            if let jsonData = data {
                do{
                    let result = try decoder.decode(WordModel.self, from: jsonData)
                    comilation(result)
                    print("data fetched")
                }catch {
                    print(error)
                    comilation(nil)
                }
            }
        }
    }
    
}

