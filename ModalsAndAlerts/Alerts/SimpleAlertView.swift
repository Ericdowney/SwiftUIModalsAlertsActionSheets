//
//  SimpleAlertView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct SimpleAlertView: View {
    
    @State private var displayAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Simple Alert")
            Button(action: { self.displayAlert.toggle() }) { Text("Display Simple Alert") }
        }
        .alert(isPresented: $displayAlert) { Alert(title: Text("Simple Alert"), dismissButton: .cancel(Text("OK"))) }
        .navigationBarTitle("Simple Alert Example")
    }
}

struct SimpleAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleAlertView()
    }
}
