/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

private enum Layout {
  static let padding: CGFloat = 20
  static let smallPadding: CGFloat = 2
}

struct TitleDetailView: View {
  
  var callback: ((SettingsOptions)->())?
  var row: SettingsOptions
  var body: some View {
    
    GeometryReader { geometry in
      Button(action: {
        self.callback?(self.row)
      }, label: {
        
        VStack {
          
          HStack {
            Text(self.row.title)
              .foregroundColor(.appBlack)
              .font(.uiBodyAppleDefault)
              .padding([.leading,.trailing], Layout.padding)
            
            Spacer()
            
            if self.row.isToggle {
              ToggleView()
                .padding([.trailing], Layout.padding)
            } else {
              // TODO fix this
              Text(self.row.detail.first!)
                .foregroundColor(.appBlack)
                .font(.uiBodyAppleDefault)
                .padding([.leading], Layout.padding)
                .padding([.trailing], Layout.smallPadding)
              
              Image("carrotRight")
                .resizable()
                .frame(maxWidth: 13, maxHeight: 13)
                .padding([.trailing], Layout.padding)
                .foregroundColor(.coolGrey)
            }
          }
          
          Rectangle()
            .frame(width: (geometry.size.width - (2*Layout.padding)), height: 1, alignment: .center)
            .foregroundColor(Color.paleBlue)
            .padding([.leading, .trailing], Layout.padding)
        }
      })
      .background(Color.paleGrey)
    }
  }
}

#if DEBUG
struct TitleDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    TitleDetailView(callback: nil, row: .videoPlaybackSpeed)
  }
}
#endif


// TODO move this
struct CustomToggle : UIViewRepresentable {
  
  func makeUIView(context: Context) -> UISwitch {
    UISwitch()
  }

  func updateUIView(_ uiView: UISwitch, context: Context) {
    // This is appGreen
    uiView.onTintColor = UIColor(red: 21.0 / 255.0, green: 132.0 / 255.0, blue: 67.0 / 255.0, alpha: 1)
    
    // TODO pull from userDefaults
    uiView.isOn = true
  }
}

struct ToggleView : View {
  var body: some View {
    CustomToggle()
  }
}
