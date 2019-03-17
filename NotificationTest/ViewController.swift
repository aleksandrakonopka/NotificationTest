//
//  ViewController.swift
//  NotificationTest
//
//  Created by Aleksandra Konopka on 22/12/2018.
//  Copyright © 2018 Aleksandra Konopka. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var number = 0
    let center = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        center.requestAuthorization(options: [.alert,.sound]) { (granted, error) in
            //print(error)
        }
        
    }

    @IBAction func clickPressed(_ sender: UIButton) {
        let title = "Click button Pressed!"
        number = number+1
        let body = "Button has been clicked \(number) times"
        createNotification(title: title, body: body)
        }
    func createNotification(title:String,body:String)
    {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        self.center.add(request) { (error) in
            // print(error)
        }
    }
}

