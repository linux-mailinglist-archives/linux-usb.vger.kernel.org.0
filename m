Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE54241D01
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 17:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgHKPPQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 11:15:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26402 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728721AbgHKPPP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 11:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597158913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=3esd2ry+DBaV82mVE8iUIQ1zvcp2TStZOt6XF639RHg=;
        b=M8nSRFu26nPZbliv3K73wfvZqdHqIjab4GFWv8QZLozIKuUys9V44McBRiAbhzqPCZNzgt
        aAPqs9nYcVTzBrfkeyZMg5q+NZdUoG4CNS2jEZAf6OGd45oeEMzPihOs1wW9DasycV4yT2
        JZw3Xhh+o673SD4l9aIJNRmWZzEsxLQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-k2YUwox8M6-tUX8-xp1XzQ-1; Tue, 11 Aug 2020 11:15:12 -0400
X-MC-Unique: k2YUwox8M6-tUX8-xp1XzQ-1
Received: by mail-qt1-f200.google.com with SMTP id m13so9998862qth.16
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 08:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3esd2ry+DBaV82mVE8iUIQ1zvcp2TStZOt6XF639RHg=;
        b=AndeSaLgATKeE++c8T5JwbAJuXNnBiUU0fwdyLGQxSc0ExtiJ/73WJ/86gMADeqTJt
         /JetBsikAD2L+0d0Z8M0oIDlf9732iRKIGD3yMVFpNtnENnoTC15Wjd4nVH6DpUBDmS7
         LYsJ4FJ7MHbxkLcRWowItMlqncX1xrlg2dDrN4rkvZZ3UiNNpwBUVsUVzuwNIQaTbFVk
         +sGUsgX5ar8c20b+KVj2OmuBp6Gi8JW4WYG021hPR+FErpUvf2lsAPmaRrPw1omLe4zW
         ckmENkd+0iYVMyClYQhM0WDvzqtm4npu0ncFt6pu1wegEvbm+hBp7mOaYNbew5LFXEj2
         d0zg==
X-Gm-Message-State: AOAM530Yt67r7M8OT1WcHQwnDNDyuhLM7q31aBOlZaMjQ6/Sr53WWSyL
        n13ykfUaYFgGjW7lonPeSO7UG3zjIGKqPRx9vNlMA6bCFbSdWC/s9qTUpAZ4zWZV3WddXMk13JN
        H6NrHp42UDBnzaWA5wLGV
X-Received: by 2002:a0c:9b85:: with SMTP id o5mr1806902qve.11.1597158911544;
        Tue, 11 Aug 2020 08:15:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGcJOYBsolI3rpKndVyNpm8v41rYZuU02gZc73pUkYiYEtHjtRWWW9Z1ky0FlZWFTQeDRHsg==
X-Received: by 2002:a0c:9b85:: with SMTP id o5mr1806860qve.11.1597158911195;
        Tue, 11 Aug 2020 08:15:11 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 8sm16358892qkh.77.2020.08.11.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 08:15:10 -0700 (PDT)
From:   trix@redhat.com
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        acozzette@cs.hmc.edu
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] USB: realtek_cr: fix return check for dma functions
Date:   Tue, 11 Aug 2020 08:15:05 -0700
Message-Id: <20200811151505.12222-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this representative problem

realtek_cr.c:639:3: warning: The left expression of the compound
  assignment is an uninitialized value. The computed value will
  also be garbage
    SET_BIT(value, 2);
    ^~~~~~~~~~~~~~~~~

value is set by a successful call to rts51x_read_mem()

	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
	if (retval < 0)
		return -EIO;

A successful call to rts51x_read_mem returns 0, failure can
return positive and negative values.  This check is wrong
for a number of functions.  Fix the retval check.

Fixes: 065e60964e29 ("ums_realtek: do not use stack memory for DMA")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/storage/realtek_cr.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 3789698d9d3c..b983753e2368 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -481,16 +481,16 @@ static int enable_oscillator(struct us_data *us)
 	u8 value;
 
 	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
-	if (retval < 0)
+	if (retval != STATUS_SUCCESS)
 		return -EIO;
 
 	value |= 0x04;
 	retval = rts51x_write_mem(us, 0xFE77, &value, 1);
-	if (retval < 0)
+	if (retval != STATUS_SUCCESS)
 		return -EIO;
 
 	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
-	if (retval < 0)
+	if (retval != STATUS_SUCCESS)
 		return -EIO;
 
 	if (!(value & 0x04))
@@ -533,7 +533,7 @@ static int do_config_autodelink(struct us_data *us, int enable, int force)
 	u8 value;
 
 	retval = rts51x_read_mem(us, 0xFE47, &value, 1);
-	if (retval < 0)
+	if (retval != STATUS_SUCCESS)
 		return -EIO;
 
 	if (enable) {
@@ -549,7 +549,7 @@ static int do_config_autodelink(struct us_data *us, int enable, int force)
 
 	/* retval = rts51x_write_mem(us, 0xFE47, &value, 1); */
 	retval = __do_config_autodelink(us, &value, 1);
-	if (retval < 0)
+	if (retval != STATUS_SUCCESS)
 		return -EIO;
 
 	return 0;
@@ -565,7 +565,7 @@ static int config_autodelink_after_power_on(struct us_data *us)
 		return 0;
 
 	retval = rts51x_read_mem(us, 0xFE47, &value, 1);
-	if (retval < 0)
+	if (retval != STATUS_SUCCESS)
 		return -EIO;
 
 	if (auto_delink_en) {
@@ -580,7 +580,7 @@ static int config_autodelink_after_power_on(struct us_data *us)
 
 		/* retval = rts51x_write_mem(us, 0xFE47, &value, 1); */
 		retval = __do_config_autodelink(us, &value, 1);
-		if (retval < 0)
+		if (retval != STATUS_SUCCESS)
 			return -EIO;
 
 		retval = enable_oscillator(us);
@@ -602,18 +602,18 @@ static int config_autodelink_after_power_on(struct us_data *us)
 
 		/* retval = rts51x_write_mem(us, 0xFE47, &value, 1); */
 		retval = __do_config_autodelink(us, &value, 1);
-		if (retval < 0)
+		if (retval != STATUS_SUCCESS)
 			return -EIO;
 
 		if (CHECK_ID(chip, 0x0159, 0x5888)) {
 			value = 0xFF;
 			retval = rts51x_write_mem(us, 0xFE79, &value, 1);
-			if (retval < 0)
+			if (retval != STATUS_SUCCESS)
 				return -EIO;
 
 			value = 0x01;
 			retval = rts51x_write_mem(us, 0x48, &value, 1);
-			if (retval < 0)
+			if (retval != STATUS_SUCCESS)
 				return -EIO;
 		}
 	}
@@ -633,37 +633,37 @@ static int config_autodelink_before_power_down(struct us_data *us)
 
 	if (auto_delink_en) {
 		retval = rts51x_read_mem(us, 0xFE77, &value, 1);
-		if (retval < 0)
+		if (retval != STATUS_SUCCESS)
 			return -EIO;
 
 		SET_BIT(value, 2);
 		retval = rts51x_write_mem(us, 0xFE77, &value, 1);
-		if (retval < 0)
+		if (retval != STATUS_SUCCESS)
 			return -EIO;
 
 		if (CHECK_ID(chip, 0x0159, 0x5888)) {
 			value = 0x01;
 			retval = rts51x_write_mem(us, 0x48, &value, 1);
-			if (retval < 0)
+			if (retval != STATUS_SUCCESS)
 				return -EIO;
 		}
 
 		retval = rts51x_read_mem(us, 0xFE47, &value, 1);
-		if (retval < 0)
+		if (retval != STATUS_SUCCESS)
 			return -EIO;
 
 		SET_BIT(value, 0);
 		if (CHECK_ID(chip, 0x0138, 0x3882))
 			SET_BIT(value, 2);
 		retval = rts51x_write_mem(us, 0xFE77, &value, 1);
-		if (retval < 0)
+		if (retval != STATUS_SUCCESS)
 			return -EIO;
 	} else {
 		if (CHECK_ID(chip, 0x0159, 0x5889) ||
 		    CHECK_ID(chip, 0x0138, 0x3880) ||
 		    CHECK_ID(chip, 0x0138, 0x3882)) {
 			retval = rts51x_read_mem(us, 0xFE47, &value, 1);
-			if (retval < 0)
+			if (retval != STATUS_SUCCESS)
 				return -EIO;
 
 			if (CHECK_ID(chip, 0x0159, 0x5889) ||
@@ -677,14 +677,14 @@ static int config_autodelink_before_power_down(struct us_data *us)
 
 			/* retval = rts51x_write_mem(us, 0xFE47, &value, 1); */
 			retval = __do_config_autodelink(us, &value, 1);
-			if (retval < 0)
+			if (retval != STATUS_SUCCESS)
 				return -EIO;
 		}
 
 		if (CHECK_ID(chip, 0x0159, 0x5888)) {
 			value = 0x01;
 			retval = rts51x_write_mem(us, 0x48, &value, 1);
-			if (retval < 0)
+			if (retval != STATUS_SUCCESS)
 				return -EIO;
 		}
 	}
-- 
2.18.1

