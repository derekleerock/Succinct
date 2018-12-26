import Quick
import Nimble
import Succinct

final class NSAttributedString_attributeSpec: QuickSpec {
    override func spec() {
        describe("finding attributes for an exact substring") {

            context("when there is a single attribute") {
                it("can find text with a foregroundColor") {
                    let redForegroundColor = [NSAttributedString.Key.foregroundColor : UIColor.red]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(
                            redForegroundColor,
                            range: NSRange(location: 0, length: 10)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(redForegroundColor, atSubString: "Foreground")).to(beTrue())
                }

                it("can find text with a backgroundColor") {
                    let redBackgroundColor = [NSAttributedString.Key.backgroundColor : UIColor.red]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(
                            redBackgroundColor,
                            range: NSRange(location: 15, length: 10)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(redBackgroundColor, atSubString: "Background")).to(beTrue())
                }

                it("can find text with a specific font") {
                    let smallFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Small and Large")
                        .withAttributes(
                            smallFont,
                            range: NSRange(location: 0, length: 5)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(smallFont, atSubString: "Small")).to(beTrue())
                }

                it("can find text that is underlined") {
                    let smallFontAndRedBackground = [
                        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.patternDash,
                        NSAttributedString.Key.underlineColor : UIColor.red
                        ] as [NSAttributedString.Key : Any]

                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Underlined Text")
                        .withAttributes(
                            smallFontAndRedBackground,
                            range: NSRange(location: 0, length: 10)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(smallFontAndRedBackground, atSubString: "Underlined")).to(beTrue())
                }

                it("can find text that is underlined with a custom underline") {
                    let CustomUnderlineStyle = 0x11
                    let smallFontAndRedBackground = [
                        NSAttributedString.Key.underlineStyle : CustomUnderlineStyle,
                        NSAttributedString.Key.underlineColor : UIColor.red
                        ] as [NSAttributedString.Key : Any]

                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Underlined Text")
                        .withAttributes(
                            smallFontAndRedBackground,
                            range: NSRange(location: 0, length: 10)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(smallFontAndRedBackground, atSubString: "Underlined")).to(beTrue())
                }
            }

            context("when there are multiple attributes") {
                it("can find both attributes") {
                    let tappableText = [
                        NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDash,
                        NSAttributedString.Key.underlineColor: UIColor.lightGray
                    ] as [NSAttributedString.Key : Any]

                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Tappable Text")
                        .withAttributes(
                            tappableText,
                            range: NSRange(location: 0, length: 8)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(tappableText, atSubString: "Tappable")).to(beTrue())
                }
            }

            context("when there are no attributes") {
                it("finds nothing") {
                    let redBackgroundColor = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Nothing").build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(redBackgroundColor, atSubString: "Nothing")).to(beFalse())
                }
            }
        }
    }
}