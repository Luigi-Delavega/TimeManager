import axios from "axios";
import {devServer} from "../../vue.config";

export default {
    getAllUsers() {
        axios
            .get(devServer.proxy + "/users")
            .then((res) => {
                this.results = JSON.parse(JSON.stringify(res.data.data));
                console.log(JSON.parse(JSON.stringify(res.data.data)));
            });
    },
}