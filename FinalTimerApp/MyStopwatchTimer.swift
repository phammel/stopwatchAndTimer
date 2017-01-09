//
//  MyStopwatchTimer.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/19/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import Foundation

import UIKit

class MyStopwatchTimer
{

    
    var time: Double
    
    var mytimer = Timer()
    
    var thetableView: UITableView!
    
    var running = false
    
    init(thetableView: UITableView )
    {
        time = 0;
        self.thetableView = thetableView
    }
    
    func Start()
    {
        running = true
        
        mytimer = Timer.scheduledTimer(timeInterval: 0.10, target: self, selector: #selector(Increment), userInfo: nil, repeats: true)
        
    }
    
    @objc func Increment()
    {
        time += 0.10
        thetableView.reloadData()
    }
    
    func Pause()
    {
        running = false
        mytimer.invalidate()
    }
    
    func Reset()
    {
        running = false
        mytimer.invalidate()
        time = 0.00
        thetableView.reloadData()
        
    }
    
    
    
}
