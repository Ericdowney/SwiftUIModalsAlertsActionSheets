//
//  BrokenModalView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct BrokenModalView: View {
    
    @State private var displayModal1: Bool = false
    @State private var displayModal2: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Simple Modal")
            Button(action: { self.displayModal1.toggle() }) { Text("Display Modal #1") }
            Button(action: { self.displayModal2.toggle() }) { Text("Display Modal #2") }
        }
        .sheet(isPresented: $displayModal1) { ModalView(modalName: "Modal #1") }
        .sheet(isPresented: $displayModal2) { ModalView(modalName: "Modal #2") }
    }
}

struct BrokenModalView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenModalView()
    }
}
