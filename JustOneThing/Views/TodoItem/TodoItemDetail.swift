//
//  TodoItemDetail.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/28/24.
//
import SwiftUI
import MapKit

struct TodoItemDetail: View {

    var todoItem: TodoItem
    
    var body: some View {
        VStack(spacing: 20) {
                VStack {
                    if todoItem.whyItsImportant.isNotEmpty {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                Text("Why You Said it Was Important")
                                Spacer()
                            }
                            .headlineText()
                            Text(todoItem.whyItsImportant)
                        }
                    } else {
                        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                    }
                }

                if todoItem.whatDoYouNeed.isNotEmpty {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: C.Img.tools)
                            Text("What you said you need")
                            Spacer()
                        }
                        .headlineText()
                        
                        Text(detectLinksAndPhones(in: todoItem.whatDoYouNeed))
                    }

                }

            }
            .padding()
            .bodyText()
            
        
    }
    
    private func detectLinksAndPhones(in text: String) -> AttributedString {
        let linkAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        let phoneAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        let attributedText = NSMutableAttributedString(string: text)

        let dataDetector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue | NSTextCheckingResult.CheckingType.phoneNumber.rawValue)

        let results = dataDetector.matches(in: text, range: NSRange(location: 0, length: text.utf16.count))
        
        for result in results {
            if result.resultType == .link {
                attributedText.addAttributes(linkAttributes, range: result.range)
            } else if result.resultType == .phoneNumber {
                attributedText.addAttributes(phoneAttributes, range: result.range)
            }
        }

        return AttributedString(attributedText)
    }
}

#Preview {
    TodoItemDetail(todoItem: TodoItem.examples.first!)
}
