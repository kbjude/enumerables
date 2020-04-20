require './lib/enumerables'

RSpec.describe Enumerable do
    let(:arr) { [1, 2, 3, 4, 3] }
    let(:new_arr) { [ ] }
    let(:arg) { 23 }
    let(:count) { 5 }
    let(:word) {['ChristLord', 'Living', 'Life', 'Love']}


    describe '#.my_each' do

        context 'When array and block are given'do
            it 'returns the items in the array' do
                expect( arr.my_each_with_index { |i, v| i}).to eql( arr.each_with_index { |i, v| i} )
            end
        end

        context 'When no block is given' do
            it 'returns an enumerator' do
                expect(arr.my_each).to be_instance_of(Enumerator)
            end
        end
    end

    describe '#.my_each_with_index' do
        context 'When no block is given' do
            it 'returns an enumerator' do
                expect(arr.my_each_with_index).to be_instance_of(Enumerator)
            end
        end
    end

    describe '#.my_select' do

        context 'When block is given'do
            it 'returns the selected items in the array' do
                 expect( arr.my_select { |i| i > 3 }).to eql(arr.select { |i| i > 3})
            end
        end
        context 'When no block is given' do
            it 'returns an enumerator' do
                expect(arr.my_select {|i| i == 3 }).to eql(arr.select {|i| i == 3 })
            end
        end
     end

    describe '#.my_all?' do

        context 'When block is given'do

            it 'returns false when atleast one array item is not true' do
                expect( arr.my_all? { |i| i.even? }).to eql(arr.all?{ |i| i.even? })
            end

            it 'returns true or false depending on the argument' do
                expect( arr.my_all?(/r/)).to eql(arr.all?(/r/))
            end
        end
        context 'When no block is given' do
            ints = [3,3,3]
            it 'returns an true or false depending on the argument' do
                expect( ints.my_all?(3)).to eql(ints.all?(3))
            end
        end
    end

    describe '#my_any?' do
        context 'When a block is given' do
            it 'returns true when any of the number in the array is an integer' do
                expect(arr.my_any? { |i| i.class == Integer }).to eql(true)
            end

            it 'returns true when any of the number in the array is true' do
                expect( arr.my_any?(/[0-9]/)).to eq(arr.any?(/[0-9]/))
            end
        end

        context 'When no block is given but arguments' do

            it 'returns true when the class of one of the items in the array is similar to the arguments' do
                expect(arr.my_any?(Integer)).to eql(arr.any?(Integer))
            end
        end
    end

    describe '#.my_none?' do

        context 'When array and block are given'do
            it 'returns false when one or all the items in the array are integer' do
                expect( arr.my_none? { |i| i.class == Integer }).to eql(false)
            end

            it 'returns true when all the items in the array are not true' do
                expect( arr.my_none? { |i| i.even? }).to eql(false)
            end

            it 'returns false when the argument is not regex' do
                expect( arr.my_none?(/d/)).to eq(arr.none?(/d/))
            end
        end
        context 'When no block is given' do
            it 'returns false when the argument is an integer' do
                expect( arr.my_none?( arg.class == Integer )).to eql( true )
            end
        end
    end

    describe '#my_map' do
        context 'When a block is provided' do
            it 'creates a new empty array to receive the items from the other array' do
                expect(arr.my_map { |i| i }).to eql([1, 2, 3, 4, 3])
            end

            it 'returns true and false items in a new with ternary operators ' do
                expect(arr.my_map { |i| i.even? }).to eql([false, true, false, true, false])
            end
        end

        context 'When no block is given but arguments' do

            it 'returns true when the class of one of the items is similar to the class for the argument' do
                expect(arr.my_map).to be_instance_of(Enumerator)
            end
        end
    end

    describe '#my_count' do
        context 'When a block is given' do
            it 'counts the items in the array and returns total' do
                expect(arr.my_count { |i| i < 4 }).to eql(4)
            end

            it 'returns a count of items in the array basing on the input of the argument' do
                expect(arr.my_count{ |i|(arg > i)}).to eql(5)
            end

        end

        context 'When no block is given but arguments' do

            it 'returns a count of items in the array basing on the input of the argument' do
                expect(arr.my_count(arg)).to eql(0)
            end
        end
    end
end