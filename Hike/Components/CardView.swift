//
//  CardView.swift
//  Hike
//
//  Created by Sree Lakshman on 25/05/25.
//

import SwiftUI

struct CardView: View {
    
    // MARK: Properties
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    // MARK: functions
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while imageNumber == randomNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        
        // MARK: CardView
        ZStack {
            CustomBackgroundView()
            VStack {
                
                // MARK: Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors:
                                                [.customGrayLight,
                                                 .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom )
                            )
                        
                        Spacer()
                        
                        Button {
                            //ACTION - SHOW A BOTTOM SHEET
                            print("did tap button!")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activities for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                    
                
                //MARK: Main content
                
                
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(colors: [
                                .customIndigoMedium,
                                .customSalmonLight
                            ],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing
                                          )
                        )
                        .frame(width: 256, height: 256)
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeInOut, value: imageNumber)
                }
                
                //MARK: Footer
                
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium],
                                                        startPoint: .top,
                                                        endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButtonStyle())
            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
