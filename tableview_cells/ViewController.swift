//
//  ViewController.swift
//  tableview_cells
//
//  Created by Ariel Ramírez on 05/09/17.
//  Copyright © 2017 Ariel Ramírez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let list = ["Ernesto","Gabriel","Karla"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! viewcontrollerTableViewCell
        cell.myImage.image = UIImage(named:(list[indexPath.row] + ".jpg"))
        cell.myLabel.text = list[indexPath.row]
        return (cell)
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

