//
//  Not.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct Not: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                
                VStack(spacing: 10) {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                       status = true
                        
                    }, label: {
                        
                        Text("Enable")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    
                    Button(action: {
                        
                       status = true
                        
                    }, label: {
                        
                        Text("Skip")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray))
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
    Not()
}
