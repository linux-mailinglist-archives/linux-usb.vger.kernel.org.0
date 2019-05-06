Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A2C146FC
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfEFJDg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:36 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:39687 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:35 -0400
Received: by mail-ed1-f52.google.com with SMTP id e24so14494322edq.6
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+clA/uLxzrbGv8CZw4s4OPLp17oMRzn1Ei0D2USaI50=;
        b=cj1y7k4YRUc7VlDobtP5i6KJmJ8L+niQWdKV3Vh6Le6nuEM8gQa7u4n5hZVVOsgXqF
         /S8QN4toICjp3C7CKsOANYWgQMt2RH1uowI/8j60pRhHfJQ1h0ILSI58Z+Vg+S68n+7U
         Qqe6sS+AC2ukIM3zAONchYNJgJSb6aQntWixBPpGV663D2rvAu6IDYSOosONQzdpRS47
         exu2PhVaiuTRFfbPJsH/IXjkM5zdNhdd+83zUU52jOEUgeSWXAAlJvY+2qsgwQlBtZbX
         USRia0Umo2CH4Cxt7UpYs83A+gnLtSSAzOayDtBd56lOxgT368JvnHToZdDO1ZBgplT+
         vHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+clA/uLxzrbGv8CZw4s4OPLp17oMRzn1Ei0D2USaI50=;
        b=dpN+WDedbjC4Re1HZStXbw/hT4jhdaXl7W0YgTdVJKJYs+uqtPQAyLD3vgAcoC3684
         G3k6PibrjeIzrgZgBmSP2379llT1nbxRr7IxTbzWzBffzULr9KOmKu07TBb3s6HV4pPp
         4/rvaAPLeLON9Bbaof1FfPw0LAyUuOJ/Rv0FZKaE7kyS4ZyLWfSx+xKxfmysVdfdOL5d
         y96L7/oPk9uuRAWNlq9Z7oXADtTVrNONZodsyDGwvxT6xwPPNgKLt9Sil82tJBS+Eeo1
         VYmX8O199pXIxvEdOssWHYk3o8kd76mFafEFF5ULc5+EkjIPmRhzfETxlgXORaiRHWfM
         m9ig==
X-Gm-Message-State: APjAAAUKr2ZvUHZ1JaUX/R7+TjF3723RhrJY1c0PmLN4ZC7rXvjJV8JU
        6VPUpVuBjDWK7CrO3mr5vBUSDXnIRv0=
X-Google-Smtp-Source: APXvYqx7tQS7wQ4Zwlh261WS5TsKYNyfJc6oZ/64bnqpV5oh4kesY+aZPqWe5hEUGA+SqPl/L646Lg==
X-Received: by 2002:a50:9765:: with SMTP id d34mr24971431edb.195.1557133413511;
        Mon, 06 May 2019 02:03:33 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id i5sm1489172ejb.24.2019.05.06.02.03.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:32 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 10/34] lsusb.py: avoid shadowing Python's built-in 'str'
Date:   Mon,  6 May 2019 12:02:17 +0300
Message-Id: <20190506090241.169665-11-grawity@gmail.com>
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
 lsusb.py.in | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 93fe6b5..5338d82 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -45,11 +45,11 @@ def readlink(path, name):
 
 class UsbClass:
 	"Container for USB Class/Subclass/Protocol"
-	def __init__(self, cl, sc, pr, str = ""):
+	def __init__(self, cl, sc, pr, strg = ""):
 		self.pclass = cl
 		self.subclass = sc
 		self.proto = pr
-		self.desc = str
+		self.desc = strg
 	def __repr__(self):
 		return self.desc
 	def __lt__(self, oth):
@@ -481,13 +481,13 @@ class UsbDevice:
 		self.children.sort(key=usbsortkey)
 
 	def __str__(self):
-		#str = " " * self.level + self.fname
+		#strg = " " * self.level + self.fname
 		if self.iclass == 9:
 			col = cols[2]
 			if noemptyhub and len(self.children) == 0:
 				return ""
 			if nohub:
-				str = ""
+				strg = ""
 		else:
 			col = cols[1]
 		if not nohub or self.iclass != 9:
@@ -495,27 +495,27 @@ class UsbDevice:
 				plural = " "
 			else:
 				plural = "s"
-			str = "%-16s %s%04x:%04x%s %02x %s%6sMbit/s %5s %iIF%s (%s%s%s)" % \
+			strg = "%-16s %s%04x:%04x%s %02x %s%6sMbit/s %5s %iIF%s (%s%s%s)" % \
 				(" " * self.level + self.fname, 
 				 cols[1], self.vid, self.pid, cols[0],
 				 self.iclass, self.usbver, self.speed, self.maxpower,
 				 self.nointerfaces, plural, col, self.name, cols[0])
 			#if self.driver != "usb":
-			#	str += " %s" % self.driver
+			#	strg += " %s" % self.driver
 			if self.iclass == 9 and not showhubint:
-				str += " %shub%s\n" % (cols[2], cols[0])
+				strg += " %shub%s\n" % (cols[2], cols[0])
 			else:
-				str += "\n"
+				strg += "\n"
 				if showeps:
 					ep = UsbEndpoint(self, self.level+len(self.fname))
 					ep.read("ep_00")
-					str += ep.__str__()
+					strg += ep.__str__()
 				if showint:	
 					for iface in self.interfaces:
-						str += iface.__str__()
+						strg += iface.__str__()
 		for child in self.children:
-			str += child.__str__()
-		return str
+			strg += child.__str__()
+		return strg
 
 
 def usage():
-- 
2.21.0

