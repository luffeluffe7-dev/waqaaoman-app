import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            WagaWebView(url: URL(string: "https://waga-oman.netlify.app/")!)
                .ignoresSafeArea(edges: .bottom)
                .navigationTitle("وقاء")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WagaWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        if webView.url == nil {
            webView.load(URLRequest(url: url))
        }
    }
}
