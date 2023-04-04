//
//  NetworkManager.swift
//  HSTestApp
//
//  Created by ROMAN VRONSKY on 04.04.2023.
//

import Foundation

class NetworkManager {
    static let shared: NetworkManager = .init()
    
    let headers = [
        "X-RapidAPI-Key": "0765c2b9b8msh16a080b9cd5b61fp1b04d2jsn66e7e997d5a5",
        "X-RapidAPI-Host": "pizzaallapala.p.rapidapi.com"
    ]

    
    func getPizzas(completion: @escaping ([Pizza]) -> Void)  {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://pizzaallapala.p.rapidapi.com/productos")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.init(configuration: .default)
        
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            if let error {
                print(error.localizedDescription)
                
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            print(statusCode ?? "")
            if statusCode != 200 {
                print("Status Code = \(String(describing: statusCode))")
                
                return
            }
            guard let data else {
                print("data = nil")
                return
            }
            do {
                let answer = try JSONDecoder().decode(AnswerPizza.self, from: data)
                let pizza = answer.productos
                completion(pizza)
                
            } catch {
                print(error)
                
            }
        }
        task.resume()
    }
}
