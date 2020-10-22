import axios from "axios";
import {devServer} from "../../vue.config";

export default {
    getAllUsers() {
        return axios
            .get(devServer.proxy + "/users");
    },
    removeUser(id) {
        return axios
        .delete(devServer.proxy + "/users/" + id);
    },
    
    UpdateUser(id, query) {
        return  axios.put(devServer.proxy + "/users/" + id, {
            user: {
                username: query
            }
        })
    },
    PostClock(id) {
        
        var d = new Date,
        dformat = [ (d.getFullYear()+1).padLeft(),
                    d.getMonth().padLeft(),
                    d.getDate()].join('-')+
                    ' ' +
                  [ d.getHours().padLeft(),
                    d.getMinutes().padLeft(),
                    d.getSeconds().padLeft()].join(':');
        axios.post(devServer.proxy + "/clocks/" + id, {
            clock: {
                state: true,
                time: dformat
            }
        })
    }
}