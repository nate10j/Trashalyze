//
//  HomeView.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/14/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome!")
            }
            .navigationBarTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
