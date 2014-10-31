#!/usr/bin/env rspec

require 'spec_helper'

describe 'nexus' do
  let(:params) { { :version => '2.10.0-2.cgk.el6' } }
  it { should contain_class 'nexus' }
end
