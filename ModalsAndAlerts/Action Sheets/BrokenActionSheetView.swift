//
//  BrokenActionSheetView.swift
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct BrokenActionSheetView: View {
    
    @State private var displayActionSheet1: Bool = false
    @State private var displayActionSheet2: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Simple ActionSheet")
            Button(action: { self.displayActionSheet1.toggle() }) { Text("Display ActionSheet #1") }
            Button(action: { self.displayActionSheet2.toggle() }) { Text("Display ActionSheet #2") }
        }
        .actionSheet(isPresented: $displayActionSheet1) { ActionSheet(title: Text("Simple ActionSheet #1"), buttons: [.cancel(Text("OK"))]) }
        .actionSheet(isPresented: $displayActionSheet2) { ActionSheet(title: Text("Simple ActionSheet #2"), buttons: [.cancel(Text("OK"))]) }
        .navigationBarTitle("Broken ActionSheet Example")
    }
}

struct BrokenActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BrokenActionSheetView()
    }
}
