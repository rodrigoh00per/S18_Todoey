//
//  ViewController.swift
//  Todoey
//
//  Created by Rodrigo Guerrero Rocha on 3/13/19.
//  Copyright © 2019 Rodrigo Guerrero Rocha. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
      //inicilizamos el USER Default para poder persistir data local
    var defaults = UserDefaults.standard;
    var itemArray = [Item]();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem  = Item();
        newItem.title = "Juanito";
        self.itemArray.append(newItem);
        
        
        let newItem2 = Item();
        newItem2.title = "Artemizo";
        self.itemArray.append(newItem2);
        
        let newItem3 = Item();
        newItem3.title = "Sami";
        self.itemArray.append(newItem3);
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //recuperamos la data y la seteamos en el array
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items;
        }
    }

    //este es para saber el numero de filas que se van a mostrar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    
    //esta es para el origen de los datos
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.itemArray[indexPath.row];
        let message = item.title;
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell",for:indexPath);
        
        cell.textLabel?.text = message;
        
    //acuerdate que aqui este metodo es para lo que mostrara tableView
        
        //verificamos que bandera esta en el item
        cell.accessoryType = item.done == true ? .checkmark : .none;
  
        
        return cell;
    }
    //este metodo nos sirve cuando estamos seleccionando una celda en especifico y queremos agregarle algo por ejemplo una paloma o algo asi
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row);
        
        
        self.itemArray[indexPath.row].done = !self.itemArray[indexPath.row].done;
       
           tableView.reloadData();
     
        tableView.deselectRow(at: indexPath, animated: true);//esta es para que no se quede marcada la linea
    
        
    }
//este boton nos permite
    @IBAction func addButtonItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField();
        
        let alert = UIAlertController(title: "Añade un Nuevo Elemento", message: "", preferredStyle: .alert );
        
        let action = UIAlertAction(title: "Añadir", style: .default) { (UIAlertAction) in
            
            if textField.text == "" {
                
                let newItem = Item();
                newItem.title = "Elemento Vacio";
                self.itemArray.append(newItem);
                
            }else {
                let newItem = Item();
                newItem.title = textField.text!;
                self.itemArray.append(newItem);
                
            }
            self.tableView.reloadData();
            //guardamos la data de manera local en nuestro telefono
            self.defaults.set(self.itemArray, forKey: "TodoListArray");
            
        }
        
        //dentro de la alerta estamos agregando un textField
        alert.addTextField { (alertTextField) in
            textField = alertTextField;
        }
        alert.addAction(action);
        
        present(alert, animated: true,completion: nil);
    }
}

