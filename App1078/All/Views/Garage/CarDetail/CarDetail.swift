//
//  CarDetail.swift
//  App1078
//
//  Created by IGOR on 15/11/2024.
//

import SwiftUI

struct CarDetail: View {

    @StateObject var viewModel: GarageViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Car")
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
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                                
                        }, label: {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(Color.red)
                                .font(.system(size: 17, weight: .medium))
                       
                        })
                    }
                }
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 19) {
                        
                        Text(viewModel.selectedCar?.cMM ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 34, weight: .bold))
                        
                        Text("\(viewModel.selectedCar?.cLP ?? "")| \(viewModel.selectedCar?.cStatus ?? "")")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Driver Assigned")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 13, weight: .regular))
                            
                            Text(viewModel.selectedCar?.cDriver ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        
                        Text("Car overview")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                        
                        VStack(alignment: .leading, spacing: 12) {

                            Text("Mileage")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text(viewModel.selectedCar?.cMil ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Last Service Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text(viewModel.selectedCar?.cLastSD ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Next Service Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text(viewModel.selectedCar?.cNextSD ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))

                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    
                    Text("Delete car?")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    Button(action: {
                        
                        viewModel.numCars -= 1
                        
                        CoreDataStack.shared.deleteCar(withCLP: viewModel.selectedCar?.cLP ?? "", completion: {
                            
                            viewModel.fetchCars()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                        
                    })
                    .padding(.top, 20)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.gray)
                            .font(.system(size: 17, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CarDetail(viewModel: GarageViewModel())
}
