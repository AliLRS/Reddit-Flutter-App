package com.example.database;

import com.example.*;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;


public class Database {

    private static final String usersPath = "server/src/main/java/com/example/data/users.txt";
    private static final  String communitiesPath = "server/src/main/java/com/example/data/communities.txt";
    private static final String commentsPath = "server/src/main/java/com/example/data/comments.txt";

    public static User[] getUsers(){
        try {
            if (!Files.exists(Path.of(usersPath))) {
                Files.createFile(Path.of(usersPath));
                return new User[0];
            }
            try(FileInputStream fis = new FileInputStream(usersPath);
                ObjectInputStream ois = new ObjectInputStream(fis)){
                Object obj = ois.readObject();
                if (obj instanceof User[])
                    return (User[]) obj;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e){
            e.printStackTrace();
        }
        return new User[0];
    }

    public static boolean writeUsers(User[] users){
        try {
            if (!Files.exists(Path.of(usersPath)))
                Files.createFile(Path.of(usersPath));
        } catch (IOException e){
            e.printStackTrace();
        }
        try(FileOutputStream fos = new FileOutputStream(usersPath);
            ObjectOutputStream oos = new ObjectOutputStream(fos)){
            oos.writeObject(users);
        } catch (IOException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static Community[] getCommunities() {
        try {
            if (!Files.exists(Path.of(communitiesPath))) {
                Files.createFile(Path.of(communitiesPath));
                return new Community[0];
            }
            try(FileInputStream fis = new FileInputStream(communitiesPath);
                ObjectInputStream ois = new ObjectInputStream(fis)){
                Object obj = ois.readObject();
                if (obj instanceof Community[])
                    return (Community[]) obj;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e){
            e.printStackTrace();
        }
        return new Community[0];
    }

    public static boolean writeCommunities(Community[] communities){
        try {
            if (!Files.exists(Path.of(communitiesPath)))
                Files.createFile(Path.of(communitiesPath));
        } catch (IOException e){
            e.printStackTrace();
        }
        try(FileOutputStream fos = new FileOutputStream(communitiesPath);
            ObjectOutputStream oos = new ObjectOutputStream(fos)){
            oos.writeObject(communities);
        } catch (IOException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static Comment[] getComment() {
        try {
            if (!Files.exists(Path.of(commentsPath))) {
                Files.createFile(Path.of(commentsPath));
                return new Comment[0];
            }
            try(FileInputStream fis = new FileInputStream(commentsPath);
                ObjectInputStream ois = new ObjectInputStream(fis)){
                Object obj = ois.readObject();
                if (obj instanceof Comment[])
                    return (Comment[]) obj;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } catch (IOException e){
            e.printStackTrace();
        }
        return new Comment[0];
    }

    public static boolean writeComments(Comment[] comments){
        try {
            if (!Files.exists(Path.of(commentsPath)))
                Files.createFile(Path.of(commentsPath));
        } catch (IOException e){
            e.printStackTrace();
        }
        try(FileOutputStream fos = new FileOutputStream(commentsPath);
            ObjectOutputStream oos = new ObjectOutputStream(fos)){
            oos.writeObject(comments);
        } catch (IOException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
