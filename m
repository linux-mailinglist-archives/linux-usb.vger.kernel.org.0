Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C593314709
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfEFJDz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:55 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39234 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfEFJDy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:54 -0400
Received: by mail-ed1-f68.google.com with SMTP id e24so14495220edq.6
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NovldSKLd1vNLf7VuMVfUoBxxCGFuTHVQRSwge9eons=;
        b=V1CwGujtY6rRZ7gLQ2capExbXtXmlG0yi+AtK2kSBDsKG/zwbqWbFBYrryQQRSI/+1
         uQX/KWhNTB0iACLUfodD4FzZc2F06wXxlhcPuDL26bgKTZRoFm+LDN4PFav+IF00mPty
         gA90qGmyM+7OsUVcvULTt8OJ1bNygbFfbTH3lNhlI/a5+bDcHvGYbRKtXSee4PWAMJy2
         s1nOdIZJgvEqqKjAB9/TGxGFVKYLuq+D80CgR6gIUE6AT8obNWYJ4zpCThavpQYrCkb0
         RwLASZ1J3rJ/J+YLTqcMNHF0drfLL90RbPBGGnTI9mRUKZGhRNPiCZrLFr/bP5zVK7Xq
         eI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NovldSKLd1vNLf7VuMVfUoBxxCGFuTHVQRSwge9eons=;
        b=S9pmdrvqLKaGT7iaO5ZEz7MezbvML6faE9yaozCWklbzJ3NQqse4F3jgOxCGIOgGZu
         ZWPehA7TQvYrjGugejMVT8wd95wArbHDJqtTMHi/Vcun4FH5YlZjG7NmxH5YiYz8VmtB
         E3Wn1vdIk6xBB2LsP+UAPOg328Rj55E/S7/NC+qkmjZfjaqAGvoY2GSoi+RYzevcXhFJ
         pQVRmFDhZ2LvDCFW3e829V0/1uhgpn42igdL82WVYxToWF8koBEYAhBfpyU9YaWa2/pi
         zq0HTzmi0XF3M9gRk/kZGaHl6ORbVz630V0lkGoAz+hSz8kuu6LXSddWlHL7FpnRrgu7
         kPAg==
X-Gm-Message-State: APjAAAUqw2WFkl4L3sDz+gIjZuIC8hQHOMmLpM5hR/pWePTEscW8eY2O
        EZH9Bthfe3Y4OacwBe+Drt5DuMblW48=
X-Google-Smtp-Source: APXvYqwGGNJ90luByTnuj45aP/LnHsc7TRuFkycXuoBYSu1aPdCTbEH+FLR1xUWFNbsvqh6G2CQJRA==
X-Received: by 2002:a50:ad77:: with SMTP id z52mr7017606edc.174.1557133432715;
        Mon, 06 May 2019 02:03:52 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id w14sm1467717ejv.58.2019.05.06.02.03.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:52 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 22/34] lsusb.py: use a constant for the magic class number 9
Date:   Mon,  6 May 2019 12:02:29 +0300
Message-Id: <20190506090241.169665-23-grawity@gmail.com>
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
 lsusb.py.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 2c1e5e2..e9e18dc 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -17,6 +17,8 @@ import os
 import re
 import sys
 
+HUB_ICLASS = 0x09
+
 # Global options
 showint = False
 showhubint = False
@@ -413,7 +415,7 @@ class UsbDevice:
 		self.children.sort(key=usbsortkey)
 
 	def __str__(self):
-		if self.iclass == 9:
+		if self.iclass == HUB_ICLASS:
 			col = cols[2]
 			if noemptyhub and len(self.children) == 0:
 				return ""
@@ -421,7 +423,7 @@ class UsbDevice:
 				strg = ""
 		else:
 			col = cols[1]
-		if not nohub or self.iclass != 9:
+		if not nohub or self.iclass != HUB_ICLASS:
 			if self.nointerfaces == 1:
 				plural = " "
 			else:
@@ -431,7 +433,7 @@ class UsbDevice:
 				 cols[1], self.vid, self.pid, cols[0],
 				 self.iclass, self.usbver, self.speed, self.maxpower,
 				 self.nointerfaces, plural, col, self.name, cols[0])
-			if self.iclass == 9 and not showhubint:
+			if self.iclass == HUB_ICLASS and not showhubint:
 				strg += " %shub%s\n" % (cols[2], cols[0])
 			else:
 				strg += "\n"
-- 
2.21.0

