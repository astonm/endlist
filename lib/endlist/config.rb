module Endlist
  module Config
    # clients include the config so you can have multiple clients
    # with different credentials and settings
    def self.included(base)
      base.send :include, ClassMethods
    end

    module ClassMethods

      def client_id
        return @client_id if @client_id
        self.client_id = yaml['credentials']['client_id']
      end

      def client_id=(val)
        @client_id = val
      end


      def secret
        return @secret if @secret
        self.secret = yaml['credentials']['secret']
      end

      def secret=(val)
        @secret = val
      end


      def signature(nonce='')
        Digest::SHA1.hexdigest("#{client_id}#{secret}#{nonce}")
      end


      def host
        return @host if @host
        self.host = yaml['credentials']['host'] || "list.endless.fm"
      end

      def host=(val)
        @host = val
      end


      def yaml
        return @yaml if @yaml
        return {} unless path
        file_path = File.join(path, 'endlist.yml')
        return self.yaml = YAML.load_file(file_path)[env] if File.exists?(file_path)
        {}
      end

      def yaml=(val)
        @yaml = val
      end


      def env
        return @env if @env
        return self.env = Rails.env if defined?(Rails)
        self.env = 'development'
      end

      def env=(val)
        @environment = val
      end


      def path
        return @path if @path
        return self.path = Rails.root.join("config") if defined?(Rails)
        return self.path = File.join(Dir.pwd, 'config')
        nil 
      end
      
      def path=(val)
        @path = val 
      end
    end

    extend ClassMethods

  end
end
