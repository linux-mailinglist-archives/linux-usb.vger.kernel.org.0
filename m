Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F601471D
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfEFJEL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:11 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:34257 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfEFJEK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:10 -0400
Received: by mail-ed1-f53.google.com with SMTP id w35so12829569edd.1
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uxja2ki1JGEhbEbbyqD/3v2K77rNFNejJCKxXP5YgsA=;
        b=FBvknOVnUQMwnkpxRga0UyiFnIuqeu4NpU6BRi+j2x1UAJEO8ATuNovlL6lPqHBWtV
         K0Q67FqJ8c1xMBX/snJpjeVWpaIHe9tprYy5ngzjPnJDCyY1Jdd41VsYtlkuzrHE2uAX
         GQUKerOloMW7t6Elmxl5TLBlQ1koer1d7e+nW8X+5a7GizvlplJM2HkM+n0oDak5SyNS
         4IObJvLCR6VNnAtLA/oZayUnn5m4+1xGA/u6D5DT96HdaIlbrHqfVH+LztaFG2My2g89
         thErDAE8cwofzs2VEcsbdYqGJrD9GLq4ArPFyRYQ6a3StGLpT+fM5VVOSLqQLrdG8njR
         X8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uxja2ki1JGEhbEbbyqD/3v2K77rNFNejJCKxXP5YgsA=;
        b=Re+yo7O0hWDlbQgIxm2997+cTsGl+tvZ8EfJLoCdcWOLOVIntMRneXV50FUQv/SAxY
         ebdq4NsEQIQLzDq7ddmFV8/U7VxFZ1hh1OxXGohFsPnsB/Ix3ZHupajDAwu6zWO/lJEZ
         EwOZ5hq8YPYodSxn/1uxNcPrWvdBNKagGdwuP1EfoWBH9XkDZq4z3sn19ZXgk/IpWBh7
         FBBu8VHcwrUnl0gGQzPCIBh/3Vvmy9cG3tZ4L0J3vbFRnfrG62ctwvNrqVct+FL9HXJe
         Ltezm+oY0YspuUXQUpTNWVGxE35c9q6jow/3Hx7Y4gRD3Qw7SwSQFHmbY0G8xqzk5sFb
         kqZA==
X-Gm-Message-State: APjAAAUGQvPkw4GsYZkGS4SbFaUhyxp3Rr4UOMs3Lk/rxEtNkraM22BH
        rAkJ2FPidzfK52t4VSen0RCrrX/Vo/o=
X-Google-Smtp-Source: APXvYqzHGTNF3cvOQJgf/65OLaIXu+MRYCGHPNa7OGXQ8qKh2XrF7UNfkDXYnmyMe1OYjkrgL/+Q5Q==
X-Received: by 2002:a50:ad77:: with SMTP id z52mr7018925edc.174.1557133448560;
        Mon, 06 May 2019 02:04:08 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id n3sm1497212eja.70.2019.05.06.02.04.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:07 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 31/34] lsusb.py: use color by default
Date:   Mon,  6 May 2019 12:02:38 +0300
Message-Id: <20190506090241.169665-32-grawity@gmail.com>
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
 lsusb.py.in | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index a9559ce..7fa5493 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -456,6 +456,7 @@ def usage():
 	print("  -u, --hide-empty-hubs suppress empty hubs")
 	print("  -U, --hide-hubs       suppress all hubs")
 	print("  -c, --color           use colors")
+	print("  -C, --no-color        disable colors")
 	print("  -e, --endpoints       display endpoint info")
 	print("  -f FILE, --usbids-path FILE")
 	print("                        override filename for /usr/share/usb.ids")
@@ -478,6 +479,7 @@ def main(argv):
 	"main entry point"
 	global showint, showhubint, noemptyhub, nohub
 	global cols, usbids, showeps
+	usecols = None
 
 	long_options = [
 		"help",
@@ -486,12 +488,13 @@ def main(argv):
 		"hide-empty-hubs",
 		"hide-hubs",
 		"color",
+		"no-color",
 		"usbids-path=",
 		"endpoints",
 	]
 
 	try:
-		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcef:", long_options)
+		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcCef:", long_options)
 	except getopt.GetoptError as exc:
 		print("Error:", exc, file=sys.stderr)
 		sys.exit(2)
@@ -510,7 +513,9 @@ def main(argv):
 			noemptyhub = True
 			nohub = True
 		elif opt[0] in {"-c", "--color"}:
-			cols = (norm, bold, red, green, amber, blue)
+			usecols = True
+		elif opt[0] in {"-C", "--no-color"}:
+			usecols = False
 		elif opt[0] == "-w":
 			print("Warning: option -w is no longer supported", file=sys.stderr)
 		elif opt[0] in {"-f", "--usbids-path"}:
@@ -521,6 +526,12 @@ def main(argv):
 		print("Error: excess args %s ..." % args[0], file=sys.stderr)
 		sys.exit(2)
 
+	if usecols is None:
+		usecols = sys.stdout.isatty() and os.environ.get("TERM", "dumb") != "dumb"
+
+	if usecols:
+		cols = (norm, bold, red, green, amber, blue)
+
 	if usbids[0]:
 		try:
 			parse_usb_ids()
-- 
2.21.0

