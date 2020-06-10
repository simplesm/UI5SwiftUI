//
//  ContentView.swift
//  UI5AndSwiftUI
//
//  Created by StMoPr on 10.06.20.
//  Copyright © 2020 StMoPr. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView : UIViewRepresentable {
    let strUrl: URL
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        return webView
        
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        do {
            uiView.loadHTMLString( try String(contentsOf: strUrl, encoding: .utf8), baseURL: Bundle.main.resourceURL)
        } catch  {
            print("Unable to get the file.")
        }
    }
}


struct ContentView: View {
    let htmlPathURL = Bundle.main.url(forResource: "index", withExtension: "html")!
    var body: some View {
        WebView(strUrl: htmlPathURL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
