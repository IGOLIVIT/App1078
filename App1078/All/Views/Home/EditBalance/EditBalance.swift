//
//  EditBalance.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct EditBalance: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit balance")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
          
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                            
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Balance")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addBalance.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.addBalance)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }

                        VStack(alignment: .leading) {
                            
                            Text("Change")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addChange.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.addChange)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        Text("Direction")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Menu(content: {
                            
                            ForEach(viewModel.directions, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curDirection = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                        
                                    })
                            }
                            
                        }, label: {
                            
                            if viewModel.curDirection.isEmpty {
                                
                                HStack {
                                    
                                    Text("Type of sport")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                                
                            } else {
                                
                                HStack {
                                    
                                    Image(viewModel.curDirection)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15)
                                    
                                    Text(viewModel.curDirection)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
         
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        })


                    }
                }
                
                Button(action: {

                    viewModel.direct = viewModel.curDirection
                    viewModel.balance = viewModel.addBalance
                    viewModel.change = viewModel.addChange
                    
                    viewModel.addChange = ""
                    viewModel.addBalance = ""
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEditBalance = false
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}


#Preview {
    EditBalance(viewModel: HomeViewModel())
}
