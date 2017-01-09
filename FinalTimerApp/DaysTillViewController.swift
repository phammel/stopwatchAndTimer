//
//  DaysTillViewController.swift
//  FinalTimerApp
//
//  Created by Phammel on 12/20/16.
//  Copyright © 2016 Phammel. All rights reserved.
//

import UIKit

class DaysTillViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var MyTableView: UITableView!
    
    
    @IBOutlet weak var EditButton: UIBarButtonItem!
    
    var categoriesArray = [category]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.instance = self
        load()
       
    }
    
    //----------------------------------cellForRowAt--------------------------------------
    //-----------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let myCell = MyTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        myCell.textLabel?.font = UIFont(name: "Gill Sans", size: 20)
        myCell.textLabel?.text = categoriesArray[indexPath.row].category
        
        return myCell
    }
    //-----------------------------numberOfRowsInSection-----------------------------------
    //-----------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return categoriesArray.count
        
    }

    
    
    
    @IBAction func EditTap(_ sender: Any)
    {
        if (EditButton.tag == 0)
        {
            
            MyTableView.isEditing = true
            EditButton.tag = 1
        }
        else
        {
            MyTableView.isEditing = false
            EditButton.tag = 0
        }
    }
    
    @IBAction func AddTap(_ sender: Any)
    {
        
        let myAlert = UIAlertController(title: "Add category", message: nil, preferredStyle: .alert)
        myAlert.addTextField { (alertTextfeild) -> Void in
            alertTextfeild.placeholder = "Category Name" // add place holder text
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let name = myAlert.textFields![0] as UITextField
            
            self.categoriesArray.append(category(category: name.text!))
            self.MyTableView.reloadData()
             self.save()
        }
        myAlert.addAction(addAction)
        
        
        self.present(myAlert, animated: true, completion: nil)
       
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == .delete)
        {
            
            categoriesArray.remove(at: indexPath.row)
            MyTableView.reloadData() // reload table view
            save()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let categoryN = categoriesArray[sourceIndexPath.row]
        categoriesArray.remove(at: sourceIndexPath.row)
        categoriesArray.insert(categoryN, at: destinationIndexPath.row)
        save()
        
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
   {
        
        let detailview = segue.destination as! DaysTillTwoViewController
       let selectedrow = MyTableView.indexPathForSelectedRow?.row
        
        detailview.curCategory = categoriesArray[selectedrow!]
        
        
        
    }

    
    
    
    var filePath: String{
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as URL
        return url.appendingPathComponent("savedData").path
        
    }
    
    func load()
    {
        if let array = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [category]
        {
            categoriesArray = array
        }
        
    }
    
    
    //----------------------------------save--------------------------------------
    //-----------------------------------------------------------------------------------------
    
    
    func save()
    {
        NSKeyedArchiver.archiveRootObject(categoriesArray, toFile: filePath)
    }
    

    
    
    
    

    

}
