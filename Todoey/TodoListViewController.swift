//
//  ViewController.swift
//  Todoey
//
//  Created by Rodrigo Guerrero Rocha on 3/13/19.
//  Copyright © 2019 Rodrigo Guerrero Rocha. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Juanito","Pedro","Artemizo"];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //este es para saber el numero de filas que se van a mostrar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    
    //esta es para el origen de los datos
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = self.itemArray[indexPath.row];
        
        
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell",for:indexPath);
        
        cell.textLabel?.text = message;
        
        return cell;
    }
    //este metodo nos sirve cuando estamos seleccionando una celda en especifico y queremos agregarle algo por ejemplo una paloma o algo asi
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row);
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{ //verificamos si ya tiene puesta una marca esa celda
            tableView.cellForRow(at: indexPath)?.accessoryType = .none;
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark;
        }
        tableView.deselectRow(at: indexPath, animated: true);//esta es para que no se quede marcada la linea
    
    }

}

