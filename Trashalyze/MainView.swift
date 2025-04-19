//
//  MainView.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/14/25.
//

import SwiftUI

struct MainView: View {
    @State var selectedTabIndex: Int = 0
    @State var cameraManager: CameraManager = CameraManager()
    
    var body: some View {
        VStack {
            // content here
            ZStack {
                switch selectedTabIndex {
                case 0:
                    HomeView()
                case 1:
                    let _ = {
                        Task {
                            await cameraManager.startSession()
                        }
                    }
                    
                    CameraView(selectedTabIndex: $selectedTabIndex, cameraManager: $cameraManager)
                case 2:
                    SettingsView()
                default:
                    Text("This page does not exist")
                }
            }
            
            Spacer()
            
            if selectedTabIndex == 1 {
                // if it is 1 (meant to keep things truthy
            } else {
                CustomTabBar(selectedTabIndex: $selectedTabIndex, cameraManager: $cameraManager)
            }
        }
    }
}

#Preview {
    MainView()
}
