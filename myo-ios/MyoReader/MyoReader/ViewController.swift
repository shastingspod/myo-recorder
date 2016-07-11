//
//  ViewController.swift
//  MyoReader
//
//  Created by Sam Hastings on 7/10/16.
//  Copyright © 2016 SEH. All rights reserved.
//

import UIKit

let notifer = NSNotificationCenter.defaultCenter()
private var myo: TLMMyo? {
    return TLMHub.sharedHub().myoDevices().first as? TLMMyo
}

class ViewController: UIViewController {
    
    @IBOutlet weak var xValue: UILabel!
    @IBOutlet weak var yValue: UILabel!
    @IBOutlet weak var zValue: UILabel!
    
    @IBAction func connectMyoButton(sender: UIButton) {
        print("HI THERE")
        xValue.text = String(00)
        yValue.text = String(00)
        zValue.text = String(00)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        notifer.addObserverForName(TLMHubDidConnectDeviceNotification, object: nil, queue: nil) {
            (notification: NSNotification!) -> Void in
            myo!.setStreamEmg(.Enabled)
            
        }
        notifer.addObserver(self, selector: #selector(ViewController.didConnectDevice()), name: TLMHubDidConnectDeviceNotification, object: nil)
        notifer.addObserver(self, selector: #selector(ViewController.didDisconnectDevice()), name: TLMHubDidDisconnectDeviceNotification, object: nil)
        notifer.addObserver(self, selector: #selector(ViewController.didRecieveAccelerationEvent()), name: TLMMyoDidReceiveAccelerometerEventNotification, object: nil)
        // myo?.setStreamEmg(TLMStreamEmgDisabled)
        notifer.addObserver(self, selector: #selector(ViewController.onEmg()), name: TLMMyoDidReceiveEmgEventNotification, object: nil)
            
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
            print("device connected")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

