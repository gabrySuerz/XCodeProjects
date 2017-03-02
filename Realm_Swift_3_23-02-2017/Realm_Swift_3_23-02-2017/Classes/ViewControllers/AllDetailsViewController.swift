//
//  AllDetailsViewController.swift
//  Realm_Swift_3_23-02-2017
//
//  Created by Gabriele Suerz on 23/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit
import RealmSwift

class AllDetailsViewController: UIViewController {

    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var personImage: UIImageView!
    
    public var idPerson = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setGUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setPerson()
    }
    
    private func setGUI() {
        let rightButton = UIBarButtonItem(
            title: "Modify",
            style: .plain,
            target: self,
            action: #selector(buttonModifyPressed(_:)))
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        if idPerson != -1 {
            setPerson()
        }
    }
    
    private func setPerson() {
        let realm = try! Realm()
        let thisPerson = realm.objects(Person.self).filter("id == \(idPerson)").first
        
        if thisPerson?.image != nil && thisPerson?.image != ""{
            let data = FileManager.default.contents(atPath: (thisPerson?.image)!)
            // personImage.image = UIImage(data: data!)
        }
        surnameLabel.text = thisPerson!.username
        nameLabel.text = thisPerson!.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthdayLabel.text = dateFormatter.string(from: thisPerson!.birth)
        addressLabel.text  = thisPerson!.address
        phoneLabel.text  = "\(thisPerson!.phone)"
        emailLabel.text = thisPerson!.email
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "modify" {
            if sender is UIBarButtonItem {
                let add = segue.destination as! AddPersonViewController
                add.idPerson = idPerson
            }
        }
    }
    
    func buttonModifyPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "modify", sender: sender)
    }

}
