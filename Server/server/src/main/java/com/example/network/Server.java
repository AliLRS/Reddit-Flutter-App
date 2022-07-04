package com.example.network;

import java.net.*;
import java.io.*;

public class Server {
    static boolean isRunning = true;

    public void start() {
        try {
            ServerSocket ss = new ServerSocket(8080);
            while (isRunning){
                Socket socket = ss.accept();
                System.out.println("Connection established");
                new ClientHandler(socket).start();
            }
        } catch (IOException e) {
            System.out.println("Server error");
        }
    }
}
