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

    @IBOutlet weak var tableMascota: UITableView!
    
    @IBAction func buttonAddDog(_ sender: Any) {
       displayFieldTextAlert()
    }
    
    class Perro {
        var list:[Perro] = [Perro]()
        var name: String
        var photo: UIImage
        init (name: String, photo: UIImage) {
            self.name = name
            self.photo = photo
        }
        func returnImage () -> UIImage {
            return self.photo
        }
        func returnName () -> String {
            return self.name
        }
    }
    
    var dogs:[Perro] = [Perro]()
    
    //ActionButton
    @IBAction func callbuttonpressed(_ sender: UIButton) {
        print("button_pressed_\(sender.tag)")
        displayalert(userMessage: "Realmente desea eliminar este elemento?", index: sender.tag)
        
    }
    
    //returnNumberCells
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    //customCell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! viewcontrollerTableViewCell
        cell.myImage.image = UIImage(named:(list[indexPath.row] + ".jpg"))
        cell.myLabel.text = list[indexPath.row]
        cell.myButton.tag = indexPath.row
        print(indexPath.row)
        cell.myButton.addTarget(self, action: #selector(ViewController.callbuttonpressed(_:)), for: UIControlEvents.touchUpInside)
        return (cell)
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
    }*/
    
    
    
    /*func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }*/
    
    //swipeToDeleteItem_
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            list.remove(at: indexPath.row)
            tableView.reloadData()
            print(list)
        }
    }
    
    //displayAlertFunction
    func displayalert(userMessage:String, index:Int) {
        
        let myalert = UIAlertController(title:"Aviso", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler:{ (action: UIAlertAction!) in
            print("Borrar registro")
            //sendIndexToDelete
            self.deleteIndex(index: index)
        })
        myalert.addAction(okAction)
        
        let cancelaction = UIAlertAction(title:"cancel", style: UIAlertActionStyle.default, handler:nil)
        myalert.addAction(cancelaction)
        
        self.present(myalert, animated:true, completion:nil)
    }

    //eliminarRegistroDeLaLista
    func deleteIndex (index : Int) {
        
        list.remove(at: index)
        tableMascota.reloadData()
        
    }
    
    //addNewIndex
    func addIndex(name: String) {
        list.append(name)
        tableMascota.reloadData()
    }

    
    func displayFieldTextAlert () {
        //Create the alert controller.
        let alert = UIAlertController(title: "Ingresa el nombre del Perro", message: "Enter a text", preferredStyle: .alert)
        
        //Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        //Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            var textfieldUnwrap = String()
            if textField!.text != nil {
                textfieldUnwrap = textField!.text!
            }
            print("Text field: \(textfieldUnwrap)")
            self.addIndex(name: textfieldUnwrap)
        }))
        
        //Present the alert.
        self.present(alert, animated: true, completion: nil)
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

