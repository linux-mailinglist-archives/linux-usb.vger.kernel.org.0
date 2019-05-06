Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6986D14700
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbfEFJDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:42 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:42472 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEFJDm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:42 -0400
Received: by mail-ed1-f53.google.com with SMTP id l25so14491058eda.9
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3CuzsGa+cDpS/luaPveBXv0AEyuN1w1Z+jlYw+hb38=;
        b=E6h8vuDyTmWsDbQ1cnTdzJ7LGusplPW6yelUaD6IdQ8ETr49Y1jATNnEwQyVZZhzVn
         IYsmvDIMe7Q41uCb76/ksaGN/HBi0HXoHWCUYWMqmIWeRvtWDtb7C8AaG/+fChj+2bI7
         3A4mAR/PpicDEaBQKAEKLYX/VYYbJNMNQMwqSdfqVMx5LiueFzCIl4ov+mJlHfDDvh8s
         eKtBpfd0WGcUwd8BiimiyN5PTAr3AIhDTIs3YMT3iIlMV0X37ImrAxv95yk0zpiTsljR
         9Xjht7KVxO6bNpzx0f5YE66wxAnSkWsbPg6OHyuxivU4OBUTKL+v5izHwFhgqePvmfPS
         vmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3CuzsGa+cDpS/luaPveBXv0AEyuN1w1Z+jlYw+hb38=;
        b=qf62w5UX0Smn4DMH5cuAS9Ps2nT/NNjYnzGmhY8/L3nwRnmEQE80zvV32G/dvzTlwn
         ACm7Dfs2ZGj5WE90lJ0ajhisWGPFsL5RobBOklDa7IBaXuwQKoEQMuNHdLN+dDc4Q8ow
         4x7ZaZh6UBq8rLxksAcEl15BSqVmQXfjTHPOzsjXQtwl6ElAVbAlXo1iKPjqkXnPRS31
         6nb0nvGdrTeNBpWN5wD2DZXzLy6xma8SP2mojp0+e8o+I/uzTYDzi3gBtJEK9n27XHxf
         AaXqf/AYkF1bkNvu3qIhJdW7nJEmh+gRxLjQe6Krfvev7K7oeW2LbnM62dSpxR121pdD
         Bh1w==
X-Gm-Message-State: APjAAAWSkmhp353miEi6KVkOmoT0uhkUaXfALbn4sSwMvOgFhmQ+XoUk
        gGnggcrW3rPqfoEIEkYV1vHD5tGslN8=
X-Google-Smtp-Source: APXvYqxt2J+WRVdJJbMebDoXRKRuphvoLhMNw8CWJdLDK1uMc8yBIHKKNNHW2PvZ+m1DX0Dh6SlDug==
X-Received: by 2002:a17:906:1984:: with SMTP id g4mr17783614ejd.260.1557133419882;
        Mon, 06 May 2019 02:03:39 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id e21sm1467292ejk.86.2019.05.06.02.03.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:39 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 14/34] lsusb.py: replace __repr__() for USB IDs with __str__()
Date:   Mon,  6 May 2019 12:02:21 +0300
Message-Id: <20190506090241.169665-15-grawity@gmail.com>
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

This is more suitable for a method that returns human-oriented strings.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 79d6cd6..83f9143 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -50,7 +50,7 @@ class UsbClass:
 		self.subclass = sc
 		self.proto = pr
 		self.desc = strg
-	def __repr__(self):
+	def __str__(self):
 		return self.desc
 	def __lt__(self, oth):
 		return (self.pclass, self.subclass, self.proto) < \
@@ -64,7 +64,7 @@ class UsbVendor:
 	def __init__(self, vid, vname = ""):
 		self.vid = vid
 		self.vname = vname
-	def __repr__(self):
+	def __str__(self):
 		return self.vname
 	def __lt__(self, oth):
 		return self.vid < oth.vid
@@ -77,7 +77,7 @@ class UsbProduct:
 		self.vid = vid
 		self.pid = pid
 		self.pname = pname
-	def __repr__(self):
+	def __str__(self):
 		return self.pname
 	def __lt__(self, oth):
 		return (self.vid, self.pid) < (oth.vid, oth.pid)
@@ -162,12 +162,12 @@ def find_usb_prod(vid, pid):
 	strg = ""
 	vendor = usbvendors.get(vid)
 	if vendor:
-		strg = repr(vendor)
+		strg = str(vendor)
 	else:
 		return ""
 	product = usbproducts.get((vid, pid))
 	if product:
-		return strg + " " + repr(product)
+		return strg + " " + str(product)
 	return strg
 
 def find_usb_class(cid, sid, pid):
@@ -177,13 +177,13 @@ def find_usb_class(cid, sid, pid):
 	lnlst = len(usbclasses)
 	cls = usbclasses.get((cid, sid, pid))
 	if cls:
-		return repr(cls)
+		return str(cls)
 	cls = usbclasses.get((cid, sid, -1))
 	if cls:
-		return repr(cls)
+		return str(cls)
 	cls = usbclasses.get((cid, -1, -1))
 	if cls:
-		return repr(cls)
+		return str(cls)
 	return ""
 
 
-- 
2.21.0

