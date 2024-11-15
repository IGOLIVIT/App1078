//
//  R1.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R1")
                    .resizable()
                
                VStack(spacing: 10) {
                    
                    Text("Comprehensive dashboard")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("View real-time stats on active cars, drivers, and ongoing trips in one place.")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.bottom, 20)
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .frame(height: 350)
                .background(Color("bg"))
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    R1()
}
