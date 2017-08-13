import Foundation
import UIKit

public class DonutChartData {
    let label: String
    let value: Int
    let color: UIColor
    
    public init(label:String, value:Int, color:UIColor) {
        self.label = label
        self.value = value
        self.color = color
    }
}
