package com.example.database;

import com.example.*;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;


public class Database {

    private static final String usersPath = "server/src/main/java/com/example/data/users.txt";

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
}
