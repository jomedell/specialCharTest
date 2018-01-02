//
//  MSEventsVC.swift
//  VSAC
//
//  Created by Jorge Medellin on 12/28/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation
import UIKit
import AppCenterAnalytics

class MSEventsVC: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK Actions
    
    @IBAction func eventsButtonPressed(_ sender: UIButton) {
        
        MSAnalytics.trackEvent("Custom event button pressed")
    }
}
