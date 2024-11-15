//
//  HomeView.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("prim2").opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .padding(.horizontal, 30)
                        .offset(y: -60)
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("prim2").opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 15)
                        .frame(height: 100)
                        .offset(y: -40)
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("prim2"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .padding(.top)
                        .overlay (
                        
                            VStack(alignment: .leading, spacing: 8) {
                                
                                HStack {
                                    
                                    Text("Top Balance")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isEditBalance = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: "square.and.pencil")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                            .padding(9)
                                            .background(Circle().fill(Color("bg")))
                                    })
                                }
                                
                                Spacer()
                                
                                Text("$\(viewModel.balance)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 28, weight: .bold))
                                
                                HStack {
                                    
                                    if viewModel.direct == "Up" {
                                        
                                        Text("+$\(viewModel.change)")
                                            .foregroundColor(Color("prim3"))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    } else {
                                        
                                        Text("-$\(viewModel.change)")
                                            .foregroundColor(.red)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    Text("for last week")
                                        .foregroundColor(.black)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                }
                            }
                                .padding(20)
                                .padding(.vertical)
                        )
                    
                }
                .padding(.bottom)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBalance2 = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "arrow.up.right.square")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(4)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                    
                                    Text("Total Revenue")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                
                                Spacer()
                                
                                Text("$\(viewModel.income)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding()
                            .frame(width: 170, height: 100, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color("bg3")))
                        })

                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBalance2 = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "arrow.down.right.square")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(4)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                                    
                                    Text("Total Expenses")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                
                                Spacer()
                                
                                Text("$\(viewModel.expenses)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding()
                            .frame(width: 170, height: 100, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color("bg3")))
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBalance2 = true
                            }
                            
                        }, label: {
                            
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    
                                    Image(systemName: "dollarsign.arrow.circlepath")
                                        .foregroundColor(.white)
                                        .font(.system(size: 11, weight: .regular))
                                        .padding(4)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.white.opacity(0.3)))
                                    
                                    Text("Total Expenses")
                                        .foregroundColor(.white)
                                        .font(.system(size: 13, weight: .medium))
                                }
                                
                                Spacer()
                                
                                Text("$\(viewModel.netprofit)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .padding()
                            .frame(width: 170, height: 100, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 18).fill(Color("prim3")))
                        })
                    }
                }
                
                HStack {
                    
                    Text("Active orders")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus.viewfinder")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                    })
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.orders, id: \.self) { index in
                        
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text(index.orID ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    Text(index.orDriver ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Text(index.orVeh ?? "")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(6)
                                        .padding(.horizontal, 5)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(Color("prim")))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 8) {
                                    
                                    Text("Fare")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text(index.orFare ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchOrders()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOrder(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEditBalance, content: {
            
            EditBalance(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isEditBalance2 ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEditBalance2 = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBalance2 = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                        .padding()

                    ZStack(content: {
                        
                        Text("Total Revenue")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addIncome.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addIncome)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                    ZStack(content: {
                        
                        Text("Total Expenses")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addExpenses.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addExpenses)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                    ZStack(content: {
                        
                        Text("Net Profit")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addNetProfit.isEmpty ? 1 : 0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("", text: $viewModel.addNetProfit)
                            .foregroundColor(Color.black)
                            .font(.system(size: 16, weight: .medium))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.income = viewModel.addIncome
                            viewModel.expenses = viewModel.addExpenses
                            viewModel.netprofit = viewModel.addNetProfit
                            
                            viewModel.addIncome = ""
                            viewModel.addExpenses = ""
                            viewModel.addNetProfit = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBalance2 = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            viewModel.addIncome = ""
                            viewModel.addExpenses = ""
                            viewModel.addNetProfit = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEditBalance2 = false
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
                .offset(y: viewModel.isEditBalance2 ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    HomeView()
}
