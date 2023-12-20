//
//  WordView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI

struct WordView: View {
    @Binding var word:WordModel?
    var body: some View {
        VStack{
            Text("your Word : \(word?.word ?? "")").padding()
            Text("Defination : \(word?.results[0].definition ?? "")").padding()
            
        }.shadow(color: .green, radius: 100).padding()
    }
}

//#Preview {
//    WordView()
//}
