require 'git-helper/version'
# bundler_setup loads all gem dependenceis
require 'bundler_setup'
# Setup configures all parts of our code, kind of like rails config/initializers
require 'setup'

# Initial main menu, entry point for the start command
require 'git-helper/menus/main'

module GitHelper
  def self.start
    GitHelper::Menus::MainMenu.open
  end

  def self.gem_dir
    File.dirname(File.dirname(__FILE__))
  end

  def self.storage_dir
    File.expand_path('~/Library/git-helper')
  end

  # @return [Hash] cached read-only settings
  def self.settings
    @settings ||= load_settings.clone.freeze
  end

  def self.project_pref_path
    project_directory = `pwd`.sub("\n", '')
    File.join(project_directory, '.git-helper-pref.plist')
  end

  def self.project_backup_pref_path
    pref_backup_directory = File.join(GitHelper.storage_dir, 'settings')
    # Dasherize the backslashes to avoid needless subdirectories
    project_directory = `pwd`.sub("\n", '')
    FileUtils.mkdir_p(pref_backup_directory)
    project_backup_pref_file_name = File.join(pref_backup_directory, project_directory.gsub(/\//, '-'))
    project_backup_pref_file_name + '.plist'
  end

  # @return [Hash] read-only settingsD
  def self.load_settings
    # Load backup pref for project
    project_backup_pref_path = self.project_backup_pref_path
    if File.exists?(project_backup_pref_path)
      @backup_pref = Plist.parse_xml(project_backup_pref_path)
    else
      @backup_pref = {}
      Plist::Emit.save_plist(@backup_pref, project_backup_pref_path)
    end
    # Load project pef
    project_pref_path = self.project_pref_path
    if File.exists?(project_pref_path)
      @project_pref = Plist.parse_xml(project_pref_path)
    else
      @project_pref = @backup_pref
      Plist::Emit.save_plist(@project_pref, project_pref_path)
    end
    @project_pref
  end

  # @param [String, Symbol] key automatically converted to string
  # @return [Object] value
  def self.settings_for(key)
    settings[key.to_s]
  end

  # Updates GitHelper.settings with new key-value pair and immediately saves to disk
  # @param [String, Symbol] key automatically converted to string
  # @param [Object] value
  # @return [Hash] the update settings
  def self.update_settings(key, value)
    load_settings
    key = key.to_s
    # Update ivars
    @project_pref[key] = value
    @backup_pref[key] = value
    # Update settings ivar
    @settings = @project_pref.clone.freeze
    # Update files
    save_settings(@settings)
    @settings
  end

  # Saves settings to disk
  # One of them goes to the current root directory that called GitHelper
  # The other goes to git-helpers gem directory as backup in case you lose this file
  # @param [Hash, optional] settings complete settings to save to disk
  #        Defaults to GitHelper.settings
  # @return [True/False] true if successful, false if not
  def self.save_settings(settings = self.settings)
    Plist::Emit.save_plist(settings, project_pref_path)
    Plist::Emit.save_plist(settings, project_backup_pref_path)
    true
  end
end
