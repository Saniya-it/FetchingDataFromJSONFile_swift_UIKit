//
//  Phone.Manager.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya 
//

import UIKit

struct PhoneManager {
      
    func fetchPhones(completion: @escaping(PhoneModel) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=keyword&apiKey=a091c4a749214b8c8313f7ccc0aa5a77") else {return}
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
 
