//
//  ModalView.swift
//  ModalsAndAlerts
//
//  Created by Uncanny Apps on 5/23/20.
//  Copyright © 2020 Dev-Central. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    var modalName: String
    
    var body: some View {
        NavigationView {
            Text(modalName)
                .navigationBarTitle("Modal View")
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(modalName: "Modal #1")
    }
}
