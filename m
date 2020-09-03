Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040F625BDD8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgICIux (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgICIuv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 04:50:51 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF24C061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 01:50:51 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id u20so1784744pfn.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 01:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VLwjdBqRP5KkcLfMJcD+59nZi8fno4/2R2tsm4OK2/w=;
        b=lDiEqWVSOU/DjR1ocEMpGLX2pDaznvUAuyMp3tzErVSbqq1/ZWzqNVhKxKOLadxd54
         BRDecgkNVErRs0tWJJ2vGVF4HBtKFwqd6vW6GG3rH/5jj1BSLrUKkQeaTt1xf69VH/F6
         60P/LfJAJUgELVnw9x0oSLZbiB4MUuZzp3AdA+Kb1RMOp/E4SWhH9Y+rYAj3PV+411ov
         hrFUB5lMb9mMwYWtXctueV/1L6HNUrtQLzpvNL6xhocwKmI29far2jM/w8ek6o3aiUdc
         UmzVkpKbBG8xo9HM5bZ1SbfwVfhZRvO7BitIUMIjbRe/NCw5NkDJ2GoSquvstnrKxfIO
         ViCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VLwjdBqRP5KkcLfMJcD+59nZi8fno4/2R2tsm4OK2/w=;
        b=IczDET6CFZ9MFlShRoPhyMCHl5mMY58k2C4oD6xAadahvBur0Tk9Uz1oCWmdjh14BQ
         RISOzaMdhhMxdPAYTQG/zSIcVNchMAGG3zjSt7WePxMbb3n+UhyIyTIsvzPXHLad/sUQ
         wss6iNo66+Pyjex9+/e7Nhvxz++ftW5U9ZLm0WX8ev3U2qyd/gdD9kiGtI/olZmpjGh8
         woO9z3wJoIjLkVNtpEuENRx7ZP33HlhL52XKPBY4gYWifooZS4ey8FD0yGQ3gUhowAlq
         oKhplIBNyT9g088MOVZcSXc/PzL61B7/0XvzSA/lmKi+L7JEDWrlY7e62zSSQwacbJx3
         sr3w==
X-Gm-Message-State: AOAM5308CK4JpIMEGD0Waim3pZtmE/a+s867VUp8BIEhxNPPmEUM6foW
        9llVOvBI3I6hl3Cx251LEakx8ISw4sk=
X-Google-Smtp-Source: ABdhPJypSXMabgALkVqbO1levj57oYbbaDis9RfrH7+CDHw7zXSHHMkKKqwaCy2PMQ8wRUsiHAE18g==
X-Received: by 2002:a63:2782:: with SMTP id n124mr332299pgn.319.1599123050317;
        Thu, 03 Sep 2020 01:50:50 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id i9sm1945760pgb.37.2020.09.03.01.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:50:49 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v5 1/2] usb-storage: fix sdev->host->dma_dev
Date:   Thu,  3 Sep 2020 16:50:34 +0800
Message-Id: <20200903085035.307720-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903083404.GA2169202@kroah.com>
References: <20200903083404.GA2169202@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use scsi_add_host_with_dma() instead of scsi_add_host() in usb.c and uas.c.

When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
to the dma max mapping size. Therefore, the correct device that should be used
for the clamping needs to be set.

The same clamping is still needed in the USB drivers as hw_max_sectors could be
changed there. The original clamping would be invalidated in such cases.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
v2: fix commit message line length; bump hw_max_sectors to 2048 for SS UAS
drives; split the "fallback" hw_max_sectors setting into another patch
v3: use a different approach: fix the dma_dev instead
v4: add the changelog of the patch series
v5: fix changelog line length
 drivers/usb/storage/scsiglue.c |  2 +-
 drivers/usb/storage/uas.c      | 17 +++++++++++------
 drivers/usb/storage/usb.c      |  5 +++--
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index e5a971b83e3f..560efd1479ba 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -92,7 +92,7 @@ static int slave_alloc (struct scsi_device *sdev)
 static int slave_configure(struct scsi_device *sdev)
 {
 	struct us_data *us = host_to_us(sdev->host);
-	struct device *dev = us->pusb_dev->bus->sysdev;
+	struct device *dev = sdev->host->dma_dev;
 
 	/*
 	 * Many devices have trouble transferring more than 32KB at a time,
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
 
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 94a64729dc27..c2ef367cf257 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -1049,8 +1049,9 @@ int usb_stor_probe2(struct us_data *us)
 		goto BadDevice;
 	usb_autopm_get_interface_no_resume(us->pusb_intf);
 	snprintf(us->scsi_name, sizeof(us->scsi_name), "usb-storage %s",
-					dev_name(&us->pusb_intf->dev));
-	result = scsi_add_host(us_to_host(us), dev);
+					dev_name(dev));
+	result = scsi_add_host_with_dma(us_to_host(us), dev,
+					us->pusb_dev->bus->sysdev);
 	if (result) {
 		dev_warn(dev,
 				"Unable to add the scsi host\n");
-- 
2.28.0

