//
//  Network.swift
//  KivaLoan
//
//  Created by Perry Davies on 22/01/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class Network
{
    let kivaUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    init(callback:@escaping ([KivaLoan])->Void)
    {
        
        connect(callback: callback)
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
                    if let data = data
                    {
                        let loans = self.parseJson(data: data)
                        callback(loans)
                    }
                }
            }).resume()
            
             
        }
    }
     
    func parseJson(data:Data) -> [KivaLoan]
    {
        var json: Dictionary = Dictionary<AnyHashable, AnyObject>()
        var kivaLoans = [KivaLoan]()
        do{
            json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<AnyHashable, AnyObject>
            
            let loans = json["loans"] as! [AnyObject]
            for jsonLoan in loans
            {
                let kivaLoan = KivaLoan()
                kivaLoan.nameLabel = jsonLoan["name"] as! String
                let location = jsonLoan["location"] as! [String:AnyObject]
                
                kivaLoan.countryLabel = location["country"] as! String
                kivaLoan.useLabel = jsonLoan["use"] as! String
            
                kivaLoan.amountLabel = jsonLoan["loan_amount"] as! Int
                
                kivaLoans.append(kivaLoan)
            }
            
            print(kivaLoans.map({
                
                return $0.toString() 
                
            }))
        
        }catch
        {
            print("Conversion error")
            return []
        }
        return kivaLoans
    }
}
