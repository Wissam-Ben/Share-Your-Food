import express from "express";
import {check, validationResult} from 'express-validator';
import { UserController } from "../controllers/user.controller";
import { isAuth, hasRole} from '../middlewares/auth.middleware';

const isAdmin = hasRole(1); 

const userRouter = express.Router();

userRouter.get("/", isAuth, async function(req, res) {
    const plateController = await UserController.getInstance();
    const plate = await plateController.getAll();
    if(plate !== null) {
        res.json(plate);
        res.status(200);
    }else {
        res.status(404).end();
    }
});
userRouter.get("/availables", isAuth, async function(req, res) {
    const plateController = await UserController.getInstance();
    const plate = await plateController.getAll(true);
    if(plate !== null) {
        res.json(plate);
        res.status(200);
    }else {
        res.status(404).end();
    }
});
userRouter.get("/:by", isAuth, async function(req,res) {
    const userController = await UserController.getInstance();
    const user = await userController.getBy(req.params.by);
    if(user !== null) {
        res.status(200).end();
    } else {
        res.status(404).send({error: 'field not found'}).end();
    }
})

userRouter.put("/:by", isAuth, async function (req, res) {
    const userController = await UserController.getInstance();
    const user = await userController.getBy(req.params.by);
    if (user !== null) {
        await user.update({
            firstname  : req.body.firstname || user.firstname,
            lastname   : req.body.lastname || user.lastname,
            username   : req.body.name || user.username, 
            password   : req.body.password || user.password,
            email      : req.body.email || user.email,
            photo      : req.body.photo || user.photo,
            number     : req.body.number || user.number,
            address    : req.body.address || user.address,
            zipcode    : req.body.zipcode || user.zipcode,
            city       : req.body.city || user.city,
            cantEat    : req.body.cantEat || user.cantEat,
            bio        : req.body.bio || user.bio,
            isAvailable: req.body.isAvailable
        })
        res.json(user).status(201).end();
    } else {
        res.status(404).send({error: "No such user"}).end();
    }
})

userRouter.delete("/:by", isAuth, isAdmin, async function(req,res) {
    const userController = await UserController.getInstance();
    const user = await userController.remove(req.params.by, req);
    if(user !== null) {
        res.status(200).send({success: 'Deletion completed'}).end();
    } else {
        res.status(404).send({error: 'Not such user'}).end();
    }
})

userRouter.delete("/unsuscribe/:by", isAuth, async function(req,res) {
    const userController = await UserController.getInstance();
    const user = await userController.remove(req.params.by, req, true);
    if(user !== null) {
        res.status(200).send({success: 'Deletion completed'}).end();
    } else {
        res.status(404).send({error: 'Not such user'}).end();
    }
})
export {
    userRouter
};