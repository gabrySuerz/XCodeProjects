//
//  PeopleTableViewController.swift
//  Realm_Swift_3_23-02-2017
//
//  Created by Gabriele Suerz on 23/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit
import RealmSwift

class PeopleTableViewController: UITableViewController, LoadingPeopleDelegate {

    let realm = try! Realm()
    let backgroundQueue = DispatchQueue(label: ".realm", qos: .background)
    var list: Results<Person>!
    let spinner = UIActivityIndicatorView()
    private var idToSend = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundQueue.async {
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll()
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        self.editButtonItem.title = "Delete"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white        
        
        tableView.tableFooterView = UIView()
        
        // spinner property
        spinner.center = view.center
        spinner.color = UIColor.black
        spinner.hidesWhenStopped = true
        self.view.addSubview(spinner)
        spinner.startAnimating()
        
        let ld = LoadingPeople()
        ld.delegate = self
        ld.getData(urlAsString: "https://jsonplaceholder.typicode.com/users")
        
        list = getPersons()
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getPersons().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        
        cell.imageView?.image = UIImage(named: "person-placeholder")
        cell.textLabel?.text = list[indexPath.row].username
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        
        //var itemToMove = getPersons()[fromIndexPath.row]
        
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let myAlert = UIAlertController(title: "Delete User", message: "Do you want delete the user?", preferredStyle: .alert)
            
            
            myAlert.addAction(UIAlertAction(title: "YES", style: .default, handler: {  (action) in
                self.backgroundQueue.async {
                    let realm = try! Realm()
                    try! realm.write {
                        realm.delete(self.list[indexPath.row])
                        tableView.deleteRows(at: [indexPath], with: .left)
                    }
                }
            }))
            myAlert.addAction(UIAlertAction(title: "NO", style: .default, handler: nil))
            
            self.present(myAlert, animated: true, completion: nil)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // MARK: - Utils
    
    func getPersons() -> Results<Person> {
        // spinner stopped
        spinner.stopAnimating()
        return realm.objects(Person.self).sorted(byKeyPath: "name", ascending: true)
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Person.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "personDetails" {
            if sender is UITableViewCell {
                let add = segue.destination as! AllDetailsViewController
                add.idPerson = list[(tableView.indexPathForSelectedRow?.row)!].id
            }
        }
    }
    
    // MARK: - Delegate
    
    func dataArrived(data: Array<Dictionary<String, AnyObject>>) {
        data.forEach { (my: [String : AnyObject]) in
            let p = Person()
            p.name = my["name"] as! String
            p.username = my["username"] as! String
            p.phone = my["phone"] as! String
            p.email = my["email"] as! String
            my["address"].map({ (address) in
                p.address = "\(address["city"] as! String) \(address["street"] as! String) \(address["suite"] as! String)"
            })
            p.birth = Date()
            
            backgroundQueue.async {
                let realm = try! Realm()
                try! realm.write {
                    p.id = self.incrementID()
                    realm.add(p)
                    DispatchQueue.main.sync() {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

}
