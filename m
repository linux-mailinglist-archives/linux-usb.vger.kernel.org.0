Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEE825A229
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 02:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgIBAJt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 20:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBAJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 20:09:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B358C061244
        for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2020 17:09:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q1so1449444pjd.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2020 17:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KmQZ2wdfhO0u5IWuWl+x6FQWkkltxJLGpdVuQWt5oHw=;
        b=Dk3KgwNFTVpSdGefXhZtJtH3Vda0dC/6NJVIR+DlkZ8oB2hJ0li5a3wCifRJcdjfV1
         EnL6ORqTQ9jkstyEBNiH8d6W72oGWDo6X/mmsUjRWuxeaAYzJ0E3h1eqb1AAhGcS1b+D
         e0OTzzm4ZoDa9YIhLzXft3k2bAV5NE/SvI47YN0dP4EGwCF/XViHArwfllU/SvB/X1wb
         0DkyGC70HGf1YZZjJPz/yI/uAh2it5fO38M2XeDP8T2fsHkUyzX9BJvc17g1nUsGIapY
         +bqQHGVtgxnNQZ/nQkAZQjBcMlWDPWV7PQaoQzX8jdF5Br4SidafBtWfiGYlpvpTf/mT
         Duag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KmQZ2wdfhO0u5IWuWl+x6FQWkkltxJLGpdVuQWt5oHw=;
        b=N8mpMK49GL3f8z9lsuTw9oBwWoF1+bPUnNpZRgLyYor2cNHFReTjJwOIeLnFWFQ/jE
         tLHZ/sSUhCMHSbY1bd4KIyOnLF1dsru/cRpKrdCwrjWj6ws4HT+UGw4NC7D0LvmPz+G/
         sdqcy3vThglY5ZTTVgHb9ZBdMqyPa7pMk+oLi+Ocxay9do07FyYagL+neOb/HTQK+7Nq
         +UoFMv/Z6YQh3x9Ayb6yochmkZYNDcmxnosdoJgVxxY2Rp8yUEp4oLLkEEhnXuYSZGoB
         tH051BnJzmzEiitP1tX6PV6N+ZFRcF5b/oYb33F6qaULIfnMQrV8eL0f+T/gaezLxxR5
         PIaQ==
X-Gm-Message-State: AOAM531H6YI2C/G6eH4CsczyP+jPJwPont2YnmAgowZAs1txOJYzTkET
        JwF5ywLdiYqlT3vp71QoD6IlJrKis48=
X-Google-Smtp-Source: ABdhPJwqhgljx/eTSJD722PxeNGnmx5m2aVdF/asAaGTRtUURUGj8urShMhmqeqzDLwUoPKAVq6VJQ==
X-Received: by 2002:a17:90b:138a:: with SMTP id hr10mr4015634pjb.8.1599005386533;
        Tue, 01 Sep 2020 17:09:46 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id d77sm3352630pfd.121.2020.09.01.17.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 17:09:45 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v2 1/2] uas: bump hw_max_sectors to 2048 blocks for SS or faster drives
Date:   Wed,  2 Sep 2020 08:09:36 +0800
Message-Id: <20200902000937.2204-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901145535.GC587030@rowland.harvard.edu>
References: <20200901145535.GC587030@rowland.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no reason for uas to use a smaller value of max_sectors than
usb-storage.

Also copying the dma max mapping size clamping from usb-storage.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 drivers/usb/storage/uas.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 08f9296431e9..813c49914b9a 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -827,11 +827,6 @@ static int uas_slave_alloc(struct scsi_device *sdev)
 	 */
 	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
 
-	if (devinfo->flags & US_FL_MAX_SECTORS_64)
-		blk_queue_max_hw_sectors(sdev->request_queue, 64);
-	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
-		blk_queue_max_hw_sectors(sdev->request_queue, 240);
-
 	return 0;
 }
 
@@ -839,6 +834,20 @@ static int uas_slave_configure(struct scsi_device *sdev)
 {
 	struct uas_dev_info *devinfo = sdev->hostdata;
 
+	struct us_data *us = host_to_us(sdev->host);
+	struct device *dev = us->pusb_dev->bus->sysdev;
+
+	if (devinfo->flags & US_FL_MAX_SECTORS_64)
+		blk_queue_max_hw_sectors(sdev->request_queue, 64);
+	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
+		blk_queue_max_hw_sectors(sdev->request_queue, 240);
+	else if (us->pusb_dev->speed >= USB_SPEED_SUPER)
+		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
+
+	blk_queue_max_hw_sectors(sdev->request_queue,
+		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
+		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
+
 	if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
 		sdev->no_report_opcodes = 1;
 
-- 
2.28.0

