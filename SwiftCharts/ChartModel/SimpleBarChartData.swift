import Foundation
import UIKit

public class SimpleBarChartData {
    let label: String
    let value: Double
    var color: UIColor?
    
    public init(label:String, value:Double, color:UIColor) {
        self.label = label
        self.value = value
        self.color = color
    }
    
    public init(label:String, value:Double) {
        self.label = label
        self.value = value
    }
}
