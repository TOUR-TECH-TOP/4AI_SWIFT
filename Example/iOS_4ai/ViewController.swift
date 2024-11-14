//
//  ViewController.swift
//  iOS_4ai
//
//  Created by jayesh_tourtech on 08/26/2024.
//  Copyright (c) 2024 jayesh_tourtech. All rights reserved.
//

import UIKit
import WebKit
import iOS_4ai
import AVFoundation

class ViewController: UIViewController {
//    let siteId = "" // Replace with actual logic to generate the siteId

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
//        let chatVC = iOS_4ai(mySiteId: siteId)
//        present(chatVC, animated: true, completion: nil)
        
        // Check if microphone permission is granted
        checkAndRequestAudioPermission { [weak self] granted in
            if granted {
                // If permission is granted, present the chat view controller
                DispatchQueue.main.async {
                    let chatVC = iOS_4ai(mySiteId: "your_site_id") // Replace with actual logic to generate the siteId
                    self?.present(chatVC, animated: true, completion: nil)
                }
            } else {
                // Handle the case where permission is denied
                print("Audio permission denied. Cannot proceed with voice chat.")
                // Optionally, present an alert to the user here.
            }
        }
    }
    
    
    private func checkAndRequestAudioPermission(completion: @escaping (Bool) -> Void) {
        let audioSession = AVAudioSession.sharedInstance()
        
        // Check if permission has already been granted
        if audioSession.recordPermission() == .granted {
            // Permission already granted
            completion(true)
        } else if audioSession.recordPermission() == .denied {
            // Permission denied
            completion(false)
        } else {
            // If permission is undetermined, request permission
            audioSession.requestRecordPermission { granted in
                completion(granted)
            }
        }
    }

}

