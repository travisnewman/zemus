path = File.expand_path('../zemus', __FILE__)
Dir.glob(File.join(path, "/**/*.rb")).each { |f| require f }

module Zemus

  def self.embed(url)
    Zemus::Parser.build_embedder(url).to_embed
  end


end
