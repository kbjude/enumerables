require './lib/enumerables'

RSpec.describe Enumerable do
    let(:arr) { [1, 2, 3, 4, 3] }


    describe '#.my_each' do

        context 'When array and block are given'do
            it 'returns the items in the array' do
                expect { arr.my_each { |i| print i }}.to output('12343').to_stdout
            end
        end
        context 'When no block is given' do
            it 'returns an enumerator' do
                expect(arr.my_each).to be_instance_of(Enumerator)
            end
        end
    end

    describe '#.my_each_with_index' do

        context 'When array and block are given'do
            it 'returns the items in the array' do
                expect { arr.my_each { |i, v| print i, v }}.to output('12343').to_stdout
            end
        end
        context 'When no block is given' do
            it 'returns an enumerator' do
                expect(arr.my_each).to be_instance_of(Enumerator)
            end
        end
    end
end