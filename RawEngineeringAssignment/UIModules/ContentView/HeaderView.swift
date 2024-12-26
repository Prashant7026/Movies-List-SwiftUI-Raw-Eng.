//
//  HeaderView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 28/11/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Text("TEAM")
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(Color.white)
                .bold()
            Spacer()
                .frame(height: 16.0)
            HStack{
                VStack{
                    Text("Schedule")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            selectedTab = 0
                        }
                    Spacer()
                        .frame(height: 10.0)
                    Rectangle()
                        .fill(selectedTab == 0 ? Color.yellow : Color.clear)
                        .frame(height: 1)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                VStack{
                    Text("Games")
                        .foregroundColor(Color.white)
                        .onTapGesture {
                            selectedTab = 1
                        }
                    Spacer()
                        .frame(height: 10.0)
                    Rectangle()
                        .fill(selectedTab == 1 ? Color.yellow : Color.clear)
                        .frame(height: 1)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}

//#Preview {
//    HeaderView()
//}
