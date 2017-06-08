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
    
    var people: [String] = []
    
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
            let person:[Person] = try managedContext.fetch(fetchRequest)
            people = person.map({ (person) in
                return person.name!
            })
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
    }
    
    @IBAction func addPerson(_ sender: Any) {
        let alert = UIAlertController.init(title: "Hey", message: "You", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: {
                (UIAlertAction) in
                let context = self.container.viewContext
                let person: Person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
                person.name = alert.textFields?[0].text
                do {
                    try context.save()
                    self.people.append(person.name!)
                }catch {
                    
                }
                self.tableView.reloadData()
            }
        ))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = person
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let context = self.container.viewContext
            let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
            fetchRequest.predicate = NSPredicate(format: "name contains[c] %@", (tableView.cellForRow(at: indexPath)?.textLabel?.text!)!)
            do {
                let person:[Person] = try context.fetch(fetchRequest)
                context.delete(person.first!)
                people.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
            } catch let error as NSError {
                print("Could not fetch \(error)")
            }
        } else if editingStyle == .insert {
            
        }
    }

}

