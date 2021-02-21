Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FCA32093F
	for <lists+linux-usb@lfdr.de>; Sun, 21 Feb 2021 09:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhBUIwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Feb 2021 03:52:41 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58687 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhBUIwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Feb 2021 03:52:40 -0500
Received: from [123.112.65.49] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1lDkT6-0000TV-Gq; Sun, 21 Feb 2021 08:51:57 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-usb@vger.kernel.org, hdegoede@redhat.com, oneukum@suse.com,
        gregkh@linuxfoundation.org
Cc:     hui.wang@canonical.com
Subject: [PATCH] USB: UAS: don't unbind and rebind the driver during usb_reset_device
Date:   Sun, 21 Feb 2021 16:51:00 +0800
Message-Id: <20210221085100.4297-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Once pre_reset() or post_reset() returns non-zero, the disconnect()
and probe() of the usb_driver will be called. In the disconnect(),
the scsi_host will be removed and be freed after scsi_host_put(), in
the probe(), the new scsi_host and uas_dev_info will be created.

If the usb_reset_device() is triggered by eh_device_reset_handler(),
and pre_reset()/post_reset() returns non-zero, the disconnect() and
probe() will be called, then returns to the eh_device_reset_handler(),
it still accesses old scsi related variables and uas_dev_info, and so
do its caller functions.

Here change the pre_reset() and post_reset() to let them only return
0, after this change, the usb_reset_device() will only reset this
usb devcie from its hub port, will not execute unbind and rebind
usb_driver during reset.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/usb/storage/uas.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index bef89c6bd1d7..c66287448e34 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -1121,7 +1121,6 @@ static int uas_pre_reset(struct usb_interface *intf)
 	if (uas_wait_for_pending_cmnds(devinfo) != 0) {
 		shost_printk(KERN_ERR, shost, "%s: timed out\n", __func__);
 		scsi_unblock_requests(shost);
-		return 1;
 	}
 
 	uas_free_streams(devinfo);
@@ -1152,7 +1151,7 @@ static int uas_post_reset(struct usb_interface *intf)
 
 	scsi_unblock_requests(shost);
 
-	return err ? 1 : 0;
+	return 0;
 }
 
 static int uas_suspend(struct usb_interface *intf, pm_message_t message)
-- 
2.25.1

