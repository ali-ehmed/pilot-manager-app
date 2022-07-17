class HashSerializer
  def self.dump(hash)
    hash.to_json
  end

  def self.load(hash)
    hash = JSON.parse(hash) if hash.kind_of?(String)
    (hash || {}).with_indifferent_access
  end
end
