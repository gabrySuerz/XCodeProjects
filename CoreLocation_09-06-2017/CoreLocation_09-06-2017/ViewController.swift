//
//  ViewController.swift
//  CoreLocation_09-06-2017
//
//  Created by Gabriele Suerz on 09/06/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import UIKit
import MapKit
import UserNotifications
import UserNotificationsUI

struct PositionGPX {
    static let lat = 37.37215601;
    static let long = -122.14117960;
}

class ViewController: UIViewController, CLLocationManagerDelegate, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let requestIdentifier = "regionRequest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        let appleLocation = CLCircularRegion(center: CLLocationCoordinate2DMake(PositionGPX.lat, PositionGPX.long), radius: 100.0, identifier: "Apple Headquarters")

        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                self.mapView.setUserTrackingMode(.follow, animated: true)
            }
        }
        else{
            print("Location services not enabled")
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "Sub"
        content.body = "body"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
            self.mapView.showsUserLocation = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLCircularRegion {
            
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == self.requestIdentifier {
            completionHandler([.alert, .badge, .sound])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

