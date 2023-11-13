//
//  ContentView.swift
//  Msigma-assignment
//
//  Created by Mayonk Kumar Behera on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            MyCoursesView()
                .tabItem {
                    Label("My Course", systemImage: "person.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
