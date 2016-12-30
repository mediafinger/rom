require 'rom/schema'

RSpec.describe ROM::Schema, '#[]' do
  context 'with a schema' do
    subject(:schema) do
      define_schema(:users, id: :Int, name: :String, email: :String)
    end

    it 'returns an attribute identified by its canonical name' do
      expect(schema[:email]).to eql(define_type(:email, :String))
    end

    it 'returns an aliased attribute identified by its canonical name' do
      expect(schema.rename(id: :user_id)[:id]).to eql(define_type(:id, :Int, alias: :user_id))
    end

    it 'raises KeyError when attribute is not found' do
      expect { schema[:not_here] }.to raise_error(KeyError, /not_here/)
    end
  end

  context 'with a merged schema' do
    subject(:schema) do
      left.merge(right.__send__(:new, right.map { |attr| attr.meta(source: :tasks) }))
    end

    let(:left) do
      define_schema(:users, id: :Int, name: :String)
    end

    let(:right) do
      define_schema(:tasks, id: :Int, title: :String)
    end

    it 'returns an attribute identified by its canonical name' do
      expect(schema[:id]).to eql(define_type(:id, :Int))
    end

    it 'returns an attribute identified by its canonical name and its source' do
      expect(schema[:id, :tasks]).to eql(define_type(:id, :Int).meta(source: :tasks))
    end

    it 'raises KeyError when attribute is not found' do
      expect { schema[:not_here] }.to raise_error(KeyError, /not_here/)
      expect { schema[:not_here, :tasks] }.to raise_error(KeyError, /not_here/)
    end
  end
end
