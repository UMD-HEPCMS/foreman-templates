gem 'minitest'
require 'minitest/autorun'
require 'test_helper'

class TestKickstartProvision < MiniTest::Unit::TestCase
  include TemplatesHelper

  def validate_distro(template, family, name, major, minor, ksversion)
    ns = FakeNamespace.new(family, name, major, minor)
    code, output = validate_erb(template, ns, ksversion)
    assert_empty output
    assert_equal code, 0
  end

  def test_centos_5
    validate_distro('kickstart/provision.erb', 'Redhat', 'CentOS', '5', '0', 'RHEL5')
  end

  def test_centos_6
    validate_distro('kickstart/provision.erb', 'Redhat', 'CentOS', '6', '0', 'RHEL6')
  end

  def test_centos_7
    validate_distro('kickstart/provision.erb', 'Redhat', 'CentOS', '7', '0', 'RHEL7')
  end

  def test_scientific_5
    validate_distro('kickstart/provision.erb', 'Redhat', 'Scientific Linux', '5', '0', 'RHEL5')
  end

  def test_scientific_6
    validate_distro('kickstart/provision.erb', 'Redhat', 'Scientific Linux', '6', '0', 'RHEL6')
  end

  def test_scientific_7
    validate_distro('kickstart/provision.erb', 'Redhat', 'Scientific Linux', '7', '0', 'RHEL7')
  end
end
