//
//  AddCar.swift
//  App1078
//
//  Created by IGOR on 15/11/2024.
//

import SwiftUI

struct AddCar: View {

    @StateObject var viewModel: GarageViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add car")
                        .foregroundColor(.white.opacity(0.9))
                        .font(.system(size: 20, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
          
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 17, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {

                        VStack(alignment: .leading) {
                            
                            Text("Driver Assigned")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.namesDrivers, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.driverForAdd = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                            
                                        })
                                }
                                
                            }, label: {
                                
                                if viewModel.driverForAdd.isEmpty {
                                    
                                    HStack {
                                        
                                        Text("Enter")
                                            .foregroundColor(.white.opacity(0.5))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white.opacity(0.5))
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    
                                } else {
                                    
                                    HStack {
                                        
                                        Text(viewModel.driverForAdd)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
             
                                    }
                                }
                            })
                            .padding(18)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Make and Mode")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cMM.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.cMM)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("License Plate")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cLP.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.cLP)
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
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.up.chevron.down")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.curStatus)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
     
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                    })
                        
                        VStack(alignment: .leading) {
                            
                            Text("Mileage")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cMil.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.cMil)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Last Service Date")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cLastSD.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.cLastSD)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Next Service Date")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.cNextSD.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.cNextSD)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        }
                        .padding(.bottom, 20)
                        
                        Button(action: {

                            viewModel.numCars += 1
                            viewModel.cDriver = viewModel.driverForAdd
                            viewModel.cStatus = viewModel.curStatus
                            
                            viewModel.addCar()
                            
                            viewModel.cMM = ""
                            viewModel.cLP = ""
                            viewModel.cMil = ""
                            viewModel.cLastSD = ""
                            viewModel.cNextSD = ""
                            viewModel.driverForAdd = ""
                            viewModel.curStatus = ""
                            
                            viewModel.fetchCars()
                            
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
                        .opacity(viewModel.driverForAdd.isEmpty || viewModel.cLP.isEmpty || viewModel.curStatus.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.driverForAdd.isEmpty || viewModel.cLP.isEmpty || viewModel.curStatus.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddCar(viewModel: GarageViewModel())
}
