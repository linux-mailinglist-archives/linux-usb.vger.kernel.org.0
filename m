Return-Path: <linux-usb+bounces-24022-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D300AB96E8
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 09:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76B70A007BD
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 07:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A84722D4F9;
	Fri, 16 May 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7bwIbex"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CF22ACD3
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381960; cv=none; b=qsTyrgtla4dxIjIkqC+T86NBIykCoPjOx4vyzrU64EWq/rXEAYHFS1peZ0EE4Yd5FfZg5FWdiFK6HdwBs3w/6OoDX4RDI3Vqop6Zuaxy+7vUuVC/dRSCO4zgcnubpAx5bVY/adzsXQ0JIfKI4kD3uX4C5HQncEU7Of5OzpicxBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381960; c=relaxed/simple;
	bh=nGJ5eI30ImOXFz042ZecD3Lr0jUTg50Sln/wBFDZTWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/E1dWbcWDfjg7IY2r3YyqY4NEw00zJPt0Z6BBtuuAuPZP51Vh1NnskXkk8roQ8fQm/YV+lRYkN2Kvct3D04oKd5obB6G1uJgV49wbYdzhKcroAAOR88vmp2Ejzm2TuIGt3YSCgmrQTTOPh8D34N9JHVDxjr8rhC1vEV1CUZxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7bwIbex; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-8616987c261so70829339f.3
        for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747381957; x=1747986757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuz/jfCudiv7qBbELPR1XDzrJi/iTfekvc+8ixZ02uI=;
        b=j7bwIbexsPcjnKLZc5tyQibhUU1A0TEoIrc9ul5m5uNPTZ1cwvLdWRaZNMoT47cdGx
         18eE9qBBk1GuevWVR8U8WIY+QH0m3mNyyHgrw9AsBaGuaBGhvblRdlWrAs+gJ6hg67W+
         RZeTNUYTOifIf3JdVJ7g4US12NSmPDSem/5i7YklxpgMMtd5xjtDH+PiqPEZt86NoJCP
         Omktsd/6pJK4swgPXRwoq7l7qrEyYm/Ycu0vufX3VfVQYrV0nNa2thlMg8IE9srjgfJQ
         d3IVqirei+ncmQ3DN/f1ABMG+Ge0bJ1xDh8EuAH193S2QIHOdT2osPK+qeWxaOw7w2VN
         e44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381957; x=1747986757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuz/jfCudiv7qBbELPR1XDzrJi/iTfekvc+8ixZ02uI=;
        b=dCwxtXMrczlukDmLxJ1l8lEeztT8z5GuNzSkAP72rAfPU4V1+UA4sF/AeBLu3roWMO
         u7A4u6igYta0BA1kcFX9aJjkCO0WEuMmndiysjn5ZcvxK73QAU7eJPiozraxU30cOTWr
         yyNCME4rgHK10vPwfD28QOo+c/2gV1v8dDtMDNxW50lktqj8TxowgvgvqT6wFr8pzsAD
         4dR5Et8wjYFsdbzGGd3IZHGZ6yAlCqMkoOOnVNBKA1n3D198dz5ORq5FcqYv9P1KJ5BF
         3IhT1er8NKfkEKNB8wIR0uG3mF7ihG24rp4m7bNztPWjGWYpN/y2ZTJkVERX3xoPJiEp
         BriQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmhYCVsedxmkwC1OcfXVYYSY/2rX+pOaT/zo7b0NzdXbRHYOgWBax2Ide68infAxg4Rxtk/ZXEV5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YycbyKiDagu/rJnJ61C+1o8aPw84vkWSrUO6SBc23p6RWclfX9p
	VQZgQ7kfGalHbVnSbtOYwB2XBgoUDbhZ6UAXS8ZC9XHQM+o0YNsZaBxo8VnDDKQU
X-Gm-Gg: ASbGncvpLynYVLzK6Hd8DdzM6C+BDuBmAoA9LrLdL9ongveESJ61OkfjKqk69GzCwLn
	QVetpCtWBVijnKs9486Y7X1f2SDsoAWQ6Ahg4GedkUFacvNHqAMWyLCJn5OqC1IVAWU9T39SZQm
	h+cjCd9j075poLOCCWsZ9cOOXtlUfzQo8i6fFU/sEIP4GeYOPhJZ5cjJZrd+chEVDCPkxcE7TNd
	jdi+9ANdo2Nok1VYcxZpF4tqB3zf3qzSnVHLhuiH5PkWx6FAhvZdtZJCoMcFtZ7++PbLtXjyE4C
	9yvHKvb27QsVnJvHkGMaxgjAPfSUzUf9NNIwToo1EjqWcg3O77nbvQ==
X-Google-Smtp-Source: AGHT+IGh8q5ETx1GV9edvd/uF8QN62vB8yPHafUswMNXdFpwlKNQOgpVilLFTbRh+zrd61+l+uhQlQ==
X-Received: by 2002:a05:6602:6a8e:b0:864:4a9b:f1f1 with SMTP id ca18e2360f4ac-86a23285f3cmr357452239f.14.1747381957229;
        Fri, 16 May 2025 00:52:37 -0700 (PDT)
Received: from dell.. ([185.223.112.22])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4aa6cfsm281438173.113.2025.05.16.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 00:52:36 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH 2/3] [2/3] usbipd: add long options to set TCP_KEEPIDLE/TCP_KEEPCNT/TCP_KEEPINTVL socket options
Date: Fri, 16 May 2025 10:52:03 +0300
Message-ID: <20250516075204.7950-2-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516075204.7950-1-vadimgrn@gmail.com>
References: <20250516075204.7950-1-vadimgrn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    - Add usbip daemon options "--tcp-keepidle SECS", "--tcp-keepcnt CNT",
      "--tcp-keepintvl SECS". A user can add these parameters if default
      values do not satisfy him/her.

    - If the option is passed, set corresponding socket option for accepted
      connection. For example, if "--tcp-keepidle 60" is passed, call
      setsockopt(sockfd, IPPROTO_TCP, TCP_KEEPIDLE, ...).

    - configure.ac handles presence of these socket options.
      If TCP_KEEPIDLE/TCP_KEEPCNT/TCP_KEEPINTVL are not available,
      corresponding program options will not be added.

Signed-off-by: Vadym Hrynchyshyn <vadimgrn@gmail.com>
---
 tools/usb/usbip/configure.ac        | 24 +++++++-
 tools/usb/usbip/src/usbip_network.c | 85 +++++++++++++++++++++++++++++
 tools/usb/usbip/src/usbip_network.h | 14 +++++
 tools/usb/usbip/src/usbipd.c        | 59 ++++++++++++++++++--
 4 files changed, 176 insertions(+), 6 deletions(-)

diff --git a/tools/usb/usbip/configure.ac b/tools/usb/usbip/configure.ac
index 8debf934f8b7..439377cfe23b 100644
--- a/tools/usb/usbip/configure.ac
+++ b/tools/usb/usbip/configure.ac
@@ -29,7 +29,7 @@ AC_PROG_MAKE_SET
 AC_HEADER_DIRENT
 AC_HEADER_STDC
 AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stdint.h stdlib.h dnl
-		  string.h sys/socket.h syslog.h unistd.h])
+		  string.h sys/socket.h syslog.h unistd.h netinet/tcp.h])
 
 # Checks for typedefs, structures, and compiler characteristics.
 AC_TYPE_INT32_T
@@ -107,5 +107,27 @@ AC_ARG_WITH([fortify],
 			    dnl [ACTION-IF-NOT-GIVEN]
 			    [AC_MSG_RESULT([default])])
 
+AC_MSG_CHECKING([whether tcp keepalive options are available])
+AC_COMPILE_IFELSE(
+	[AC_LANG_PROGRAM(
+		[ #include <sys/socket.h>
+		  #include <arpa/inet.h>
+		  #include <netinet/tcp.h> ],
+		[
+			int n = 0;
+			setsockopt(-1, IPPROTO_TCP, TCP_KEEPIDLE, &n, sizeof(n));
+			setsockopt(-1, IPPROTO_TCP, TCP_KEEPCNT, &n, sizeof(n));
+			setsockopt(-1, IPPROTO_TCP, TCP_KEEPINTVL, &n, sizeof(n));
+		]
+	)],
+	[
+		AC_MSG_RESULT([yes])
+		AC_DEFINE([HAVE_KEEPALIVE_OPTS], [1],
+			  [Define to 1 if TCP_KEEPIDLE/TCP_KEEPCNT/TCP_KEEPINTVL
+			   socket-level options are available.])
+	],
+	[ AC_MSG_RESULT([no]) ],
+)
+
 AC_CONFIG_FILES([Makefile libsrc/Makefile src/Makefile])
 AC_OUTPUT
diff --git a/tools/usb/usbip/src/usbip_network.c b/tools/usb/usbip/src/usbip_network.c
index ed4dc8c14269..15787044a7c9 100644
--- a/tools/usb/usbip/src/usbip_network.c
+++ b/tools/usb/usbip/src/usbip_network.c
@@ -50,6 +50,34 @@ void usbip_setup_port_number(char *arg)
 	info("using port %d (\"%s\")", usbip_port, usbip_port_string);
 }
 
+int usbip_to_int(const char *name, const char *val, int maxval)
+{
+	char *end;
+	long value = strtol(val, &end, 10);
+
+	if (end == val) {
+		err("%s: could not parse '%s' as a decimal integer", name, val);
+		return 0;
+	}
+
+	if (*end != '\0') {
+		err("%s: garbage at end of '%s'", name, val);
+		return 0;
+	}
+
+	if (value <= 0) {
+		err("%s: must be greater than zero, actual %s", name, val);
+		return 0;
+	}
+
+	if (value > maxval) {
+		err("%s: %s is too high, max=%d", name, val, maxval);
+		return 0;
+	}
+
+	return value;
+}
+
 uint32_t usbip_net_pack_uint32_t(int pack, uint32_t num)
 {
 	uint32_t i;
@@ -243,6 +271,63 @@ int usbip_net_set_keepalive(int sockfd)
 	return ret;
 }
 
+#if HAVE_KEEPALIVE_OPTS
+
+int usbip_net_set_keepidle(int sockfd, int seconds)
+{
+	int ret;
+
+	ret = setsockopt(sockfd, IPPROTO_TCP, TCP_KEEPIDLE, &seconds, sizeof(seconds));
+	if (ret < 0)
+		dbg("setsockopt: TCP_KEEPIDLE");
+
+	return ret;
+}
+
+int usbip_net_set_keepcnt(int sockfd, int cnt)
+{
+	int ret;
+
+	ret = setsockopt(sockfd, IPPROTO_TCP, TCP_KEEPCNT, &cnt, sizeof(cnt));
+	if (ret < 0)
+		dbg("setsockopt: TCP_KEEPCNT");
+
+	return ret;
+}
+
+int usbip_net_set_keepintvl(int sockfd, int seconds)
+{
+	int ret;
+
+	ret = setsockopt(sockfd, IPPROTO_TCP, TCP_KEEPINTVL, &seconds, sizeof(seconds));
+	if (ret < 0)
+		dbg("setsockopt: TCP_KEEPINTVL");
+
+	return ret;
+}
+
+#else
+
+int usbip_net_set_keepidle(int, int)
+{
+	dbg("setsockopt: TCP_KEEPIDLE is not supported");
+	return -1;
+}
+
+int usbip_net_set_keepcnt(int, int)
+{
+	dbg("setsockopt: TCP_KEEPCNT is not supported");
+	return -1;
+}
+
+int usbip_net_set_keepintvl(int, int)
+{
+	dbg("setsockopt: TCP_KEEPINTVL is not supported");
+	return -1;
+}
+
+#endif /* HAVE_KEEPALIVE_OPTS */
+
 int usbip_net_set_v6only(int sockfd)
 {
 	const int val = 1;
diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
index 83b4c5344f72..9611ddede0cf 100644
--- a/tools/usb/usbip/src/usbip_network.h
+++ b/tools/usb/usbip/src/usbip_network.h
@@ -18,6 +18,17 @@ extern int usbip_port;
 extern char *usbip_port_string;
 void usbip_setup_port_number(char *arg);
 
+/**
+ * usbip_to_int - convert string to positive integer
+ * @name:	name of the @val for logging
+ * @val:	string to convert to integer using base 10
+ * @maxval:	max allowed result value
+ *
+ * Return: positive integer on success, zero if conversion
+ *	   is not possible or value is out of range [1...maxval].
+ */
+int usbip_to_int(const char *name, const char *val, int maxval);
+
 /* ---------------------------------------------------------------------- */
 /* Common header for all the kinds of PDUs. */
 struct op_common {
@@ -172,6 +183,9 @@ int usbip_net_recv_op_common(int sockfd, uint16_t *code, int *status);
 int usbip_net_set_reuseaddr(int sockfd);
 int usbip_net_set_nodelay(int sockfd);
 int usbip_net_set_keepalive(int sockfd);
+int usbip_net_set_keepidle(int sockfd, int seconds);
+int usbip_net_set_keepcnt(int sockfd, int cnt);
+int usbip_net_set_keepintvl(int sockfd, int seconds);
 int usbip_net_set_v6only(int sockfd);
 int usbip_net_tcp_connect(char *hostname, char *port);
 
diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index d89633d8f799..8d83f870b89c 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -46,6 +46,10 @@
 
 #define DEFAULT_PID_FILE "/var/run/" PROGNAME ".pid"
 
+static int tcp_keepidle;
+static int tcp_keepcnt;
+static int tcp_keepintvl;
+
 static const char usbip_version_string[] = PACKAGE_STRING;
 
 static const char usbipd_help_string[] =
@@ -75,6 +79,19 @@ static const char usbipd_help_string[] =
 	"	-tPORT, --tcp-port PORT\n"
 	"		Listen on TCP/IP port PORT.\n"
 	"\n"
+#if HAVE_KEEPALIVE_OPTS
+	"	--tcp-keepidle SECONDS\n"
+	"		Number of SECONDS a connection needs to be idle\n"
+	"		before TCP begins sending out keep-alive probes.\n"
+	"\n"
+	"	--tcp-keepcnt PROBES\n"
+	"		Max. number of TCP keep-alive PROBES to send\n"
+	"		before killing the connection.\n"
+	"\n"
+	"	--tcp-keepintvl SECONDS\n"
+	"		Number of SECONDS between TCP keep-alive probes.\n"
+	"\n"
+#endif
 	"	-h, --help\n"
 	"		Print this help.\n"
 	"\n"
@@ -88,6 +105,24 @@ static void usbipd_help(void)
 	printf("%s\n", usbipd_help_string);
 }
 
+static void set_socket_options(int sockfd)
+{
+	/* should set TCP_NODELAY for usbip */
+	usbip_net_set_nodelay(sockfd);
+
+	if (usbip_net_set_keepalive(sockfd) < 0)
+		return;
+
+	if (tcp_keepidle)
+		usbip_net_set_keepidle(sockfd, tcp_keepidle);
+
+	if (tcp_keepcnt)
+		usbip_net_set_keepcnt(sockfd, tcp_keepcnt);
+
+	if (tcp_keepintvl)
+		usbip_net_set_keepintvl(sockfd, tcp_keepintvl);
+}
+
 static int recv_request_import(int sockfd)
 {
 	struct op_import_request req;
@@ -117,9 +152,7 @@ static int recv_request_import(int sockfd)
 	}
 
 	if (found) {
-		/* should set TCP_NODELAY for usbip */
-		usbip_net_set_nodelay(sockfd);
-		usbip_net_set_keepalive(sockfd);
+		set_socket_options(sockfd);
 
 		/* export device needs a TCP/IP socket descriptor */
 		status = usbip_export_device(edev, sockfd);
@@ -586,15 +619,21 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
 
 int main(int argc, char *argv[])
 {
+	enum { KEEPIDLE = 1, KEEPCNT, KEEPINTVL };
+
 	static const struct option longopts[] = {
 		{ "ipv4",     no_argument,       NULL, '4' },
 		{ "ipv6",     no_argument,       NULL, '6' },
 		{ "daemon",   no_argument,       NULL, 'D' },
-		{ "daemon",   no_argument,       NULL, 'D' },
 		{ "debug",    no_argument,       NULL, 'd' },
 		{ "device",   no_argument,       NULL, 'e' },
 		{ "pid",      optional_argument, NULL, 'P' },
 		{ "tcp-port", required_argument, NULL, 't' },
+#if HAVE_KEEPALIVE_OPTS
+		{ "tcp-keepidle",  required_argument, NULL, KEEPIDLE },
+		{ "tcp-keepcnt",   required_argument, NULL, KEEPCNT },
+		{ "tcp-keepintvl", required_argument, NULL, KEEPINTVL },
+#endif
 		{ "help",     no_argument,       NULL, 'h' },
 		{ "version",  no_argument,       NULL, 'v' },
 		{ NULL,	      0,                 NULL,  0  }
@@ -609,6 +648,7 @@ int main(int argc, char *argv[])
 	int daemonize = 0;
 	int ipv4 = 0, ipv6 = 0;
 	int opt, rc = -1;
+	int longidx = 0;
 
 	pid_file = NULL;
 
@@ -621,7 +661,7 @@ int main(int argc, char *argv[])
 	cmd = cmd_standalone_mode;
 	driver = &host_driver;
 	for (;;) {
-		opt = getopt_long(argc, argv, "46DdeP::t:hv", longopts, NULL);
+		opt = getopt_long(argc, argv, "46DdeP::t:hv", longopts, &longidx);
 
 		if (opt == -1)
 			break;
@@ -654,6 +694,15 @@ int main(int argc, char *argv[])
 		case 'e':
 			driver = &device_driver;
 			break;
+		case KEEPIDLE:
+			tcp_keepidle = usbip_to_int(longopts[longidx].name, optarg, UINT16_MAX);
+			break;
+		case KEEPCNT:
+			tcp_keepcnt = usbip_to_int(longopts[longidx].name, optarg, UINT16_MAX);
+			break;
+		case KEEPINTVL:
+			tcp_keepintvl = usbip_to_int(longopts[longidx].name, optarg, UINT16_MAX);
+			break;
 		case '?':
 			usbipd_help();
 		default:
-- 
2.43.0


