import Foundation

class NumberUtils {
    static func min(value1: CGFloat, value2:CGFloat) -> CGFloat {
        if value1 < value2 {
            return value1
        }
        return value2
    }
}
