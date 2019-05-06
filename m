Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70F61471F
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfEFJEN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40320 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfEFJEM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id e56so14478717ede.7
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gxVMYZHqVFdGkYPGDVHKQfc02dS9WrFd4TukRLCYULA=;
        b=KqGMKcD40gKoK7ERAKxgyQUy7UIE3q8iMhjr7VQjXVikLx1kaPr/d8hmbcEzaFwZ93
         5kNpDS2gdRHYxHO0UiUl961utubaWJ2q0kdHsCCOCCy2XrChDMucha70Ym1UYFBX+Mz/
         3qMbzeW84rjh0bA2fXLeC2pEdYMIB/S7toNqlafo28TspoQm4+JIi3oHDhtLUVm3S+3e
         5gm78l/01iQiiCpknBhtvJG0DJx60SX+Gw8jSvIQnXTUrwd0KJqe7HcLJ0BTAJ0uklWp
         vO6pGlJGKl1TogJmGWBJLozx526z4tWeYn01XCKzXNOT8cH5Qg/iQzS+PAXMEUyN7s10
         mcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxVMYZHqVFdGkYPGDVHKQfc02dS9WrFd4TukRLCYULA=;
        b=NU+NrP4aDIRmyFRU9qjuRWBdT4kI1x4flFtVYSuMUNnzWGIc0d70RcLHr0yYaoO6sL
         iKeWf9SekSVdvwJjzB/fIEcOPaEDkUBSlGtrESvhVAXZ38klXqlzCC8eJGGqpzGUYMwB
         Jr9bQRmSAGrnIJ5GNkshEpeBB6syDlI5USwfEaKmlrrzKNuhHqYBoYvQCB/WP3WlstxG
         mLGYfUPw4qg3nRLD5B2kRr1jUUIfk/VarRSmKI4ArAFub34RgIO3Jc22e22pHpHmVn85
         CHM6bZeezI8D5CSDF2svZ4/5xugUc4AS5idNZr9kTtP+fDgnABT3kpNXBZXYaYaOZK1E
         6s5g==
X-Gm-Message-State: APjAAAVfwuQI/dGO4W3b4COLiaRjwNn9cMRbsgBCNPtzKhEg39i4Z8d7
        zzR6S37lXbP/Urye8TLBcSYzaYGM1y8=
X-Google-Smtp-Source: APXvYqz3UGrkoltwO8XkyiQXhft6xYDl4Khaf0xG4KgsfgnDbFbNW6Lo/pYkNAczQk2jIs7rW6KUog==
X-Received: by 2002:a17:906:c669:: with SMTP id ew9mr6051367ejb.2.1557133450062;
        Mon, 06 May 2019 02:04:10 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id d8sm1454888ejm.29.2019.05.06.02.04.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:09 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 32/34] lsusb.py: rework output for more consistent indent of both columns
Date:   Mon,  6 May 2019 12:02:39 +0300
Message-Id: <20190506090241.169665-33-grawity@gmail.com>
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
 lsusb.py.in | 54 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 7fa5493..648a734 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -46,6 +46,9 @@ usbvendors = {}
 usbproducts = {}
 usbclasses = {}
 
+def colorize(num, text):
+	return cols[num] + str(text) + cols[0]
+
 def ishexdigit(str):
 	"return True if all digits are valid hex digits"
 	for dg in str:
@@ -262,10 +265,13 @@ class UsbEndpoint(UsbObject):
 		return "<UsbEndpoint[%r]>" % self.fname
 
 	def __str__(self):
-		indent = self.level + len(self.parent.fname)
-		return "%-17s  %s(EP) %02x: %s %s attr %02x len %02x max %03x%s\n" % \
-			(" " * indent, cols[5], self.epaddr, self.type,
-			 self.ival, self.attr, self.len, self.max, cols[0])
+		indent = "  " * self.level
+		#name = "%s/ep_%02X" % (self.parent.fname, self.epaddr)
+		name = ""
+		body = "(EP) %02x: %s %s attr %02x len %02x max %03x" % \
+			(self.epaddr, self.type, self.ival, self.attr, self.len, self.max)
+		body = colorize(5, body)
+		return "%-17s %s\n" % (indent + name, indent + body)
 
 
 class UsbInterface(UsbObject):
@@ -309,13 +315,13 @@ class UsbInterface(UsbObject):
 		return "<UsbInterface[%r]>" % self.fname
 
 	def __str__(self):
+		indent = "  " * self.level
+		name = self.fname
 		plural = (" " if self.noep == 1 else "s")
-		strg = "%-17s (IF) %02x:%02x:%02x %iEP%s (%s) %s%s %s%s%s\n" % \
-			(" " * self.level+self.fname, self.iclass,
-			 self.isclass, self.iproto, self.noep,
-			 plural, self.protoname, 
-			 cols[3], self.driver,
-			 cols[4], self.devname, cols[0])
+		body = "(IF) %02x:%02x:%02x %iEP%s (%s) %s %s" % \
+			(self.iclass, self.isclass, self.iproto, self.noep, plural,
+			 self.protoname, colorize(3, self.driver), colorize(4, self.devname))
+		strg = "%-17s %s\n" % (indent + name, indent + body)
 		if showeps and self.eps:
 			for ep in self.eps:
 				strg += str(ep)
@@ -415,25 +421,23 @@ class UsbDevice(UsbObject):
 		return "<UsbDevice[%r]>" % self.fname
 
 	def __str__(self):
-		if self.iclass == HUB_ICLASS:
-			col = cols[2]
+		is_hub = (self.iclass == HUB_ICLASS)
+		if is_hub:
 			if noemptyhub and len(self.children) == 0:
 				return ""
-			if nohub:
-				strg = ""
-		else:
-			col = cols[1]
-		if not nohub or self.iclass != HUB_ICLASS:
+		strg = ""
+		if not (nohub and is_hub):
+			indent = "  " * self.level
+			name = self.fname
 			plural = (" " if self.nointerfaces == 1 else "s")
-			strg = "%-16s %s%04x:%04x%s %02x %s%6sMbit/s %5s %iIF%s (%s%s%s)" % \
-				(" " * self.level + self.fname, 
-				 cols[1], self.vid, self.pid, cols[0],
+			body = "%s %02x %s%5sMBit/s %s %iIF%s (%s) %s" % \
+				(colorize(1, "%04x:%04x" % (self.vid, self.pid)),
 				 self.iclass, self.usbver, self.speed, self.maxpower,
-				 self.nointerfaces, plural, col, self.name, cols[0])
-			if self.iclass == HUB_ICLASS and not showhubint:
-				strg += " %shub%s\n" % (cols[2], cols[0])
-			else:
-				strg += "\n"
+				 self.nointerfaces, plural,
+				 colorize(2 if is_hub else 1, self.name),
+				 colorize(2, "hub") if is_hub else "")
+			strg = "%-17s %s\n" % (indent + name, indent + body)
+			if not (is_hub and not showhubint):
 				if showeps:
 					ep = UsbEndpoint(self, "ep_00", self.level+1)
 					strg += str(ep)
-- 
2.21.0

