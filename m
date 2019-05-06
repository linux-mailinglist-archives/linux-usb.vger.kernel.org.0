Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3657C14720
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfEFJEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:04:15 -0400
Received: from mail-ed1-f44.google.com ([209.85.208.44]:46554 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfEFJEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:04:14 -0400
Received: by mail-ed1-f44.google.com with SMTP id f37so14460651edb.13
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8nM/uYJzoMjbe2HZe7po/xn0RF5ZRwVV2Yqg+jH/nP8=;
        b=LmYOYFs5G7zdBxkqLb9Rkf/xr8qC7JQJKbT0eLbpW1fX0fj4POLUXzlRX/Nm9D/UvH
         McdnzlsBf/WTj6I8rLbRdqTd0+yfSLFW2pvgPX1tPFG+mFcktUBwVcNuRTUxW5vO/GZD
         xiDDyAhcAXkEfjPmWwMw0FC9J2BleBBiq99IZCvzEOoAWQMDbk3W3NnMwEWHpztp05Mv
         yPls9RNZqGx8uqxivsvW6jwtCWu5dRBKbg9h8ycUVxRmOmQK0gh5K1CrNPuz5YZlh9OA
         q5Jpd2M2DOZvKf0tK+yNnv0BQ79KVQUA+aF2/W653OcQesvq0Pz+0izzpf0Kh0ElGnhn
         JF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8nM/uYJzoMjbe2HZe7po/xn0RF5ZRwVV2Yqg+jH/nP8=;
        b=CRm6ODwHETGIHl9H6MFylJx0ngRnAr8tsqEk5DqdKwjGdWXk8dzuOKci1SulBXHeQ+
         uh25r889g1zx2uBRiFgctIJlo3gdzEWTQTAV8MruKUS+FfcHhKS7rTSAeQgXDTJVFgfE
         tdpkWuIbYJN3VZLFvybt9isQt28X7Yhq0yiBseZUO1Mwi0YJ2QEK5g9kA/e/3bhsfjYG
         0BS+o/RCxDPvgC2+4NUlq9A0fP7UBh3vWu0ohVFmA9woMcbRKGv4cj3yVFECNTkbg9a1
         evnHaWIQrEPdSpyXAHY9rnIFdNIPI5EavURCyVx4qhVw/f05InMWG/+dfbqoWX6Add0F
         41Kg==
X-Gm-Message-State: APjAAAX518vTLsF5L8VuLg7OSpz00MlDhKnbE4y0sELcaPBQiHOIWa1c
        5v5/0OJJnKHifYc+/oFdp7psh9Yizm0=
X-Google-Smtp-Source: APXvYqyAPkLqCG5lIJUvPo2VNqBKf0uQeKsLDFr8j2AruznvkDvXuAo4woKrVmxZFz4NIMxPm0y8Jw==
X-Received: by 2002:a17:906:b789:: with SMTP id dt9mr15671057ejb.244.1557133451715;
        Mon, 06 May 2019 02:04:11 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id e4sm1439973ejm.50.2019.05.06.02.04.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:04:10 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 33/34] lsusb.py: fix endpoint interval spacing
Date:   Mon,  6 May 2019 12:02:40 +0300
Message-Id: <20190506090241.169665-34-grawity@gmail.com>
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
 lsusb.py.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 648a734..c170ebb 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -255,7 +255,7 @@ class UsbEndpoint(UsbObject):
 		self.epaddr = int(self.read_attr("bEndpointAddress"), 16)
 		ival = int(self.read_attr("bInterval"), 16)
 		if ival:
-			self.ival = "(%s)" % self.read_attr("interval")
+			self.ival = " (%s)" % self.read_attr("interval")
 		self.len = int(self.read_attr("bLength"), 16)
 		self.type = self.read_attr("type")
 		self.attr = int(self.read_attr("bmAttributes"), 16)
@@ -268,7 +268,7 @@ class UsbEndpoint(UsbObject):
 		indent = "  " * self.level
 		#name = "%s/ep_%02X" % (self.parent.fname, self.epaddr)
 		name = ""
-		body = "(EP) %02x: %s %s attr %02x len %02x max %03x" % \
+		body = "(EP) %02x: %s%s attr %02x len %02x max %03x" % \
 			(self.epaddr, self.type, self.ival, self.attr, self.len, self.max)
 		body = colorize(5, body)
 		return "%-17s %s\n" % (indent + name, indent + body)
-- 
2.21.0

