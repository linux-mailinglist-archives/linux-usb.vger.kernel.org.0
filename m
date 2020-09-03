Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AED2125BBFD
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 09:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgICH4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 03:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgICH4s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 03:56:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E9DC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 00:56:48 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so1622457pfc.12
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snrx0dNGkfQ13DSaHbehNypGaEnu54r6TKdLubPoN6o=;
        b=RHtrNQNK7NE3uNrZPxj7MQgQ0EbK5LEK/748PQkluIquP/avxEZqgwr2oOMtsU+M4Q
         Q0mEPBOUUEphEuEUtXm1a7aYg6L7xQo/gxbXf0zAMZvTJtgRqE5nF6Zza5OQwUU19AUm
         2v7MdJqEJvflzjCUDWMUzzUeCvkqOdDViakFnVDuhGYusmgkvNq7Cy8xDUlVMwT0tDjZ
         MGmPM2xZCp46mcc3pXewF43QzkOmV87p7FcLcwhc8KlsVyxxtxtw7Z8oMSJuMGejbVE2
         GAkHbdb2NGMnrYyxTIg7EpjUIWCRtyQGVisexUi1/PstIyWQaTU62vOPiKoh0FJ9ttpT
         waaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=snrx0dNGkfQ13DSaHbehNypGaEnu54r6TKdLubPoN6o=;
        b=ccV8lW0UVmSDX95YaRA3vtchgP+7E60AJZsNYK/rTaFrduGsKbffbdvoe0C51qahB6
         eLoiZJySNoEikKcsUrNQuaQP0XqRDSIrYOCtuPBcdPvx5CNbqkzAcjr7tpX+fJh118JO
         HExQejGmhkkLMUp94txVx/IBwYFtMqMJVqNWfIXvCamzXRVMVwy0BCJ9Pnax9V8pd2lf
         wS2dIfihnFBDq2ZQ+yAUXjDGicr+m0pbYWothNN7bQEKBXl04uFr5vjS9AvgttuPqzIK
         6wmuf00NCqbkQmBZUWgzN0gwdxD67aILyw2Ap/wpSwUMvjtNkiL8zGCz5xSyhdyapeOb
         UqCQ==
X-Gm-Message-State: AOAM531mFNpois/yjT6f8LHRZNiUIPXnsiZdwC1+YYiSV2MQa5N4lr0i
        Ozjl5BNVPwQJtcdoXWe58FCXe2b3keo=
X-Google-Smtp-Source: ABdhPJzQmf/IxTGS1ZBhS9ADlzpsLWOzHnqqGv2DC+lb0zAwWxm06HKm15TaqXdGeGs25QWgVave4A==
X-Received: by 2002:a62:1c4c:: with SMTP id c73mr2726107pfc.124.1599119807128;
        Thu, 03 Sep 2020 00:56:47 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
        by smtp.gmail.com with ESMTPSA id l13sm1787607pgq.33.2020.09.03.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 00:56:46 -0700 (PDT)
From:   Tom Yan <tom.ty89@gmail.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, arnd@arndb.de
Cc:     cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        Tom Yan <tom.ty89@gmail.com>
Subject: [PATCH v3 1/2] usb-storage: fix sdev->host->dma_dev
Date:   Thu,  3 Sep 2020 15:56:38 +0800
Message-Id: <20200903075639.31138-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
References: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
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

