import axios from "axios";
import { devServer } from "../../vue.config";

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
        return axios.put(devServer.proxy + "/users/" + id, {
            user: {
                username: query
            }
        })
    },
    PostClock(id, time, status) {
        axios.post(devServer.proxy + "/clocks/" + id, {
            clock: {
                status: status,
                time: time
            }
        })
    },
    getClock(id) {
        return axios.get(devServer.proxy + "/clocks/" + id);
    }
}