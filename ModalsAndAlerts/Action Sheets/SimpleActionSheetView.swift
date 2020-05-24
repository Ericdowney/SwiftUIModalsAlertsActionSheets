//
//  SimpleActionSheetView.swift
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct SimpleActionSheetView: View {
    
    @State private var displayActionSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Simple ActionSheet")
            Button(action: { self.displayActionSheet.toggle() }) { Text("Display Simple ActionSheet") }
        }
        .actionSheet(isPresented: $displayActionSheet) { ActionSheet(title: Text("Simple ActionSheet"), buttons: [.cancel(Text("OK"))]) }
        .navigationBarTitle("Simple ActionSheet Example")
    }
}

struct SimpleActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleActionSheetView()
    }
}
