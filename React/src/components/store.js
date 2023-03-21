import { configureStore } from "@reduxjs/toolkit";
import loggedRed from "./slice";


export default configureStore({
    reducer :{
        logged: loggedRed
    }
})