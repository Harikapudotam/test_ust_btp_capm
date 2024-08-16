module.exports = async(srv) =>{
      //implementation code for srv def
      srv.on('greetings',(req,res)=>{
        return "good morning" + req.data.name;
      })
      srv.on('mul',(req,res)=>{
        return req.data.arg1 * req.data.arg2;
      })
}