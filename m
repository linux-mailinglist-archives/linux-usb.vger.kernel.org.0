Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87322146FE
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 11:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfEFJDj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 05:03:39 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:41116 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJDj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 05:03:39 -0400
Received: by mail-ed1-f54.google.com with SMTP id m4so14501196edd.8
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ioyYgtRSWwZfgGBK06FVcuhb/YX76eFCJh3r9OTvubA=;
        b=pVbGKwTiv+xNUv1qxeKW/D368jt15VO51ZNIrZWlRJV3OC/Hd4MSRrB7AHizHyIUZp
         6E4bnaIbrWVbLfqrQckTUOeeSwpIK+2+vtj8YXS8UoFSlDQfDsY+lrCdjb0menoxrJQI
         mSAmkgPnXjdJVNGnfZU8KLdAAR1FtxmNN9XYdNuc49FvexAxoYurYU3z6Biiy9TaGOLl
         /mTOjBd2tZcgGs7JNTlLA7/JRLrBpZ/cFCcJU1GdBOclOVUAwlvGfL1uot0xxQqbjaSU
         qstdImHNKAc/spdrhvfNFUILm/S0fyYuIFF7L0Yb5B3Qid5/v/jqIb+30niVZoGVX+/+
         FIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ioyYgtRSWwZfgGBK06FVcuhb/YX76eFCJh3r9OTvubA=;
        b=BB3LhOE3XjnXqpcrq/kvp8/mYh/tm9xfTw7rDQs3numOhzqJaYOLKdMUg4NsS9k4DZ
         +v50vVKyYLoc9CEsBzuryDLZLHvXxdTxnLYRjla32i4jDGIhm4v5VYW7luQelslxbBmi
         ybd20JuuejLD0kNRRQtFf+urA8fbDEDmid9IA929/SRdMUFqCgU2QWwvbELt1/XJ9Ryi
         +jypDUKaRxTImDwwyzJeEM+E5ayog7iOgJOQrCaZPPJIKs0nOQRbM7YOb65U0wCdd090
         gh2XA6o4KqF3lLQD5Vse7SeEpuVBtHgX9mPmnuYqDIifl8GJ8eZbCK/mbZYUjDUF+ddq
         4ujA==
X-Gm-Message-State: APjAAAWxXtZ/pO8ZeCyIa95KvgRprmcnNNplkMwD1iuzVZZN92di+szo
        NHySqR56ZAE+A2QW1y9mr3GfGIPZmyA=
X-Google-Smtp-Source: APXvYqz7qG/46KxHoCfTUVtidnRwCaNOxb4ZCHkFhNZB0d73kmp7Q6OnealbFyi8Gmc0nuBoj661gQ==
X-Received: by 2002:a50:8818:: with SMTP id b24mr24983710edb.28.1557133416858;
        Mon, 06 May 2019 02:03:36 -0700 (PDT)
Received: from localhost (frost.nullroute.eu.org. [2001:778:e27f:a23:36c4:e19f:3c1:8a8])
        by smtp.gmail.com with ESMTPSA id f1sm53658edi.34.2019.05.06.02.03.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 02:03:36 -0700 (PDT)
From:   =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        =?UTF-8?q?Mantas=20Mikul=C4=97nas?= <grawity@gmail.com>
Subject: [PATCH 12/34] lsusb.py: remove now-unused bin_search()
Date:   Mon,  6 May 2019 12:02:19 +0300
Message-Id: <20190506090241.169665-13-grawity@gmail.com>
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
 lsusb.py.in | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/lsusb.py.in b/lsusb.py.in
index 26ab745..a8f18ab 100644
--- a/lsusb.py.in
+++ b/lsusb.py.in
@@ -157,25 +157,6 @@ def parse_usb_ids():
 			continue
 		mode = modes.Misc
 
-def bin_search(first, last, item, list):
-	"binary search on list, returns -1 on fail, match idx otherwise, recursive"
-	#print("bin_search(%i,%i)" % (first, last))
-	if first == last:
-		return -1
-	if first == last-1:
-		if item == list[first]:
-			return first
-		else:
-			return -1
-	mid = (first+last) // 2
-	if item == list[mid]:
-		return mid
-	elif item < list[mid]:
-		return bin_search(first, mid, item, list)
-	else:
-		return bin_search(mid, last, item, list)
-
-
 def find_usb_prod(vid, pid):
 	"Return device name from USB Vendor:Product list"
 	strg = ""
-- 
2.21.0

