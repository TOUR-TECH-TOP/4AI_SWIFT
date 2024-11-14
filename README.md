# iOS_4ai

[![CI Status](https://img.shields.io/travis/jayesh_tourtech/iOS_4ai.svg?style=flat)](https://travis-ci.org/jayesh_tourtech/iOS_4ai)
[![Version](https://img.shields.io/cocoapods/v/iOS_4ai.svg?style=flat)](https://cocoapods.org/pods/iOS_4ai)
[![License](https://img.shields.io/cocoapods/l/iOS_4ai.svg?style=flat)](https://cocoapods.org/pods/iOS_4ai)
[![Platform](https://img.shields.io/cocoapods/p/iOS_4ai.svg?style=flat)](https://cocoapods.org/pods/iOS_4ai)

## Example

/DETAILS
### Solution: Provide a Pre-Packaged SDK/Library for 4AI chat

#### 1. *iOS (Swift) Example*

- **Create a CocoaPod**: Package your WebView code into a CocoaPod that iOS developers can install.

- **Installation**: Developers would add your pod to their `Podfile`:

  ruby
  pod 'iOS_4ai'
  

- **Usage**: After installation, they can use your SDK like this:

  swift
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
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



*Inside your SDK (CocoaPod):*

swift
// iOS_4ai.swift inside the pod
import UIKit
import WebKit

@available(iOS 11.0, *)
public class iOS_4ai: UIViewController {
    
    var webView: WKWebView!
    
    public init(mySiteId: String) {
        super.init(nibName: nil, bundle: nil)
        self.loadChat(siteId: mySiteId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadChat(siteId: String) {

        webView = WKWebView(frame: self.view.frame)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the WKWebView to the view hierarchy
        self.view.addSubview(webView)
        
        // Set up constraints to respect the safe area
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
                
        webView.configuration.preferences.javaScriptEnabled = true
        webView.configuration.allowsInlineMediaPlayback = true
        
        // Load the URL directly
              if let url = URL(string: "https://4ai.chat/mobile-script?siteId=\(siteId)") {
                  let request = URLRequest(url: url)
                  webView.load(request)
              }
    }

}



### Summary:

- **Pre-Packaged SDK**: Provide your chat functionality as a pre-packaged SDK or library for each platform. This makes the integration process very similar to how developers are accustomed to adding third-party functionalities.
- **Ease of Use**: By simply installing a package and using a provided component or activity, developers can easily integrate your chat solution without needing to deal with lengthy or complex code snippets.
- **Platform-Specific Packages**: Tailor the distribution method to each platform, such as npm for React Native, Maven for Android, CocoaPods for iOS, and pub.dev for Flutter.

## Requirements

iOS 11.0 and up

## Installation

iOS_4ai is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
target 'MyApp' do
  pod 'iOS_4ai', '~> 0.6'
end
```
and than 

pod install
or
pod install --repo-update 

## Author

jayesh_tourtech, jayesh@tourtech.co.il

## License

iOS_4ai is available under the MIT license. See the LICENSE file for more info.
