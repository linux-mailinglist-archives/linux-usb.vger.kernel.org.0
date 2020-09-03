Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADB425C89E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 20:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgICSRj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 14:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICSRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 14:17:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8E9C061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 11:17:38 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u128so2982013pfb.6
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 11:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UogfL6cduRwRQNe6hBusItUBEqxEtygL++0UT6QBUJM=;
        b=SeoM7BUrFNVcfpcnI3XyQRqyH9Nlb2ONE+dCKfrOnFPLw6CaLkA1rydGaZUYCT7Z6s
         CZBYDZeB7po+re1bm1HlHPip4Gt6tS0+7IVIwjidL8EhitFNv8ztd8C9mo+6vTrHkZmn
         9ntrNKC8cEEXsiIyE0nkrR/K9BVAADxOMYlWTsVwkV0PXCPlBAY03RQZaIs3QzgvSJt2
         C5hEzNCz/PorW+Uxadg7edtbdC9kHmskEd5hm43GpJclxDWLYgPNa5T/U/HneEMYjPae
         bIXzsRx201M2pT4p6+B07mNW6mrsNi2KAtNH1zKX/p1jhj4rJY+5LbsQWp9p6phTwE0k
         0N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UogfL6cduRwRQNe6hBusItUBEqxEtygL++0UT6QBUJM=;
        b=DKJthHIzaKeOwroG/czygIgsrLkxYB7S8/n+Ph05pqR8w5cmHdxFkvLF37BWnhx/dH
         82HG+y+teqpC3cyY5iPW2K9SZnCHWXENNzEnSNbQlPXSnphFt0MBqPxQzfhBeHdunow/
         SLGTBhREF3MS3SPX3kACpZJ4Pe+VlHEXSIRXEsmH3OVE6o40we0jKoB4PjQtuLQxS+Ne
         15tKSL4dLQO7ev3SjgNywu1j36GO3X8qkVbKU+/JVT/8L92K1Q/Q7HX96kqnzcj+a6z2
         U8nQCVhhB9PNbktmPB8WbDXTqjrCwbp5sGg9NawVZ624s+cWklGv4Llk5BlSNLslUIhA
         G1wA==
X-Gm-Message-State: AOAM530qPf+R6Aa3xf1fSMfC0wswlNCsAyq5WrnccQcKfCKSHbJEKBeL
        uX/S6wZcZWK1M9Y71TfJEpdTz+pXlFA=
X-Google-Smtp-Source: ABdhPJwswXH1rLlFAXmvPvhX1wSjRm+s9t+ly6fBU8mf/p/CLs7bqQGdbhDeWrGkpoiFe7nPBD9fQQ==
X-Received: by 2002:a17:902:9b8e:b029:d0:89f3:28c8 with SMTP id y14-20020a1709029b8eb02900d089f328c8mr3692362plp.4.1599157057288;
        Thu, 03 Sep 2020 11:17:37 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id r91sm3228530pja.56.2020.09.03.11.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 11:17:36 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v6 2/3] uas: fix sdev->host->dma_dev
Date:   Fri,  4 Sep 2020 02:17:24 +0800
Message-Id: <20200903181725.2931-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903181725.2931-1-tom.ty89@gmail.com>
References: <20200903155438.GC663761@rowland.harvard.edu>
 <20200903181725.2931-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use scsi_add_host_with_dma() instead of scsi_add_host().

When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
to the dma max mapping size. Therefore, the correct device that should be used
for the clamping needs to be set.

The same clamping is still needed in uas as hw_max_sectors could be changed
there. The original clamping would be invalidated in such cases.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 drivers/usb/storage/uas.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 08f9296431e9..f4beeb8a8adb 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -827,17 +827,22 @@ static int uas_slave_alloc(struct scsi_device *sdev)
 	 */
 	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
 
-	if (devinfo->flags & US_FL_MAX_SECTORS_64)
-		blk_queue_max_hw_sectors(sdev->request_queue, 64);
-	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
-		blk_queue_max_hw_sectors(sdev->request_queue, 240);
-
 	return 0;
 }
 
 static int uas_slave_configure(struct scsi_device *sdev)
 {
 	struct uas_dev_info *devinfo = sdev->hostdata;
+	struct device *dev = sdev->host->dma_dev;
+
+	if (devinfo->flags & US_FL_MAX_SECTORS_64)
+		blk_queue_max_hw_sectors(sdev->request_queue, 64);
+	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
+		blk_queue_max_hw_sectors(sdev->request_queue, 240);
+
+	blk_queue_max_hw_sectors(sdev->request_queue,
+		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
+		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
 
 	if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
 		sdev->no_report_opcodes = 1;
@@ -1023,7 +1028,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	shost->can_queue = devinfo->qdepth - 2;
 
 	usb_set_intfdata(intf, shost);
-	result = scsi_add_host(shost, &intf->dev);
+	result = scsi_add_host_with_dma(shost, &intf->dev, udev->bus->sysdev);
 	if (result)
 		goto free_streams;
 
-- 
2.28.0

