!function(W){
  var d;
  
  function generateUUIDElement(c) {
    var r = (d + Math.random()*16)%16 | 0;
    d = Math.floor(d/16);
    return (c=='x' ? r : (r&0x3|0x8)).toString(16);
  }
  
  function UUID(){
    d = new Date().getTime();
    this.value = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,generateUUIDElement);
  }
  
  UUID.prototype.toString=function(){
    return this.value;
  }
  
  W.UUID = UUID;
}(window);
    