//
//  HomeView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI

struct HomeView: View {
    @State var data:WordModel?
    @State var query:String = ""
    @State var isSearching = false
    var body: some View {
        NavigationStack{
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                HStack{
                    TextField("Search for word", text: $query).padding().border(.gray).padding()
                    Button{
                        NetworkManger.shared.fetch(query: query, comilation: {word in
                            
                            if let result = word {
                                data = result
                                
                            }
                        })
                        isSearching = true
                    }label: {

                            Image(systemName: "magnifyingglass").font(.system(size: 24)).padding()
                    }
                }
                
                Spacer()
            }.padding()
            NavigationLink(destination:searchResultView(word: $data),isActive: $isSearching ){
                EmptyView()
            }
        }
    }
}

#Preview {
    HomeView()
}
