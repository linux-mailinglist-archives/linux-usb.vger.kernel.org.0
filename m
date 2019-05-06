Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44A71470D
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfEFJEA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:00 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33709 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfEFJD7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:59 -0400
Received: by mail-ed1-f67.google.com with SMTP id n17so14519095edb.0
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xtlimpaq5Uyswsddti7P+snnW0dp9hJMWiAWVLYOUHM=;
        b=q//Ygab52uvLVZaqlQQcdF+Qf2GcWtsn8WCnceKuGJzL7aBshnU6USFWvBwbCBk2mN
         jZ5bXHw1kPn2Fec63jLFmSsf/MNJiAoS9l/17/MTmDp53oSE/vmOyaG6b9ZgigUnatPJ
         DmKsZss5QKgDZJGpGAoF1Drcuq6MxO87YJWSWERSaCCBtFztKcODOoOB4lrlwNA/rx/s
         RhQKo5PcJjwpab9WU4fa5tfReJ9HdEF2xuIBFYw/XpM0t4cDSYOyuwnwip/kj/cVLn+3
         H6rF4LZLy+NWzgNG+1rsbNki/Rx49y+PPleiB9FMffbk23cC9lOQBbDuOsPXu9you2R/
         Ku/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xtlimpaq5Uyswsddti7P+snnW0dp9hJMWiAWVLYOUHM=;
        b=b+9a/KUR5o3OH9jcwasR2TmRyBwW6+rYurRoEp6dysz5Bx9KhBuHs2vnnlhWQK0O2z
         rPslfZLmS6QtTTUgroEJcEkKvJhUbH+Bl9cCjxbOgGZO6IEKE0f4gOZXbQaGYCXgkshl
         AkREfskDkv9p+lnnY8bnJ4ej9fiw24fvVxac4OzT4gIR/s/Sz7t/0QsPMPLfC+63Fpd9
         DGY1R3K5A9ew8+fgBn7nIUmuRY7xZKNwslSWY6+MSgT3u+M9Ri57ySHTpYJl8PVMbC2K
         BOlZjdol1Pkp6gg9RaunnFmE+vHkWez26EJv5P0/XZjqGkD+wPt5OgnUlnzCBdyn7tNe
         df5A==
X-Gm-Message-State: APjAAAVkwNzuad0MoYh9YDq7PnKW5jq+BLGSlt/14HpJyypQTz9zxoT0
        OQGRdgO5WmBNdth7Uni8Px6uT+nY6Mo=
X-Google-Smtp-Source: APXvYqwzCU4OTHcUPHdd1JY9QRRAoSQcYoEATW7oaCELwnm0HFdLQ9OQRsCxSLgbTtnnqSocMm3FNw==
X-Received: by 2002:a50:a3b5:: with SMTP id s50mr24776695edb.149.1557133437594;
        Mon, 06 May 2019 02:03:57 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id o1sm1478401eja.55.2019.05.06.02.03.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:56 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 25/34] lsusb.py: a few cosmetic changes
Date:   Mon,  6 May 2019 12:02:32 +0300
Message-Id: <20190506090241.169665-26-grawity@gmail.com>
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

- Place all globals above functions.
- Do not need chr(), this is not Visual Basic.
- Use .startswith() instead of hardcoding the length.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index b65cd80..47ed22b 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -33,16 +33,18 @@ usbids = [
 	"/usr/share/libosinfo/usb.ids",
 	"/usr/share/kcmusb/usb.ids",
 ]
+cols = ("", "", "", "", "", "")
 
-esc = chr(27)
-norm = esc + "[0;0m"
-bold = esc + "[0;1m"
-red =  esc + "[0;31m"
-green= esc + "[0;32m"
-amber= esc + "[0;33m"
-blue = esc + "[0;34m"
+norm	= "\033[0;0m"
+bold	= "\033[0;1m"
+red	= "\033[0;31m"
+green	= "\033[0;32m"
+amber	= "\033[0;33m"
+blue	= "\033[0;34m"
 
-cols = ("", "", "", "", "", "")
+usbvendors = {}
+usbproducts = {}
+usbclasses = {}
 
 def readattr(path, name):
 	"Read attribute from sysfs and return as string"
@@ -53,10 +55,6 @@ def readlink(path, name):
 	"Read symlink and return basename"
 	return os.path.basename(os.readlink(prefix + path + "/" + name));
 
-usbvendors = {}
-usbproducts = {}
-usbclasses = {}
-
 def ishexdigit(str):
 	"return True if all digits are valid hex digits"
 	for dg in str:
@@ -309,15 +307,12 @@ class UsbInterface:
 		self.protoname = find_usb_class(self.iclass, self.isclass, self.iproto)
 		if showeps:
 			for dirent in os.listdir(prefix + fullpath):
-				if dirent[:3] == "ep_":
+				if dirent.startswith("ep_"):
 					ep = UsbEndpoint(self, dirent, self.level+1)
 					self.eps.append(ep)
 
 	def __str__(self):
-		if self.noep == 1:
-			plural = " "
-		else:
-			plural = "s"
+		plural = (" " if self.noep == 1 else "s")
 		strg = "%-17s (IF) %02x:%02x:%02x %iEP%s (%s) %s%s %s%s%s\n" % \
 			(" " * self.level+self.fname, self.iclass,
 			 self.isclass, self.iproto, self.noep,
@@ -368,14 +363,14 @@ class UsbDevice:
 				  + readattr(fname, "product")
 		except:
 			pass
-		if self.name and self.name[:5] == "Linux":
+		if self.name:
 			mch = re.match(r"Linux [^ ]* (.hci[_-]hcd) .HCI Host Controller", self.name)
 			if mch:
 				self.name = mch.group(1)
 		if not self.name:
 			self.name = find_usb_prod(self.vid, self.pid)
 		# Some USB Card readers have a better name then Generic ...
-		if self.name[:7] == "Generic":
+		if self.name.startswith("Generic"):
 			oldnm = self.name
 			self.name = find_usb_prod(self.vid, self.pid)
 			if not self.name:
@@ -429,10 +424,7 @@ class UsbDevice:
 		else:
 			col = cols[1]
 		if not nohub or self.iclass != HUB_ICLASS:
-			if self.nointerfaces == 1:
-				plural = " "
-			else:
-				plural = "s"
+			plural = (" " if self.nointerfaces == 1 else "s")
 			strg = "%-16s %s%04x:%04x%s %02x %s%6sMbit/s %5s %iIF%s (%s%s%s)" % \
 				(" " * self.level + self.fname, 
 				 cols[1], self.vid, self.pid, cols[0],
-- 
2.21.0

