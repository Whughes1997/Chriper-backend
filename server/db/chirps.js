import { query } from "express";
import { Query } from "./index";

const all = () => Query("select * from chirps");

const one = (id) => Query("select * from chirps where chirps.id = ?", [id])

const postChirp = (userid, content, location) => Query("insert into chirps(userid, content, location) values(?,?,?)", [userid, content, location])

const deleteChirp = (userid, content, location) => Query("delete into chirps(userid, content, location) values(?,?,?)", [userid, content, location])

const updateChirp = (userid, content, location) => Query("insert into chirps(userid, content, location) values(?,?,?)", [userid, content, location])

const readChirp = (userid, content, location) => Query("insert into chirps(userid, content, location) values(?,?,?)", [userid, content, location])

export default {
    all,
    one,
    postChirp,
    deleteChirp,
    updateChirp,
    readChirp

}