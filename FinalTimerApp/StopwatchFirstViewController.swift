//
//  StopwatchFirstViewController.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/19/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class StopwatchFirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var AddButton: UIBarButtonItem!
    
    @IBOutlet weak var DeleteButton: UIBarButtonItem!
    
    @IBOutlet weak var ResetButton: UIBarButtonItem!
    
    var deleting  = false
    var reseting = false
    

    
    @IBOutlet weak var StopWatchTableView: UITableView!
    
    
    var StopWatchArray = [MyStopwatchTimer]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return StopWatchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let myCell = StopWatchTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        myCell.textLabel?.font = UIFont(name: "Gill Sans", size: 50)
        
        
        var celltext = "" + String(format: "%.2f", StopWatchArray[indexPath.row].time)
        myCell.textLabel?.text = celltext
        
        return myCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("tap")
        print("    ")
        if (deleting)
        {
            StopWatchArray[indexPath.row].Reset()
            StopWatchArray.remove(at: indexPath.row)
            StopWatchTableView.reloadData()
            deleting = false
            DeleteButton.tintColor = UIColor.black
        }
        else if(reseting)
        {
            StopWatchArray[indexPath.row].Reset()
            reseting = false
            ResetButton.tintColor = UIColor.black

            
        }
        else
        {
            if (StopWatchArray[indexPath.row].running)
            {
                StopWatchArray[indexPath.row].Pause()
            }
            else
            {
                StopWatchArray[indexPath.row].Start()
            }
        }
        
            
        
    }
    
    
    
    
    
    
    @IBAction func AddTap(_ sender: Any)
    {
        
        StopWatchArray.append(MyStopwatchTimer(thetableView: StopWatchTableView))
        StopWatchTableView.reloadData()
        
    }
    
    @IBAction func Delete(_ sender: Any)
    {
        deleting = !deleting
        if (deleting)
        {
            DeleteButton.tintColor = UIColor.red
        }
        else
        {
            DeleteButton.tintColor = UIColor.black
        }
    }
    
    @IBAction func RestTap(_ sender: Any)
    {
       
        
        reseting = !reseting
        
        if (reseting)
        {
        ResetButton.tintColor = UIColor.red
        }
        else
        {
            ResetButton.tintColor = UIColor.black
        }
    }
    
    
    
    
    
    
    

 
}
