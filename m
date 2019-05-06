Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61542146F8
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbfEFJD3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:29 -0400
Received: from mail-ed1-f41.google.com ([209.85.208.41]:37633 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJD2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:28 -0400
Received: by mail-ed1-f41.google.com with SMTP id w37so14495569edw.4
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1R1kGTgCL4+P1GzSjlvm2gLqBkVFGYi+9VwESTtf+w=;
        b=S++EN50R1EndzPfZHAvUQrsBlT8Xc0ud6+NAIvgKoPAV15+Q/h+RKVLTHwJxL1ozNR
         fwQzTyB0ce4aDtHsFxpzDjJS6OwpAiBf4IaoanWpLGBkYxTuAJqOExNGa3OGtl4S2Vh6
         Cw3emVR8Y7RE+sHaWQwGDb+tQbTVRqsvn3uxpdWtMAry7ljLRdOyv/qkl1raLCP6sN1N
         4RjStzYsU8nP8WdDE3Y59zNUW8Us65ys2XJPrImbCwfHCbzvNLI2Ykt72+uvGQ8nUdiD
         NzcKOC98XDyRM7QzCIpAkS/hfRROMJd4SqlYuU3M2YLbbE9lo6EtQ10kyQxTri0rkXf0
         c2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1R1kGTgCL4+P1GzSjlvm2gLqBkVFGYi+9VwESTtf+w=;
        b=PjomjPBLh74I2I8RYdl2R7wgp9ILOJ2AVTSNcGGwib5okgpbLYiwV8J2asAfKyHlH2
         1dsAsWEl1IOeNwIHafGeq7hxyYVjJSyl+IoTpwe9dMpdc3m3IE6b603yVoH+HbIMuUC9
         UY+PRpKX1da/kBmXMt8TlcnYYAAWG7ilRZRtwV4L/zH2T3UM9ZSrgcWIYDme+/tHI/EZ
         TE5w2j2MUIGo48asvzAweiZQpzAsPSIVprX2kZYOrrnl7SEUvh60+bkzLC7zBamEup+7
         v/8PRmPOyGTSnB2Ff/YBqttUOfPDSsZJiWJWH1+AQG2p7x6bVqugGHTY4m21d65xjpD6
         1sGg==
X-Gm-Message-State: APjAAAUH+gEGnIeLMprc4U+xXNccOUfZ2hPwQZyKa41U5SVxV+0xUI0P
        0eRzEgFqUHmuoe6GP+9DPryvgffLzgg=
X-Google-Smtp-Source: APXvYqw5lWYoQwzs25Ul3AitdRBgH1WGEGLNJTherj3WR/1W5/vR2Pz6844YvoU5TI8g1AZmEwNw9A==
X-Received: by 2002:a50:9441:: with SMTP id q1mr24445863eda.101.1557133406628;
        Mon, 06 May 2019 02:03:26 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id g7sm1457334ejl.73.2019.05.06.02.03.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:25 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 06/34] lsusb.py: ensure all error messages are written to stderr
Date:   Mon,  6 May 2019 12:02:13 +0300
Message-Id: <20190506090241.169665-7-grawity@gmail.com>
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
index b0964c1..e09b4cf 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -558,7 +558,7 @@ def main(argv):
 	try:
 		(optlist, args) = getopt.gnu_getopt(argv[1:], "hiIuUwcef:", ("help",))
 	except getopt.GetoptError as exc:
-		print("Error:", exc)
+		print("Error:", exc, file=sys.stderr)
 		sys.exit(2)
 	for opt in optlist:
 		if opt[0] == "-h" or opt[0] == "--help":
@@ -592,7 +592,7 @@ def main(argv):
 			showeps = True
 			continue
 	if len(args) > 0:
-		print("Error: excess args %s ..." % args[0])
+		print("Error: excess args %s ..." % args[0], file=sys.stderr)
 		sys.exit(2)
 
 	if usbids[0]:
-- 
2.21.0

