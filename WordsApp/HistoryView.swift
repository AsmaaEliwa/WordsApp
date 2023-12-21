//
//  HistoryView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 21/12/2023.
//

import SwiftUI

struct HistoryView: View {
    @State var viewModel:SearchViewModel
    init(){
        viewModel = SearchViewModel.shared
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            ForEach(viewModel.cachedWords , id:\.self){word in
                Text(word)
            }
        }
    }
}

#Preview {
    HistoryView()
}
