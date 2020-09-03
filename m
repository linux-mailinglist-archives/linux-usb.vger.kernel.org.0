Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398E725BDAA
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbgICIq7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgICIqy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 04:46:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2421DC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 01:46:54 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so1745513pfw.9
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=beFsdmSBbRn+LGiu9ewoJnarM2j/jK8DgQ2Vvf17gI0=;
        b=CH8Wo8HhX80hsjwqP6BU/Cgn4s6ol+K0ryn6k6q3pkRlzxi8wpoUAirBmsnVsSz1de
         QvFnMESHznFRlQ7LxGrvJ0mx3uL8k+gKi4ARgmpaBxcFk3qTtkI1Z9GUYbOuTG6zmxZX
         U0/U/AIs2Gl1tW/PHLioXuDua4B16MnOg2lOmYxV6dx+f8PxdfhwOpy7ll91DEjW1+yR
         9tMn7/03PY6S0T8LGFZqueG7DbKZlB9uGsdyU4tfEtJ2t4JwrHGHQWs0dIMAkOCDSZEK
         kSvClKec0uHXbk74RS8eYzaLYMYJL6Icf5yZ9N0kUDov8MzKSW6RVuZRiKUTmhuKDKdn
         57Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=beFsdmSBbRn+LGiu9ewoJnarM2j/jK8DgQ2Vvf17gI0=;
        b=hYJVENTaxPnMoptVFJM8/7V7xE6fAv7f0D2V+seG8ywq9tbVSF6tCSAD8rD1PjKgYi
         OY1PeOVCQrnxQEY8+sYkkD9sbSXE8XrRwqm9LyIZ3sOMPOlUQ7hG8wYSI6TeuWqIs7Py
         zyFy6e/KjAMtzkHo9rarhM/JhAT4qoMvasFSheQtALxoqqOyR3VvWtB+Xd+3EcMI8qRs
         5ds4mOQAvEPxNvzI6aE3Vx3gycL19c8KAay5+dFy28xRVVULmH7j8tn1QSktNmFHsoYw
         BVZn5Fz8ZG3leIzY5Z3AipmV3MAAOAL8phEqWVGfpcEm82uOoXo2ytCv++WukG6rWw6u
         8ACw==
X-Gm-Message-State: AOAM5312BYS5QWWSRZaiwCS/gAknDvOFVDxLdrT8negsnl14HAclM44C
        8RZdm2hPCI/fLGtogUKrg8//oGagfBY=
X-Google-Smtp-Source: ABdhPJyWOxQmcP0N/y+X6HgmHWwT9hHcFdB0Vvqj7eXLa6nu8uI2Kta80cR1BMxFqxjx1/SP2apT4A==
X-Received: by 2002:a63:d25:: with SMTP id c37mr1999418pgl.403.1599122812161;
        Thu, 03 Sep 2020 01:46:52 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id k5sm1840180pjq.5.2020.09.03.01.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 01:46:51 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v4 1/2] usb-storage: fix sdev->host->dma_dev
Date:   Thu,  3 Sep 2020 16:46:44 +0800
Message-Id: <20200903084645.287856-1-tom.ty89@gmail.com>
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
v2: fix commit message line length; bump hw_max_sectors to 2048 for SS UAS drives; split the "fallback" hw_max_sectors setting into another patch
v3: use a different approach: fix the dma_dev instead
v4: add the changelog of the patch series
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

