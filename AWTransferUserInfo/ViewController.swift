//
//  ViewController.swift
//  AWTransferUserInfo
//
//  Created by Brett Chapin on 2/5/18.
//  Copyright © 2018 Black Rose Productions. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    @IBOutlet weak var receivedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendDataPressed(_ sender: Any) {
        let userInfo = ["Hello" : "Hello, from the iPhone."]
        let session = WCSession.default
        
        if session.activationState == .activated {
            session.transferUserInfo(userInfo)
        }
    }
    
    // MARK: Function for recieving userInfo from AppleWatch
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        DispatchQueue.main.async {
            if let output = userInfo["World"] as? String {
                self.receivedDataLabel.text = output
            }
        }
    }
    
    // MARK: Required methods for WCSessionDelegate
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // TODO: Implement as you see fit.
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        // TODO: Implement as you see fit.
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // TODO: Implement as you see fit.
    }


}

