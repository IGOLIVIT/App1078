//
//  GarageView.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct GarageView: View {

    @StateObject var viewModel = GarageViewModel()
    
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
                    
                    Button(action: {
                        
                        if viewModel.currentBS == "Cars" {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        } else {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddDriver = true
                            }
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding(8)
                            .background(Circle().fill(Color("prim3")))
                    })
                }
                .padding(.bottom, 20)
               
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.currentBS = "Cars"
                            
                        }, label: {
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "arrow.down.right.square")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(4)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                    
                                    Text("Total Cars")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                
                                Spacer()
                                
                                Text("\(viewModel.numCars)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding()
                            .frame(height: 100)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 18).fill(viewModel.currentBS == "Cars" ? Color("prim3") : Color("bg3")))
                        })
                        
                        Button(action: {
                            
                            viewModel.currentBS = "Drivers"
                            
                        }, label: {
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "arrow.down.right.square")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(4)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                    
                                    Text("Total Drivers")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                
                                Spacer()
                                
                                Text("\(viewModel.numDrivers)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding()
                            .frame(height: 100)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 18).fill(viewModel.currentBS == "Drivers" ? Color("prim3") : Color("bg3")))
                        })
                    }
                
                if viewModel.currentBS == "Cars" {
                    
                    HStack {
                        
                        Text("Your cars")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Spacer()

                    }
                    .padding(.vertical)
                    
                } else if viewModel.currentBS == "Drivers" {
                    
                    
                    HStack {
                        
                        Text("Your drivers")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Spacer()

                    }
                    .padding(.vertical)
                }
                
                if viewModel.currentBS == "Cars" {
                    
                    if viewModel.cars.isEmpty {
                        
                        VStack {
                            
                            Text("Empty")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 18, weight: .semibold))
                            
                            Text("Add driver, next add car")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                        }
                        .frame(maxHeight: .infinity)
                    } else {
                    
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.cars, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedCar = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 9) {
                                                
                                                Text(index.cLP ?? "")
                                                    .foregroundColor(Color("prim"))
                                                    .font(.system(size: 16, weight: .regular))
                                                
                                                Text(index.cMM ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 18, weight: .medium))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            VStack(alignment: .trailing, spacing: 9) {
                                                
                                                Text("Status")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                                Text(index.cStatus ?? "")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 16, weight: .medium))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                                    })
                                }
                            }
                        }
                    }
                    
                } else if viewModel.currentBS == "Drivers" {
                    
                    if viewModel.namesDrivers.isEmpty {
                        
                        VStack {
                            
                            Text("Empty")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            VStack {
                                
                                ForEach(viewModel.namesDrivers, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Spacer()
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg3")))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchCars()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCar(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CarDetail(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddDriver ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddDriver = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddDriver = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    
                    Text("Add driver")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .padding()

                    ZStack(content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addNameDriver.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNameDriver)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.numDrivers += 1
                            viewModel.namesDrivers.append(viewModel.addNameDriver)
                            
                            viewModel.addNameDriver = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddDriver = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.addNameDriver = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddDriver = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.gray)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isAddDriver ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    GarageView()
}
