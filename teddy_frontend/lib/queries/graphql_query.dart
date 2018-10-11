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
        type
        listid
    }
  }
}
"""
    .replaceAll('\n', ' '); 
}

fetchUser <String>(String id){
return """
query {
  getUser(userid:"$id"){
    firstname
    lastname
    listids
    getLists{
      name
      id
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