//
//  HistoryView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 21/12/2023.
//
import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel = SearchViewModel.shared
    
    var body: some View {
        VStack {
            Text("Recently Searched")
                .font(.title)
                .padding(.top, 20)
            
            List(viewModel.cachedWords, id: \.self) { word in
                VStack(alignment: .leading) {
                    Text(word)
                        .font(.headline)
                }
                .padding(.vertical, 10)
            }
            .listStyle(InsetGroupedListStyle())
            .padding(.horizontal)
            .background(Color(UIColor.systemGroupedBackground))
            .cornerRadius(15)
            .shadow(radius: 5)
            .padding()
        }
        .navigationBarTitle("History")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
