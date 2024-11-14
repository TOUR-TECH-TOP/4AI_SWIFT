import UIKit
import WebKit

@available(iOS 11.0, *)
public class iOS_4ai: UIViewController {
    
    var webView: WKWebView!
    
    public init(mySiteId: String) {
        super.init(nibName: nil, bundle: nil)
//        print("mySiteId: ", mySiteId)
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
