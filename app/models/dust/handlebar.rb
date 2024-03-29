module Dust
  class Handlebar < Mustache

    def app_config
      raw_config = File.read("#{Rails.root}/config/app_config.yml")
      yaml_data = YAML.load(raw_config) 
      Hashie::Mash.new(yaml_data)
    end

    def block(id)
      @block = Block.find_by_id(id)
      @block.front_end_content
    end

    def method_missing(name, *args, &block)
      if name.to_s =~ /^block_(\d+)/
        block($1)
      else
        return super
      end
    end

    def respond_to?(method)
      if method.to_s =~ /^block_(\d+)/
        method.to_s =~ /^block_(\d+)/
      else
        super
      end
    end

    def current_year
      Time.now.strftime("%Y")
    end

  end
end
