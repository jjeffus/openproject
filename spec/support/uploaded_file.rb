class UploadedFile
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def basename
    File.basename(path)
  end

  def self.load_from(path)
    full_path = Rails.root.join(path)
    shared_path = DownloadList::SHARED_PATH.join(File.basename(full_path))
    # with remote drivers, files to upload must be in the shared downloads folder
    FileUtils.cp(full_path, shared_path)
    new(shared_path)
  end
end
