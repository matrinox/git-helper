require 'spec_helper'

describe GitHelper do
  it 'has a version number' do
    expect(GitHelper::VERSION).not_to be nil
  end
end
