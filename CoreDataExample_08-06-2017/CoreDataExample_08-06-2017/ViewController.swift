//
//  ViewController.swift
//  CoreDataExample_08-06-2017
//
//  Created by Gabriele Suerz on 08/06/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var people: [Person] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let managedContext = self.container.viewContext
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        do {
            self.people = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
    }
    
    @IBAction func addPerson(_ sender: Any) {
        let alert = UIAlertController.init(title: "Hey", message: "You", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: {
                (UIAlertAction) in
                    self.add(name: (alert.textFields?[0].text)!)
            }
        ))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = self.people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let alert = UIAlertController.init(title: "Modify", message: "Modify the person name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: {
                (UIAlertAction) in
                self.modify(indexPath: indexPath, name: (alert.textFields?[0].text)!)
            }
            ))
            alert.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
            alert.addTextField(configurationHandler: nil)
            self.present(alert, animated: true, completion: nil)
        }
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let alert = UIAlertController.init(title: "Delete", message: "Delete the person", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: {
                (UIAlertAction) in
                self.delete(indexPath: indexPath)
            }
            ))
            alert.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return [delete, edit]
    }
    
    func add(name: String){
        let container = self.appDelegate.persistentContainer
        let context = container.viewContext
        let person: Person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        person.name = name
        do {
            try context.save()
            self.people.append(person)
        }catch {
            
        }
        self.tableView.reloadData()
    }
    
    func delete(indexPath: IndexPath){
        let container = self.appDelegate.persistentContainer
        let context = container.viewContext
        do {
            try context.delete(people[indexPath.row])
            self.people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
    }
    
    func modify(indexPath: IndexPath, name: String){
        let person = self.people[indexPath.row]
        person.name = name
        self.tableView.reloadData()
        self.appDelegate.saveContext()
    }

}

