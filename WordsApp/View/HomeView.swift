//
//  HomeView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI
enum SearchCategory {
    case definition
    case synonyms
}
import SwiftUI

struct HomeView: View {
    @State var query: String = ""
    @State var category: SearchCategory = .definition
    @ObservedObject var viewModel = SearchViewModel.shared

    var body: some View {
        VStack {
            HStack{
                      Text("Hello, User!")
                      NavigationLink(destination:HistoryView()){
                          Text("history")
                      }
                  }
                  Spacer()
                  Picker("Category", selection: $category) {
                                     Text("Definition").tag(SearchCategory.definition)
                                     Text("Synonyms").tag(SearchCategory.synonyms)
                                 }
                                 .pickerStyle(SegmentedPickerStyle())
                                 .padding()
            
            HStack {
                TextField("Search for word", text: $query).padding().background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .blue, radius: 10, x: 0, y: 5)

                Button {
                    viewModel.fetchData(query: query, category: category)
                } label: {
                    Image(systemName: "magnifyingglass").font(.system(size: 24))
                }
            }.padding()
            
            Spacer()
        }.padding()

        NavigationLink(destination: searchResultView(word: $viewModel.data, categery: $category), isActive: $viewModel.isSearching) {
            EmptyView()
        }
    }
}
