Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48AEA14706
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfEFJDu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:50 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:37677 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfEFJDt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:49 -0400
Received: by mail-ed1-f51.google.com with SMTP id w37so14496610edw.4
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NBuw+KD/0ECG8BY+GQ+QI16cFNs7SmoT7gvx8PQ9xZk=;
        b=KrxtZaewwJGyEhBRNzZT9LetNMvd5Q9qiooG4igLj4IwODIXzOH1JHz+e7xhfyv1is
         IOnE3VAAZyV861zxGWee4xxz7faN/5+NQ0S5cva3dksgLFLCGjC2FB0KwYtBTm8U5okx
         GJW8rRIgZ/CGR/inW+G48hPFj2oQ+XGpC1JU9E0sqaZwrCsW6zR9wp6SMcB7Uo5VZX8m
         C9X3MBV/xBPdOeqiAUT9E3fCzhTAeYcu7PLxsZ5twSJOQeL1L/Jwc4zXDPRPv2LMonpG
         VOrZCC5XDBKdkyEBJeyjnwNIMcMN4DOyCOnpCOSEgfsZY3CU9jYrAEaGJqLEjZtvd97Y
         ZgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NBuw+KD/0ECG8BY+GQ+QI16cFNs7SmoT7gvx8PQ9xZk=;
        b=Pd0QnTQ89XQe+Ve/5U6J4inQti+RVvjOGmHqzL/jpIpDgV3K325au412YJw+3Qt2co
         Unx8gcaf4/TfWDBM0DMEgA9kc0EAITalz8F+k49gimt7AiHiGx4N3UDkB8yJzKhuIpaa
         f7jQfQHDXfWkZ6Gjm7+xr+8B13GrkW8qi+jAH1lzTH51DPqNou8geb/ajNeNQkBsjLJL
         ctHYg3EMgWkOVSZmADrut56n+L3ImS7u6st19ZbM/nltAKO0FdgH/z1rKQdw9c+UtUkA
         WW+JLXEIQOajf1EbujH7U5kv2cTqJ703sFQCV/vMdS3L19lBKeCm1FtoR07oIqaFXlaC
         adAw==
X-Gm-Message-State: APjAAAU3LVXbJJanjh/p6FvBWd20nBbaIFzYPTExveMroBG+KvlujBSl
        g4fM9Wj0idShfAtOjhtQU7HOepFtoMQ=
X-Google-Smtp-Source: APXvYqx52iS5L2pzZzCSmyPO8SzAqQsJESGWL/8DetxZv65AzhX/Pn8UKyWnTH8zgv+VFD+jDbudAA==
X-Received: by 2002:a05:6402:1499:: with SMTP id e25mr24264208edv.282.1557133427735;
        Mon, 06 May 2019 02:03:47 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id 65sm2850654edm.60.2019.05.06.02.03.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:47 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 19/34] lsusb.py: remove dead code
Date:   Mon,  6 May 2019 12:02:26 +0300
Message-Id: <20190506090241.169665-20-grawity@gmail.com>
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
 lsusb.py.in | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 74d8c8d..fc3e7a6 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -200,18 +200,15 @@ def add_drv(path, drvnm):
 def find_dev(driver, usbname):
 	"Return pseudo devname that's driven by driver"
 	res = ""
-	#print("find_dev(%s, %s)" % (driver, usbname))
 	for nm in devlst:
 		dirnm = prefix + usbname
 		prep = ""
-		#print(nm)
 		idx = nm.find('/')
 		if idx != -1:
 			prep = nm[:idx+1]
 			dirnm += "/" + nm[:idx]
 			nm = nm[idx+1:]
 		ln = len(nm)
-		#print(" search %s for %s" % (dirnm, nm))
 		try:
 			for ent in os.listdir(dirnm):
 				if ent[:ln] == nm:
@@ -359,7 +356,6 @@ class UsbDevice:
 		try:
 			self.name = readattr(fname, "manufacturer") + " " \
 				  + readattr(fname, "product")
-			#self.name += " " + readattr(fname, "serial")
 			if self.name[:5] == "Linux":
 				rx = re.compile(r"Linux [^ ]* (.hci_hcd) .HCI Host Controller")
 				mch = rx.match(self.name)
@@ -390,8 +386,6 @@ class UsbDevice:
 		try:
 			self.nointerfaces = int(readattr(fname, "bNumInterfaces"))
 		except:
-			#print("ERROR: %s/bNumInterfaces = %s" % (fname,
-			#		readattr(fname, "bNumInterfaces")))
 			self.nointerfaces = 0
 		try:
 			self.driver = readlink(fname, "driver")
@@ -407,7 +401,6 @@ class UsbDevice:
 		for dirent in os.listdir(prefix + self.fname):
 			if not dirent[0:1].isdigit():
 				continue
-			#print(dirent)
 			if os.access(prefix + dirent + "/bInterfaceClass", os.R_OK):
 				iface = UsbInterface(self, self.level+1)
 				iface.read(dirent)
@@ -422,7 +415,6 @@ class UsbDevice:
 		self.children.sort(key=usbsortkey)
 
 	def __str__(self):
-		#strg = " " * self.level + self.fname
 		if self.iclass == 9:
 			col = cols[2]
 			if noemptyhub and len(self.children) == 0:
@@ -441,8 +433,6 @@ class UsbDevice:
 				 cols[1], self.vid, self.pid, cols[0],
 				 self.iclass, self.usbver, self.speed, self.maxpower,
 				 self.nointerfaces, plural, col, self.name, cols[0])
-			#if self.driver != "usb":
-			#	strg += " %s" % self.driver
 			if self.iclass == 9 and not showhubint:
 				strg += " %shub%s\n" % (cols[2], cols[0])
 			else:
@@ -480,7 +470,6 @@ def read_usb():
 	"Read toplevel USB entries and print"
 	root_hubs = []
 	for dirent in os.listdir(prefix):
-		#print(dirent,)
 		if not dirent[0:3] == "usb":
 			continue
 		usbdev = UsbDevice(None, 0)
-- 
2.21.0

