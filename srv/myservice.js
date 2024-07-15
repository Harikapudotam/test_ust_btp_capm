module.exports = async (srv) => {
 
    //implementation code
    srv.on('greetings', (req,res)=>{
        return "good morning ! " + req.data.name ;
    })
    srv.on('multiplication', (req,res)=>{
          return req.data.nam * req.data.name1;

    })
}

