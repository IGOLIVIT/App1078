//
//  SettingsView.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Garage")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    Spacer()

                }
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 17) {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(width: 26, height: 26)
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.black))
                                
                                Text("Rate us")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Spacer()
                                
                                Text("Rate")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(7)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                            }
                            .padding()
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/7ac7cf2b-b1d5-4ba4-9224-5d20551a318f") else { return }
                            
                            UIApplication.shared.open(url)
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "person.badge.shield.checkmark.fill")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 25, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Spacer()
                                
                                Text("Read")
                                    .foregroundColor(.black.opacity(0.7))
                                    .font(.system(size: 14, weight: .regular))
                                    .padding(7)
                                    .padding(.horizontal, 5)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                            }
                            .padding()
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
