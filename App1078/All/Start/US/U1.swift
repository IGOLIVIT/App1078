//
//  U1.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg3")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                
                VStack(spacing: 10) {
                    
                    Text("Start now and earn more")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("A proven way to make easy money")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
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
    U1()
}
