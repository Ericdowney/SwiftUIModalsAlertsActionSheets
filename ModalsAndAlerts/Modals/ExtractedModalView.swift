//
//  ExtractedModalView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct ExtractedModalView: View {
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Extracted Modal")
            Modal1Button()
            Modal2Button()
        }
        .navigationBarTitle("Extracted Modal View")
        .navigationBarItems(trailing: Modal1Button())
    }
}

fileprivate struct Modal1Button: View {
    
    @State private var displayModal: Bool = false
    
    var body: some View {
        Button(action: { self.displayModal.toggle() }) { Text("Display Modal #1") }
            .sheet(isPresented: $displayModal) { ModalView(modalName: "Modal #1") }
    }
}

fileprivate struct Modal2Button: View {
    
    @State private var displayModal: Bool = false
    
    var body: some View {
        Button(action: { self.displayModal.toggle() }) { Text("Display Modal #2") }
            .sheet(isPresented: $displayModal) { ModalView(modalName: "Modal #2") }
    }
}
