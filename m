Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF4214716
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbfEFJED (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:03 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33833 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfEFJED (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id w35so12829192edd.1
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rKB6206S4iffXZ65kSRcM5T1riqrlPgvwY+Qn2e8gBU=;
        b=RALwol/OsdDmK4RasZ1AXz3k4t8g4jvGogr3wSXm2MUVVir9XOZRgwbtG/sNmMItiz
         /eJb/irtr4KbUS4S5POsX+Twe3XJCny1Nqg+52HyGfexj4BHtMOXSTj4tkovpWWIrvem
         UqT9hFBjpOJ71Fz5ibaNgoXqhOTna58ygOm/g3hQ5ZOnFhZm/9x3824pvC6KvPZ965vY
         BfdElbSHKt5WzY2eHXaL8kW4a9+TU/2TunxZ/x2E4dAYr/mWQYh4hvk+XzgKx2pMVISA
         M7HJoypcfHLzZS7DwIOXc2jglwncW06OL/taYDUQrrKD2Cq2DvqUNGdpEMnx4uLOpfeS
         B9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKB6206S4iffXZ65kSRcM5T1riqrlPgvwY+Qn2e8gBU=;
        b=Y+Cii1uKACZRindlghIY3A4ZOxlPbIEIMoZK/JD8BUyhCe9g/YXCl1alQQ179USsBn
         H3iepIwxDUYlmHGhCIT2tIkRMGcQCfUDYAgYJJreUDWf6j3SRjJw8G0BRj3BVO71rzJd
         a5YyfUvWfhv99uKTu+jGZceJnGqpxxHldim9sp74y/TWuyf/LZQgSsKJm1RfVx7HRpt/
         gnxvU1eXwvoOuk/vtmXIprHkKU7PlpaxwclMTjRGHlNfhjwU3k5XtXfxnQxm3ApoHDvR
         GFTe7vFUD6HTHSoS5DmNCffvbH+4pkZJ8YvhgF54DZYS5QNcBMk/+AbhF8PlYlH16Dxf
         0gNA==
X-Gm-Message-State: APjAAAVciEhqriFKfyCqHSFEViAOjfJUJWSeMThqb0LXHQLHmnFHV2RB
        2RRPVYGKQQK3uM/1iDrbFsiJH35l0AM=
X-Google-Smtp-Source: APXvYqz4bak6562ebFgjIc4Uom/9PulWARRHmekAEY3VMIJELbLKrw141HfxHNynnbm77nJ105FDcg==
X-Received: by 2002:a50:ad19:: with SMTP id y25mr24364522edc.216.1557133441066;
        Mon, 06 May 2019 02:04:01 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id x44sm2872778edb.51.2019.05.06.02.04.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:00 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 27/34] lsusb.py: give all Usb* objects a .path attribute
Date:   Mon,  6 May 2019 12:02:34 +0300
Message-Id: <20190506090241.169665-28-grawity@gmail.com>
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
 lsusb.py.in | 77 +++++++++++++++++++++++++----------------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index eb00211..5720cd2 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -236,6 +236,7 @@ class UsbEndpoint:
 		self.parent = parent
 		self.level = level
 		self.fname = fname
+		self.path = ""
 		self.epaddr = 0
 		self.len = 0
 		self.ival = ""
@@ -246,18 +247,16 @@ class UsbEndpoint:
 			self.read(self.fname)
 
 	def read(self, fname):
-		fullpath = ""
-		if self.parent:
-			fullpath = self.parent.fullpath + "/"
-		fullpath += fname
-		self.epaddr = int(readattr(fullpath, "bEndpointAddress"), 16)
-		ival = int(readattr(fullpath, "bInterval"), 16)
+		self.fname = fname
+		self.path = self.parent.path + "/" + fname
+		self.epaddr = int(readattr(self.path, "bEndpointAddress"), 16)
+		ival = int(readattr(self.path, "bInterval"), 16)
 		if ival:
-			self.ival = "(%s)" % readattr(fullpath, "interval")
-		self.len = int(readattr(fullpath, "bLength"), 16)
-		self.type = readattr(fullpath, "type")
-		self.attr = int(readattr(fullpath, "bmAttributes"), 16)
-		self.max = int(readattr(fullpath, "wMaxPacketSize"), 16)
+			self.ival = "(%s)" % readattr(self.path, "interval")
+		self.len = int(readattr(self.path, "bLength"), 16)
+		self.type = readattr(self.path, "type")
+		self.attr = int(readattr(self.path, "bmAttributes"), 16)
+		self.max = int(readattr(self.path, "wMaxPacketSize"), 16)
 
 	def __str__(self):
 		indent = self.level + len(self.parent.fname)
@@ -271,8 +270,8 @@ class UsbInterface:
 	def __init__(self, parent, fname, level=1):
 		self.parent = parent
 		self.level = level
-		self.fullpath = ""
 		self.fname = fname
+		self.path = ""
 		self.iclass = 0
 		self.isclass = 0
 		self.iproto = 0
@@ -285,24 +284,20 @@ class UsbInterface:
 			self.read(self.fname)
 
 	def read(self, fname):
-		fullpath = ""
-		if self.parent:
-			fullpath += self.parent.fname + "/"
-		fullpath += fname
-		self.fullpath = fullpath
 		self.fname = fname
-		self.iclass = int(readattr(fullpath, "bInterfaceClass"),16)
-		self.isclass = int(readattr(fullpath, "bInterfaceSubClass"),16)
-		self.iproto = int(readattr(fullpath, "bInterfaceProtocol"),16)
-		self.noep = int(readattr(fullpath, "bNumEndpoints"))
+		self.path = self.parent.path + "/" + fname
+		self.iclass = int(readattr(self.path, "bInterfaceClass"),16)
+		self.isclass = int(readattr(self.path, "bInterfaceSubClass"),16)
+		self.iproto = int(readattr(self.path, "bInterfaceProtocol"),16)
+		self.noep = int(readattr(self.path, "bNumEndpoints"))
 		try:
-			self.driver = readlink(fname, "driver")
-			self.devname = find_dev(self.driver, fname)
+			self.driver = readlink(self.path, "driver")
+			self.devname = find_dev(self.driver, self.path)
 		except:
 			pass
 		self.protoname = find_usb_class(self.iclass, self.isclass, self.iproto)
 		if showeps:
-			for dirent in os.listdir(prefix + fullpath):
+			for dirent in os.listdir(prefix + self.path):
 				if dirent.startswith("ep_"):
 					ep = UsbEndpoint(self, dirent, self.level+1)
 					self.eps.append(ep)
@@ -326,7 +321,7 @@ class UsbDevice:
 		self.parent = parent
 		self.level = level
 		self.fname = fname
-		self.fullpath = ""
+		self.path = ""
 		self.iclass = 0
 		self.isclass = 0
 		self.iproto = 0
@@ -348,15 +343,15 @@ class UsbDevice:
 
 	def read(self, fname):
 		self.fname = fname
-		self.fullpath = fname
-		self.iclass = int(readattr(fname, "bDeviceClass"), 16)
-		self.isclass = int(readattr(fname, "bDeviceSubClass"), 16)
-		self.iproto = int(readattr(fname, "bDeviceProtocol"), 16)
-		self.vid = int(readattr(fname, "idVendor"), 16)
-		self.pid = int(readattr(fname, "idProduct"), 16)
+		self.path = fname
+		self.iclass = int(readattr(self.path, "bDeviceClass"), 16)
+		self.isclass = int(readattr(self.path, "bDeviceSubClass"), 16)
+		self.iproto = int(readattr(self.path, "bDeviceProtocol"), 16)
+		self.vid = int(readattr(self.path, "idVendor"), 16)
+		self.pid = int(readattr(self.path, "idProduct"), 16)
 		try:
-			self.name = readattr(fname, "manufacturer") + " " \
-				  + readattr(fname, "product")
+			self.name = readattr(self.path, "manufacturer") + " " \
+				  + readattr(self.path, "product")
 		except:
 			pass
 		if self.name:
@@ -372,23 +367,23 @@ class UsbDevice:
 			if not self.name:
 				self.name = oldnm
 		try:
-			ser = readattr(fname, "serial")
+			ser = readattr(self.path, "serial")
 			# Some USB devs report "serial" as serial no. suppress
 			if (ser and ser != "serial"):
 				self.name += " " + ser
 		except:
 			pass
-		self.usbver = readattr(fname, "version")
-		self.speed = readattr(fname, "speed")
-		self.maxpower = readattr(fname, "bMaxPower")
-		self.noports = int(readattr(fname, "maxchild"))
+		self.usbver = readattr(self.path, "version")
+		self.speed = readattr(self.path, "speed")
+		self.maxpower = readattr(self.path, "bMaxPower")
+		self.noports = int(readattr(self.path, "maxchild"))
 		try:
-			self.nointerfaces = int(readattr(fname, "bNumInterfaces"))
+			self.nointerfaces = int(readattr(self.path, "bNumInterfaces"))
 		except:
 			self.nointerfaces = 0
 		try:
-			self.driver = readlink(fname, "driver")
-			self.devname = find_dev(self.driver, fname)
+			self.driver = readlink(self.path, "driver")
+			self.devname = find_dev(self.driver, self.path)
 		except:
 			pass
 
-- 
2.21.0

