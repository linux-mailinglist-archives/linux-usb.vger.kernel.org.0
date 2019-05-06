Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E10D3146F7
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfEFJD0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:26 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41714 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJD0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:26 -0400
Received: by mail-ed1-f67.google.com with SMTP id m4so14500596edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LXpMnS0aQLz8OrYNckgLxb2gARv1O++8HJ9wt6ARiQ8=;
        b=LaeSeWqFOa3CfgFPpo2G1v0bF8KkflGtMPjwdK0s+qjPUyCsBUSMbTHaNC9qOUnZ6c
         bZ7hr6h9OMhgRH1CK7cYq4puqMJ4prL+6byeGUlmNeZOabqN3NWO6SaKPErN+dl9G1Cw
         nQRc73TfqFYWys7H1hLgy1/H4SPDkdJZ6s43CM9aReivKEqDrNhhU7YbU6Vee2fLMUCe
         3Zlx8ugL9GTg4bW+8sWUL44qhXqglHEG7c4XYRlqFaTMHX7jBju7SAkyYYixVhoe2jDK
         +tRwdzw2+enjZZa1lZviIAqvAsWmddVrxG/5rpCNBCu5XcZqsbmQn2geI64RQpXnFp7/
         oWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXpMnS0aQLz8OrYNckgLxb2gARv1O++8HJ9wt6ARiQ8=;
        b=IOeCQ3ovbpnWfHGB7k5fc/QruOS/hG09NmLdDbDLy0AhSF7GuKP2+2OIV382WwexGi
         1YnJghNGpABssYIvirP0l2pLIBdXKI6H+pmqLe6eqLFuCNzvDsPjdxdIj2Q2obg/1bjZ
         +3J6UUwek/wmU6Lm48n27Ohguaxy11xHCLR9Dw3lQa3DVzhsrbSqATUr3XpQ9K/RcUuv
         4W+7MO2Ya/OsVKw6VNVe60WiCioN7Fn87yXF3VDcnWMX/D5kRo7ss2lKrdB1LKiglMg9
         duAYL8g9RICSVuXLNIykXVzAjIQ+AQVcLUkOLU5gptARYi0ar7Arq3Ip541BTa43oQJa
         bCbg==
X-Gm-Message-State: APjAAAVAKGXF2nyZXhakadUTAGB2alcgG/o/8wZ1JMHCatVfmNCz1Yjy
        7i1eT0OQRSbRpUvKzofQG3bZGwTdqj0=
X-Google-Smtp-Source: APXvYqwEuY9WbZuZnjDcuZF4TtqjJujucdhCRZrJbm66eK0wbsTZ1WS8HniAw8wbdyjjK4TODZu1xw==
X-Received: by 2002:a50:ad98:: with SMTP id a24mr7838095edd.235.1557133404174;
        Mon, 06 May 2019 02:03:24 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id m7sm2889832edd.64.2019.05.06.02.03.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:23 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 05/34] lsusb.py: remove -w (warn if usb.ids not sorted) option
Date:   Mon,  6 May 2019 12:02:12 +0300
Message-Id: <20190506090241.169665-6-grawity@gmail.com>
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
 lsusb.py.in | 45 ++-------------------------------------------
 1 file changed, 2 insertions(+), 43 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 9ca734c..b0964c1 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -19,7 +19,6 @@ showint = False
 showhubint = False
 noemptyhub = False
 nohub = False
-warnsort = False
 showeps = False
 
 prefix = "/sys/bus/usb/devices/"
@@ -518,42 +517,6 @@ class UsbDevice:
 			str += child.__str__()
 		return str
 
-def display_diff(lst1, lst2, fmtstr, args):
-	"Compare lists (same length!) and display differences"
-	for idx in range(0, len(lst1)):
-		if lst1[idx] != lst2[idx]:
-			print("Warning: " + fmtstr % args(lst2[idx]))
-
-def fix_usbvend():
-	"Sort USB vendor list and (optionally) display diffs"
-	if warnsort:
-		oldusbvend = usbvendors[:]
-	usbvendors.sort()
-	if warnsort:
-		display_diff(usbvendors, oldusbvend, 
-				"Unsorted Vendor ID %04x",
-				lambda x: (x.vid,))
-
-def fix_usbprod():
-	"Sort USB products list"
-	if warnsort:
-		oldusbprod = usbproducts[:]
-	usbproducts.sort()
-	if warnsort:
-		display_diff(usbproducts, oldusbprod, 
-				"Unsorted Vendor:Product ID %04x:%04x",
-				lambda x: (x.vid, x.pid))
-
-def fix_usbclass():
-	"Sort USB class list"
-	if warnsort:
-		oldusbcls = usbclasses[:]
-	usbclasses.sort()
-	if warnsort:
-		display_diff(usbclasses, oldusbcls,
-				"Unsorted USB class %02x:%02x:%02x",
-				lambda x: (x.pclass, x.subclass, x.proto))
-
 
 def usage():
 	"Displays usage information"
@@ -568,7 +531,6 @@ def usage():
 	print("  -U            suppress all hubs")
 	print("  -c            use colors")
 	print("  -e            display endpoint info")
-	print("  -w            display warning if usb.ids is not sorted correctly")
 	print("  -f FILE       override filename for /usr/share/usb.ids")
 	print()
 	print("Use lsusb.py -ciu to get a nice overview of your USB devices.")
@@ -592,7 +554,7 @@ def read_usb():
 def main(argv):
 	"main entry point"
 	global showint, showhubint, noemptyhub, nohub
-	global warnsort, cols, usbids, showeps
+	global cols, usbids, showeps
 	try:
 		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcef:", ("help",))
 	except getopt.GetoptError as exc:
@@ -620,7 +582,7 @@ def main(argv):
 			cols = (norm, bold, red, green, amber, blue)
 			continue
 		if opt[0] == "-w":
-			warnsort = True
+			print("Warning: option -w is no longer supported", file=sys.stderr)
 			continue
 		if opt[0] == "-f":
 			#usbids = (opt[1], *usbids)
@@ -636,9 +598,6 @@ def main(argv):
 	if usbids[0]:
 		try:
 			parse_usb_ids()
-			fix_usbvend()
-			fix_usbprod()
-			fix_usbclass()
 		except:
 			print(" WARNING: Failure to read usb.ids", file=sys.stderr)
 			#print(sys.exc_info(), file=sys.stderr)
-- 
2.21.0

