# -*- coding: utf-8 -*-
require File.expand_path('spec_helper', File.dirname(__FILE__))

require 'i18n'

I18n.config.available_locales = [:ja, :en]

describe SelectableAttr::Enum do

  before(:all) do
    @default_locale_backup = I18n.default_locale
    @locale_backup = I18n.locale
  end

  after(:all) do
    I18n.locale = @locale_backup
    I18n.default_locale = @default_locale_backup
  end

  before(:each) do
    I18n.backend = I18n::Backend::Simple.new
    I18n.backend.store_translations 'en', 'selectable_attrs' => {'enum1' => {
        'entry1' => 'entry one',
        'entry2' => 'entry two',
        'entry3' => 'entry three'
      } }
    I18n.backend.store_translations 'ja', 'selectable_attrs' => {'enum1' => {
        'entry1' => 'エントリ壱',
        'entry2' => 'エントリ弐',
        'entry3' => 'エントリ参'
      } }
  end

  EnumI18n1 = SelectableAttr::Enum.new do
    i18n_scope(:selectable_attrs, :enum1)
    entry 1, :entry1, "エントリ1"
    entry 2, :entry2, "エントリ2"
    entry 3, :entry3, "エントリ3"
  end

  it 'test_enum1_i18n' do
    I18n.locale.should == :en
    EnumI18n1.name_by_key(:entry1).should == "entry one"
    EnumI18n1.name_by_key(:entry2).should == "entry two"
    EnumI18n1.name_by_key(:entry3).should == "entry three"
    EnumI18n1.names.should == ["entry one", "entry two", "entry three"]

    I18n.locale = 'ja'
    EnumI18n1.name_by_key(:entry1).should == "エントリ壱"
    EnumI18n1.name_by_key(:entry2).should == "エントリ弐"
    EnumI18n1.name_by_key(:entry3).should == "エントリ参"
    EnumI18n1.names.should == ["エントリ壱", "エントリ弐", "エントリ参"]

    I18n.locale = 'en'
    EnumI18n1.name_by_key(:entry1).should == "entry one"
    EnumI18n1.name_by_key(:entry2).should == "entry two"
    EnumI18n1.name_by_key(:entry3).should == "entry three"
    EnumI18n1.names.should == ["entry one", "entry two", "entry three"]
  end

  class EnumBase
    include ::SelectableAttr::Base
  end

  class SelectableAttrMock1 < EnumBase
    selectable_attr :attr1, :default => 2 do
      i18n_scope(:selectable_attrs, :enum1)
      entry 1, :entry1, "エントリ1"
      entry 2, :entry2, "エントリ2"
      entry 3, :entry3, "エントリ3"
    end
  end

  it 'test_attr1_i18n' do
    I18n.locale = :en
    I18n.default_locale = 'ja'
    I18n.locale = :ja
    I18n.locale.should == :ja
    SelectableAttrMock1.attr1_name_by_key(:entry1).should == "エントリ壱"
    SelectableAttrMock1.attr1_name_by_key(:entry2).should == "エントリ弐"
    SelectableAttrMock1.attr1_name_by_key(:entry3).should == "エントリ参"
    SelectableAttrMock1.attr1_options.should == [["エントリ壱",1], ["エントリ弐",2], ["エントリ参",3]]

    I18n.locale = 'ja'
    SelectableAttrMock1.attr1_name_by_key(:entry1).should == "エントリ壱"
    SelectableAttrMock1.attr1_name_by_key(:entry2).should == "エントリ弐"
    SelectableAttrMock1.attr1_name_by_key(:entry3).should == "エントリ参"
    SelectableAttrMock1.attr1_options.should == [["エントリ壱",1], ["エントリ弐",2], ["エントリ参",3]]

    I18n.locale = 'en'
    SelectableAttrMock1.attr1_name_by_key(:entry1).should == "entry one"
    SelectableAttrMock1.attr1_name_by_key(:entry2).should == "entry two"
    SelectableAttrMock1.attr1_name_by_key(:entry3).should == "entry three"
    SelectableAttrMock1.attr1_options.should == [["entry one",1], ["entry two",2], ["entry three",3]]
  end

  class SelectableAttrMock2 < EnumBase
    selectable_attr :enum1, :default => 2 do
      i18n_scope(:selectable_attrs, :enum1)
      entry 1, :entry1, "エントリ1"
      entry 2, :entry2, "エントリ2"
      entry 3, :entry3, "エントリ3"
    end
  end

  it 'test_enum1_i18n' do
    I18n.locale = 'ja'
    SelectableAttrMock2.enum1_name_by_key(:entry1).should == "エントリ壱"
    SelectableAttrMock2.enum1_name_by_key(:entry2).should == "エントリ弐"
    SelectableAttrMock2.enum1_name_by_key(:entry3).should == "エントリ参"
    SelectableAttrMock2.enum1_options.should == [["エントリ壱",1], ["エントリ弐",2], ["エントリ参",3]]

    I18n.locale = 'en'
    SelectableAttrMock2.enum1_name_by_key(:entry1).should == "entry one"
    SelectableAttrMock2.enum1_name_by_key(:entry2).should == "entry two"
    SelectableAttrMock2.enum1_name_by_key(:entry3).should == "entry three"
    SelectableAttrMock2.enum1_options.should == [["entry one",1], ["entry two",2], ["entry three",3]]
  end

end
