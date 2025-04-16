//
//  CustomTabBar.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/14/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTabIndex: Int
    @Binding var cameraManager: CameraManager
    
    var body: some View {
        ZStack {
            VStack {
                Divider()
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.selectedTabIndex = 0
                    }, label: {
                        Image(systemName: "house")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:36, height:36)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    })
                    
                    Spacer()
                    
                    Spacer()
                    
                    Spacer()
                    
                    Button(action: {
                        self.selectedTabIndex = 2
                    }, label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:36, height:36)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                    })
                    
                    Spacer()
                }
            }
            
            Button(action: {
                Task {
                    await cameraManager.startSession()
                }
                self.selectedTabIndex = 1
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:28, height:28)
                    .foregroundColor(.white)
                    .padding(30)
                    .background(Color.green)
                    .clipShape(Circle())
                    .padding(.bottom, 0)
            })
        }
    }
}

#Preview {
    MainView()
}
