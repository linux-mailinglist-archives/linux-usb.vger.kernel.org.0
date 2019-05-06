Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD912146F9
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfEFJDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:31 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43908 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:31 -0400
Received: by mail-ed1-f65.google.com with SMTP id w33so12159726edb.10
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4yz+s+2fTy3r5t4w3+3GvHAC5iEHvch9zSIFBySmEhA=;
        b=EticedEHXoHx6LX0snf9vwtRNuAIlDSKmDlDGHWP6DRnvI4xn4sRpdNSCcStjVKt6G
         DTJTWhd02SCkel2pu5zJ8BZ1gRMtW9Squ2+KWzHS8RmtlqfkZ7gnzr4MsVxTNjZJqpuz
         VbKMOpNUfrSG88Cfw8kAuIfrqA2/ZAENsNcvkoypMr+ktz5AwJFdi8KpjZ8X9q29p7g7
         y7/0RzjOZhqbYNcRdU+O2G/IloOoyxtvSKWC6bTcN8DUtB2aP8tmuOn/S3s0A2d5kVC0
         OOyAuQGi/0TpBz6SKTyB2z+SQmlKJnQ+KwFt2PWpQ6A+68/gSZzia7aGV5Fe7BBOPd8m
         lViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4yz+s+2fTy3r5t4w3+3GvHAC5iEHvch9zSIFBySmEhA=;
        b=SUIBkg2NGlZkobVMj+OM8YBdxWhG2OxrkDPJJ6RvsUjx2ndlYleCtvOa9mjWCI/GSV
         aPAJs+aboecAHNuKlRCbA5xAXZF+mNjG/t2EGHgIniCta73yJUgsTRCWSVZvWQwQIDsg
         hnY84dF5EFQVwB33doxmFXMf9uak/Wm9wJikLI9lWm5H8ishEcUpzZ4OkM6i8DWnH4s+
         yFVl4hpAzzYOYxQCz+c4HLW/V9O/8N49zrA5m6FmmqUC2IchYJYnkICKn9kXik2y8Po1
         HyJFD6FSqVnUL/ZZz3bl7JZeX+JpCb+Uju1zYsBGMmKUuqIrQhoEXVYNPBFPAhUK66Vm
         aIyw==
X-Gm-Message-State: APjAAAUb56RROWwxQi5CrFBl/nuGfrfbToLD8PPaUHpDo61hTBo+p2bw
        3u2kG4D3LID90/DjByEMcyCuXgz31oc=
X-Google-Smtp-Source: APXvYqwltc4eKpnmkR3z0NxUB6EcAOvV14csKwysnsYHfHHkN80XdqHRxDlTeGPv3Shc6RQaFga7Lg==
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr17886486eja.123.1557133408415;
        Mon, 06 May 2019 02:03:28 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id f1sm2824844edm.59.2019.05.06.02.03.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:27 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 07/34] lsusb.py: support long options
Date:   Mon,  6 May 2019 12:02:14 +0300
Message-Id: <20190506090241.169665-8-grawity@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190506090241.169665-1-grawity@gmail.com>
References: <20190506090241.169665-1-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 48 ++++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index e09b4cf..f9e273d 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -523,15 +523,15 @@ def usage():
 	print("Usage: lsusb.py [options]")
 	print()
 	print("Options:")
-	#     "|-------|-------|-------|-------|-------"
-	print("  -h            display this help")
-	print("  -i            display interface information")
-	print("  -I            display interface information, even for hubs")
-	print("  -u            suppress empty hubs")
-	print("  -U            suppress all hubs")
-	print("  -c            use colors")
-	print("  -e            display endpoint info")
-	print("  -f FILE       override filename for /usr/share/usb.ids")
+	print("  -h, --help            display this help")
+	print("  -i, --interfaces      display interface information")
+	print("  -I, --hub-interfaces  display interface information, even for hubs")
+	print("  -u, --hide-empty-hubs suppress empty hubs")
+	print("  -U, --hide-hubs       suppress all hubs")
+	print("  -c, --color           use colors")
+	print("  -e, --endpoints       display endpoint info")
+	print("  -f FILE, --usbids-path FILE")
+	print("                        override filename for /usr/share/usb.ids")
 	print()
 	print("Use lsusb.py -ciu to get a nice overview of your USB devices.")
 
@@ -555,40 +555,52 @@ def main(argv):
 	"main entry point"
 	global showint, showhubint, noemptyhub, nohub
 	global cols, usbids, showeps
+
+	long_options = [
+		"help",
+		"interfaces",
+		"hub-interfaces",
+		"hide-empty-hubs",
+		"hide-hubs",
+		"color",
+		"usbids-path=",
+		"endpoints",
+	]
+
 	try:
-		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcef:", ("help",))
+		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcef:", long_options)
 	except getopt.GetoptError as exc:
 		print("Error:", exc, file=sys.stderr)
 		sys.exit(2)
 	for opt in optlist:
-		if opt[0] == "-h" or opt[0] == "--help":
+		if opt[0] in {"-h", "--help"}:
 			usage()
 			sys.exit(0)
-		if opt[0] == "-i":
+		if opt[0] in {"-i", "--interfaces"}:
 			showint = True
 			continue
-		if opt[0] == "-I":
+		if opt[0] in {"-I", "--hub-interfaces"}:
 			showint = True
 			showhubint = True
 			continue
-		if opt[0] == "-u":
+		if opt[0] in {"-u", "--hide-empty-hubs"}:
 			noemptyhub = True
 			continue
-		if opt[0] == "-U":
+		if opt[0] in {"-U", "--hide-hubs"}:
 			noemptyhub = True
 			nohub = True
 			continue
-		if opt[0] == "-c":
+		if opt[0] in {"-c", "--color"}:
 			cols = (norm, bold, red, green, amber, blue)
 			continue
 		if opt[0] == "-w":
 			print("Warning: option -w is no longer supported", file=sys.stderr)
 			continue
-		if opt[0] == "-f":
+		if opt[0] in {"-f", "--usbids-path"}:
 			#usbids = (opt[1], *usbids)
 			usbids = (opt[1],)
 			continue
-		if opt[0] == "-e":
+		if opt[0] in {"-e", "--endpoints"}:
 			showeps = True
 			continue
 	if len(args) > 0:
-- 
2.21.0

