const express = require("express");
const router = express.Router();
import db from "../db/"
// const chirpsStore = require("../chirpstore.js");
// no more chirpstore! install mysql from npm and configure the routes to use that instead of chirpstore.

// REST API
router.get("/:id?", async(req, res) => {
    const id = req.params.id;

    if (id) {

        res.json(await db.chirps.one(id));
    } else {
        res.json(await db.chirps.all())
    }
});

// Create
router.post("/", async(req, res) => {
    const body = req.body;

    (await db.chirps.postChirp(body.userid, body.content, body.location))
    // chirpsStore.CreateChirp(body);
    res.sendStatus(200);
});

// // Delete
router.delete("/:id", async(req, res) => {
    const id = req.params.id;
    (await db.chirps.deleteChirp(id))
    // chirpsStore.DeleteChirp(id);
    res.sendSemtatus(200);
});
// Update
// router.put async("/:id", async(req, res) => {
//     const id = req.params.id;
//     res.json(await db.chirps.update(body.userid, body.content, body.location))
//     const body = req.body;

//     // chirpsStore.UpdateChirp(id, body);
//     res.sendStatus(200);
// });

export default router;