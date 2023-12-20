//
//  WordView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI
import SwiftUI

struct WordView: View {
    @Binding var word: WordModel?
    @Binding var category: SearchCategory

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Your Word: \(word?.word ?? "N/A")")
                .font(.headline)

            if category == .definition {
                // Display the definition
                if let definition = word?.results.first?.definition {
                    Text("Definition: \(definition)")
                        .font(.subheadline)
                } else {
                    Text("Definition not available.")
                        .font(.subheadline)
                }
            } else if category == .synonyms {
                // Display the synonyms
                if let synonyms = word?.results.first?.synonyms {
                    Text("Synonyms: \(synonyms.joined(separator: ", "))")
                        .font(.subheadline)
                } else {
                    Text("Synonyms not available.")
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .background(Color.white) // You can choose a different color
        .cornerRadius(10)
        .shadow(color: .green, radius: 10, x: 0, y: 5) // Adjusted shadow
        .padding() // Outer padding to separate from other views
    }
}
