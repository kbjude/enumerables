require './lib/enumerables'

RSpec.describe Enumerable do
    let(:arr) { [1, 2, 3, 4, 3] }
    let(:new_arr) { [ ] }
    let(:arg) { 23 }
    let(:count) { 5 }
    let(:word) {['ChristLord', 'Living', 'Life', 'Love']}


    describe '#.my_each' do

        context 'When block is given'do
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

            it 'returns true or false depending on the argument' do
                expect( arr.my_all?(/d/)).to eql(arr.all?(/d/))
            end
        end
        context 'When no block is given' do
            ints = [3,3,3]
            it 'returns true or false depending on the argument' do
                expect( ints.my_all?(3)).to eql(ints.all?(3))
            end
        end
    end

    describe '#my_any?' do
        context 'When a block is given' do
            it 'returns true when any of the number in the array is an integer' do
                expect(arr.my_any? {|i| i > 2}).to eql(arr.any? {|i| i > 2})
            end

            it 'returns true when any of the number in the array is true' do
                expect( arr.my_any?(/d/)).to eq(arr.any?(/d/))
            end
        end

        context 'When no block is given but arguments' do

            it 'returns true the item class  is similar to the argument' do
                expect(arr.my_any?(Integer)).to eql(arr.any?(Integer))
            end
        end
    end

    describe '#.my_none?' do

        context 'When block is given'do
            it 'returns false when atleast one of the items in the array is an integer' do
                expect( arr.my_none? { |i| i.class == Integer }).to eql(false)
            end

            it 'returns true when all the items in the array are not true' do
                expect( arr.my_none? { |i| i.even? }).to eql(arr.none? { |i| i.even? })
            end

            it 'returns false when the argument is not regex' do
                expect( arr.my_none?(/d/)).to eq(arr.none?(/d/))
            end
        end
        context 'When no block is given' do
            it 'returns false when the argument is an integer' do
                expect( arr.my_none?( arg.class == Integer )).to eql(arr.none?( arg.class == Integer ))
            end
        end
    end

    describe '#my_map' do
        context 'When a block is provided' do
            it 'creates a new empty array to receive the items from the other array' do
                expect(arr.my_map { |i| i }).to eql(arr.map { |i| i })
            end

            it 'returns true and false items in a new array' do
                expect(arr.my_map { |i| i.even? }).to eql(arr.map { |i| i.even?})
            end
        end

        context 'When no block is given but arguments' do

            it 'returns true when the class is similar to the class for the argument' do
                expect(arr.my_map).to be_instance_of(Enumerator)
            end
        end
    end

    describe '#my_count' do
        context 'When a block is given' do
            it 'counts the items in the array and returns total' do
                expect(arr.my_count { |i| i < 4 }).to eql(arr.count { |i| i < 4 })
            end

            it 'returns a count of array items according to the argument provided' do
                expect(arr.my_count{ |i|(arg > i)}).to eql(arr.count{ |i|(arg > i)})
            end

        end

        context 'When no block is given but arguments' do

            it 'returns a count of items in the array basing on the input of the argument' do
                expect(arr.my_count(arg)).to eql(arr.count(arg))
            end
        end
    end
end