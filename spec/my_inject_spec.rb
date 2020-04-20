# require '../lib/enumerables'

RSpec.describe Enumerable do

    let(:data) {[3,4,5,6,4]}
    
    describe '#my_inject' do
        context 'When block is not given' do

            it 'when a number and a symbol are passed' do
                arr = [3,4,5,6,4]
                expect(data.my_inject( 5, :* )).to eql(data.inject(5,:*))
            end

            it 'when a symbol is given' do
                expect(data.my_inject(:*)).to eql(data.inject(:*))
            end
        end
        context 'When block is given' do

            it 'when items of the array arrat multiplied against each other' do
                expect(data.my_inject { |i| i * i }).to eql(data.inject{ |i| i * i })
            end

            it 'when a number and a symbol are passed' do
                expect(data.my_inject{ | v, i| 5 * i }).to eql(data.inject{ | v, i| 5 * i })
            end

            it 'returns all the items in a range' do
                expect((2..15).my_inject(:*)).to eql((2..15).inject(:*))
            end
        end
    end
end