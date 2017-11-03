
// Enums should use upper-case first letter camel casing for the type name
enum AEnum {
    // Each case should have it's own line and should be camel cased
    case aEnum
    case bEnum
}

// Where enums have a raw value you should explicitly declare those values where practical to do so
enum AnotherEnum: Int {
    case aRedEnum = 1
    case aBlueEnum = 2
}

// A protocol name should always end with protocol when declaring an interface for a class. If the protocol is meant for usage as part of behaviour e.g. delegates it should end with 'Delegate'.
protocol StyleGuideProtocol {
    func doSomeWork()
}

/*
 * Whilst swift supports multple class declarations in a file we generally don't use this.
 * In iOS a file is very tightly coupled to the member which it is declaring.
 * It is unusual to see multiple classes in a single file
 *
 * An exception to this rule is to have a protocol declaration for the class at the top of the file where the protocol declaration is tightly coupled to the classes purpose.
 * For example:
 * protocol RequestManagerProtocol {
 *    func makeRequest() -> Request
 * }
 *
 * class RequestManager: RequestManagerProtocol {
 *    
 * }


 Grouped by:
 Constants, Mutable and computed properties (we don't differentiate between ones with getters or setters)
 Then by Access control: public/open, fileprivate, private 
 */
class StyleGuide {
    /*
     * Use constants for public field getters where possible
     */
    let publicField: Bool
    
    /*
     * You may use computed properties but their operations should be kept simple. A function implies work
     * but a var is considered simple non-IO calculations
     *
     * Where a getter does not require a setter you should omit the get { } clause
     */
    var computedProperty: Int {
         return 0
    }

    /*
     * Use fileprivate for fields rather than private as it works better when using extensions
     *
     * All fields should use camel casing and placed at top of the class
     *
     */
    fileprivate let privateField: Bool

    /*
    * We prefer to use type inference where possible
    */
    fileprivate let isAPrivateField = true 
}

/* Protocol conformance should prefer adding a separate class extension for method implementations
* Note: Given Swift 4's lack of support for overriding extensions. If you must override a function from a protocol declaration you should declare that protocol on the class rather than the extension.
*/
extension StyleGuide: StyleGuideProtocol {
    // Empty functions should have it's opening and closing braces on the same line with no spaces in between.
    func doSomeWork() {}
}

private extension StyleGuide {
    // A private function should be declared within a private extension
    func aPrivateFunc(nillableEnumValue: AEnum?, nillableStringValue: String?) {
        /*
        * Validate input as close to the top of the function as possible.
        * Avoid complex guard statements, breaking now down into logical chunks is prefered.
        */
        guard let enumValue = nillableEnumValue else {
            return
        }

        /*
        * We prefer not to use ternary operators due to compile time problems. 'If' statements are preferred.
        * This also applies to the nil-coelesing operator `??`
        */
        let nonNullString: String
        if let stringValue = nillableStringValue {
            nonNullString = stringValue
        } else {
            nonNullString = "Default value"
        }

        /*
         * Switch statements should be exhaustive where practical do so.
         */
        switch enumValue {
        case .aEnum:
            break
        case .bEnum:
            break
        }

        
    }
}

class StyleGuideView: UIView {
    /*
     * Be especially explicit when using IBOutlets or view variables
     *
     * They should include the type in their name along with the intented user purpose
     *
     * It is generally frowned upon to use implicitally unwrapped variables however they are considered
     * the norm for view variables
     */
    var viewGuideButton: UIButton!
    var searchGuideTextField: UITextField!
}

/*
* Structs should represent simple data structures. 
* We prefer to avoid mutability in structs.
* We prefer to use the generated initializer for structs.
*/
struct StyleGuideItem {
    let value: String
}