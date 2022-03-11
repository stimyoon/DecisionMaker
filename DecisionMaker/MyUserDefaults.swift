//
//  MyUserDefaults.swift
//  Health
//
//  Created by Tim Yoon on 3/10/22.
//

import Foundation
import Combine

class MyUserDefaults<T : Codable> : ObservableObject {
    @Published private (set) var item : T?
    private var key : String
    
    public func save(_ item: T) {
        self.item = item
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(item) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: key)
        }
    }
    
    private func fetch(){
        if let loadedData = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loadedItem = try? decoder.decode(T.self, from: loadedData) {
                self.item = loadedItem
            }
        }
    }
    
    init(key: String) {
        self.key = key
        fetch()
    }
}
