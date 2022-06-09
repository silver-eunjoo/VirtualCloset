//
//  View+Extensions.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/06/09.
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
