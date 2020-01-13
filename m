Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7F11389BE
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 04:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733271AbgAMDb1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jan 2020 22:31:27 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16393 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732961AbgAMDb0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jan 2020 22:31:26 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e1be4790001>; Sun, 12 Jan 2020 19:31:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 12 Jan 2020 19:31:25 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 12 Jan 2020 19:31:25 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 03:31:25 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 13 Jan 2020 03:31:24 +0000
Received: from ubuntu.nvidia.com (Not Verified[10.19.108.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e1be48c0000>; Sun, 12 Jan 2020 19:31:24 -0800
From:   EJ Hsu <ejh@nvidia.com>
To:     <oneukum@suse.com>
CC:     <linux-usb@vger.kernel.org>, <ejh@nvidia.com>
Subject: [PATCH] usb: uas: fix a plug & unplug racing
Date:   Sun, 12 Jan 2020 19:30:35 -0800
Message-ID: <20200113033035.50875-1-ejh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578886266; bh=SHTMPGGVzYYZv1Mtm7Ic7bFvZ5XUMpPZzATlro7BtqI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=AXyn/0mok/QhrBb82WlqIbfHuzJFywAZU364j66aAz9T6MAviA/SDa03UT0pB+1B6
         RTZSD1OS6fGmwKsui8oo8VEn6eMc9guajkqyDd8ceAoKQT3IaqjowXU32hhiCtBwzK
         SP6qikG4pwB/w5xnxaWJh6lXEqRBGD2ka2g3EpIhIAOqO96LIc2MpGJPZnrDmIMS3b
         8pBHaPp5MdfIov1Tq46MSAAX9vvDn37UA2icrjYPJ0KZQYwxF4K3xM215DXtASKZsE
         pwxnf1f20Rl7k5MKKd10fnPAUGrLy6wWwjOfBtNexw6WgU+Cmx3zAmmtNDaWlf75+V
         9itB16SCT4eog==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a uas disk is plugged into an external hub, uas_probe()
will be called by the hub thread to do the probe. It will
first create a SCSI host and then do the scan for this host.
During the scan, it will probe the LUN using SCSI INQUERY command
which will be packed in the URB and submitted to uas disk.

There might be a chance that this external hub with uas disk
attached is unplugged during the scan. In this case, uas driver
will fail to submit the URB (due to the NOTATTACHED state of uas
device) and try to put this SCSI command back to request queue
waiting for next chance to run.

In normal case, this cycle will terminate when hub thread gets
disconnection event and calls into uas_disconnect() accordingly.
But in this case, uas_disconnect() will not be called because
hub thread of external hub gets stuck waiting for the completion
of this SCSI command. A deadlock happened.

In this fix, uas will call scsi_scan_host() asynchronously to
avoid the blocking of hub thread.

Signed-off-by: EJ Hsu <ejh@nvidia.com>
---
 drivers/usb/storage/uas.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 95bba3ba6ac6..d367718fef45 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -42,9 +42,11 @@ struct uas_dev_info {
 	unsigned cmd_pipe, status_pipe, data_in_pipe, data_out_pipe;
 	unsigned use_streams:1;
 	unsigned shutdown:1;
+	unsigned scan_pending:1;
 	struct scsi_cmnd *cmnd[MAX_CMNDS];
 	spinlock_t lock;
 	struct work_struct work;
+	struct work_struct scan_work;      /* for async scanning */
 };
 
 enum {
@@ -114,6 +116,20 @@ static void uas_do_work(struct work_struct *work)
 	spin_unlock_irqrestore(&devinfo->lock, flags);
 }
 
+static void uas_scan_work(struct work_struct *work)
+{
+	struct uas_dev_info *devinfo =
+		container_of(work, struct uas_dev_info, scan_work);
+	struct Scsi_Host *shost = usb_get_intfdata(devinfo->intf);
+
+	dev_dbg(&devinfo->intf->dev, "starting scan\n");
+	scsi_scan_host(shost);
+	dev_dbg(&devinfo->intf->dev, "scan complete\n");
+
+	usb_autopm_put_interface(devinfo->intf);
+	devinfo->scan_pending = 0;
+}
+
 static void uas_add_work(struct uas_cmd_info *cmdinfo)
 {
 	struct scsi_pointer *scp = (void *)cmdinfo;
@@ -982,6 +998,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	init_usb_anchor(&devinfo->data_urbs);
 	spin_lock_init(&devinfo->lock);
 	INIT_WORK(&devinfo->work, uas_do_work);
+	INIT_WORK(&devinfo->scan_work, uas_scan_work);
 
 	result = uas_configure_endpoints(devinfo);
 	if (result)
@@ -998,7 +1015,11 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (result)
 		goto free_streams;
 
-	scsi_scan_host(shost);
+	/* Submit the delayed_work for SCSI-device scanning */
+	usb_autopm_get_interface_no_resume(intf);
+	devinfo->scan_pending = 1;
+	schedule_work(&devinfo->scan_work);
+
 	return result;
 
 free_streams:
@@ -1166,6 +1187,14 @@ static void uas_disconnect(struct usb_interface *intf)
 	usb_kill_anchored_urbs(&devinfo->data_urbs);
 	uas_zap_pending(devinfo, DID_NO_CONNECT);
 
+	/*
+	 * Prevent SCSI scanning (if it hasn't started yet)
+	 * or wait for the SCSI-scanning routine to stop.
+	 */
+	cancel_work_sync(&devinfo->scan_work);
+	if (devinfo->scan_pending)
+		usb_autopm_put_interface_no_suspend(intf);
+
 	scsi_remove_host(shost);
 	uas_free_streams(devinfo);
 	scsi_host_put(shost);
-- 
2.17.1

