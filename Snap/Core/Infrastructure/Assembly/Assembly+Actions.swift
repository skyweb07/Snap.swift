import Foundation

extension Assembly {
  var extractViewImage: ExtractViewImage {
    return ExtractViewImage(
      saveImageToDisk: saveImageToDisk,
      addAttachment: addAttachment
    )
  }
  
  private var saveImageToDisk: SaveImageToDisk {
    return SaveImageToDisk(
      environment: environment,
      fileManager: fileManager
    )
  }
  
  var compareImages: CompareImages {
    return CompareImages(
      fileManager: fileManager,
      config: snapConfig,
      addAttachment: addAttachment,
      saveImageToDisk: saveImageToDisk
    )
  }
  
  private var addAttachment: AddAttachment {
    return AddAttachment()
  }
  
  private var snapConfig: Config {
    return Snap.config
  }
}
