Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7719B146F6
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfEFJDZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:25 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35606 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfEFJDZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:25 -0400
Received: by mail-ed1-f68.google.com with SMTP id p26so14499409edr.2
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LZ9j3yNOApf6nKPRCTYe6aiZvBqOM02XLcTwOWcYfsM=;
        b=X+z8tl6G+66//UeEwHvhGz3r9kx0ilmUiu5rT7iS5LTFPPJRvHVC7GtGruwA+CD6Fr
         UvvRWBhkTpVWXbPdduO8eQvArGbguPgIMGhusgF0ZzxAL15TnM3kb6wQv81Ta1S9+qHT
         V+amLwWJnd/TUYLQmq2PK1OeXRim9zCn1pgYt9LM0n8BxuKpatNW/dVXa4yP2ZcggCkd
         deQvnBE+fF/yrvhw4Kj1RyutNecQn52sAlM0rM6kKINgfh5hVx5EteCn6fmj05EXZIu8
         mctYoD0Hj1LnMy/FM+P2FfijVhBvxsWbaa3oWiF0s3eDOQmJFTWHbTDwYjDMz5Ibcl+m
         VVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LZ9j3yNOApf6nKPRCTYe6aiZvBqOM02XLcTwOWcYfsM=;
        b=oz8U55KOzuXgyXidXqaIPDQRn9MCbVypYTA4tLFPAu7Rf7EC60Sq12RtxV5jaQ9gHU
         rvJxGkuSwC8ze0BlzHG9zzFRJip2fAl/nUBHCPauOK4HCbmD6g0hJLeMIsE+f62XhLy9
         NkSE7SpmRgf7jP1uiSHcCi6KEN5HBhNjgkyAZi1nXdW8Zv8QiMonyRownaGZPtSs2aTp
         mtpUs9MstAMa1BM3eeBLg3INupCfwVDPCT8xiXc+Oynj2hAF3lMvLjcBsGDuVc8GPjcf
         6oEIOZYh1E5qmWk9W0AmZlRFFeOCslMgmchAqr0N4UQcEKCb2v8RmqmhGz6HlcIXIkdH
         qVTQ==
X-Gm-Message-State: APjAAAU38qsExZ0uWdQuIzRenkPE9Q0NFmFNR3nVYHV+8VoPwBsBAH4c
        i+ZRqGjsPnkU9cKsXUhpBvqmhHOGBLg=
X-Google-Smtp-Source: APXvYqwCOV2jVV1D/yjbx2isKkhYqf/2Yz9wg4RNcmcktN7uM/e9TsHFUMwDpai0rTXHgFG/4RYyvg==
X-Received: by 2002:a17:906:69b:: with SMTP id u27mr12022889ejb.256.1557133402542;
        Mon, 06 May 2019 02:03:22 -0700 (PDT)
Received: from localhost (frost.work.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id v17sm802957ejj.33.2019.05.06.02.03.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:21 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 04/34] lsusb.py: replace fake deepcopy()
Date:   Mon,  6 May 2019 12:02:11 +0300
Message-Id: <20190506090241.169665-5-grawity@gmail.com>
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

It doesn't actually do a deep copy, and Python already has ways of doing
a shallow copy (list(foo) and [*foo] for arbitrary iterables; foo[:] for
indexable lists).

Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
---
 lsusb.py.in | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index e54ee75..9ca734c 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -518,13 +518,6 @@ class UsbDevice:
 			str += child.__str__()
 		return str
 
-def deepcopy(lst):
-	"Returns a deep copy from the list lst"
-	copy = []
-	for item in lst:
-		copy.append(item)
-	return copy
-
 def display_diff(lst1, lst2, fmtstr, args):
 	"Compare lists (same length!) and display differences"
 	for idx in range(0, len(lst1)):
@@ -534,7 +527,7 @@ def display_diff(lst1, lst2, fmtstr, args):
 def fix_usbvend():
 	"Sort USB vendor list and (optionally) display diffs"
 	if warnsort:
-		oldusbvend = deepcopy(usbvendors)
+		oldusbvend = usbvendors[:]
 	usbvendors.sort()
 	if warnsort:
 		display_diff(usbvendors, oldusbvend, 
@@ -544,7 +537,7 @@ def fix_usbvend():
 def fix_usbprod():
 	"Sort USB products list"
 	if warnsort:
-		oldusbprod = deepcopy(usbproducts)
+		oldusbprod = usbproducts[:]
 	usbproducts.sort()
 	if warnsort:
 		display_diff(usbproducts, oldusbprod, 
@@ -554,7 +547,7 @@ def fix_usbprod():
 def fix_usbclass():
 	"Sort USB class list"
 	if warnsort:
-		oldusbcls = deepcopy(usbclasses)
+		oldusbcls = usbclasses[:]
 	usbclasses.sort()
 	if warnsort:
 		display_diff(usbclasses, oldusbcls,
-- 
2.21.0

