package com.yj.smarthome.http;

import java.util.Vector;

/**
 * http response
 */
public class HttpResponse {

	public String urlString;

	public int defaultPort;

	public String file;

	public String host;

	public String path;

	public int port;

	public String protocol;

	public String query;

	public String ref;

	public String userInfo;

	public String contentEncoding;

	public String content;

	public String contentType;

	public int code;

	public String message;

	public String method;

	public int connectTimeout;

	public int readTimeout;

	public Vector<String> contentCollection;

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("urlString:" + urlString + "\n");
		sb.append("defaultPort:" + defaultPort + "\n");
		sb.append("file:" + file + "\n");
		sb.append("protocol:" + protocol + "\n");
		sb.append("query:" + query + "\n");
		sb.append("ref:" + ref + "\n");
		sb.append("userInfo:" + userInfo + "\n");
		sb.append("contentEncoding:" + contentEncoding + "\n");
		sb.append("contentType:" + contentType + "\n");
		sb.append("code:" + code + "\n");
		sb.append("message:" + message + "\n");
		sb.append("method:" + method + "\n");
		sb.append("connectTimeout:" + connectTimeout + "\n");
		sb.append("readTimeout:" + readTimeout + "\n");
		sb.append("contentCollection:" + contentCollection + "\n");
		return sb.toString();
	}

	public String getContent() {
		return content;
	}

	public String getContentType() {
		return contentType;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public Vector<String> getContentCollection() {
		return contentCollection;
	}

	public String getContentEncoding() {
		return contentEncoding;
	}

	public String getMethod() {
		return method;
	}

	public int getConnectTimeout() {
		return connectTimeout;
	}

	public int getReadTimeout() {
		return readTimeout;
	}

	public String getUrlString() {
		return urlString;
	}

	public int getDefaultPort() {
		return defaultPort;
	}

	public String getFile() {
		return file;
	}

	public String getHost() {
		return host;
	}

	public String getPath() {
		return path;
	}

	public int getPort() {
		return port;
	}

	public String getProtocol() {
		return protocol;
	}

	public String getQuery() {
		return query;
	}

	public String getRef() {
		return ref;
	}

	public String getUserInfo() {
		return userInfo;
	}

}
