//
//  TourismManager.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 08/06/22.
//

import Foundation

struct TourismManager{
    func fetchTourism(completion: @escaping(TourismModel)->Void){
        guard let url = URL(string: "https://tourism-api.dicoding.dev/list") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url){(data, _,error) in
            if let error = error{
                print("Error fetching tourism: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else {return }
            
            let decoder = JSONDecoder()
            
            do{
                let decodedData = try decoder.decode(TourismModel.self, from: jsonData)
                completion(decodedData)
            }catch{
                print("Error decoding data.")
            }
        }
        
        dataTask.resume()
    }
}
