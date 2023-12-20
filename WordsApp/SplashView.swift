//
//  SplashView.swift
//  WordsApp
//
//  Created by asmaa gamal  on 20/12/2023.
//

import SwiftUI

struct SplashView: View {
    @State var selectedView = 1
    var body: some View {
        TabView(selection: $selectedView,
                content:  {
            HomeView().tabItem { Image(systemName: "magnifyingglass") }.tag(1)
            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
        })
    }
}

#Preview {
    SplashView()
}
