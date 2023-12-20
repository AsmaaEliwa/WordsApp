//
//  WordModel.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import Foundation
struct WordModel:Codable{
    let word:String
    let results:[detailsModel]
    
}

struct detailsModel:Codable{
    let definition:String
    let partOfSpeech:String
    let synonyms : [String]?
}


