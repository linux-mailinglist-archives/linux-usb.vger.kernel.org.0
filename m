Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBA5102548
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 14:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfKSNV7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 08:21:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:41352 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725280AbfKSNV7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Nov 2019 08:21:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9746CB3FB;
        Tue, 19 Nov 2019 13:21:57 +0000 (UTC)
Message-ID: <1574169714.28617.7.camel@suse.com>
Subject: Re: INFO: task hung in wdm_flush
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
Cc:     =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
        linux-usb@vger.kernel.org
Date:   Tue, 19 Nov 2019 14:21:54 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

#syz test: https://github.com/google/kasan.git e96407b4

From d3d9edf17e33889e0fc4238f3d03a2dce7af30e1 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 19 Nov 2019 14:09:41 +0100
Subject: [PATCH] cdc-wdm: add timeout in wdm_flush()

wdm_flush() will wait forever for IO to end. If a device
happens to crash exactly at that time and becomes unresponsive or
turns rogue and malicious exactly at that time, we get unkillable
tasks. The solition is to add a sensible timeout.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index f9f7c8a5e091..17de5c88a325 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -587,8 +587,9 @@ static ssize_t wdm_read
 static int wdm_flush(struct file *file, fl_owner_t id)
 {
 	struct wdm_device *desc = file->private_data;
+	int timeout;
 
-	wait_event(desc->wait,
+	timeout = wait_event_timeout(desc->wait,
 			/*
 			 * needs both flags. We cannot do with one
 			 * because resetting it would cause a race
@@ -596,7 +597,14 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 			 * a disconnect
 			 */
 			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
+			test_bit(WDM_DISCONNECTING, &desc->flags),
+			/* pulled out of thin air */
+			30 * HZ);
+
+	if (!timeout) {
+		usb_kill_urb(desc->command);
+		return -EIO;
+	}
 
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))
-- 
2.16.4

