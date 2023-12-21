//
//  SplashView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI
struct SplashView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
//                Color.black.opacity(0.5).ignoresSafeArea()
                VStack {
                    Spacer()
                    NavigationLink(destination: HomeView()) {
                        Text("Get Started")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.blue)
                            )
                            .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    SplashView()
}
