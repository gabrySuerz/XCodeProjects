//
//  ViewController.swift
//  chatMqtt
//
//  Created by Gabriele Suerz on 09/06/17.
//
//


import UIKit
import SwiftMQTT
import ACProgressHUD_Swift

class ViewController: UIViewController, MQTTSessionDelegate {
    
    var mqttSession: MQTTSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mqttSession = MQTTSession(host: "broker.mqttdashboard.com", port: 1883, clientID: "Damiano", cleanSession: true, keepAlive: 15, useSSL: false)
        mqttSession.delegate = self
        
        let progressView = ACProgressHUD.shared
        progressView.progressText = "Mi connetto al broker..."
        progressView.showHUD()
        
        mqttSession.connect { (succeeded, error) -> Void in
            if succeeded {
                print("Connected!")
                ACProgressHUD.shared.hideHUD()
                self.performSegue(withIdentifier: "chat", sender: nil)
            } else {
                ACProgressHUD.shared.hideHUD()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MQTTSessionDelegates
    func mqttDidReceive(message data: Data, in topic: String, from session: MQTTSession) {
        let string = String(data: data, encoding: .utf8)!
        print(string)
    }
    
    func mqttSocketErrorOccurred(session: MQTTSession) {
        //appendStringToTextView("Socket Error")
    }
    
    func mqttDidDisconnect(session: MQTTSession) {
        //appendStringToTextView("Session Disconnected.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chat" {
            let controller: chatTableViewController = segue.destination as! chatTableViewController
            controller.mqttSession = self.mqttSession
        }
    }

}

