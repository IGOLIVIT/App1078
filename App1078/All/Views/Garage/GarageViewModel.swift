//
//  GarageViewModel.swift
//  App1078
//
//  Created by IGOR on 14/11/2024.
//

import SwiftUI
import CoreData

final class GarageViewModel: ObservableObject {
    
    @AppStorage("balance") var balance: String = ""
    @AppStorage("change") var change: String = ""
    @AppStorage("direct") var direct: String = ""
    
    @AppStorage("numCars") var numCars: Int = 0
    @AppStorage("numDrivers") var numDrivers: Int = 0
    
    @Published var addBalance: String = ""
    @Published var addChange: String = ""
    @Published var addDirect: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddDriver: Bool = false
    
    @Published var buttonSelect: [String] = ["Cars", "Drivers"]
    @Published var currentBS = "Cars"
    
    @Published var statuses: [String] = ["Available", "In Service", "Servicing", "Not Available"]
    @Published var curStatus = ""

    @AppStorage("namesDrivers") var namesDrivers: [String] = []
    @Published var driverForAdd = ""
    @Published var addNameDriver = ""

    @Published var cDriver: String = ""
    @Published var cMM: String = ""
    @Published var cLP: String = ""
    @Published var cStatus: String = ""
    @Published var cMil: String = ""
    @Published var cLastSD: String = ""
    @Published var cNextSD: String = ""

    @Published var cars: [CarsModel] = []
    @Published var selectedCar: CarsModel?

    func addCar() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CarsModel", into: context) as! CarsModel

        loan.cDriver = cDriver
        loan.cMM = cMM
        loan.cLP = cLP
        loan.cStatus = cStatus
        loan.cMil = cMil
        loan.cLastSD = cLastSD
        loan.cNextSD = cNextSD

        CoreDataStack.shared.saveContext()
    }

    func fetchCars() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CarsModel>(entityName: "CarsModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.cars = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.cars = []
        }
    }
}
