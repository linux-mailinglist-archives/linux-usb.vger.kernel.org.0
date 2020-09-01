Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C043D2587AB
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 07:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIAFyt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 01:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgIAFyt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 01:54:49 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EC0C0612A3
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 22:54:48 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d19so101367pgl.10
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 22:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8C8KNu0LvtUft86eR0DAIxVBonTyO27+DmOTnmOqSo=;
        b=FdxEeyxso7Kq7U+PB4j8Ou+WjF1TF0CYI1gsdqs3F/JwbhHk6XMPKrDtHe0oSJ40WD
         t00C9bzku4T7SSthZfxoQ6p5NrwXIie/NBoQjxKUphBHAhIZyf1UVshSZjc/DEhzf+0i
         XgfsGjLLdjIC9uSACmE3r/ibtFSo4wk67y7Bng6nH/WQW/vqAI/SHt+wj8bF7zudzmVX
         bcbvwuES3WYypQCHZltY0PG64DlRaehb7X5WpfRhf/DDKKZUqZanshLGqT/WC+13sRHe
         RdES5tZoMAeP94TqwdrXDxNQ5iBrZ21iDjOE17L2ojqs+vvBAbfBRzRegoDsDnF1tj7E
         5Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8C8KNu0LvtUft86eR0DAIxVBonTyO27+DmOTnmOqSo=;
        b=Ssfr7AfABeLFMyyWQpWsr1d1hPn4/gJgc1g+quzIQjEGEX+H7FndxBw6gzVgoUDiUY
         G5H15Omk15H948aOY+J9jQYg5/D1pXnX69X+9aUHtP4jBPBBY6bGF2Q70p6+OvNGS4Mf
         LmyiLHLLDw4jGU0WZ6eCFwTokFMd4n90fJfu/njsYZwCTVkeHs9blfdQPCqbuo8Rv3NY
         zMbCfzLOoTQ2wUw1WCifAZ8kcxGalxeD31JoqG7vDZlGED67Q79eKxEBrEv6iQ6lLqcr
         pQuLG1jf02ujlIFv42+wWj73wbU5mU1GWiL5+0HVVPGXozCagPV1nyb9tHhKukWBcNTh
         jHqA==
X-Gm-Message-State: AOAM533M6+UeTeczKLtYk/Wi5Z+gRnvopWfrK2EQfeDsKKzz+ryng/R+
        kXB0T8lU71qNh4kLHWRQfOSLtrMZC7w=
X-Google-Smtp-Source: ABdhPJyXZKRvKtlf36XyhEGyKo1an7QaudEjqTfbOJ8mJ4ehL/Vgv/hc8o6gNXLNkVW9+YUANtNymg==
X-Received: by 2002:aa7:9781:: with SMTP id o1mr336033pfp.93.1598939687801;
        Mon, 31 Aug 2020 22:54:47 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id 9sm230941pfv.22.2020.08.31.22.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 22:54:47 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH] usb-storage: always set hw_max_sectors in slave_configure to avoid inappropriate clamping
Date:   Tue,  1 Sep 2020 13:54:17 +0800
Message-Id: <20200901055417.1732-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the scsi request queue is initialized/allocated, the scsi driver clamps hw_max_sectors against the dma max mapping size of sdev->host->dma_dev. The clamping is apparently inappriorate to USB drives.

Either way we are calling blk_queue_max_hw_sectors() in the usb drivers for some (but not all) cases, which causes the clamping to be overriden (inconsistently) anyway.

Therefore the usb driver should always set hw_max_sectors and do the clamping against the right device itself.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 drivers/usb/storage/scsiglue.c | 37 ++++++++++++++++------------------
 drivers/usb/storage/uas.c      | 23 ++++++++++++++++-----
 2 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index e5a971b83e3f..804cbc0ba4da 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -120,6 +120,23 @@ static int slave_configure(struct scsi_device *sdev)
 		 * better throughput on most devices.
 		 */
 		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
+	} else {
+	    /*
+	     * Some devices are known to choke with anything larger. It seems like
+	     * the problem stems from the fact that original IDE controllers had
+	     * only an 8-bit register to hold the number of sectors in one transfer
+	     * and even those couldn't handle a full 256 sectors.
+	     *
+	     * Because we want to make sure we interoperate with as many devices as
+	     * possible, we will maintain a 240 sector transfer size limit for USB
+	     * Mass Storage devices.
+	     *
+	     * Tests show that other operating have similar limits with Microsoft
+	     * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
+	     * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
+	     * and 2048 for USB3 devices.
+	     */
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
index 08f9296431e9..cffa435afd84 100644
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
 
@@ -839,6 +834,24 @@ static int uas_slave_configure(struct scsi_device *sdev)
 {
 	struct uas_dev_info *devinfo = sdev->hostdata;
 
+	struct us_data *us = host_to_us(sdev->host);
+	struct device *dev = us->pusb_dev->bus->sysdev;
+
+	if (devinfo->flags & US_FL_MAX_SECTORS_64)
+		blk_queue_max_hw_sectors(sdev->request_queue, 64);
+	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
+		blk_queue_max_hw_sectors(sdev->request_queue, 240);
+	else
+		blk_queue_max_hw_sectors(sdev->request_queue, SCSI_DEFAULT_MAX_SECTORS);
+
+	/*
+	 * The max_hw_sectors should be up to maximum size of a mapping for
+	 * the device. Otherwise, a DMA API might fail on swiotlb environment.
+	 */
+	blk_queue_max_hw_sectors(sdev->request_queue,
+		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
+		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
+
 	if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
 		sdev->no_report_opcodes = 1;
 
-- 
2.28.0

