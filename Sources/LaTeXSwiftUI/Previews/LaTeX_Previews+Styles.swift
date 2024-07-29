//
//  LaTeX_Previews+Styles.swift
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

struct LaTeX_Previews_Styles: PreviewProvider {
    static var previews: some View {
        ScrollView {
            LaTeX("""
                  To find the convergence set of the given power series: $\\sum_{n = 0}^{\\infty} \\frac{(x - 9)^{n}}{n^{5}9^{n}}$ we need to determine its radius of convergence. For a general power series: $\\sum_{n=0}^{\\infty} a_n (x - c)^n$ we can use the ratio test or root test to find the radius of convergence.

                      $(\\sum_{n = 0}^{\\infty} \\frac{(x - 9)^{n}}{n^{5}9^{n}}$

            $\\cos(\\theta + \\varphi) = \
            //                                 \\cos(\\theta)\\cos(\\varphi) - \\sin(\\theta)\\sin(\\varphi)$


            $\\sqrt{\\frac{1}{N}\\sum_{i=1}^N (x_i - \\mu)^2}$

            $\\neg(P\\land Q) \\iff (\\neg P)\\lor(\\neg Q)$

              \\vec \\bf V_1 \\times \\vec \\bf V_2 =  \\begin{vmatrix}"
                                       "\\hat \\imath &\\hat \\jmath &\\hat k \\\\"
                                       "\\frac{\\partial X}{\\partial u} &  \\frac{\\partial Y}{\\partial u} & 0 \\\\"
                                       "\\frac{\\partial X}{\\partial v} &  \\frac{\\partial Y}{\\partial v} & 0"
                                       "\\end{vmatrix}
            """)
        }
        .previewDisplayName("")
    }
}
