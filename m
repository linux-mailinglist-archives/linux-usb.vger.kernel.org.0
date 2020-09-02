Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D4C25A22C
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 02:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgIBAJx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 20:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBAJv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 20:09:51 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23691C061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 17:09:51 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id j11so1386182plk.9
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 17:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aCgtEkMZDS4B1B7GtT5isDDP0NFbvrH7N+BMafLPBbs=;
        b=CS7M0br4uxLlYTHaFR8ja9qHEhsymx9c50luvM0MexA1+EIt8TcPfy15QbHEB19DWY
         gCvEaLmqpzm8XE8MEYDy2Th9DS2Fs0cW++AoGWLsTada6aK8gKXeE4eQJReA+2U3GZqg
         Y6lNI1a2m+ucu73kFJFppU2UNWdr1W5P2RoIpt53AQLhHNRdc/ASwrWYoer9xwZPUXFS
         jWzs1yuFluTWCJA2BmofeaS/XyRgtFYGeV3AYDqm5kZ+weSWvD1Wg8qRuB0uyQOFy1n2
         qU5ZRjgQjyxt/HE3Ve9CdFgCKvHGShOu5n2f1YrTBWaH9D6EtcOf6oQxcd9TXm9kERMn
         P3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aCgtEkMZDS4B1B7GtT5isDDP0NFbvrH7N+BMafLPBbs=;
        b=oELNLvrzc8wmsLFZeGHfo6R3+4Oplm1nTXJypVCtMbaR6z5UjVNa8pBKXsEceEYV88
         PcGRi1bpbwLjQvkqTw510TN3ajuH0Wfgdd3iDGk3hHibkcVB8t+EkY+qDkOLKW28p4oB
         qSu7dgU1rOA4tIM8r4hr8XCVNilbHRY4u4YYfnXnU9rVmghl97hK5glV2XAhc9BVzRtU
         C0uAhCnt37HxPPPVhhbYaAY04SE0rMmzIDU4qROa8L064ovdQG7EDJZp23UKGI8i+q7k
         PcJ4fQtmEl8R+6uqVJUE3HXU5exhxgQCHU+tsSZhKTu3ajH4lLNPvTYrHJADzxSQj/Hn
         UMNw==
X-Gm-Message-State: AOAM533MAWLrYv2VHVOd4z6Hrb4LLQzoPheWSVJs7cRaPqfSmu7BGU3l
        n6q6+iSn3X66o1UlrGy3LOlH6PaC3vY=
X-Google-Smtp-Source: ABdhPJz9jFJ6VsCh/otSfdncQKrqYGyqpQV2zNHR2whwShbc0Kz4BY0y+Va9OiAh+obEfYIOIeL1vA==
X-Received: by 2002:a17:90a:a088:: with SMTP id r8mr3747274pjp.73.1599005390296;
        Tue, 01 Sep 2020 17:09:50 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id d77sm3352630pfd.121.2020.09.01.17.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 17:09:49 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v2 2/2] usb-storage: always set hw_max_sectors in slave_configure to avoid inappropriate clamping
Date:   Wed,  2 Sep 2020 08:09:37 +0800
Message-Id: <20200902000937.2204-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902000937.2204-1-tom.ty89@gmail.com>
References: <20200901145535.GC587030@rowland.harvard.edu>
 <20200902000937.2204-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the scsi request queue is initialized/allocated, the scsi driver clamps
hw_max_sectors against the dma max mapping size of sdev->host->dma_dev. The
device is currently inappriorate to use for USB drives.

Therefore, always (re)set hw_max_sectors in the usb drivers to invalidate the
clamping.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 drivers/usb/storage/scsiglue.c | 37 ++++++++++++++++------------------
 drivers/usb/storage/uas.c      |  2 ++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index e5a971b83e3f..1f60d777a7e8 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -120,6 +120,23 @@ static int slave_configure(struct scsi_device *sdev)
 		 * better throughput on most devices.
 		 */
 		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
+	} else {
+		/*
+		 * Some devices are known to choke with anything larger. It seems like
+		 * the problem stems from the fact that original IDE controllers had
+		 * only an 8-bit register to hold the number of sectors in one transfer
+		 * and even those couldn't handle a full 256 sectors.
+		 *
+		 * Because we want to make sure we interoperate with as many devices as
+		 * possible, we will maintain a 240 sector transfer size limit for USB
+		 * Mass Storage devices.
+		 *
+		 * Tests show that other operating have similar limits with Microsoft
+		 * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
+		 * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
+		 * and 2048 for USB3 devices.
+		 */
+		blk_queue_max_hw_sectors(sdev->request_queue, 240);
 	}
 
 	/*
@@ -626,26 +643,6 @@ static const struct scsi_host_template usb_stor_host_template = {
 	/* lots of sg segments can be handled */
 	.sg_tablesize =			SG_MAX_SEGMENTS,
 
-
-	/*
-	 * Limit the total size of a transfer to 120 KB.
-	 *
-	 * Some devices are known to choke with anything larger. It seems like
-	 * the problem stems from the fact that original IDE controllers had
-	 * only an 8-bit register to hold the number of sectors in one transfer
-	 * and even those couldn't handle a full 256 sectors.
-	 *
-	 * Because we want to make sure we interoperate with as many devices as
-	 * possible, we will maintain a 240 sector transfer size limit for USB
-	 * Mass Storage devices.
-	 *
-	 * Tests show that other operating have similar limits with Microsoft
-	 * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
-	 * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
-	 * and 2048 for USB3 devices.
-	 */
-	.max_sectors =                  240,
-
 	/* emulated HBA */
 	.emulated =			1,
 
diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 813c49914b9a..592e1358822e 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -843,6 +843,8 @@ static int uas_slave_configure(struct scsi_device *sdev)
 		blk_queue_max_hw_sectors(sdev->request_queue, 240);
 	else if (us->pusb_dev->speed >= USB_SPEED_SUPER)
 		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
+	else
+		blk_queue_max_hw_sectors(sdev->request_queue, SCSI_DEFAULT_MAX_SECTORS);
 
 	blk_queue_max_hw_sectors(sdev->request_queue,
 		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
-- 
2.28.0

