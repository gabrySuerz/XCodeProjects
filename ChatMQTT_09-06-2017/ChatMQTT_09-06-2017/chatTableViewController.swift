//
//  chatTableViewController.swift
//  
//
//  Created by Gabriele Suerz on 09/06/17.
//
//

import UIKit
import SwiftMQTT

class chatTableViewController: UITableViewController {

    var mqttSession: MQTTSession!
    var messages = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.mqttSession.subscribe(to: "Its_Ios", delivering: .atLeastOnce) { (succeeded, error) -> Void in
            if succeeded {
                print("Subscribed!")
                let jsonDict = ["client" : self.mqttSession.clientID, "message": "entro"]
                let data = try! JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
                
                self.mqttSession.publish(data, in: "Its_Ios", delivering: .atLeastOnce, retain: false) { (succeeded, error) -> Void in
                    if succeeded {
                        print("Published!")
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MQTTSessionDelegates
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        do{
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, String> {
                messages.append(dictionary as NSDictionary)
                self.tableView.reloadData()
            }
        } catch {
            
        }
    }
    
    func mqttSocketErrorOccurred(session: MQTTSession) {
        //appendStringToTextView("Socket Error")
    }
    
    func mqttDidDisconnect(session: MQTTSession) {
        //appendStringToTextView("Session Disconnected.")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = messages[indexPath.row].object(forKey: "message") as! String

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
