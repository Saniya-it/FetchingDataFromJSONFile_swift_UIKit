//
//  Phone.Manager.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya 
//

import UIKit

struct PhoneManager {
      
    func fetchPhones(completion: @escaping(PhoneModel) -> ()) {
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return  }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode(PhoneModel.self, from: jsonData)
                print(decodedData)
                completion(decodedData) 
            }
            catch {
                print("Error")
                 
            }
            
        }
        dataTask.resume()
    }
}
 
