Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279AB14705
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbfEFJDs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:48 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39220 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfEFJDs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:48 -0400
Received: by mail-ed1-f65.google.com with SMTP id e24so14494919edq.6
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mKFFTU+BZR9xKQptqP0FhkUKSrzsJE92Z2l8FT4aXFk=;
        b=R3mdRTgb9nrG8mVuRd88kqw7HYU2OFSOyChIJunQRIwbHSMH/L1ofMKTWK5Cx20tPN
         4b+jlL2FcRJQGCSepH37WRYVSzO5UEchhoHsCZNbgngE+hSiiSN1wx+uhlUeAUAXBSuP
         oi5iviOGx7tQBxDx5QSAb56m2dOpsFps6Pv9DkAK1yTEDHJcxMIkv5LMhWDTDPLQW5It
         9oamymWh50sRa4tSLoyl/zMI2LDc4nlFe3Zn2LWfqG6++f4s38L+Jfg6Fps0Dz++KpBE
         xLxIr/GuQJIGNXlmtSnv+OolxdLZcUrFtJpxFsJyXQyhGdU8BOSKC6RS+wQWvIDiyFpI
         w6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mKFFTU+BZR9xKQptqP0FhkUKSrzsJE92Z2l8FT4aXFk=;
        b=j145E0LDDmE2aA5g1RzlDI5t/lfdqpIdq2xYxrPz25ey9DsAkUP0I7ZLK0xo81Cfr9
         Qy5NNV9DZEJmt92FEhlBRxM+Awk6ujtT9Oo+DIRaoEX8HZ5/dAh4b5hu3DNVlM+OIpIm
         QOusZEqH/ew52DIyL4x9i5Wc+1xhJR4qXQngcOkZr7yk6XuUch6uc3EmV8v4EirAy+AN
         EIRHRPCMBX16ytPGmpLqzKA4rlDmvxNQ7phg3fjGjqZOvQh3L/jIR/8a/PtxPO0EKdDP
         8VkCl1WtwV1Dlb1Hm0QyMRsNd7Lp6klNdDuKb8zOqRX92R5oTTq+eIdDKSRyw7Mw7cyA
         Ftww==
X-Gm-Message-State: APjAAAVdRt9eDMwVJYiky6PQuJlL+mw1U7HDc5wj7ZQEoQiBwGQ3XCCm
        A52jiDTxNVDgqhzBfduCAI8k6EqA3qA=
X-Google-Smtp-Source: APXvYqzPF91eLx+F2DsVcrCHIpND7P2QwCN+tpmCq6QWcrgIh2ZwWxOTvm4f7YrWjvk5Gd9KLKCQPA==
X-Received: by 2002:a50:e79b:: with SMTP id b27mr25070045edn.281.1557133426141;
        Mon, 06 May 2019 02:03:46 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id o9sm2787877edh.95.2019.05.06.02.03.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:45 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 18/34] lsusb.py: use 'elif' where suitable
Date:   Mon,  6 May 2019 12:02:25 +0300
Message-Id: <20190506090241.169665-19-grawity@gmail.com>
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
 lsusb.py.in | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index f19401c..74d8c8d 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -12,7 +12,10 @@
 
 # Py2 compat
 from __future__ import print_function
-import os, sys, re, getopt
+import getopt
+import os
+import re
+import sys
 
 # Global options
 showint = False
@@ -513,32 +516,24 @@ def main(argv):
 		if opt[0] in {"-h", "--help"}:
 			usage()
 			sys.exit(0)
-		if opt[0] in {"-i", "--interfaces"}:
+		elif opt[0] in {"-i", "--interfaces"}:
 			showint = True
-			continue
-		if opt[0] in {"-I", "--hub-interfaces"}:
+		elif opt[0] in {"-I", "--hub-interfaces"}:
 			showint = True
 			showhubint = True
-			continue
-		if opt[0] in {"-u", "--hide-empty-hubs"}:
+		elif opt[0] in {"-u", "--hide-empty-hubs"}:
 			noemptyhub = True
-			continue
-		if opt[0] in {"-U", "--hide-hubs"}:
+		elif opt[0] in {"-U", "--hide-hubs"}:
 			noemptyhub = True
 			nohub = True
-			continue
-		if opt[0] in {"-c", "--color"}:
+		elif opt[0] in {"-c", "--color"}:
 			cols = (norm, bold, red, green, amber, blue)
-			continue
-		if opt[0] == "-w":
+		elif opt[0] == "-w":
 			print("Warning: option -w is no longer supported", file=sys.stderr)
-			continue
-		if opt[0] in {"-f", "--usbids-path"}:
+		elif opt[0] in {"-f", "--usbids-path"}:
 			usbids = [opt[1]]
-			continue
-		if opt[0] in {"-e", "--endpoints"}:
+		elif opt[0] in {"-e", "--endpoints"}:
 			showeps = True
-			continue
 	if len(args) > 0:
 		print("Error: excess args %s ..." % args[0], file=sys.stderr)
 		sys.exit(2)
-- 
2.21.0

