//
//  SettingsView.swift
//  Hike
//
//  Created by Sree Lakshman on 26/05/25.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcons: [String] = [
        "AppIcon-Mushroom",
        "AppIcon-Map",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Campfire",
        "AppIcon-Camera",
        "AppIcon-Backpack"
    ]
    
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    //MARK: SECTION HEADER
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight,
                                                         .customGreenMedium,
                                                         .customGreenDark],
                                                startPoint: .top,
                                                endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("When can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(.colorGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            
            
            //MARK: SECTION ICONS
            Section(header: Text("Alternate App-Icons")) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons, id: \.self) { item in
                            
                            Button {
                                UIApplication.shared.setAlternateIconName(item) { error in
                                    if error != nil {
                                        print("failed updating the app icon")
                                    } else {
                                        print("suceess! you have chnages the app icon to \(item)")
                                    }
                                }
                                
                            } label: {
                                Image("\(item)-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            }
            .listRowSeparator(.hidden)
            
            
            
            //MARK: SECTION About
            Section(header: Text("ABOUT THE APP"),
                    footer: HStack {
                Spacer()
                Text("Copyright ©  All rights reserved.")
                Spacer()
            }
                .padding(.vertical, 8)
            ) {
                CustomListRowView(
                    rowLabel: "Application",
                    rowValue: "Hike",
                    rowIcon: "apps.iphone",
                    rowTintColor: .blue)
                
                CustomListRowView(
                    rowLabel: "Compatibility",
                    rowValue: "iOS, iPadOS",
                    rowIcon: "info.circle",
                    rowTintColor: .red)
                
                CustomListRowView(
                    rowLabel: "Technology",
                    rowValue: "Swift",
                    rowIcon: "swift",
                    rowTintColor: .orange)
                
                CustomListRowView(
                    rowLabel: "Version",
                    rowValue: "1.0",
                    rowIcon: "gear",
                    rowTintColor: .purple)
                
                CustomListRowView(
                    rowLabel: "Developer",
                    rowValue: "Lakshman",
                    rowIcon: "ellipsis.curlybraces",
                    rowTintColor: .mint)
                
                CustomListRowView(
                    rowLabel: "Designer",
                    rowValue: "Jon Doe",
                    rowIcon: "paintpalette",
                    rowTintColor: .pink)
                
                CustomListRowView(
                    rowLabel: "Website",
                    rowValue: nil,
                    rowIcon: "globe",
                    rowTintColor: .mint,
                    rowLinkLabel: "site",
                    rowLinkDestination: "https://www.lipsum.com/")
            }
            
        }
    }
}

#Preview {
    SettingsView()
}
