// TODO: => Core

public protocol KeyAccessible {
    associatedtype Key
    associatedtype Value
    subscript(key: Key) -> Value? { get set }
}

extension Dictionary: KeyAccessible {}

extension KeyAccessible where Key == HeaderKey, Value == String {
    subscript(str: String) -> Value? {
        get {
            return self[HeaderKey(str)]
        }
        set {
            self[HeaderKey(str)] = newValue
        }
    }
}

// TODO: => Core ^

public struct HeaderKey : VaporString {
    public let key: UTF8String
    
    public var utf8String: UTF8String {
        return key
    }
    
    public init(_ key: String) {
        self.key = UTF8String(string: key)
    }
    
    public init(_ key: UTF8String) {
        self.key = key
    }
    
    public init(_ key: StaticString) {
        self.key = UTF8String(staticString: key)
    }
    
    public init(_ key: Bytes) {
        self.key = UTF8String(bytes: key)
    }
}

extension HeaderKey: CustomStringConvertible {
    public var description: String {
        return String(bytes: key.bytes, encoding: .utf8) ?? "Invalid HeaderKey value"
    }
}

extension HeaderKey: Hashable {
    public var hashValue: Int {
        return key.lowercasedHashValue
    }

    static public func ==(lhs: HeaderKey, rhs: HeaderKey) -> Bool {
        return lhs.key.lowercasedHashValue == rhs.key.lowercasedHashValue
    }
}

extension HeaderKey {

  //
  // Common HTTP Header Request keys
  //

  static public var accept: HeaderKey = {
    return HeaderKey("Accept" as StaticString)
  }()

  static public var acceptCharset: HeaderKey = {
    return HeaderKey("Accept-Charset" as StaticString)
  }()

  static public var acceptEncoding: HeaderKey = {
    return HeaderKey("Accept-Encoding" as StaticString)
  }()

  static public var acceptLanguage: HeaderKey = {
    return HeaderKey("Accept-Language" as StaticString)
  }()

  static public var authorization: HeaderKey = {
    return HeaderKey("Authorization" as StaticString)
  }()

  static public var cacheControl: HeaderKey = {
    return HeaderKey("Cache-Control" as StaticString)
  }()

  static public var connection: HeaderKey = {
    return HeaderKey("Connection" as StaticString)
  }()

  static public var cookie: HeaderKey = {
    return HeaderKey("Cookie" as StaticString)
  }()

  static public var contentLength: HeaderKey = {
    return HeaderKey("Content-Length" as StaticString)
  }()

  static public var contentType: HeaderKey = {
    return HeaderKey("Content-Type" as StaticString)
  }()

  static public var date: HeaderKey = {
    return HeaderKey("Date" as StaticString)
  }()

  static public var expect: HeaderKey = {
    return HeaderKey("Expect" as StaticString)
  }()

  static public var forwarded: HeaderKey = {
    return HeaderKey("Forwarded" as StaticString)
  }()

  static public var from: HeaderKey = {
    return HeaderKey("From" as StaticString)
  }()

  static public var host: HeaderKey = {
    return HeaderKey("Host" as StaticString)
  }()

  static public var ifMatch: HeaderKey = {
    return HeaderKey("If-Match" as StaticString)
  }()

  static public var ifModifiedSince: HeaderKey = {
    return HeaderKey("If-Modified-Since" as StaticString)
  }()

  static public var ifNoneMatch: HeaderKey = {
    return HeaderKey("If-None-Match" as StaticString)
  }()

  static public var ifRange: HeaderKey = {
    return HeaderKey("If-Range" as StaticString)
  }()

  static public var ifUnmodifiedSince: HeaderKey = {
    return HeaderKey("If-Unmodified-Since" as StaticString)
  }()

  static public var maxForwards: HeaderKey = {
    return HeaderKey("Max-Forwards" as StaticString)
  }()

  static public var origin: HeaderKey = {
    return HeaderKey("Origin" as StaticString)
  }()

  static public var pragma: HeaderKey = {
    return HeaderKey("Pragma" as StaticString)
  }()

  static public var proxyAuthorization: HeaderKey = {
    return HeaderKey("Proxy-Authorization" as StaticString)
  }()

  static public var range: HeaderKey = {
    return HeaderKey("Range" as StaticString)
  }()

  static public var referrer: HeaderKey = {
    return HeaderKey("Referer" as StaticString)
  }()

  static public var transferCodingExceptions: HeaderKey = {
    return HeaderKey("TE" as StaticString)
  }()

  static public var userAgent: HeaderKey = {
    return HeaderKey("User-Agent" as StaticString)
  }()

  static public var upgrade: HeaderKey = {
    return HeaderKey("Upgrade" as StaticString)
  }()

  static public var via: HeaderKey = {
    return HeaderKey("Via" as StaticString)
  }()

  static public var warning: HeaderKey = {
    return HeaderKey("Warning" as StaticString)
  }()

  //
  // Common HTTP Header Response keys
  //

  static public let acceptPatch: HeaderKey = {
    return HeaderKey("Accept-Patch" as StaticString)
  }()

  static public let acceptRanges: HeaderKey = {
    return HeaderKey("Accept-Ranges" as StaticString)
  }()

  static public let age: HeaderKey = {
    return HeaderKey("Age" as StaticString)
  }()

  static public let allow: HeaderKey = {
    return HeaderKey("Allow" as StaticString)
  }()

  static public let alternativeServices: HeaderKey = {
    return HeaderKey("Alt-Svc" as StaticString)
  }()

  static public let contentDisposition: HeaderKey = {
    return HeaderKey("Content-Disposition" as StaticString)
  }()

  static public let contentEncoding: HeaderKey = {
    return HeaderKey("Content-Encoding" as StaticString)
  }()

  static public let contentLanguage: HeaderKey = {
    return HeaderKey("Content-Language" as StaticString)
  }()

  static public let contentLocation: HeaderKey = {
    return HeaderKey("Content-Location" as StaticString)
  }()

  static public let contentRange: HeaderKey = {
    return HeaderKey("Content-Range" as StaticString)
  }()

  static public let etag: HeaderKey = {
    return HeaderKey("Etag" as StaticString)
  }()

  static public let expires: HeaderKey = {
    return HeaderKey("Expires" as StaticString)
  }()

  static public let lastModified: HeaderKey = {
    return HeaderKey("Last-Modified" as StaticString)
  }()

  static public let link: HeaderKey = {
    return HeaderKey("Link" as StaticString)
  }()

  static public let location: HeaderKey = {
    return HeaderKey("Location" as StaticString)
  }()

  static public let proxyAuthenticate: HeaderKey = {
    return HeaderKey("Proxy-Authenticate" as StaticString)
  }()

  static public let publicKeyPins: HeaderKey = {
    return HeaderKey("Public-Key-Pins" as StaticString)
  }()

  static public let retryAfter: HeaderKey = {
    return HeaderKey("Retry-After" as StaticString)
  }()

  static public let server: HeaderKey = {
    return HeaderKey("Server" as StaticString)
  }()

  static public let setCookie: HeaderKey = {
    return HeaderKey("Set-Cookie" as StaticString)
  }()

  static public let strictTransportSecurity: HeaderKey = {
    return HeaderKey("Strict-Transport-Security" as StaticString)
  }()

  static public let trailer: HeaderKey = {
    return HeaderKey("Trailer" as StaticString)
  }()

  static public let transferEncoding: HeaderKey = {
    return HeaderKey("Transfer-Encoding" as StaticString)
  }()

  static public let trackingStatusValue: HeaderKey = {
    return HeaderKey("TSV" as StaticString)
  }()

  static public let vary: HeaderKey = {
    return HeaderKey("Vary" as StaticString)
  }()

  static public let wwwAuthenticate: HeaderKey = {
    return HeaderKey("WWW-Authenticate" as StaticString)
  }()
}

extension HeaderKey: ExpressibleByStringLiteral {
    public init(stringLiteral string: String) {
        self.init(string)
    }

    public init(extendedGraphemeClusterLiteral string: String){
        self.init(string)
    }

    public init(unicodeScalarLiteral string: String){
        self.init(string)
    }
}
