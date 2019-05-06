Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 200DC14702
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEFJDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:45 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:41123 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEFJDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:45 -0400
Received: by mail-ed1-f51.google.com with SMTP id m4so14501457edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2VVWSzAbtGbLro9aBOJESSRShmFIr4PlIcCfA3dpr9s=;
        b=gLoKk/8W1NHMdff9GdVE7upLzenXJyOGuxgK1ZCrNWsPuIZKJ3U7z5SMHXYZ7rROh4
         PKQvqThCMMXMyZA63ScSsnZpMk0E1CttOZc5qRDHyfF2WD+AGsyuCfAlcItPXsKbpKiZ
         LyJ7JtltXtwEQsmML9QFRhuKzdeWZcGTTRifR820Vwb76yiR2NWdKJJy52Yig8VBJmc/
         idbdu1zgNd153AeNVaIjUVC2qNVygbdEtG1iPjKKXWh6b2QyOmG4pB2OZEL6j6+uRLqm
         kSOBay88je9+oj6s9UoajnO3Zec4Z08zxvE9SDRrx8srD6UGf26xQxDDAIVa0HF8mscL
         lkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2VVWSzAbtGbLro9aBOJESSRShmFIr4PlIcCfA3dpr9s=;
        b=enje+9M9oUMjBRyv22jHk5r0tTB2BJ2UOtmv/Btb8kypG0xO9+VXZOLqovhTsI8/wD
         DVH+qQHaLGAWfu7FW08vhV0lnMzRQB3dyMeoYy82xobxh5vMJ62SmgpaaKr7JEhwhXQs
         78MIT1BbuqMRlPUfIWxW8NKq0Jn28u63j2tL+czdHnAWl4w/UxGnw/nJONCrdODb8mcH
         2TGQ92U4yWUy01QzrncQ68PTCT2JOZhZNqkyfRSXusY62rIV9KIwWKm/RnWfW7q6avsP
         DUPROLDuEzYEnJLWeShbp98jKg4Nl2lRNTkdd1Ez393/a+NngTCGpSLbjkFEucq61NGr
         4ekA==
X-Gm-Message-State: APjAAAUncMt1WwXecNIcDO613NB/jO7OfKDMPIT3Xwu067ZCxQ5AN8Mp
        vSR+KAzVGQnJwkO5afFjX97qAG8NXGM=
X-Google-Smtp-Source: APXvYqwWFNElfIfHs4i2QmbnSevsbzor2kL1mvQ2IbFL8v0GqQdb/xaeNgg9nl2MxEf3ehwodf52Fg==
X-Received: by 2002:a50:b557:: with SMTP id z23mr24944877edd.154.1557133422967;
        Mon, 06 May 2019 02:03:42 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id 1sm1489783eju.9.2019.05.06.02.03.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:42 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 16/34] lsusb.py: entirely remove Usb* classes
Date:   Mon,  6 May 2019 12:02:23 +0300
Message-Id: <20190506090241.169665-17-grawity@gmail.com>
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

Their main purpose in life was to be sortable, which we no longer do.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 53 ++++++-----------------------------------------------
 1 file changed, 6 insertions(+), 47 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index e1a30d7..73b4e67 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -43,47 +43,6 @@ def readlink(path, name):
 	"Read symlink and return basename"
 	return os.path.basename(os.readlink(prefix + path + "/" + name));
 
-class UsbClass:
-	"Container for USB Class/Subclass/Protocol"
-	def __init__(self, cl, sc, pr, strg = ""):
-		self.pclass = cl
-		self.subclass = sc
-		self.proto = pr
-		self.desc = strg
-	def __str__(self):
-		return self.desc
-	def __lt__(self, oth):
-		return (self.pclass, self.subclass, self.proto) < \
-				(oth.pclass, oth.subclass, oth.proto)
-	def __eq__(self, oth):
-		return (self.pclass, self.subclass, self.proto) == \
-				(oth.pclass, oth.subclass, oth.proto)
-
-class UsbVendor:
-	"Container for USB Vendors"
-	def __init__(self, vid, vname = ""):
-		self.vid = vid
-		self.vname = vname
-	def __str__(self):
-		return self.vname
-	def __lt__(self, oth):
-		return self.vid < oth.vid
-	def __eq__(self, oth):
-		return self.vid == oth.vid
-
-class UsbProduct:
-	"Container for USB VID:PID devices"
-	def __init__(self, vid, pid, pname = ""):
-		self.vid = vid
-		self.pid = pid
-		self.pname = pname
-	def __str__(self):
-		return self.pname
-	def __lt__(self, oth):
-		return (self.vid, self.pid) < (oth.vid, oth.pid)
-	def __eq__(self, oth):
-		return (self.vid, self.pid) == (oth.vid, oth.pid)
-
 usbvendors = {}
 usbproducts = {}
 usbclasses = {}
@@ -125,7 +84,7 @@ def parse_usb_ids():
 		if ishexdigit(ln[0:4]):
 			mode = modes.Vendor
 			vid = int(ln[:4], 16)
-			usbvendors[vid] = UsbVendor(vid, ln[6:])
+			usbvendors[vid] = ln[6:]
 			continue
 		if ln[0] == '\t' and ishexdigit(ln[1:3]):
 			# usb.ids has a device id of 01xy, sigh
@@ -135,7 +94,7 @@ def parse_usb_ids():
 				did = int(ln[1:5], 16)
 			# USB devices
 			if mode == modes.Vendor:
-				usbproducts[vid, did] = UsbProduct(vid, did, ln[7:])
+				usbproducts[vid, did] = ln[7:]
 				continue
 			elif mode == modes.Class:
 				nm = ln[5:]
@@ -143,20 +102,20 @@ def parse_usb_ids():
 					strg = cstrg + ":" + nm
 				else:
 					strg = cstrg + ":"
-				usbclasses[vid, did, -1] = UsbClass(vid, did, -1, strg)
+				usbclasses[vid, did, -1] = strg
 				continue
 		if ln[0] == 'C':
 			mode = modes.Class
 			cid = int(ln[2:4], 16)
 			cstrg = ln[6:]
-			usbclasses[cid, -1, -1] = UsbClass(cid, -1, -1, cstrg)
+			usbclasses[cid, -1, -1] = cstrg
 			continue
 		if mode == modes.Class and ln[0] == '\t' and ln[1] == '\t' and ishexdigit(ln[2:4]):
 			prid = int(ln[2:4], 16)
-			usbclasses[cid, did, prid] = UsbClass(cid, did, prid, strg + ":" + ln[6:])
+			usbclasses[cid, did, prid] = ln[6:]
 			continue
 		mode = modes.Misc
-	usbclasses[0xFF, 0xFF, 0xFF] = UsbClass(0xFF, 0xFF, 0xFF, "Vendor Specific")
+	usbclasses[0xFF, 0xFF, 0xFF] = "Vendor Specific"
 
 def find_usb_prod(vid, pid):
 	"Return device name from USB Vendor:Product list"
-- 
2.21.0

