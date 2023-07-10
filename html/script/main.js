window.addEventListener("load", function(){
    this.document.getElementsByClassName("container")[0].style.display = "none"
})


window.addEventListener("message", function(event){
    const item = event.data;
    if(item.action === "open"){
        this.document.getElementsByClassName("container")[0].style.display = "flex"
    }

});


    document.getElementById("adder").addEventListener("click", () =>{
        axios.post(`https://${GetParentResourceName()}/spawncar`,{
            name : this.document.getElementById("adder").attributes[0].value,
        })
    })
    
    document.getElementById("exit").addEventListener("click", () =>{
        axios.post(`https://${GetParentResourceName()}/releaseFocus`,{
        });
         this.document.getElementsByClassName("container")[0].style.display = "none"
    })

