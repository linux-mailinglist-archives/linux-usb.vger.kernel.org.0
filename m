Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E916936B02F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 11:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhDZJGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 05:06:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:51342 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232068AbhDZJGh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 05:06:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1619427955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=IMgmacegrTXSxBn53p5Sap+drifLJBlin5DKTtP50Pc=;
        b=RaSuDiLT1I76YBsvqthokEEdwk9SUW69p2iQB/FBd87fxSSeIN1iYpVDWhOX1idY4SGnKe
        gGhPXq3mRDtqP0g2sNI/zRfuvEMAiXl/ERG/WjHiC5WUEupjT2A8LbjMipV8K9OlgUZhGY
        IExdSYd21ZCR81AS3V6z+x/vaaRInnk=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id ED3CAB17F;
        Mon, 26 Apr 2021 09:05:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2] cdc-wdm: untangle a circular dependency between callback and softint
Date:   Mon, 26 Apr 2021 11:05:47 +0200
Message-Id: <20210426090547.19361-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have a cycle of callbacks scheduling works which submit
URBs with those callbacks. This needs to be blocked, stopped
and unblocked to untangle the circle.

V2: Fixed spelling mistakes in description

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 508b1c3f8b73..d1e4a7379beb 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -321,12 +321,23 @@ static void wdm_int_callback(struct urb *urb)
 
 }
 
-static void kill_urbs(struct wdm_device *desc)
+static void poison_urbs(struct wdm_device *desc)
 {
 	/* the order here is essential */
-	usb_kill_urb(desc->command);
-	usb_kill_urb(desc->validity);
-	usb_kill_urb(desc->response);
+	usb_poison_urb(desc->command);
+	usb_poison_urb(desc->validity);
+	usb_poison_urb(desc->response);
+}
+
+static void unpoison_urbs(struct wdm_device *desc)
+{
+	/*
+	 *  the order here is not essential
+	 *  it is symmetrical just to be nice
+	 */
+	usb_unpoison_urb(desc->response);
+	usb_unpoison_urb(desc->validity);
+	usb_unpoison_urb(desc->command);
 }
 
 static void free_urbs(struct wdm_device *desc)
@@ -741,11 +752,12 @@ static int wdm_release(struct inode *inode, struct file *file)
 	if (!desc->count) {
 		if (!test_bit(WDM_DISCONNECTING, &desc->flags)) {
 			dev_dbg(&desc->intf->dev, "wdm_release: cleanup\n");
-			kill_urbs(desc);
+			poison_urbs(desc);
 			spin_lock_irq(&desc->iuspin);
 			desc->resp_count = 0;
 			spin_unlock_irq(&desc->iuspin);
 			desc->manage_power(desc->intf, 0);
+			unpoison_urbs(desc);
 		} else {
 			/* must avoid dev_printk here as desc->intf is invalid */
 			pr_debug(KBUILD_MODNAME " %s: device gone - cleaning up\n", __func__);
@@ -1037,9 +1049,9 @@ static void wdm_disconnect(struct usb_interface *intf)
 	wake_up_all(&desc->wait);
 	mutex_lock(&desc->rlock);
 	mutex_lock(&desc->wlock);
+	poison_urbs(desc);
 	cancel_work_sync(&desc->rxwork);
 	cancel_work_sync(&desc->service_outs_intr);
-	kill_urbs(desc);
 	mutex_unlock(&desc->wlock);
 	mutex_unlock(&desc->rlock);
 
@@ -1080,9 +1092,10 @@ static int wdm_suspend(struct usb_interface *intf, pm_message_t message)
 		set_bit(WDM_SUSPENDING, &desc->flags);
 		spin_unlock_irq(&desc->iuspin);
 		/* callback submits work - order is essential */
-		kill_urbs(desc);
+		poison_urbs(desc);
 		cancel_work_sync(&desc->rxwork);
 		cancel_work_sync(&desc->service_outs_intr);
+		unpoison_urbs(desc);
 	}
 	if (!PMSG_IS_AUTO(message)) {
 		mutex_unlock(&desc->wlock);
@@ -1140,7 +1153,7 @@ static int wdm_pre_reset(struct usb_interface *intf)
 	wake_up_all(&desc->wait);
 	mutex_lock(&desc->rlock);
 	mutex_lock(&desc->wlock);
-	kill_urbs(desc);
+	poison_urbs(desc);
 	cancel_work_sync(&desc->rxwork);
 	cancel_work_sync(&desc->service_outs_intr);
 	return 0;
@@ -1151,6 +1164,7 @@ static int wdm_post_reset(struct usb_interface *intf)
 	struct wdm_device *desc = wdm_find_device(intf);
 	int rv;
 
+	unpoison_urbs(desc);
 	clear_bit(WDM_OVERFLOW, &desc->flags);
 	clear_bit(WDM_RESETTING, &desc->flags);
 	rv = recover_from_urb_loss(desc);
-- 
2.26.2

