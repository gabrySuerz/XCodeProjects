//
//  DetailPersonViewController.swift
//  Realm_Swift_3_23-02-2017
//
//  Created by Gabriele Suerz on 23/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit
import RealmSwift

class AddPersonViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var personImageView: UIImageView!

    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var buttonInsert: UIButton!
    
    public var idPerson = -1
    let backgroundQueue = DispatchQueue(label: ".realm", qos: .background)
    let realm = try! Realm()
    var p = Person()
    var addOr = false

    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGUI()
        
        imagePicker.delegate = self
        
        let rightButton = UIBarButtonItem(
            title: "Add Photo",
            style: .plain,
            target: self,
            action: #selector(addImageButton(_:)))
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    private func setGUI() {
        if idPerson != -1 {
            p = realm.objects(Person.self).filter("id == \(idPerson)").first!
            addOr = true;
            //load_image(urlString: p.image)
            surnameTextField.text = p.username
            nameTextField.text = p.name
            birthdayDatePicker.date = p.birth
            addressTextField.text  = p.address
            phoneTextField.text  = p.phone
            emailTextField.text = p.email
            self.title = "ModifyPerson"
            navigationItem.rightBarButtonItem?.title = "Modify Photo"
            buttonInsert.setTitle("Modify", for: UIControlState.normal)
        }
    }
    
    /*func load_image(urlString:String){
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(url: imgURL as URL)
        URLSessionDataTask(); NSURLConnection.sendAsynchronousRequest(
            request as URLRequest, queue: OperationQueue.main,
            completionHandler: {(response: URLResponse!,data: Data!,error: NSError!) -> Void in
                if error == nil {
                    self.personImageView.image = UIImage(data: data)
                }
        } as! (URLResponse?, Data?, Error?) -> Void)
        
    }*/
    
    @IBAction func buttonAddPressed(_ sender: UIButton) {
        try! realm.write {
            p.username = surnameTextField.text!
            p.name = nameTextField.text!
            p.birth = birthdayDatePicker.date as Date
            p.address = addressTextField.text!
            p.phone = phoneTextField.text!
            p.email = emailTextField.text!
        }
        if !self.addOr {
            self.p.id = self.incrementID()
            backgroundQueue.async {               
                let realm = try! Realm()
                try! realm.write {
                    realm.add(self.p, update: self.addOr)
                }
            }
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Person.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    // image picker
    
    func addImageButton(_ sender : AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : Any]) {
        let imageUrl          = info[UIImagePickerControllerReferenceURL] as! NSURL
        let imageName         = imageUrl.lastPathComponent
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let photoURL          = NSURL(fileURLWithPath: documentDirectory)
        let localPath         = photoURL.appendingPathComponent(imageName!)
        let tempImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        let data              = UIImagePNGRepresentation(tempImage!)
        do{
            try data?.write(to: localPath!, options: Data.WritingOptions.atomic)
            
        } catch{
            
        }
        personImageView.image  = tempImage
        try! realm.write {
            //p.image = localPath!.path
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
