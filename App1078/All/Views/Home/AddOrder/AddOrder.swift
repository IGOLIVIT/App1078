//
//  AddOrder.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct AddOrder: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New order")
                        .foregroundColor(.white.opacity(0.9))
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
                            
                            Text("Order ID")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orID.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orID)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Driver")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orDriver.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orDriver)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Vehicle")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orVeh.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orVeh)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Pick-Up Location")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orPULoc.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orPULoc)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Drop-Off Location")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orDOLoc.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orDOLoc)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Time of Pick-Up")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orTPU.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orTPU)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Fare")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.orFare.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.orFare)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }

                            Text("Status")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)

                        Menu(content: {
                            
                            ForEach(viewModel.statuses, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curStatus = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                        
                                    })
                            }
                            
                        }, label: {
                            
                            if viewModel.curStatus.isEmpty {
                                
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
                                    
                                    Text(viewModel.curStatus)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
         
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        })
                        .padding(.bottom, 20)
                        
                        Button(action: {

                            viewModel.orStatus = viewModel.curStatus
                            
                            viewModel.addOrder()
                            
                            viewModel.orID = ""
                            viewModel.orDriver = ""
                            viewModel.orVeh = ""
                            viewModel.orPULoc = ""
                            viewModel.orDOLoc = ""
                            viewModel.orTPU = ""
                            viewModel.orFare = ""
                            viewModel.curStatus = ""
                            
                            viewModel.fetchOrders()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        })
                        .opacity(viewModel.orID.isEmpty || viewModel.orDriver.isEmpty || viewModel.orVeh.isEmpty || viewModel.curStatus.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.orID.isEmpty || viewModel.orDriver.isEmpty || viewModel.orVeh.isEmpty || viewModel.curStatus.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    AddOrder(viewModel: HomeViewModel())
}
