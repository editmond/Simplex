import Cocoa

/*
A dictionary that stores the necessary converions to the ASCII unicode set.
Could be made acessible to the user later.
Form [Unicode character, ASCII character] but in the form of strings
 */
let randomConversions: [String: String] = ["\u{24}": "dog"]

let puncConversions: [String: String] = [
    "\u{2018}": "'",
    "\u{2019}": "'",
    "\u{201A}": ",",
    "\u{201B}": "'",
    "\u{201C}": #"""#,
    "\u{201D}": #"""#,
    //201E to 2023...
    "\u{2024}": ".",
    "\u{2025}": "..",
    "\u{2026}": "...",
    "\u{2027}": "."
]

func sanitiseText(text: String) -> String{
    var newText: String = ""
    for char in text.unicodeScalars{
        
        //Define areas of unicode to check
        //Ascii bounds
        let zero: UnicodeScalar = "0"
        let asciiBound: Unicode.Scalar = "\u{7F}"
        //punctuation bounds
        let puncLower: Unicode.Scalar = "\u{2000}"
        let puncUpper: Unicode.Scalar = "\u{206F}"
        
        switch char.value{
        case zero.value...asciiBound.value:
            //do nothing
            newText += "\(char)"
            
        case puncLower.value...puncUpper.value:
            //replace the offending character
            let newChar = puncConversions["\(char)", default: "\0"]
            newText += newChar
            
        default:
            //replace the offending character
            let newChar = randomConversions["\(char)", default: String(char)]
            newText += newChar
        }
    }
    return newText
}

var testText = "\u{201D}\u{201E}\u{2026}"
print("Original: \(testText)")
print("New: \(sanitiseText(text: testText))")
print(#"""#)
