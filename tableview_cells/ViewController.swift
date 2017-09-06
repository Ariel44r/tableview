//
//  ViewController.swift
//  tableview_cells
//
//  Created by Ariel Ramírez on 05/09/17.
//  Copyright © 2017 Ariel Ramírez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var list = ["Ernesto","Gabriel","Karla"]
    
    //return_number_cells
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    //custom_cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! viewcontrollerTableViewCell
        cell.myImage.image = UIImage(named:(list[indexPath.row] + ".jpg"))
        cell.myLabel.text = list[indexPath.row]
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            list.remove(at: indexPath.row)
            tableView.reloadData()
            print(list)
        }
    }
    
    @IBAction func button_borrar(_ sender: Any) {
        
        displayalert(userMessage: "Seguro que desea borrar el elemento de la lista?")
        
    }
    
    
    //display_alert_function
    func displayalert(userMessage:String) {
        let myalert = UIAlertController(title:"Aviso", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler:nil)
        myalert.addAction(okAction)
        let declineaction = UIAlertAction(title:"decline", style: UIAlertActionStyle.default, handler:nil)
        myalert.addAction(declineaction)
        self.present(myalert, animated:true, completion:nil)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

