//
//  ViewController.swift
//  tableview_cells
//
//  Created by Ariel Ramírez on 05/09/17.
//  Copyright © 2017 Ariel Ramírez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    //MARK: variables
    var currentIndexPhoto:Int = 0
    
    //MARK: Outlets&Actions
    @IBOutlet weak var tableMascota: UITableView!
    
    //ActionButtonDelete
    @IBAction func callbuttonpressed(_ sender: UIButton) {
        print("button_pressed_\(sender.tag)")
        displayalert(userMessage: "Realmente desea eliminar este elemento?", index: sender.tag)
    }
    
    @IBAction func addDog(_ sender: Any) {
        print("Button add new dog are pressed")
        displayFieldTextAlert()
    }
    
    //actionButtonAddImage
    @IBAction func buttonAddImage(_ sender: Any) {
        print("button Add Image Pressed")
        let image = UIImagePickerController()
        image.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        currentIndexPhoto = (sender as! UIButton).tag
        self.present(image, animated: true) {
            //despues de completar proceso
        }
    }
    
    //get Image and assign to Perro's photo attribute
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            dogs[currentIndexPhoto].photo = image
            tableMascota.reloadData()
        } else {
            //errorMessage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Objects
    class Perro {
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
    
    //MARK: GlobalInstance
    var dogs:[Perro] = [Perro]()
    
    //MARK: Alerts
    //displaySimpleAlert
    func displaySimpleAlert(userMessage:String) {
        
        let myalert = UIAlertController(title:"Aviso", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler:nil)
        myalert.addAction(okAction)
        
        self.present(myalert, animated:true, completion:nil)
    }
    //displayAlertFunctionBeforeDelete
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
    
    //DisplayAlertFieldTextInput
    func displayFieldTextAlert () {
        //Create the alert controller.
        let alert = UIAlertController(title: "Ingresa el nombre del Perro", message: "", preferredStyle: .alert)
        
        //Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        //Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            var textFieldUnwrapped = String()
            //checkIfTextFieldIsEmpty
            if textField!.text != nil && textField!.text! != "" {
                textFieldUnwrapped = textField!.text!
                print("Text field: \(textFieldUnwrapped)")
                self.addIndex(name: textFieldUnwrapped)
            } else if textField!.text! == "" {
                self.displaySimpleAlert(userMessage: "Aun no ha ingresado el nombre, por favor intente otra vez")
            }
        }))
        
        //Present the alert.
        self.present(alert, animated: true, completion: nil)
    }

    //MARK: ProccesingTableViewCell
    //eliminarRegistroDeLaLista
    func deleteIndex (index : Int) {
        dogs.remove(at: index)
        tableMascota.reloadData()
    }
    
    //addNewIndex
    func addIndex(name: String) {
        let dog = Perro (name: name, photo: UIImage(named: "Gabriel.jpg")!)
        dogs.append(dog)
        tableMascota.reloadData()
        print(dogs[0].name)
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



extension ViewController {
    
    //MARK: TableViewDelegate
    //returnNumberCells
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dogs.count)
    }
    
    //customCell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! viewcontrollerTableViewCell
        cell.myImage.image = dogs[indexPath.row].returnImage()
        cell.myLabel.text = dogs[indexPath.row].returnName()
        cell.myButton.tag = indexPath.row
        print(indexPath.row)
        cell.buttonAddImage.tag = indexPath.row
        cell.myButton.addTarget(self, action: #selector(ViewController.callbuttonpressed(_:)), for: UIControlEvents.touchUpInside)
        cell.buttonAddImage.addTarget(self, action: #selector(ViewController.buttonAddImage(_:)), for: UIControlEvents.touchUpInside)
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
            dogs.remove(at: indexPath.row)
            tableView.reloadData()
            print(dogs)
        }
    }
}
