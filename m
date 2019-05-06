Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FA11471B
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfEFJEI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:08 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33840 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfEFJEG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:06 -0400
Received: by mail-ed1-f68.google.com with SMTP id w35so12829349edd.1
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOkR7Z9nRHzB4DVkXdaaQy9kKsDLhmTfOlmMXg9X74E=;
        b=sbC6ZDl6B6bplDuKuogUIVIGoG6BMWKay9YlZBB9Qh6FgvXLMaZElmjHRtZW9X2Eom
         orqygYfmHKTwSiRik/f8nVGjOjhFTNE2bRmjTYh1zZfikCU92W+Gr5TT9ULZuyE5sozz
         YwSsJTNPQtZkTm/mxlHmfIQvjojp0KPYzaHpWCOL2/j1SR9EErZZjcOxZgkuKRqkDyBv
         k1BmZbzWFgiWGvReVCNw9JDvv/II0ccp4VJSugl3dj/83THz7LEy5a6NWNjKAHBIguhj
         MYDHAOYNKG4L5XRmdJq7a/dczk+hhKaP09+9AnVLT1brZTeZY8egSoo9I9TYwAM/L696
         CRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOkR7Z9nRHzB4DVkXdaaQy9kKsDLhmTfOlmMXg9X74E=;
        b=bEJmGI/DnEb74c9UO/f7CjbPfuIHaXBbeTFs8qGS2Kd1iu0LUKLGwIzR7VfQk9qEM+
         2UR0ziXxBrLFuTDeYM8M10kBW731p0pU63NIuCr5nWwkthbsRuTbx9Dmi/9jWMgC9Bni
         +nXIrtVOWxE9ccmOGEyMkmJ1TEooXyhn2I1g9vJJOMp0d6aNQuwtPYJ+JaDVaPwGrX+6
         PwHdHM9KJF5c48EiJ83jpG/5x61Z6agr12nmULXZ45m7cjWXc/ijnPvRKXeT8sqXVvf3
         SEdeq19kpSqhE4PBKgxq1BpJTOH4ixzcCNExd9TEY5xHmindkIumWp7CFp/CK9NX867S
         Uftg==
X-Gm-Message-State: APjAAAUUG/4I4lJYd5dDcsPiGm7yHO1pnjO0qErD0F0fyw4lHYDORR9F
        BY4y06WD2nVNQG3doTWCGoNh27tZ9Og=
X-Google-Smtp-Source: APXvYqyQMcz6Pktq1YQl9Til6vW8VuRHJeB4AhRCM9DN3mWXkgRYvmIxsuCdhOfS8kT5Tambx7NuDQ==
X-Received: by 2002:a50:8fa4:: with SMTP id y33mr24548822edy.197.1557133444418;
        Mon, 06 May 2019 02:04:04 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id w54sm2898881edw.40.2019.05.06.02.04.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:03 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 29/34] lsusb.py: give all Usb* classes a superclass
Date:   Mon,  6 May 2019 12:02:36 +0300
Message-Id: <20190506090241.169665-30-grawity@gmail.com>
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
 lsusb.py.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 577eb0a..361615d 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -230,7 +230,10 @@ def find_dev(driver, usbname):
 	return res
 
 
-class UsbEndpoint:
+class UsbObject:
+	pass
+
+class UsbEndpoint(UsbObject):
 	"Container for USB endpoint info"
 	def __init__(self, parent, fname, level):
 		self.parent = parent
@@ -268,7 +271,7 @@ class UsbEndpoint:
 			 self.ival, self.attr, self.len, self.max, cols[0])
 
 
-class UsbInterface:
+class UsbInterface(UsbObject):
 	"Container for USB interface info"
 	def __init__(self, parent, fname, level=1):
 		self.parent = parent
@@ -321,7 +324,7 @@ class UsbInterface:
 				strg += str(ep)
 		return strg
 
-class UsbDevice:
+class UsbDevice(UsbObject):
 	"Container for USB device info"
 	def __init__(self, parent, fname, level=0):
 		self.parent = parent
-- 
2.21.0

