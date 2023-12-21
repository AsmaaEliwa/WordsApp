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
struct HomeView: View {
    @State var data:WordModel?
    @State var query:String = ""
    @State var isSearching = false
    @State var category: SearchCategory = .definition
    @State var viewModel:SearchViewModel
    init(){
        viewModel = SearchViewModel.shared
    }
    var body: some View {
       
            VStack{
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
                HStack{
                    TextField("Search for word", text: $query).padding().background(Color.white) // You can choose a different color
                        .cornerRadius(10)
                        .shadow(color: .blue, radius: 10, x: 0, y: 5)
                    Button{
                        NetworkManger.shared.fetch(query: query, comilation: {word in
                            
                            if let result = word {
                                data = result
                              
                                
                            }
                        })
                        viewModel.addWordToCache(query)
                        isSearching = true
                     
                    }label: {

                            Image(systemName: "magnifyingglass").font(.system(size: 24))
                    }
                }.padding()
                
                Spacer()
            }.padding()
            NavigationLink(destination:searchResultView(word: $data , categery: $category),isActive: $isSearching ){
                EmptyView()
            }
        }
    
}

//#Preview {
////    HomeView()
//}
