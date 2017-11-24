import Foundation

extension Assembly {
  var extractViewImage: ExtractViewImage {
    return ExtractViewImage(
      saveImageToDisk: saveImageToDisk
    )
  }
  
  private var saveImageToDisk: SaveImageToDisk {
    return SaveImageToDisk(
      environment: environment,
      fileManager: fileManager,
      addAttachment: addAttachment
    )
  }
  
  var compareImages: CompareImages {
    return CompareImages(
      fileManager: fileManager,
      addAttachment: addAttachment
    )
  }
  
  private var addAttachment: AddAttachment {
    return AddAttachment()
  }
}
