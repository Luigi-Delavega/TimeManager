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
    },

    getAllWorkingTimes(id) {
        return axios
            .get(devServer.proxy + "/workingtimes/" + id);
    },
    removeWorkingTime(id) {
        return axios
            .delete(devServer.proxy + "/workingtimes/" + id);
    },

    UpdateWorkingTime(id, start, end) {
        return axios.put(devServer.proxy + "/workingtimes/" + id, {
            workingtime: {
                start: start,
                end: end
            }
        })
    },
    PostWorkingTime(id, start, end) {
        axios.post(devServer.proxy + "/workingtimes/" + id, {
            workingtime: {
                end: end,
                start: start
            }
        })
    },
    getWorkingTime(id, start, end) {
        return axios.get(devServer.proxy + "/clocks/" + id, {
            workingtime: {
                end: end,
                start: start
            }
        });
    },
}