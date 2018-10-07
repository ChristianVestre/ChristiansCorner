String id = 'si81z2ojmrqcooo';

fetchList <String>(String id){
return """
query {
  getList(id:"$id"){
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
}
/* String fetchList = """
query {
  getList(id:"si81z2ojmrqcooo"){
    name
  }
}
"""
    .replaceAll('\n', ' '); */