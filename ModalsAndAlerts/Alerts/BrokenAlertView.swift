//
//  BrokenAlertView.swift
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct BrokenAlertView: View {
    
    @State private var displayAlert1: Bool = false
    @State private var displayAlert2: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Simple Alert")
            Button(action: { self.displayAlert1.toggle() }) { Text("Display Alert #1") }
            Button(action: { self.displayAlert2.toggle() }) { Text("Display Alert #2") }
        }
        .alert(isPresented: $displayAlert1) { Alert(title: Text("Simple Alert #1"), dismissButton: .cancel(Text("OK"))) }
        .alert(isPresented: $displayAlert2) { Alert(title: Text("Simple Alert #2"), dismissButton: .cancel(Text("OK"))) }
        .navigationBarTitle("Broken Alert Example")
    }
}

struct BrokenAlertView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenAlertView()
    }
}
