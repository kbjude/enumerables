require './lib/enumerables'

RSpec.describe Enumerable do
    let(:arr) { [1, 2, 3, 4, 3] }
    let(:new_arr) { [ ] }
    let(:arg) { 26 }


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
            it 'returns each item in the array with its index' do
                expect { arr.my_each_with_index { |i, v| print i, v }}.to output('1021324332').to_stdout
            end
        end
        context 'When no block is given' do
            it 'returns an enumerator' do
                expect(arr.my_each_with_index).to be_instance_of(Enumerator)
            end
        end
    end

    describe '#.my_select' do

        context 'When array and block are given'do
            it 'returns the selected items in the array' do
                 expect( arr.my_select { |i| i > 3 }).to eql([4])
            end
        end
        context 'When no block is given' do
            it 'returns an enumerator' do
                 expect( arr.my_select {|i| i == 3 }).to eql( [ 3, 3 ] )
            end
        end
     end

    describe '#.my_all?' do

        context 'When array and block are given'do
            it 'returns true when all the items in the array are true' do
                expect( arr.my_all? { |i| i.class == Integer }).to eql(true)
            end

            it 'returns false when not all the items in the array are true' do
                expect( arr.my_all? { |i| i.even? }).to eql(false)
            end

            it 'returns an true or false depending on the argument' do
                expect( arr.my_all? (arg.class != Regexp)).to eql( true )
            end
        end
        context 'When no block is given' do
            it 'returns an true or false depending on the argument' do
                expect( arr.my_all?  ( arg.class == Integer )).to eql( true )
            end
        end
  end
end