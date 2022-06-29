package com.example;
import com.example.network.Server;
import com.fasterxml.jackson.core.JsonProcessingException;

public class App
{
        public static void main(String[] args) {
            new Server().start();
        }
}
