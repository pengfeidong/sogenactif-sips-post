require "sogenactif/sips/post/version"

module Sogenactif
  module Sips
    module Post
      class Post

        attr_reader :parameters

        def initialize(currency_code, key_version, merchant_id, normal_returnUrl)
          @parameters = {}
          add_conf_parameter(currency_code, key_version, merchant_id, normal_returnUrl)
        end

        def data
          @parameters.collect { |key, value| "#{key}=#{CGI.escape(value.to_s)}" }.join("|")
        end

        def seal(secretKey)
          Digest::SHA256.hexdigest (Post.to_utf8( data + secretKey ))
        end

        def add_parameter(key, value, options = {})
          @parameters[key] = value if !value.blank? || options[:required]
        end

        def add_conf_parameter(currency_code, key_version, merchant_id, normal_returnUrl)
          add_parameter  'currencyCode' , currency_code
          add_parameter  'keyVersion' , key_version
          add_parameter  'merchantId' , merchant_id
          add_parameter  'normalReturnUrl' , normal_returnUrl
        end

        def to_html(post_url, secretKey, interface_version, submit_text, auto_submit = false)
          html = "<form id='sipspost' method='post' action='"+post_url+"'>
                    <input type='hidden' name='Data' value='"+data+"'>
                    <input type='hidden' name='InterfaceVersion' value='"+interface_version+"'>
                    <input type='hidden' name='Seal' value='"+seal(secretKey)+"'>
                    <input type='submit' value='"+submit_text+"'>
                  </form>"
          html = html + "<script>document.getElementById('sipspost').submit();</script> "if auto_submit
          html
        end

        def self.to_utf8(string)
          string.force_encoding(Encoding::UTF_8)
        end

      end
    end
  end
end
