//
//  NetworkCallAPI.swift
//  NetworkingApp
//
//  Created by FGT MAC on 3/22/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation


class NetworkCallAPI {
    
    func fetchVersionsFromServer(completion: @escaping ([XcodeVersion]?) -> Void) {
        
        //Constructiong URL
        guard let baseUrl = URL(string: "https://xcodereleases.com/data") else {
            completion(nil)
            return
        }
        let requestURL = baseUrl.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            
            if let _ = error {
                completion(nil)
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do{
                let versions = try jsonDecoder.decode([XcodeVersion].self, from: data)
                completion(versions)
            }catch{
                completion(nil)
            }
        }.resume()
    }
    
}
