////
////  CareTaker.swift
////  course4
////
////  Created by Вячеслав Поляков on 20.09.2021.
////
//
//import Foundation
//
//class CareTaker {
//    private let encoder = JSONEncoder()
//    private let decoder = JSONDecoder()
//    
//    private let key = "Games"
//    
//    func saveGame(records: [Record]) {
//        do {
//            let data = try encoder.encode(records)
//            UserDefaults.standard.setValue(data, forKey: key)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//    func loadGame() -> [Record]? {
//        guard let data = UserDefaults.standard.data(forKey: key) else {
//            return nil
//        }
//        
//        do {
//            return try decoder.decode([Record].self, from: data)
//        } catch {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
//}
