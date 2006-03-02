class AsfResolveidsController < ActionController::Base
  def resolve
    klass_name = params[:class]
    ids = params[:ids]
    
    klass = klass_name.constantize
    connection = klass.connection
    
    name_columns = (klass.columns.reject { |column| not column.is_name? }).map { |column| column.api_name }
    
    id_resolver = ActiveSalesforce::IdResolver.new(connection)
    id_resolver.deserialize(ids)
    values = id_resolver.resolve    

    # Send back the JSON encoded mapping from OID => name    
    render(:text => "({ " + values.map { |id, names| "\"#{id}\" : \"" + names.map { |name, value| value }.join(' ') + '"'}.join(', ') + " })")
  end
end