import UIKit
import WebKit

class AthleticsViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    @IBOutlet weak var webDisplay: UIView!
    @IBOutlet weak var backArrow: UIBarButtonItem!
    @IBOutlet weak var forwardArrow: UIBarButtonItem!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem.image = UIImage(named: "athleticsTabIcon")
        self.tabBarItem.title = "Athletics"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        // For some reason, this doesn't work from viewDidLoad()
        // (webDisplay.bounds had zero width and height at that point)
        // But it works here...
        // Apparently sizing is deferred until subview layout happens
        setupBrowser()
        webViewLoadURL(urlString: "http://www.sbhsathletics.org")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.webView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    func webViewLoadURL(urlString: String) {
        
        if let searchableUrl = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(url: searchableUrl as URL)
            self.webView.load(urlRequest as URLRequest)
        } else {
            print("Bad URL")
        }
    }
    
    func setupBrowser() {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        // create instance of web view
        // the y offset has to be zero or there's a navbar-sized gray band between the
        // navbar and the web view.
        self.webView = WKWebView(frame: CGRect(x: 0, y: 0, width: webDisplay.frame.size.width, height: webDisplay.frame.size.height), configuration: configuration)
        
        self.webView.navigationDelegate = self
        
        webDisplay.addSubview(self.webView)
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.canGoBack {
            backArrow.isEnabled = true
        } else {
            backArrow.isEnabled = false
        }
        
        if webView.canGoForward {
            forwardArrow.isEnabled = true
        } else {
            forwardArrow.isEnabled = false
        }
    }
    
    @IBAction func previousPage(_ sender: UIBarButtonItem) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func forwardPage(_ sender: UIBarButtonItem) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
    
    @IBAction func reload(_ sender: UIBarButtonItem) {
        self.webView.reload()
    }
}
