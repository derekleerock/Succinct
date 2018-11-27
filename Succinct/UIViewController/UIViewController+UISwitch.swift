import UIKit

extension UIViewController {
    public func countOfSwitches(switchIsOn: Bool) -> Int {
        return view.countOfSwitches(switchIsOn: switchIsOn)
    }
    
    public func tapSwitch(containedInView viewClass: AnyClass) {
        view.findSwitch(containedInView: viewClass)?
            .tapAndFireTargetEvent()
    }
}
