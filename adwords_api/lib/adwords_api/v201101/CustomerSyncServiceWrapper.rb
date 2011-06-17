  # This file was automatically generated during the "rake generate" step of
  # library setup.
  require 'adwords_api/v201101/CustomerSyncServiceDriver.rb'

  module AdwordsApi
    module V201101
      module CustomerSyncService

        # Wrapper class for the v201101 CustomerSyncService service.
        # This class is automatically generated.
        class CustomerSyncServiceWrapper

          # Holds the API object to which the wrapper belongs.
          attr_reader :api

          # Version and service utility fields.
          attr_reader :version, :service

          REGISTRY = AdwordsApi::V201101::CustomerSyncService::DefaultMappingRegistry::LiteralRegistry
          # This takes advantage of the code generated by soap4r to get the
          # correct namespace for a given service. It accesses one of the fields
          # in the description of the service's methods, which indicates the
          # namespace.
          # Since we're using a fixed version of soap4r (1.5.8), and this is
          # automatically generated as part of the stub generation, it will
          # always point to what we want.
          NAMESPACE = 'https://adwords.google.com/api/adwords/ch/v201101'

          # Holds a shortcut to the parent module.
          # Use this to avoid typing the full class name when creating classes
          # belonging to this service, e.g.
          #  service_object.module::ClassName
          # instead of
          #  AdwordsApi::V201101::CustomerSyncService::ClassName
          # This will make it easier to migrate your code between API versions.
          attr_reader :module

          public

          # Constructor for CustomerSyncServiceWrapper.
          #
          # Args:
          # - driver: SOAP::RPC::Driver object with the remote SOAP methods for
          #   this service
          # - api: the API object to which the wrapper belongs
          #
          def initialize(driver, api)
            @driver = driver
            @api = api
            @module = AdwordsApi::V201101::CustomerSyncService
            @version = :v201101
            @service = :CustomerSyncService
          end

          # Returns the namespace for this service.
          def namespace
            return NAMESPACE
          end

          private

          # Converts from underscore_separated names to camelCase names.
          #
          # Args:
          # - text: the text to be converted
          #
          def camel_case(text)
            text.gsub(/_\w/) {|match| match[1..-1].upcase}
          end

          # Converts from camelCase names to underscore_separated names.
          #
          # Args:
          # - text: the text to be converted
          #
          def underscore(text)
            text.gsub(/[a-z0-9][A-Z]/) do |match|
              match[0,1] + '_' + match[1,1].downcase
            end
          end

          # Validates whether an object is of the correct type.
          # This method is invoked by the hash to object converter during
          # runtime to check the type validity of every object.
          #
          # Args:
          # - object: the hash "object" being evaluated
          # - type: the expected type (the class object itself)
          #
          # Returns:
          # nil, upon success
          #
          # Raises:
          # - ArgumentError: in case of an unexpected type
          #
          def validate_object(object, type)
            return nil if object.is_a? type

            wsdl_type_obj = type.new

            if object.is_a? Hash
              xsi_type = object[:xsi_type] or object['xsi_type']
              if xsi_type
                begin
                  subtype = @module.class_eval(xsi_type)
                  user_type_obj = subtype.new
                rescue
                  raise ArgumentError, "Specified xsi_type '" + xsi_type +
                      "' is unknown"
                end
                unless user_type_obj.is_a? type
                  raise ArgumentError, "Specified xsi_type '" + xsi_type +
                      "' is not a subclass of " + type.to_s
                end
              else
                object.each do |key, value|
                  if key.to_s != 'xsi_type'
                    if !wsdl_type_obj.respond_to?(camel_case(key.to_s).to_sym)
                      raise ArgumentError, "Unknown property '" + key.to_s +
                          "' for type " + type.to_s
                    end
                  end
                end
              end
            end
            return nil
          end

          # Sets a property on a real (soap4r-generated) object.
          #
          # Args:
          # - object: the object being modified
          # - property: the property being set
          # - value: the value it's being set to
          #
          def set_object_property(object, property, value)
            begin
              object.send(property.to_s + '=', value)
            rescue
              object_class = object.class.name.split('::').last
              error = AdsCommon::Errors::MissingPropertyError.new(
                  property, object_class)
              message = "'Missing property `" + property.to_s +
                  "' for object class `" + object_class + "'"
              raise(error, message)
            end
          end

          public

          # Converts dynamic objects (property hashes) into real soap4r objects.
          # This is meant to be called when setting properties on a class, so
          # the method receives an optional parameter specifying the class and
          # property. This way, it's possible to determine the default type for
          # the object if none is provided.
          #
          # Args:
          # - object: the object being converted
          # - parent_class: the class whose property is being set
          # - property: the property being set
          #
          def convert_to_object(object, parent_class = nil, property = nil)
            property = camel_case(property.to_s) if property
            if object.is_a? Hash
              # Process a hash.
              specified_class = object[:xsi_type] or object['xsi_type']
              default_class = nil
              # Determine default class for this object, given the property
              # being set.
              if parent_class and property
                parent = REGISTRY.schema_definition_from_class(parent_class)
                element = parent.elements.entries.find do |entry|
                  entry.varname.to_s == property.to_s
                end
                default_class = element.mapped_class if element
              end
              validate_object(object, default_class)
              real_class = nil
              if specified_class
                real_class = @module.class_eval(specified_class)
              else
                real_class = default_class
              end
              # Instance real object.
              real_object = real_class.new
              # Set each of its properties.
              object.each do |entry, value|
                entry = entry.to_s
                unless entry == 'xsi_type'
                  if @api.config.read('service.use_ruby_names', true)
                    entry = camel_case(entry)
                  end
                  if value.is_a? Hash
                    # Recurse.
                    set_object_property(real_object, entry,
                        convert_to_object(value, real_class, entry))
                  elsif value.is_a? Array
                    set_object_property(real_object, entry,
                        value.map do |item|
                          # Recurse.
                          convert_to_object(item, real_class, entry)
                        end
                    )
                  else
                    set_object_property(real_object, entry, value)
                  end
                end
              end
              return real_object
            elsif object.is_a? Array
              # Process an array
              return object.map do |entry|
                # Recurse.
                convert_to_object(entry, parent_class, property)
              end
            else
              return object
            end
          end

          # Converts real soap4r objects into dynamic ones (property hashes).
          # This is meant to be called for return objects of remote calls.
          #
          # Args:
          # - object: the object being converted
          #
          def convert_from_object(object)
            if object.class.name =~
                /AdwordsApi::V201101::\w+::\w+/
              # Handle soap4r object
              object_class = REGISTRY.schema_definition_from_class(object.class)
              if object_class.elements and !object_class.elements.entries.empty?
                # Process complex object.
                hash = {}
                hash[:xsi_type] = object.class.name.split('::').last
                object_class.elements.entries.each do |entry|
                  property = entry.varname.to_s
                  if object.respond_to? property and !property.include?('_Type')
                    value = object.send(property)
                    property_name = nil
                    if @api.config.read('service.use_ruby_names', true)
                      property_name = underscore(property).to_sym
                    else
                      property_name = property.to_sym
                    end
                    # Recurse.
                    hash[property_name] = convert_from_object(value) if value
                  end
                end
                return hash
              else
                # Process simple object.
                parent = object.class.superclass
                return parent.new(object)
              end
            elsif object.is_a? Array
              # Handle arrays
              return object.map do |entry|
                # Recurse.
                convert_from_object(entry)
              end
            else
              # Handle native objects
              return object
            end
          end


          public

          # Calls the {get}[http://code.google.com/apis/adwords/docs/reference/v201101/CustomerSyncService.html#get] method of the CustomerSyncService service.
          # Check {the online documentation for this method}[http://code.google.com/apis/adwords/docs/reference/v201101/CustomerSyncService.html#get].
          #
          # Args:
            # - selector: AdwordsApi::V201101::CustomerSyncService::CustomerSyncSelector
            #
            # Returns:
            # - rval: AdwordsApi::V201101::CustomerSyncService::CustomerChangeData
          #
          # Raises:
          # Error::ApiError (or a subclass thereof) if a SOAP fault occurs.
          #
          def get(selector)
            begin
              arg_array = []
                validate_object(selector, AdwordsApi::V201101::CustomerSyncService::CustomerSyncSelector)
                arg_array << convert_to_object(selector, AdwordsApi::V201101::CustomerSyncService::Get,
                    'selector')
              # Construct request object and make API call
              obj = AdwordsApi::V201101::CustomerSyncService::Get.new(*arg_array)
              reply = convert_from_object(@driver.get(obj))
              reply = reply[:rval] if reply.include?(:rval)
              return reply
            rescue SOAP::FaultError => fault
              raise AdwordsApi::Errors.create_api_exception(fault,
                  self)
            end
          end

        end
      end
    end
  end
