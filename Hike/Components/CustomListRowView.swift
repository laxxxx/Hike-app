//
//  CustomListRowView.swift
//  Hike
//
//  Created by Sree Lakshman on 26/05/25.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowValue: String? = nil
    @State var rowIcon: String
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent {
            if rowValue != nil {
                Text(rowValue!)
                    .foregroundStyle(.primary)
                    .fontWeight(.medium)
            } else if rowLinkLabel != nil && rowLinkDestination != nil {
                
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label: {
            HStack{
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Designer",
            rowValue: "Jon Doe",
            rowIcon: "paintpalette",
            rowTintColor: .pink)
    }
     
}
