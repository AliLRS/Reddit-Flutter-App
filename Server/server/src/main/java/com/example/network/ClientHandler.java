package com.example.network;
import com.example.controller.Controller;
import java.net.*;
import java.io.*;
import java.util.Scanner;

public class ClientHandler extends Thread{
    Socket socket;
    DataInputStream dis;
    DataOutputStream dos;

    public ClientHandler(Socket socket) {
        this.socket = socket;
        try {
             dis = new DataInputStream(socket.getInputStream());
             dos = new DataOutputStream(socket.getOutputStream());
        } catch (IOException e) {
            System.out.println("Error in making data streams");
        }
    }

    @Override
    public void run() {
        System.out.println("RequestHandler started");
        String request = readRequest();
        System.out.println("Request: " + request);
        String response = new Controller().run(request);
        writeResponse(response);
    }

    String readRequest() {
        try {
            StringBuilder request = new StringBuilder();
            int c;
            while ((c = dis.read()) != 0) { // 0 is ASCII code of "\0"
                request.append((char) c);
            }
            Scanner scanner = new Scanner(request.toString());
            StringBuilder str = new StringBuilder();
            while (scanner.hasNextLine()) {
                str.append(scanner.nextLine());
            }
            return str.toString();
        } catch (IOException e){
            System.out.println("Error in readResponse");
        }
        return "";
    }
    void writeResponse(String response) {
        try {
            dos.writeBytes(response);    //older command: dos.writeBytes(response + "\0");
            dos.flush();
            dos.close();
            dis.close();
            socket.close();
        } catch (IOException e) {
            System.out.println("Error in writeResponse");
        }
    }
}
