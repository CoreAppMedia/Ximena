//
//  ContentView.swift
//  ViewToPDF
//
//  Created by ximena juana mejia jacobo on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var PDFUrl: URL?
    @State var showShareSheet: Bool = false
    var body: some View {
        VStack {
            Button {
                exportPDF{
                    self
                } completion: { status, url in
                    if let url = url,status{
                        self.PDFUrl = url
                        self.showShareSheet.toggle()
                    } else {
                        print ("falied to produce ")
                        }
                    }
                } label: {
                Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
            }
            Image("imagen1")
            
               

        }
        
        .sheet(isPresented: $showShareSheet){
            PDFUrl = nil
        } content: {
            if let PDFUrl = PDFUrl {
                ShareSheet(urls: [PDFUrl])
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct ShareSheet: UIViewControllerRepresentable{
    var urls:[Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: urls, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
