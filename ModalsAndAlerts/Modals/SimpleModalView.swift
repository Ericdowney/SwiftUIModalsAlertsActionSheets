//
//  ContentView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct SimpleModalView: View {
    
    @State private var displayModal: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Simple Modal")
            Button(action: { self.displayModal.toggle() }) { Text("Display Simple Modal") }
        }
        .sheet(isPresented: $displayModal) { ModalView(modalName: "Simple Modal") }
    }
}

struct SimpleModalView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleModalView()
    }
}
