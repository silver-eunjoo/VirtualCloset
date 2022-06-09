//
//  View+Extensions.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/09.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
