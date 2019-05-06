Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B509E14717
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfEFJEG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:06 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40298 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbfEFJEF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:05 -0400
Received: by mail-ed1-f65.google.com with SMTP id e56so14478284ede.7
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0IOGsNZC5kbzt2++WwjGlBoblgG6XIK73ePdqvOM1ow=;
        b=iU7HAel7B55hpV4VnL/Jy25cZ+ckx6jU+6ZAGBM4GtDPxSf39kNQhzZbIguvGpJlqX
         XiT7iD5f5nFkDRAa/oi7weeAghPD2KNV2NJjP0WE984qXw8C7s9pYLz+f7G8Zx5JeZE/
         GYbFubWX1Yx8t2nthajg6FF55rY4kRfu43LkTR0+OznnVIZWq0qT4SCUmvr1DHDcx9OB
         dmfTGlsfxD6fujA5/7i1E881UGyZnUcxQkYIxo/29PfICJboNRvsIYbWXRNxALB+hrrG
         U02hQJjAnzuoqwUZRo2qc4hZGWy+j7qw4p9MUyd22hYo2jT9MGJiFmjRGvzkwZMFbSjJ
         E/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0IOGsNZC5kbzt2++WwjGlBoblgG6XIK73ePdqvOM1ow=;
        b=Ff8sh/ifJhYjqL5lWUK/TOgCDBPTlWvCvpvZjZ9hdB5hIxrsuc3FNpkguRGJVxH2pe
         bMbHlAc7wuXH9rPKYjjtjrR8qNqTAL/GYLzXvKw3sdDJIpmESlPslixWyo56GUzoWKNY
         LZpppxHdGlfEaTx4SND+IYqpKsizh/99+q6rK98qiDhBbSjYJTzAxBVKy7wJ94+jQYbn
         eh+ZcQ4eaS1j2jRAjwz9Pnc6N2hUKvFMOeFTG9pByiM8bJE/vSzIAX+DkYyhqu/hVdbQ
         CnRuokNAB1WAmNdQdD9fS3tzg7gzYmbwG/gl9gGc5lrFCEN5RnwItIWG8lfK8LPzQ1iX
         hxaQ==
X-Gm-Message-State: APjAAAVHK97RO8Da+5UxfokoFr5UzIwwcOGFqS/Z28MlpsB71J+tX4f0
        olyr9uJMROVMV5ZN9NWyzuKSkVS4lhE=
X-Google-Smtp-Source: APXvYqxselhzNcEeAAtLFhXt4I+56nIOh83OSMvh+/fUFD+VwiTNJxcEf/WWzASo+yHaeKeprPWXtQ==
X-Received: by 2002:a17:906:76cb:: with SMTP id q11mr17824370ejn.51.1557133442753;
        Mon, 06 May 2019 02:04:02 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id h1sm2838751edk.96.2019.05.06.02.04.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:02 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 28/34] lsusb.py: add an actual __repr__() to classes
Date:   Mon,  6 May 2019 12:02:35 +0300
Message-Id: <20190506090241.169665-29-grawity@gmail.com>
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

This simplifies debugging.

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lsusb.py.in b/lsusb.py.in
index 5720cd2..577eb0a 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -258,6 +258,9 @@ class UsbEndpoint:
 		self.attr = int(readattr(self.path, "bmAttributes"), 16)
 		self.max = int(readattr(self.path, "wMaxPacketSize"), 16)
 
+	def __repr__(self):
+		return "<UsbEndpoint[%r]>" % self.fname
+
 	def __str__(self):
 		indent = self.level + len(self.parent.fname)
 		return "%-17s  %s(EP) %02x: %s %s attr %02x len %02x max %03x%s\n" % \
@@ -302,6 +305,9 @@ class UsbInterface:
 					ep = UsbEndpoint(self, dirent, self.level+1)
 					self.eps.append(ep)
 
+	def __repr__(self):
+		return "<UsbInterface[%r]>" % self.fname
+
 	def __str__(self):
 		plural = (" " if self.noep == 1 else "s")
 		strg = "%-17s (IF) %02x:%02x:%02x %iEP%s (%s) %s%s %s%s%s\n" % \
@@ -405,6 +411,9 @@ class UsbDevice:
 		self.interfaces.sort(key=usbsortkey)
 		self.children.sort(key=usbsortkey)
 
+	def __repr__(self):
+		return "<UsbDevice[%r]>" % self.fname
+
 	def __str__(self):
 		if self.iclass == HUB_ICLASS:
 			col = cols[2]
-- 
2.21.0

