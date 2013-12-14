require "spec_helper"

require "hamster/set"

describe Hamster::Set do

  [:to_a, :entries].each do |method|

    describe "##{method}" do

      [
        [],
        ["A"],
        ["A", "B", "C"],
      ].each do |values|

        describe "on #{values.inspect}" do

          before do
            @set = Hamster.set(*values)
            @result = @set.send(method)
          end

          it "returns #{values.inspect}" do
            @result.sort.should == values.sort
          end

          it "returns a mutable array" do
            @result.last.should_not == "The End"
            @result << "The End"
            @result.last.should == "The End"
          end

        end

      end

    end

  end

end
