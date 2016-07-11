//
//  MyoTest.swift
//  MyoReader
//
//  Created by Sam Hastings on 7/10/16.
//  Copyright © 2016 SEH. All rights reserved.
//

import Foundation

let notifer = NSNotificationCenter.defaultCenter()
private var myo: TLMMyo? {
    return TLMHub.sharedHub().myoDevices().first as? TLMMyo
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // myo.usa
        notifer.addObserverForName(TLMHubDidConnectDeviceNotification, object: nil, queue: nil) {
            (notification: NSNotification!) -> Void in
            myo!.setStreamEmg(.Enabled)
            
        }
        notifer.addObserver(self, selector: #selector(ViewController.didConnectDevice(_), name: TLMHubDidConnectDeviceNotification, object: nil)
            notifer.addObserver(self, selector: #selector(ViewController.didDisconnectDevice(_), name: TLMHubDidDisconnectDeviceNotification, object: nil)
            notifer.addObserver(self, selector: #selector(ViewController.didRecieveAccelerationEvent(_), name: TLMMyoDidReceiveAccelerometerEventNotification, object: nil)
            // myo?.setStreamEmg(TLMStreamEmgDisabled)
            notifer.addObserver(self, selector: #selector(ViewController.onEmg(_), name: TLMMyoDidReceiveEmgEventNotification, object: nil)
            
            // Do any additional setup after loading the view, typically from a nib.
            }
            
            @IBAction func btnScan(sender: AnyObject) {
            let controller = TLMSettingsViewController.settingsInNavigationController()
            presentViewController(controller, animated: true, completion: nil)
            
            }
            override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
            }
            func didConnectDevice(notification: NSNotification) {
            print(“device connected”)
    }
    func didDisconnectDevice(notification: NSNotification) {
        print(“device disconnected”)
    }
    func didRecieveAccelerationEvent(notification: NSNotification) {
        // if let accelerometerEvent = notification.userInfo? as? TLMAccelerometerEvent {
        // print(accelerometerEvent.vector)
        // 
        
    }
    
    
    func onEmg(notification: NSNotification) {
        if let emg = notification.userInfo? as? TLMEmgEvent {
            print(emg.rawData)
        }
    }
}