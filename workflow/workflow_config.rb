require 'yaml'

class WorkflowConfig

  @config
  @current_languages
  @language_codes

  def initialize
    load_config
  end

  def get_languages_list
    @config[:languages]
  end

  def search_languages(query)
    @config[:languages].select do |lang|
      lang[:key].downcase =~ /#{query}/ || lang[:lang].downcase =~ /#{query}/
    end
  end

  def get_current_languages
    @current_languages
  end

  def get_current_languages_string
    @current_languages.join('+')
  end

  def add_current_language(key)
    # check valid code
    raise Exception unless @language_codes.include?(key)
    # check not already added
    raise Exception if @current_languages.include?(key)

    @current_languages << key
    @config[:default] = get_current_languages_string
    save_config
  end

  def remove_current_language(key)
    # check valid code
    raise Exception unless @language_codes.include?(key)
    # check already added
    raise Exception unless @current_languages.include?(key)

    @current_languages.delete(key)
    @config[:default] = get_current_languages_string
    save_config
  end

  def load_config
    @config = YAML.load(File.open('config.yml'))
    @current_languages = @config[:default].split('+')
    @language_codes = @config[:languages].map { |lang| lang[:key] }
  end

  def save_config
    File.open('config.yml', 'w') { |f| f.write(@config.to_yaml) }
  end

  private :load_config, :save_config, :initialize
end