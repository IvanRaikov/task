/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var errors = new Array();
window.onload = (function(){
    document.getElementById("submit").onclick = (function(event){
        event.preventDefault();
        
        var forms = document.forms[0];
        var fname = forms.fname.value;
        var sname = forms.sname.value;
        var pname = forms.pname.value;
        var email = forms.email.value;
        var phone = forms.phone.value;
        var comment = forms.comment.value;
        var file =  forms.file;
        validate(fname, 'имя');
        validate(sname, 'фамилия');
        validate(pname, 'отчество');
        emailValidate(email);
        validate(comment, 'комментарий');
        phoneValidate(phone);
        fileValidate(file.value);
        if(errors.length === 0){
            var xhr = new XMLHttpRequest();
            var formData = new FormData();
            
            xhr.open('POST', 'check.php',true);
            formData.append("fname",fname);
            formData.append("sname",sname);
            formData.append("pname",pname);
            formData.append("email",email);
            formData.append("comment",comment);
            formData.append("phone",phone);
            formData.append("file",file.files[0]);
            xhr.send(formData);
            xhr.onreadystatechange = function(){
                if(xhr.status === 200){
                    if (xhr.readyState !== 4) return;
                    if(xhr.responseText === "OK"){
                    var massege = document.getElementById("massege-ul");
                    var li = document.createElement('li');
                    li.innerHTML = "данные успешно отправлены";
                    massege.appendChild(li);
                    }else{
                        var phpErrors = JSON.parse(xhr.responseText);
                        var massege = document.getElementById('massege-ul');
                        for(i=0; i < phpErrors.length;i++){
                              var li = document.createElement('li');
                              li.innerHTML = phpErrors[i];
                               massege.appendChild(li);
                            }
                    }
                };
            };
            
        }else{
            var massege = document.getElementById('massege-ul');
            for(i=0; i < errors.length;i++){
                var li = document.createElement('li');
                li.innerHTML = errors[i];
                massege.appendChild(li);
                
            }errors=[];
        }
    });
});
function validate(arg, atrName){
    if(arg){
        return true;
    }else{
       errors.push("поле "+atrName+"  должно быть заполнено");
       return false;
    }
}
function emailValidate(string){
    if(string.match(/[0-9a-z_-]+@[0-9a-z_-]+\.[a-z]{2,5}/i)){
        return true;
    }else{
        errors.push("email заполнен не корректно");
        return false;
    }
    
}
function phoneValidate(string){
    if(string.match(/^\+?[7|8|9][0-9]{6,10}$/)){
        return true;
    }else{
        errors.push("телефон заполнен не коректно");
        return false;
    }
}
function fileValidate(arg){
    if(arg){
        return true;
    }else{
       errors.push("вы не выбрали файл");
       return false;
    }
}
