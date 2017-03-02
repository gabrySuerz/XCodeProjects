//
//  loadingPeople.swift
//  Realm_Swift_3_23-02-2017
//
//  Created by Gabriele Suerz on 28/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit

protocol LoadingPeopleDelegate {
    func dataArrived(data: Array<Dictionary<String, AnyObject>>)
}

class LoadingPeople: NSObject {
    
    var delegate: LoadingPeopleDelegate?

    func getData(urlAsString: String) -> Void {
        let url = URL(string: urlAsString)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            self.delegate?.dataArrived(data: json as! Array<Dictionary<String, AnyObject>>)
        }
        
        task.resume()
    }
    
}
