//
//  InterfaceController.swift
//  AWApp Extension
//
//  Created by Brett Chapin on 2/5/18.
//  Copyright © 2018 Black Rose Productions. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation


class InterfaceController: WKInterfaceController, WCSessionDelegate {

    @IBOutlet var receivedDataLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func sendDataPressed() {
        let userInfo = ["World" : "Hello, from the AppleWatch."]
        let session = WCSession.default
        
        if session.activationState == .activated {
            session.transferUserInfo(userInfo)
        }
    }
    
    // MARK: Function for recieving userInfo from iPhone
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        DispatchQueue.main.async {
            if let output = userInfo["Hello"] as? String {
                self.receivedDataLabel.setText(output)
            }
        }
    }
    
    // MARK: Required methods for WCSessionDelegate
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // TODO: Implement as you see fit.
    }

}
