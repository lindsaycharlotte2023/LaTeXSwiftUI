//
//  ComponentBlocksText.swift
//  LaTeXSwiftUI
//
//  Copyright (c) 2023 Colin Campbell
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

import SwiftUI

/// Displays a component block as a text view.
public struct LatexComponentBlocksText: View {
    /// The component blocks to display in the view.
   public let blocks: [LatexComponentBlock]

    /// Whether inline mode should be forced.
   public var forceInline: Bool = false

    // MARK: Private properties

    /// The view's renderer.
    @EnvironmentObject private var renderer: LatexRenderer

    /// The rendering mode to use with the rendered MathJax images.
    @Environment(\.imageRenderingMode) private var imageRenderingMode

    /// What to do in the case of an error.
    @Environment(\.errorMode) private var errorMode

    /// The view's font.
    @Environment(\.font) private var font

    /// The view's current display scale.
    @Environment(\.displayScale) private var displayScale

    /// The view's block rendering mode.
    @Environment(\.blockMode) private var blockMode

    
    public init(blocks: [LatexComponentBlock], forceInline: Bool) {
        self.blocks = blocks
        self.forceInline = forceInline
    }
    
    // MARK: View body

    public var body: some View {
        blocks.map { block in
            block.isEquationBlock && !forceInline ?
                Text("\n") + text(for: block) + Text("\n") :
                text(for: block)
        }.reduce(Text(""), +)
    }
}

// MARK: Private methods

extension LatexComponentBlocksText {
    /// Gets the `Text` view for the given component block.
    ///
    /// - Parameter block: The component block.
    /// - Returns: A `Text` view.
    public func text(for block: LatexComponentBlock) -> Text {
        block.toText(
            using: renderer,
            font: font,
            displayScale: displayScale,
            renderingMode: imageRenderingMode,
            errorMode: errorMode,
            blockRenderingMode: blockMode)
    }
}

struct ComponentBlocksTextPreviews: PreviewProvider {
    static var previews: some View {
        LatexComponentBlocksText(blocks: [LatexComponentBlock(components: [
            LatexComponent(text: #"""
      
      
      ### to highlight code blocks.
      
      This screen demonstrates $$( \\sigma )$$how you can integrate a 3rd party library
      to render syntax-highlighted code blocks.

      ```ruby
      fruits = ["apple", "banana", "orange"]
      fruits.each do |fruit|
        puts "I love #{fruit}s!"
      end
      ```
      
      An image ![](https://picsum.photos/id/433/50/25) within a line of text.
      
      **Standard Deviation Formula:**
      
      $begin{pmatrix}
      a_{11} & a_{12} & a_{13} & a_{14} \\
      a_{21} & a_{22} & a_{23} & a_{24} \\
      a_{31} & a_{32} & a_{33} & a_{34} \\
      a_{41} & a_{42} & a_{43} & a_{44}
      \\end{pmatrix}$
      
      """#, type: .inlineEquation)
        ])], forceInline: false)
            .environmentObject(LatexRenderer())
    }
}
