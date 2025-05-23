Return-Path: <linux-usb+bounces-24249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611CAC1F54
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 11:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4D8F4E085C
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 09:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3591C224AF8;
	Fri, 23 May 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpjxHosg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8207223DEF
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991291; cv=none; b=uyv/1HwNIHOn8ApvxmSNnBrvd+xwJhxvzPi86nTcWXh2CQS6mvPUfB7NRPcHNOayl/GYPl0S7znobzmtEw8PUipSUEYQ+/lJil/OXfDwyHH0k2dpNsXZpt2neqfsB4xj8KcvmkaluH27eyKoh3LnmurVoI7JrfuAfkXKQ2SBYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991291; c=relaxed/simple;
	bh=oyNSoxNJXyyNxRQFwa53rTj75lfBXTVP5qxFA7SHLEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCwvyCSFO8C/a25xyGKSfkV+NvrcClnkKmooLFX1fVl6f1pF8bfBHIIUqrpTEyEJhUYNbkeKn7JBZXLyoswEqc/ss8eR8Grc7Vyj6p6CmtNE6DJwWkq2YgYQEhIFqPdjvXWcQr1Onurqzx/XpJhDJRLR3r9MN0ZgETqit0vrmWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpjxHosg; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso80572751fa.0
        for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747991288; x=1748596088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qehleTyvvCk6y1RjVZJbpeiiJvUmWdCTFgubbMGo0Q=;
        b=OpjxHosgmoa9+utB3f/H/CWQuDFU1M1n1bMsq8iSlXyzW0F5LeSU0t77yor4+naY+4
         Addwa+YY76tUU+sd7EVW6PCljn6N6eb+zLIN871Ivt6ZOVLZGWCixK4XEd4zWKWIQAjy
         9WaAmU4BRyxAIuMe705F8sA6zD97Bx8CMVTC8KCtAZMgevaztM/vPH1vauUupnDIdlcM
         FGkGeDyzxwZy9SFc3ME7IiqWwTH09O3nZDIdik4ukZCI2oi80ayz3zbagWvkPueuoa1P
         LCSFP8vq2CoOJsXRxuu+UnNgt4ik3giETpFn8Tj/kTwTU5xfHtCUFPZvx+dT4LRJ4n7H
         qJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991288; x=1748596088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qehleTyvvCk6y1RjVZJbpeiiJvUmWdCTFgubbMGo0Q=;
        b=XUn3FAXGNXpkAruPHq7G15pjZoBFWxxARMpiCtY+QYJQyY9KdsVizqRFtVD1UYyfvY
         Xlmw6DHgg9a1a/sZ1LqeYXRlqBgxEojEcVkH1mLvWLvKz9pz+/Aald9i7w9OAL6WPwC3
         ETlV6wSzr3neWjJhQiT6DIY2bTXAt+Z321IU2aNElyPoRV3gG51slM7ddXENUcVyEjVu
         OJ2WMqhIUMJgzwhIeYaGoOB10YgDAAGbyxqs8fr2pYRe++gODoH2L+SlDQNj1aLcDR6O
         HrO8SyhVBJhXxdW0Rs8kDfetrXh7gf2go3rmxU7vhbv0rDorZsmsqDs0O//Dm7iV1qG4
         EqBA==
X-Forwarded-Encrypted: i=1; AJvYcCUn7Bl+xphx9SD8WAyefZisVghFg76iLE/R1X8PJZ5vv4Rx0Vt+Eu8iBJarHxy12JZ1AJ+MoiJSozc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwldMwjMuB5gSyn0H4cuifPgBqJvoXx6Tnp42mJ/RrX0yYdsHJK
	q5c0hODzmmaw6B41/5ja9Phm6ZsgNCQ1bwa5ZfgR1zQsQmC575keelL8bqxLwKoG
X-Gm-Gg: ASbGncuq7WdHho3ObA477OZbkzT9JSTIyx7CXyMK6nL40fvuwFanWGLU9LKy58hq5wa
	UtFJahWLqFb3avV3LcAA+NtRWdaM1bX6335xe6u1feCsWOlGko1JhpxM1iBQHkiKMOgMMcqlQZO
	9riSU1B1Ks4qN7vTaa1zOJPQeTIxf5oDntEu3DezA8UU81pIocnVnifRMjA8YamA3WlEplGm/x+
	SN2OrgPLKQMyzIl2Y636iFhXqiEyK1FjRB3Wz6XJybW7+Bvl9/Ek5t6KSx5sVJEt043wYHV+btr
	s685g7xveocDk5fD2Hs9733Yeekhtmon6d4cz+T8
X-Google-Smtp-Source: AGHT+IHj24T8AIGmzrQGxBwOi5jWjfxcIvf4WVpSkdyHuroKk+zq3OOq6gJOsMenq7ZupsmIpRwI9g==
X-Received: by 2002:a05:651c:30cb:b0:31a:466a:4746 with SMTP id 38308e7fff4ca-32950c56b18mr8332211fa.28.1747991287543;
        Fri, 23 May 2025 02:08:07 -0700 (PDT)
Received: from dell.. ([193.0.218.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f64a0sm35318391fa.114.2025.05.23.02.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:08:07 -0700 (PDT)
From: Vadym Hrynchyshyn <vadimgrn@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org
Cc: Vadym Hrynchyshyn <vadimgrn@gmail.com>
Subject: [PATCH v2 2/3] usbipd: add long options to set TCP_KEEPIDLE/TCP_KEEPCNT/TCP_KEEPINTVL socket options
Date: Fri, 23 May 2025 12:07:24 +0300
Message-ID: <20250523090802.17987-3-vadimgrn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523090802.17987-1-vadimgrn@gmail.com>
References: <20250523090802.17987-1-vadimgrn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usbip daemon options "--tcp-keepidle SECS", "--tcp-keepcnt CNT",
"--tcp-keepintvl SECS". A user can add these parameters if default
values do not satisfy him/her.

If the option is passed, set corresponding socket option for accepted
connection. For example, if "--tcp-keepidle 60" is passed, call
setsockopt(sockfd, IPPROTO_TCP, TCP_KEEPIDLE, ...).

configure.ac handles presence of these socket options.
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


