# encoding: utf-8
require 'spec_helper'

describe PoToJson do
  before :all do
    @subject = PoToJson.new(File.join(File.dirname(__FILE__), '..', 'spec', 'test.po'))
  end
  describe 'when parsing' do
    before(:all){ @parsed = @subject.parse }
  
    it { @parsed['']['Last-Translator'].should == ' FULL NAME <EMAIL@ADDRESS>' }
    it { @parsed['%{relative_time} ago'].should == [nil, 'vor %{relative_time}'] }
    it { @parsed['Axis'].should == ['Axis', 'Achse', 'Achsen'] }
    it { @parsed['Car was successfully created.'].should == [nil, 'Auto wurde erfolgreich gespeichert'] }
    it { @parsed['Car was successfully updated.'].should == [nil, 'Auto wurde erfolgreich aktualisiert'] }
    it { @parsed['Car|Model'].should == [nil, 'Modell'] }
    it { @parsed['Untranslated'].should == [nil, ''] }
    it { @parsed['Car|Wheels count'].should == [nil, 'Räderzahl'] }
    it { @parsed['Created'].should == [nil, 'Erstellt'] }
    it { @parsed['Month'].should == [nil, 'Monat'] }
    it { @parsed['car'].should == [nil, 'Auto'] }
    it { @parsed['Umläüte'].should == [nil, 'Umlaute'] }
    it do
      @parsed["You should escape '\\\\' as '\\\\\\\\'."].should ==
        [nil, "Du solltest '\\\\' als '\\\\\\\\' escapen."]
    end
    it do
      @parsed['this is a dynamic translation which was found thorugh gettext_test_log!'].should ==
        [nil, 'Dies ist eine dynamische Übersetzung, die durch gettext_test_log gefunden wurde!']
    end
  end
  
  describe 'when generating a jed compatible file' do
    before(:all){ @jed_json = @subject.generate_for_jed('de') }
    it { @jed_json.include?("var locales = locales || {}; locales['de'] = ").should be_true }
    it { @jed_json.include?('"domain":"messages"').should be_true }
    it { @jed_json.include?('"lang":"de"').should be_true }
    it { @jed_json.include?('"plural_forms":" nplurals=INTEGER; plural=EXPRESSION;"').should be_true }
  end
end

