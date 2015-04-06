
import Foundation

extension NSDate {
    
    // -> Date System Formatted Medium
    func ToDateMediumString(type: String) -> NSString? {
        
        let formatter = NSDateFormatter()
       
        if (type == "2") {
            formatter.dateStyle = .NoStyle;
            formatter.timeStyle = .MediumStyle;
        } else {
            formatter.dateStyle = .MediumStyle;
            formatter.timeStyle = .NoStyle;
        }
        
        return formatter.stringFromDate(self)
    }
}