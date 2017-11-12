// # Proxy Compiler 17.9.2-2b890a-20171018

import Foundation
import SAPOData

open class MyPrefixProductText: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var id: Property = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "Id")

    public static var language: Property = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "Language")

    public static var longDescription: Property = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "LongDescription")

    public static var name: Property = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "Name")

    public static var productID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "ProductId")

    public static var shortDescription: Property = MyPrefixMyServiceClassMetadata.EntityTypes.productText.property(withName: "ShortDescription")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: MyPrefixMyServiceClassMetadata.EntityTypes.productText)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixProductText> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixProductText>())
    }

    open func copy() -> MyPrefixProductText {
        return CastRequired<MyPrefixProductText>.from(self.copyEntity())
    }

    open var id: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: MyPrefixProductText.id))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductText.id, to: LongValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: Int64?) -> EntityKey {
        return EntityKey().with(name: "Id", value: LongValue.of(optional: id))
    }

    open var language: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductText.language))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductText.language, to: StringValue.of(optional: value))
        }
    }

    open var longDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductText.longDescription))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductText.longDescription, to: StringValue.of(optional: value))
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductText.name))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductText.name, to: StringValue.of(optional: value))
        }
    }

    open var old: MyPrefixProductText {
        return CastRequired<MyPrefixProductText>.from(self.oldEntity)
    }

    open var productID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductText.productID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductText.productID, to: StringValue.of(optional: value))
        }
    }

    open var shortDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixProductText.shortDescription))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixProductText.shortDescription, to: StringValue.of(optional: value))
        }
    }
}
