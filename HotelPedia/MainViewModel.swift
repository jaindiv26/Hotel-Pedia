//
//  MainViewModel.swift
//  HotelPedia
//
//  Created by Divyansh  Jain on 21/09/19.
//  Copyright © 2019 Divyansh  Jain. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate {
    func getItems(items: [HotelModel])
}

class ViewModel {
    
    var delegate: MainViewModelDelegate?
    
    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
    }
    
    var model: [HotelModel] = []
    
    public func loadItems () {
        let baseUrl : String = "https://api.jael.ee/datasets/hotels?country=singapore"
        
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?
        
        if let urlComponents = URLComponents(string: baseUrl) {
            guard urlComponents.url != nil else {
                return
            }
            
            let request = URLRequest(url: urlComponents.url!)
            
            dataTask =
                defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    
                    guard let dataResponse = data,
                        error == nil else {
                            print(error?.localizedDescription ?? "Response Error")
                            return }
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with:
                            dataResponse, options: [])
                        
                        guard let jsonArray = jsonResponse as? [[String: Any]] else {
                            return
                        }
                        
                        for i in jsonArray {
                            
                            let add = i["address"] as! NSDictionary
                            let street = add.value(forKey: "street") as! String
                            let city = add.value(forKey: "city") as! String
                            let hotelModel = HotelModel.init(
                                name: i["name"] as! String,
                                totalrooms: i["totalrooms"] as! Int,
                                address: street + ", " + city
                            )
                            self?.model.append(hotelModel)
                        }

                        if let list = self?.model {
                            print(list.count)
                            self?.delegate?.getItems(items: list)
                        }
                    } catch let parsingError {
                        print("Error in parsing data", parsingError)
                    }
            }
            dataTask?.resume()
        }
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
