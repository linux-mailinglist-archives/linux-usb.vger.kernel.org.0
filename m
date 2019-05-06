Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BABC21471C
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfEFJEJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:09 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39265 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfEFJEI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:08 -0400
Received: by mail-ed1-f66.google.com with SMTP id e24so14496009edq.6
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4hhwm4lBg9HRuwT0FnIfL6HYTBXHE5SPpyNzz+vcVPs=;
        b=ZW0lt7djcnIZuqfsqx7YgJsxXsZhQP3TYNxNtLWcZDSM9XnB7pbAz4D91r0DvqQ5QT
         /FpnVKUUy3rMF5C5sWiJsjFYgxzeUIVUjvRPYhL1wYgPwAk0Pi7datzqzlXS/dM79Fcc
         gKhcOCnLsdlPvvEi8OaQBYTGbzKJAnB8tBrv1jtspZVTQxpjCS0HlrLtZ2m/As4+JfvL
         dnrZWPdWp0lerswVgJAKfMpX6n2f7L935mo95cORwBMimzeyGaFlYfqkdIJlX9sWep4z
         l/jHYpVpB97R7nh35THEx8jP1BKvi0+vb68+AftUEHM4I6ig7u5UDFFCkNmr/wdHK6ce
         FO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4hhwm4lBg9HRuwT0FnIfL6HYTBXHE5SPpyNzz+vcVPs=;
        b=dPJnsCX3meNO8YrDTNdqg9CG4UtbUvdTAEFIKHIp3xGEn2fqoMl9/q6qTtPku8hhzk
         MuGgsUTIguF81cLzbkcMrSDsQqS0v+EZjXUOdj/5bfuoc4kd/y2iZ2Hs8S10WJGV9wql
         7iaBkhyYyVsGONR+9krp7n6IgeVfB7oqzKglDsRUC9WjzTq1ECLjhQ87NK3CdsFqiuGh
         ld6B7GSxkgdDoLbDpCwVOt8jUESZ/GEcZ3JpWXoZU2S3mbkOHo3jsAX36Y7hcPCP/AOu
         EeQFJnqPdJDLwX0TXvgiVxPQ5eKKbrjSpL5WKSMw8EO8JPGlfhAIjiFbWphliiBZtCIM
         VChg==
X-Gm-Message-State: APjAAAV/waeJ1L0hnW2G01fzUXAKsY8Eru2JvHxJASqu/bGLRKpTa3//
        KJDDsjTR+YOcA23RXy3WLjF2thHzHKg=
X-Google-Smtp-Source: APXvYqz0mWuVw0U5glwdG0b2g1jAXQME2eS59FPyCXxmBzDhXhQFQyy7z2QecVGuh4XNAyI4c2vBPA==
X-Received: by 2002:a50:986b:: with SMTP id h40mr6575625edb.10.1557133446907;
        Mon, 06 May 2019 02:04:06 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id e47sm2916997ede.26.2019.05.06.02.04.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:06 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 30/34] lsusb.py: convert readattr() and readlink() to methods of the container
Date:   Mon,  6 May 2019 12:02:37 +0300
Message-Id: <20190506090241.169665-31-grawity@gmail.com>
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
 lsusb.py.in | 69 +++++++++++++++++++++++++----------------------------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 361615d..a9559ce 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -46,15 +46,6 @@ usbvendors = {}
 usbproducts = {}
 usbclasses = {}
 
-def readattr(path, name):
-	"Read attribute from sysfs and return as string"
-	f = open(prefix + path + "/" + name);
-	return f.readline().rstrip("\n");
-
-def readlink(path, name):
-	"Read symlink and return basename"
-	return os.path.basename(os.readlink(prefix + path + "/" + name));
-
 def ishexdigit(str):
 	"return True if all digits are valid hex digits"
 	for dg in str:
@@ -231,7 +222,13 @@ def find_dev(driver, usbname):
 
 
 class UsbObject:
-	pass
+	def read_attr(self, name):
+		path = prefix + self.path + "/" + name
+		return open(path).readline().rstrip("\n")
+
+	def read_link(self, name):
+		path = prefix + self.path + "/" + name
+		return os.path.basename(os.readlink(path))
 
 class UsbEndpoint(UsbObject):
 	"Container for USB endpoint info"
@@ -252,14 +249,14 @@ class UsbEndpoint(UsbObject):
 	def read(self, fname):
 		self.fname = fname
 		self.path = self.parent.path + "/" + fname
-		self.epaddr = int(readattr(self.path, "bEndpointAddress"), 16)
-		ival = int(readattr(self.path, "bInterval"), 16)
+		self.epaddr = int(self.read_attr("bEndpointAddress"), 16)
+		ival = int(self.read_attr("bInterval"), 16)
 		if ival:
-			self.ival = "(%s)" % readattr(self.path, "interval")
-		self.len = int(readattr(self.path, "bLength"), 16)
-		self.type = readattr(self.path, "type")
-		self.attr = int(readattr(self.path, "bmAttributes"), 16)
-		self.max = int(readattr(self.path, "wMaxPacketSize"), 16)
+			self.ival = "(%s)" % self.read_attr("interval")
+		self.len = int(self.read_attr("bLength"), 16)
+		self.type = self.read_attr("type")
+		self.attr = int(self.read_attr("bmAttributes"), 16)
+		self.max = int(self.read_attr("wMaxPacketSize"), 16)
 
 	def __repr__(self):
 		return "<UsbEndpoint[%r]>" % self.fname
@@ -292,12 +289,12 @@ class UsbInterface(UsbObject):
 	def read(self, fname):
 		self.fname = fname
 		self.path = self.parent.path + "/" + fname
-		self.iclass = int(readattr(self.path, "bInterfaceClass"),16)
-		self.isclass = int(readattr(self.path, "bInterfaceSubClass"),16)
-		self.iproto = int(readattr(self.path, "bInterfaceProtocol"),16)
-		self.noep = int(readattr(self.path, "bNumEndpoints"))
+		self.iclass = int(self.read_attr("bInterfaceClass"),16)
+		self.isclass = int(self.read_attr("bInterfaceSubClass"),16)
+		self.iproto = int(self.read_attr("bInterfaceProtocol"),16)
+		self.noep = int(self.read_attr("bNumEndpoints"))
 		try:
-			self.driver = readlink(self.path, "driver")
+			self.driver = self.read_link("driver")
 			self.devname = find_dev(self.driver, self.path)
 		except:
 			pass
@@ -353,14 +350,14 @@ class UsbDevice(UsbObject):
 	def read(self, fname):
 		self.fname = fname
 		self.path = fname
-		self.iclass = int(readattr(self.path, "bDeviceClass"), 16)
-		self.isclass = int(readattr(self.path, "bDeviceSubClass"), 16)
-		self.iproto = int(readattr(self.path, "bDeviceProtocol"), 16)
-		self.vid = int(readattr(self.path, "idVendor"), 16)
-		self.pid = int(readattr(self.path, "idProduct"), 16)
+		self.iclass = int(self.read_attr("bDeviceClass"), 16)
+		self.isclass = int(self.read_attr("bDeviceSubClass"), 16)
+		self.iproto = int(self.read_attr("bDeviceProtocol"), 16)
+		self.vid = int(self.read_attr("idVendor"), 16)
+		self.pid = int(self.read_attr("idProduct"), 16)
 		try:
-			self.name = readattr(self.path, "manufacturer") + " " \
-				  + readattr(self.path, "product")
+			self.name = self.read_attr("manufacturer") + " " \
+				  + self.read_attr("product")
 		except:
 			pass
 		if self.name:
@@ -376,22 +373,22 @@ class UsbDevice(UsbObject):
 			if not self.name:
 				self.name = oldnm
 		try:
-			ser = readattr(self.path, "serial")
+			ser = self.read_attr("serial")
 			# Some USB devs report "serial" as serial no. suppress
 			if (ser and ser != "serial"):
 				self.name += " " + ser
 		except:
 			pass
-		self.usbver = readattr(self.path, "version")
-		self.speed = readattr(self.path, "speed")
-		self.maxpower = readattr(self.path, "bMaxPower")
-		self.noports = int(readattr(self.path, "maxchild"))
+		self.usbver = self.read_attr("version")
+		self.speed = self.read_attr("speed")
+		self.maxpower = self.read_attr("bMaxPower")
+		self.noports = int(self.read_attr("maxchild"))
 		try:
-			self.nointerfaces = int(readattr(self.path, "bNumInterfaces"))
+			self.nointerfaces = int(self.read_attr("bNumInterfaces"))
 		except:
 			self.nointerfaces = 0
 		try:
-			self.driver = readlink(self.path, "driver")
+			self.driver = self.read_link("driver")
 			self.devname = find_dev(self.driver, self.path)
 		except:
 			pass
-- 
2.21.0

