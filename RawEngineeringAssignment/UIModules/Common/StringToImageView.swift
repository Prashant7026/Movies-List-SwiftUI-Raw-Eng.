//
//  StringToImageView.swift
//  RawEngineeringAssignment
//
//  Created by Prashant Kumar Soni on 29/11/24.
//

import Foundation
import SwiftUI

struct StringToImageView: View {
    var imageString: String?
    
    var body: some View {
        AsyncImage(
            url: URL(string: imageString ?? ""),
            content: { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(20.0)
            },
            placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        )
    }
}

