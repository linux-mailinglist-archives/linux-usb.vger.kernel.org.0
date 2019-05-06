Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F12F4146FD
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfEFJDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:37 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:35992 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:37 -0400
Received: by mail-ed1-f48.google.com with SMTP id a8so14504971edx.3
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JDZQR05OK1riU31qrLbvijPaK7vQcBevecbMeDTYZg0=;
        b=ClWh2/XLd8BvZuX6tCfQpmy91pghxWgBGyOUW1AM4mVwcDurhBZRqaIQmMDob3k4iP
         53iw74Ao806MhaTIBiHqPNoaJ15APsjXqXZ6uSycbh9iU/qUSKhlirXZRFQzt7LoQrqi
         ldX6UGlsbnQ3TU69RxyDVB7oEasshOX98A/nMiwpjkP+7d1Q7fHDa38EPCLlu+74DMPC
         LmH46nC6vBg4maN6gLbtT9RA7LfktBO8n2DFdSrFwQ7P69pvNaGoAwV9OoDsK04DmCJS
         61V/gPqU2dHYPSYkJNxD+8svwIwe2aWsvd/+LhH1GMFpM2au50aUvYu7jGWWk9yj33fo
         +3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JDZQR05OK1riU31qrLbvijPaK7vQcBevecbMeDTYZg0=;
        b=KrCIBGoLMY5TArv6aG0odcdgdZRYeO+tJ8pOQtDLWbIN9uZIPZOajx1nWkhoVOEAMk
         KaHz7NRG29jbSvGctNhQQ73l/nVu/lTvqYHYFcQxIUMuA8CRxVlORHPsUQ8E9RVRLZqq
         gorK8GryxsEWOO+EXXACDxAwWGpaQdxI82c+RxnfvB1zqvv+ljplLj3FtaGpb8NgCqeZ
         uKJektG2hrFVpiBqyBZsdloRosRegKOMA/7j4J3LSWAnMCDgQ/SMDdGsIETr6id+CMEh
         WJPz6Md8V2vYC+Q7NINtz1PN1Y1A7kaZUWCz48HHO1236YnziNUj5xVyKCENg4l9wtSx
         ZaYg==
X-Gm-Message-State: APjAAAUfef4GBYC/LZwOxwVDsuzIsj5wuL3K64iPal71ruOkAW6mvOKN
        p1CFQMotUGJZshacyptFLga0RW02HI8=
X-Google-Smtp-Source: APXvYqwfLLXMfrYOXdS4caxH1+rQiQ9b84yH74PCaPU0gLYBP3NgEThFvyfATctelnY5TBi2SZbE3A==
X-Received: by 2002:a50:97ed:: with SMTP id f42mr24692382edb.141.1557133415110;
        Mon, 06 May 2019 02:03:35 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id b4sm2897592eda.9.2019.05.06.02.03.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:34 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 11/34] lsusb.py: replace usb.ids binary search with dict lookup
Date:   Mon,  6 May 2019 12:02:18 +0300
Message-Id: <20190506090241.169665-12-grawity@gmail.com>
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

There is no significant gain in reinventing the wheel here.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 53 +++++++++++++++++++++++------------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 5338d82..26ab745 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -84,9 +84,9 @@ class UsbProduct:
 	def __eq__(self, oth):
 		return (self.vid, self.pid) == (oth.vid, oth.pid)
 
-usbvendors = []
-usbproducts = []
-usbclasses = []
+usbvendors = {}
+usbproducts = {}
+usbclasses = {}
 
 def ishexdigit(str):
 	"return True if all digits are valid hex digits"
@@ -125,7 +125,7 @@ def parse_usb_ids():
 		if ishexdigit(ln[0:4]):
 			mode = modes.Vendor
 			vid = int(ln[:4], 16)
-			usbvendors.append(UsbVendor(vid, ln[6:]))
+			usbvendors[vid] = UsbVendor(vid, ln[6:])
 			continue
 		if ln[0] == '\t' and ishexdigit(ln[1:3]):
 			# usb.ids has a device id of 01xy, sigh
@@ -135,7 +135,7 @@ def parse_usb_ids():
 				did = int(ln[1:5], 16)
 			# USB devices
 			if mode == modes.Vendor:
-				usbproducts.append(UsbProduct(vid, did, ln[7:]))
+				usbproducts[vid, did] = UsbProduct(vid, did, ln[7:])
 				continue
 			elif mode == modes.Class:
 				nm = ln[5:]
@@ -143,17 +143,17 @@ def parse_usb_ids():
 					strg = cstrg + ":" + nm
 				else:
 					strg = cstrg + ":"
-				usbclasses.append(UsbClass(vid, did, -1, strg))
+				usbclasses[vid, did, -1] = UsbClass(vid, did, -1, strg)
 				continue
 		if ln[0] == 'C':
 			mode = modes.Class
 			cid = int(ln[2:4], 16)
 			cstrg = ln[6:]
-			usbclasses.append(UsbClass(cid, -1, -1, cstrg))
+			usbclasses[cid, -1, -1] = UsbClass(cid, -1, -1, cstrg)
 			continue
 		if mode == modes.Class and ln[0] == '\t' and ln[1] == '\t' and ishexdigit(ln[2:4]):
 			prid = int(ln[2:4], 16)
-			usbclasses.append(UsbClass(cid, did, prid, strg + ":" + ln[6:]))
+			usbclasses[cid, did, prid] = UsbClass(cid, did, prid, strg + ":" + ln[6:])
 			continue
 		mode = modes.Misc
 
@@ -179,18 +179,14 @@ def bin_search(first, last, item, list):
 def find_usb_prod(vid, pid):
 	"Return device name from USB Vendor:Product list"
 	strg = ""
-	dev = UsbVendor(vid, "")
-	lnvend = len(usbvendors)
-	ix = bin_search(0, lnvend, dev, usbvendors)
-	if ix != -1:
-		strg = usbvendors[ix].__repr__()
+	vendor = usbvendors.get(vid)
+	if vendor:
+		strg = vendor.__repr__()
 	else:
 		return ""
-	dev = UsbProduct(vid, pid, "")
-	lnprod = len(usbproducts)
-	ix = bin_search(0, lnprod, dev, usbproducts)
-	if ix != -1:
-		return strg + " " + usbproducts[ix].__repr__()
+	product = usbproducts.get((vid, pid))
+	if product:
+		return strg + " " + product.__repr__()
 	return strg
 
 def find_usb_class(cid, sid, pid):
@@ -198,18 +194,15 @@ def find_usb_class(cid, sid, pid):
 	if cid == 0xff and sid == 0xff and pid == 0xff:
 		return "Vendor Specific"
 	lnlst = len(usbclasses)
-	dev = UsbClass(cid, sid, pid, "")
-	ix = bin_search(0, lnlst, dev, usbclasses)
-	if ix != -1:
-		return usbclasses[ix].__repr__()
-	dev = UsbClass(cid, sid, -1, "")
-	ix = bin_search(0, lnlst, dev, usbclasses)
-	if ix != -1:
-		return usbclasses[ix].__repr__()
-	dev = UsbClass(cid, -1, -1, "")
-	ix = bin_search(0, lnlst, dev, usbclasses)
-	if ix != -1:
-		return usbclasses[ix].__repr__()
+	cls = usbclasses.get((cid, sid, pid))
+	if cls:
+		return cls.__repr__()
+	cls = usbclasses.get((cid, sid, -1))
+	if cls:
+		return cls.__repr__()
+	cls = usbclasses.get((cid, -1, -1))
+	if cls:
+		return cls.__repr__()
 	return ""
 
 
-- 
2.21.0

