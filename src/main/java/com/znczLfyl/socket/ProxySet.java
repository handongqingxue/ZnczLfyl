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
		sayToAllProxy(proxy.getJyFlag()+" Àë¿ªÁË", proxy);
		
	}
	
	public static void sayToAllProxy(String mes,SocketProxy sender){
		for(int i=0;i<proxys.size();i++){
			if(proxys.get(i)!=sender){
				proxys.get(i).sayToMe(sender.getJyFlag()+":"+mes);
			}
			
		}
	}
	
	public static void sayToClient(String mes,int jyFlag){
		System.out.println("proxys.size()==="+proxys.size());
		for(int i=0;i<proxys.size();i++){
			System.out.println("getYjFlag==="+proxys.get(i).getJyFlag());
			System.out.println("jyFlag==="+jyFlag);
			if(proxys.get(i).getJyFlag()==jyFlag){
				System.out.println("sayToMemes==="+mes);
				proxys.get(i).sayToMe(mes);
			}
			
		}
	}
}