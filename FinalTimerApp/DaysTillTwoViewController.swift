//
//  DaysTillTwoViewController.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/20/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class DaysTillTwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBOutlet weak var EditButton: UIBarButtonItem!
    
    var curCategory: category!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let myCell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        myCell.textLabel?.text = "\(curCategory.Dates[indexPath.row].name) - \(curCategory.Dates[indexPath.row].daysTill())"
        
        
        return myCell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return curCategory.Dates.count
    }

    
    
    
    
    
    @IBAction func EditTap(_ sender: Any)
    {
        if (EditButton.tag == 0)
        {
            
            myTableView.isEditing = true
            EditButton.tag = 1
        }
        else
        {
            myTableView.isEditing = false
            EditButton.tag = 0
        }
    }
    
    //--------------------------commit editingStyle--------------------------------------
    //-----------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            
            curCategory.Dates.remove(at: indexPath.row)
            myTableView.reloadData() // reload table view
        }
        
    }
    //-----------------------------canMoveRowAt------------------------------------------------
    //-----------------------------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    //-------------------------moveRowAt------------------------------------------------
    //-----------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let personN = curCategory.Dates[sourceIndexPath.row]
        curCategory.Dates.remove(at: sourceIndexPath.row)
        curCategory.Dates.insert(personN, at: destinationIndexPath.row)
        
    }
    

    
    
    
    @IBAction func AddTap(_ sender: Any)
    {
        
        let myAlert = UIAlertController(title: "Enter Date", message: nil, preferredStyle: .alert)
       
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Event" // add place holder text
        }
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Year" // add place holder text
        }
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Month" // add place holder text
        }
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Day" // add place holder text
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let year = myAlert.textFields![1] as UITextField
            let month = myAlert.textFields![2] as UITextField
            let day = myAlert.textFields![3] as UITextField
            let event = myAlert.textFields![0] as UITextField
            
            self.curCategory.Dates.append(MyDate(name: event.text!, year: Int(year.text!)!, month: Int(month.text!)!, day: Int(day
                .text!)!))
            self.myTableView.reloadData()
            self.delegate.save()
        }
        myAlert.addAction(addAction)
        
        
        self.present(myAlert, animated: true, completion: nil)
        
        
        
    }
    

}
