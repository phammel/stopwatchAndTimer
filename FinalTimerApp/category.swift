//
//  category.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/20/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import Foundation

import UIKit


class category: NSObject, NSCoding
{
    
    var category = ""
    var Dates = [MyDate]()
    
    required init?(coder aDecoder: NSCoder)
    {
        category = aDecoder.decodeObject(forKey: "category") as! String
        Dates = aDecoder.decodeObject(forKey: "Dates") as! [MyDate]
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(category, forKey: "category" )
        aCoder.encode(Dates, forKey: "Dates")
    }

    

    init(category: String)
    {
        
        self.category = category
    }
    
    
    
}
