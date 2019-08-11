module TestBench
  module Fixture
    module Output
      module Substitute
        def self.build
          Output.new
        end

        class Output
          include Fixture::Output

          def records
            @records ||= []
          end

          def assert(result, caller_location)
            record(:assert, result, caller_location)
          end

          def enter_assert_block
            record(:enter_assert_block)
          end

          def exit_assert_block(result)
            record(:exit_assert_block, result)
          end

          def comment(text)
            record(:comment, text)
          end

          def error(error)
            record(:error, error)
          end

          def start_test(title)
            record(:start_test, title)
          end

          def finish_test(title, result)
            record(:finish_test, title, result)
          end

          def skip_test(title)
            record(:skip_test, title)
          end

          def enter_context(title)
            record(:enter_context, title)
          end

          def exit_context(title, result)
            record(:exit_context, title, result)
          end

          def skip_context(title)
            record(:skip_context, title)
          end

          def record(signal, *data)
            record = Record.new(signal, data)

            records << record
          end

          Record = Struct.new(:signal, :data)
        end
      end
    end
  end
end
