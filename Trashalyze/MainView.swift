//
//  MainView.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/14/25.
//

import SwiftUI

struct MainView: View {
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        VStack {
            // content here
            ZStack {
                switch selectedTabIndex {
                case 0:
                    HomeView()
                case 1:
                    CameraView()
                case 2:
                    SettingsView()
                default:
                    Text("This page does not exist")
                }
            }
            
            Spacer()
            
            CustomTabBar(selectedTabIndex: $selectedTabIndex)
        }
    }
}

#Preview {
    MainView()
}
