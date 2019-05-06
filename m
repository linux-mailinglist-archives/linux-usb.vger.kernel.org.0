Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB9B1470B
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfEFJD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:57 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:37689 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfEFJD4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:56 -0400
Received: by mail-ed1-f53.google.com with SMTP id w37so14496936edw.4
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iIq2Yi+7vpIWQsgTfDhCTURtpMBh22kuG0Wc9/8Cwng=;
        b=T3Ta1+1uYcwnpVENHolx2f5ljyhA3TpAFb5XAfDCH/zUC88BUfBZspVbi4S4qcML04
         vEOWwx/lVJnBGtOzNgvdci4CvspT91v0Q1mqrNIIX9+ct0oVH14dNf+DaR8ZhAyocGZU
         3/gcTuCcX6rULx8bStqp9UN2pE/MsmhbwcYKbnEreNBUP8k8lP28cQJPg2yt3yIzMSLD
         DHtZEgfin4kcxVE0yrS7np3e4tQYEOqMT7T8JXVQmocYw6nRTcRUKQiHfR3dBrqBT2+Y
         GKUd2tROREhPlMeOsTXQHTQgaVyHjbLU0caBpxaCUOy5LQomXKc+3q65jwNEs+sQfkft
         LeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iIq2Yi+7vpIWQsgTfDhCTURtpMBh22kuG0Wc9/8Cwng=;
        b=nMMdtxJkuar04vfu1CBWGKcBBpyf8AAL+ybj2Zu8AD/aPi1JXF1UoFwPy5hNoPHeE4
         mKnjZ4ND6LVH5PbfQ21nFY3dV3hlvD2ncMYqR9M01wS2zY7KM3znlUB35oFe4TodueRQ
         zY71e9fgIYtZnmc9fc3FeG+sXbCL4FKolP3cDpPNpQ9GqWtD2Gr1N9fBow40yOfJ3WdX
         8XrA15hab+OrUXUSis3jewQmWDZJzP9SCATpOGzCzCXRWfKIMo8tAbEh+E6oS7Qf5+4X
         N+xDO+yz8KvrQNmbf4+459PvU4rLI9j2gFLOv2XmnUyEe07PXePbFsOcAcGQvdDYLhzy
         kW5Q==
X-Gm-Message-State: APjAAAXtGjLuxSO6ZC3py/RxAkejZaFpOK85NBezjvAs6b8CKiVd+AtU
        GqfZLlfvaVpBlWWSMs1VXPLrrEHNSPQ=
X-Google-Smtp-Source: APXvYqwDhvVE6wtuFG42FXVmwLBod1xPP8fum0ZWORz06ORqjP/JFFtJzAfzipZ4PAK31jII1owp8A==
X-Received: by 2002:a17:906:3154:: with SMTP id e20mr18058578eje.263.1557133434231;
        Mon, 06 May 2019 02:03:54 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id z4sm1469562ejm.8.2019.05.06.02.03.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:53 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 23/34] lsusb.py: Usb* classes: call read() automatically from constructor
Date:   Mon,  6 May 2019 12:02:30 +0300
Message-Id: <20190506090241.169665-24-grawity@gmail.com>
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
 lsusb.py.in | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index e9e18dc..09363d3 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -238,16 +238,18 @@ def find_dev(driver, usbname):
 
 class UsbEndpoint:
 	"Container for USB endpoint info"
-	def __init__(self, parent = None, indent = 18):
+	def __init__(self, parent, fname, indent=18):
 		self.parent = parent
 		self.indent = indent
-		self.fname = ""
+		self.fname = fname
 		self.epaddr = 0
 		self.len = 0
 		self.ival = ""
 		self.type = ""
 		self.attr = 0
 		self.max = 0
+		if self.fname:
+			self.read(self.fname)
 
 	def read(self, fname):
 		fullpath = ""
@@ -271,11 +273,11 @@ class UsbEndpoint:
 
 class UsbInterface:
 	"Container for USB interface info"
-	def __init__(self, parent = None, level = 1):
+	def __init__(self, parent, fname, level=1):
 		self.parent = parent
 		self.level = level
 		self.fullpath = ""
-		self.fname = ""
+		self.fname = fname
 		self.iclass = 0
 		self.isclass = 0
 		self.iproto = 0
@@ -284,6 +286,9 @@ class UsbInterface:
 		self.devname = ""
 		self.protoname = ""
 		self.eps = []
+		if self.fname:
+			self.read(self.fname)
+
 	def read(self, fname):
 		fullpath = ""
 		if self.parent:
@@ -302,10 +307,9 @@ class UsbInterface:
 			pass
 		self.protoname = find_usb_class(self.iclass, self.isclass, self.iproto)
 		if showeps:
-			for epfnm in os.listdir(prefix + fullpath):
-				if epfnm[:3] == "ep_":
-					ep = UsbEndpoint(self, self.level+len(self.fname))
-					ep.read(epfnm)
+			for dirent in os.listdir(prefix + fullpath):
+				if dirent[:3] == "ep_":
+					ep = UsbEndpoint(self, dirent, self.level + len(self.fname))
 					self.eps.append(ep)
 
 	def __str__(self):
@@ -326,10 +330,10 @@ class UsbInterface:
 
 class UsbDevice:
 	"Container for USB device info"
-	def __init__(self, parent = None, level = 0):
+	def __init__(self, parent, fname, level=0):
 		self.parent = parent
 		self.level = level
-		self.fname = ""
+		self.fname = fname
 		self.fullpath = ""
 		self.iclass = 0
 		self.isclass = 0
@@ -346,6 +350,9 @@ class UsbDevice:
 		self.devname = ""
 		self.interfaces = []
 		self.children = []
+		if self.fname:
+			self.read(self.fname)
+			self.readchildren()
 
 	def read(self, fname):
 		self.fname = fname
@@ -402,13 +409,10 @@ class UsbDevice:
 			if not dirent[0:1].isdigit():
 				continue
 			if os.access(prefix + dirent + "/bInterfaceClass", os.R_OK):
-				iface = UsbInterface(self, self.level+1)
-				iface.read(dirent)
+				iface = UsbInterface(self, dirent, self.level+1)
 				self.interfaces.append(iface)
 			else:
-				usbdev = UsbDevice(self, self.level+1)
-				usbdev.read(dirent)
-				usbdev.readchildren()
+				usbdev = UsbDevice(self, dirent, self.level+1)
 				self.children.append(usbdev)
 		usbsortkey = lambda obj: [int(x) for x in re.split(r"[-:.]", obj.fname)]
 		self.interfaces.sort(key=usbsortkey)
@@ -438,8 +442,7 @@ class UsbDevice:
 			else:
 				strg += "\n"
 				if showeps:
-					ep = UsbEndpoint(self, self.level+len(self.fname))
-					ep.read("ep_00")
+					ep = UsbEndpoint(self, "ep_00", self.level+len(self.fname))
 					strg += str(ep)
 				if showint:	
 					for iface in self.interfaces:
@@ -472,9 +475,7 @@ def read_usb():
 	for dirent in os.listdir(prefix):
 		if not dirent[0:3] == "usb":
 			continue
-		usbdev = UsbDevice(None, 0)
-		usbdev.read(dirent)
-		usbdev.readchildren()
+		usbdev = UsbDevice(None, dirent, 0)
 		root_hubs.append(usbdev)
 	root_hubs.sort(key=lambda x: int(x.fname[3:]))
 	for usbdev in root_hubs:
-- 
2.21.0

