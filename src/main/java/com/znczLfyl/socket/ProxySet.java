package com.znczLfyl.socket;

import java.util.Vector;

public class ProxySet {
	
	private static Vector<SocketProxy> proxys = new Vector<SocketProxy>();
	
	public static void addSocketProxy(SocketProxy proxy){
		proxys.add(proxy);
		System.out.println("proxysSize="+proxys.size());
	}
	
	public static void removeSocketProxy(SocketProxy proxy){
		proxys.remove(proxy);
		sayToAllProxy(proxy.getYjFlag()+" �뿪��", proxy);
		
	}
	
	public static void sayToAllProxy(String mes,SocketProxy sender){
		for(int i=0;i<proxys.size();i++){
			if(proxys.get(i)!=sender){
				proxys.get(i).sayToMe(sender.getYjFlag()+":"+mes);
			}
			
		}
	}
	
	public static void sayToClient(String mes,int yjFlag){
		System.out.println("proxys.size()==="+proxys.size());
		for(int i=0;i<proxys.size();i++){
			System.out.println("getYjFlag==="+(proxys.get(i).getYjFlag()==yjFlag));
			if(proxys.get(i).getYjFlag()==yjFlag){
				System.out.println("sayToMemes==="+mes);
				proxys.get(i).sayToMe(mes);
			}
			
		}
	}
}