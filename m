Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B727146FF
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfEFJDl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:41 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45460 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:40 -0400
Received: by mail-ed1-f68.google.com with SMTP id g57so14464162edc.12
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IRzPMnypx3CdBAGkIgMJxrqdf/w5qRpxQKai+pzgHZ4=;
        b=Lom28Qm11F3iIt5QvZF52nb3333DpgyBP3eGkRcmn230TPDFutxlwp8EkIaioxG5Tp
         H/3LimGzqvQfbLKIBbQCmQoqs5mJbIRnXG025ZRNg9znYjB1UXiHB9mL849nANWMwLCF
         /pdXN0JvM0LB4X0+tPUmCbgywqWATwEkxa7XPmE+2B3FhKUS3mu1VGvnwiG9gh6Vl7lZ
         7bU05QStpsKGJ6YEve6ps7kNc3i7Grx3PQ+nB2R8xAhEp4jo5HXnI7DYC/ALRnrLYl1l
         +2wVh6PhWFOwhJ16/xckTY8s/BFuzJPavBcM+m2Ql1G+g92TYfP+r64BZ7n/Kewa9XUa
         zwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRzPMnypx3CdBAGkIgMJxrqdf/w5qRpxQKai+pzgHZ4=;
        b=uUnLrySzHy5uzV4p7eoJUric/HXrzbue/AUuclTQ2dBoI2D0zOHP0K/C+zAdXxSNuE
         BmqReWO/dyP6yBl+u0VQOFtuniiR7hcuhEozwxHWgcAHG96lGVb6vdx8nK4t/jEF5mvG
         aYs5TyA7fv+US1ZRgHzZerH7enzWKGeNGBe8lXBiTiCUCU9ETl8O/77R9ZrKALjhE758
         F1ABVB6h2c14kL4/byPJop/uSZWC7ilGDcu8P0IZiZDHUkQ7QAo+33KjzphOfRY1dK4r
         tL+DAdtFlvSqieG3l6makfPNxJVB2+1Tb86zgiDpDZijbEs+z/s3DFrjT7dkXcL5VG7M
         J9zw==
X-Gm-Message-State: APjAAAU+8GcjQFpBoWvAAU0CC6PP4pfoiL22cwygaicKPzegDcVG7SsV
        zLRdyOZ9okJ2mxJxWg9Pof/Wds87sdk=
X-Google-Smtp-Source: APXvYqyUOEB8zVRJ083xY9APig0CmzJMgKmqw8Qr3pxTtWHqft/a/qHgR/QjX1Rv0Yh0hovmYLAgUQ==
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr17887136eja.123.1557133418467;
        Mon, 06 May 2019 02:03:38 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id bz12sm1028281ejb.59.2019.05.06.02.03.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:37 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 13/34] lsusb.py: avoid manual calls to __foo__()
Date:   Mon,  6 May 2019 12:02:20 +0300
Message-Id: <20190506090241.169665-14-grawity@gmail.com>
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
 lsusb.py.in | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index a8f18ab..79d6cd6 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -162,12 +162,12 @@ def find_usb_prod(vid, pid):
 	strg = ""
 	vendor = usbvendors.get(vid)
 	if vendor:
-		strg = vendor.__repr__()
+		strg = repr(vendor)
 	else:
 		return ""
 	product = usbproducts.get((vid, pid))
 	if product:
-		return strg + " " + product.__repr__()
+		return strg + " " + repr(product)
 	return strg
 
 def find_usb_class(cid, sid, pid):
@@ -177,13 +177,13 @@ def find_usb_class(cid, sid, pid):
 	lnlst = len(usbclasses)
 	cls = usbclasses.get((cid, sid, pid))
 	if cls:
-		return cls.__repr__()
+		return repr(cls)
 	cls = usbclasses.get((cid, sid, -1))
 	if cls:
-		return cls.__repr__()
+		return repr(cls)
 	cls = usbclasses.get((cid, -1, -1))
 	if cls:
-		return cls.__repr__()
+		return repr(cls)
 	return ""
 
 
@@ -355,7 +355,7 @@ class UsbInterface:
 			 cols[4], self.devname, cols[0])
 		if showeps and self.eps:
 			for ep in self.eps:
-				strg += ep.__str__()
+				strg += str(ep)
 		return strg
 
 class UsbDevice:
@@ -483,12 +483,12 @@ class UsbDevice:
 				if showeps:
 					ep = UsbEndpoint(self, self.level+len(self.fname))
 					ep.read("ep_00")
-					strg += ep.__str__()
+					strg += str(ep)
 				if showint:	
 					for iface in self.interfaces:
-						strg += iface.__str__()
+						strg += str(iface)
 		for child in self.children:
-			strg += child.__str__()
+			strg += str(child)
 		return strg
 
 
-- 
2.21.0

