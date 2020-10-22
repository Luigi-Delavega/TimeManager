import axios from "axios";
import {devServer} from "../../vue.config";

export default {
    getAllUsers() {
        return axios
            .get(devServer.proxy + "/users");
    },
}