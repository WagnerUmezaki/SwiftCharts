import UIKit

@IBDesignable public class SimpleBarChartView: UIView {

    @IBInspectable public var startColor: UIColor = UIColor.red
    @IBInspectable public var endColor: UIColor = UIColor.orange
    @IBInspectable public var margin: CGFloat = 20.0
    @IBInspectable public var axisColor: UIColor = UIColor(white: 1.0, alpha: 0.3)
    @IBInspectable public var defaultBarColor: UIColor = UIColor(white: 1.0, alpha: 0.3)
    
    var chartData:[SimpleBarChartData] = []

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience public init( graphPoints: [Int] ) {
        self.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
        //set up background clipping area
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: UIRectCorner.allCorners,
                                cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor] as CFArray
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors,
                                  locations: colorLocations)
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        context!.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: CGGradientDrawingOptions(rawValue: 0))
        
        // math on x axis
        let availableSpaceOnX = self.bounds.width - (2*margin)
        let numberOfBars = chartData.count
        let numberOfGaps = numberOfBars+1
        let gapFactor:CGFloat = 0.25
        let division = availableSpaceOnX/CGFloat(numberOfGaps)
        let pathWidth = division - (division*gapFactor)
        var xCursor = division + margin
        
        // math on y axis
        let maxValueOfData = self.maxValueOfData()
        let availableSpaceOnY = self.bounds.height - (2*margin)
        
        //draw bars
        for data in chartData {
            let barPath = UIBezierPath()
            barPath.move(to: CGPoint(x: xCursor, y: height-margin))
            
            let yCursor = availableSpaceOnY*CGFloat(data.value/maxValueOfData)
                
            barPath.addLine(to: CGPoint(x: xCursor, y: height-margin-yCursor))
            
            xCursor = xCursor+division
            barPath.lineWidth = pathWidth
            if let color = data.color  {
                color.setStroke()
            } else {
                defaultBarColor.setStroke()
            }
            barPath.stroke()
            barPath.fill()
        }
        
        //draw axis
        let axisPath = UIBezierPath()
        axisPath.move(to: CGPoint(x: margin, y: height-margin))
        axisPath.addLine(to: CGPoint(x: width - margin, y: height-margin))
        axisPath.move(to: CGPoint(x:margin, y: height-margin))
        axisPath.addLine(to: CGPoint(x: margin, y: margin))
        axisColor.setStroke()
        axisPath.lineWidth = 0.5
        axisPath.stroke()
    }
    
    private func maxValueOfData() -> Double {
        if self.chartData.count == 0 {
            return 0
        }
        var maxValue:Double = 0
        for data in self.chartData {
            if data.value > maxValue {
                maxValue = data.value
            }
        }
        return maxValue
    }
    
    public func setData(newData:[SimpleBarChartData]) {
        self.chartData = newData
        self.setNeedsDisplay()
    }
}
