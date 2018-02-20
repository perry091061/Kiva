//
//  Network.swift
//  KivaLoan
//
//  Created by Perry Davies on 22/01/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class Network : Codable
{
    let kivaUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    init(callback:@escaping ([KivaLoan])->Void)
    {
        
        connect(callback: callback )
    }
    
    func connect(callback:@escaping ([KivaLoan])->Void)
    {
        if let url = URL(string: kivaUrl)
        {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .ephemeral)
            session.dataTask(with: request, completionHandler: { (data, response, error) in
                if let _ = error
                {
                    return
                }
                
                if (response as! HTTPURLResponse).statusCode == 200
                {
                        guard let data = data
                        else { return }
                    
                        OperationQueue.main.addOperation {
                            let loans = self.parseJson(data: data)
                            callback(loans)
                        }
                
                }
            }).resume()
            
             
        }
    }
     
    func parseJson(data:Data) -> [KivaLoan]
    {
         
        var kivaLoans : [KivaLoan]?
        
        do{
            let decoder = JSONDecoder()
            guard let kivaLoan = try decoder.decode(Loans.self, from: data).loans
                else { return [] }
            
            return kivaLoan
        
        }catch
        {
            print("Conversion error \(error)")
            return []
        }
        return []
    }
}
