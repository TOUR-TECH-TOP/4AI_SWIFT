import UIKit
import WebKit

@available(iOS 11.0, *)
public class iOS_4ai: UIViewController {
    
    var webView: WKWebView!
    
    public init(mySiteId: String) {
        super.init(nibName: nil, bundle: nil)
        print("mySiteId: ", mySiteId)
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
        // Your HTML content
        let htmlString = """
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="keywords" content="">
            <meta name="description" content="">
            <title>chat</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
            <script id="chat-script" src="https://4ai.chat/embed.js?siteId=\(siteId)&app=mobile"></script>
        </head>
        <body>
        </body>
        </html>
        """
        
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
                
        // Do any additional setup after loading the view, typically from a nib.
        webView.loadHTMLString(htmlString, baseURL: nil)
    }

}
