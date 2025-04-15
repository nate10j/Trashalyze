//
//  CustomTabBar.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/14/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTabIndex: Int
    
    var body: some View {
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
                        .padding(16)
            })
            
            Spacer()
            
            Button(action: {
                self.selectedTabIndex = 1
            }, label: {
                Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width:26, height:26)
                        .foregroundColor(.white)
                        .padding(28)
                        .background(Color.green)
                        .clipShape(Circle())
            })
            
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
                        .padding(16)
            })
            
            Spacer()
        }
        .padding(.bottom, 10)
    }
}
