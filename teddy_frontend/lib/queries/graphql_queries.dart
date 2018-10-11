String id = 'si81z2ojmrqcooo';

var listQuery =  """
query {
  getList(id:"si81z2ojmrqcooo"){
    name
    listpartids
    getListParts{
      	id
      	part_name
        content_url
        content_text
    }
  }
}
"""
    .replaceAll('\n', ' '); 

