//
//  HomeViewModel.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("direct") var direct: String = ""
    
    @AppStorage("income") var income: String = ""
    @AppStorage("expenses") var expenses: String = ""
    @AppStorage("netprofit") var netprofit: String = ""
    
    @Published var addIncome: String = ""
    @Published var addExpenses: String = ""
    @Published var addNetProfit: String = ""

    @Published var addBalance: String = ""
    @Published var addChange: String = ""
    @Published var addDirect: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEditBalance: Bool = false
    @Published var isEditBalance2: Bool = false
    
    @Published var directions: [String] = ["Up", "Down"]
    @Published var curDirection = "Up"
    
    @Published var statuses: [String] = ["Available", "In Service", "Servicing", "Not Available"]
    @Published var curStatus = ""

    @Published var gNameForAdd = ""
    
    @Published var orID: String = ""
    @Published var orDriver: String = ""
    @Published var orVeh: String = ""
    @Published var orPULoc: String = ""
    @Published var orDOLoc: String = ""
    @Published var orTPU: String = ""
    @Published var orFare: String = ""
    @Published var orStatus: String = ""

    @Published var orders: [OrderModel] = []
    @Published var selectedOrder: OrderModel?

    func addOrder() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "OrderModel", into: context) as! OrderModel

        loan.orID = orID
        loan.orDriver = orDriver
        loan.orVeh = orVeh
        loan.orPULoc = orPULoc
        loan.orDOLoc = orDOLoc
        loan.orTPU = orTPU
        loan.orFare = orFare
        loan.orStatus = orStatus

        CoreDataStack.shared.saveContext()
    }

    func fetchOrders() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<OrderModel>(entityName: "OrderModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.orders = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.orders = []
        }
    }
}
