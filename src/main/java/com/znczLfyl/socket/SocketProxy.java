package com.znczLfyl.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;

public class SocketProxy implements Runnable{
	
	public static final int YI_JIAN=1;
	public static final int ER_JIAN=2;
	private Socket socket;
	private BufferedReader in;
	private int jyFlag;

	public int getJyFlag() {
		return jyFlag;
	}

	public void setJyFlag(int jyFlag) {
		this.jyFlag = jyFlag;
	}

	private OutputStreamWriter out;
	
	public SocketProxy(Socket socket) throws IOException{
		this.socket = socket;
		try {
			in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			out = new OutputStreamWriter(socket.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
			
		}
		Thread th = new Thread(this);
		th.start();
		
	}
	
	public void sayToMe(String mes){
		try {
			out.write(mes+"\n");
			out.flush();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		while(true){
			try {
				String line = in.readLine();
				System.out.println("line==="+line);
				if(line==null) break;
				if(jyFlag==0) {
					jyFlag = Integer.valueOf(line);
					//���Ը��߱���
					//ProxySet.sayToAllProxy("����������", this);
				}
				//else
					//ProxySet.sayToAllProxy(line,this);
			} catch (IOException e) {
				
				//e.printStackTrace();
				this.err();
				break;
			}
		}
		
	}
	
	private void err(){
		ProxySet.removeSocketProxy(this);
	}
	
}