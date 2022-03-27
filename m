Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE7864E84BD
	for <lists+linux-usb@lfdr.de>; Sun, 27 Mar 2022 01:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiC0AGf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Mar 2022 20:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiC0AGf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Mar 2022 20:06:35 -0400
X-Greylist: delayed 133 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 26 Mar 2022 17:04:57 PDT
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23024369DB
        for <linux-usb@vger.kernel.org>; Sat, 26 Mar 2022 17:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
        Subject:Cc:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8xkGnK29QDhVgR2y9snCPokmvRU3AUxcvu3RzTWgOqg=; b=KeuvurEIkXfBqxxPxvRXu6KltU
        +owibL/umly2h7OplmGnFKqF6c0sOA9GyTrwi+BJxwFpHChBuKfSo4WHaKl8Zi8LsIkUHyvAs70OF
        URS58xPtxCUh9jGEORWrBbXDY/h0MTIkLNnF9FjJKpQIDEXBt/U/WvYWC8KD7x+ZxAWM=;
Received: from [2a02:587:6a16:2a00::298]
        by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <tasos@tasossah.com>)
        id 1nYGMY-009RbV-OM; Sun, 27 Mar 2022 02:02:30 +0200
Message-ID: <b8ed7a8e-f4da-696f-cbbf-6f675a13aea4@tasossah.com>
Date:   Sun, 27 Mar 2022 02:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From:   Tasos Sahanidis <tasos@tasossah.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        tasos@tasossah.com
Content-Language: en-US
Subject: [PATCH] usb: core: Don't block while sleeping in do_proc_control()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit ae8709b296d8 ("USB: core: Make do_proc_control() and
do_proc_bulk() killable") if a device has the USB_QUIRK_DELAY_CTRL_MSG
quirk set, it will temporarily block all other URBs (e.g. interrupts)
while sleeping due to a control.

This results in noticeable delays when, for example, a userspace usbfs
application is sending URB interrupts at a high rate to a keyboard and
simultaneously updates the lock indicators using controls. Interrupts
with direction set to IN are also affected by this, meaning that
delivery of HID reports (containing scancodes) to the usbfs application
is delayed as well.

This patch fixes the regression by calling msleep() while the device
mutex is unlocked, as was the case originally with usb_control_msg().

Fixes: ae8709b296d8 ("USB: core: Make do_proc_control() and do_proc_bulk() killable")
Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/usb/core/devio.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 6abb7294e919..b5b85bf80329 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1209,12 +1209,16 @@ static int do_proc_control(struct usb_dev_state *ps,
  		usb_unlock_device(dev);
 		i = usbfs_start_wait_urb(urb, tmo, &actlen);
+
+		/* Linger a bit, prior to the next control message. */
+		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+			msleep(200);
 		usb_lock_device(dev);
 		snoop_urb(dev, NULL, pipe, actlen, i, COMPLETE, tbuf, actlen);
 		if (!i && actlen) {
 			if (copy_to_user(ctrl->data, tbuf, actlen)) {
 				ret = -EFAULT;
-				goto recv_fault;
+				goto done;
 			}
 		}
 	} else {
@@ -1231,6 +1235,10 @@ static int do_proc_control(struct usb_dev_state *ps,
  		usb_unlock_device(dev);
 		i = usbfs_start_wait_urb(urb, tmo, &actlen);
+
+		/* Linger a bit, prior to the next control message. */
+		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+			msleep(200);
 		usb_lock_device(dev);
 		snoop_urb(dev, NULL, pipe, actlen, i, COMPLETE, NULL, 0);
 	}
@@ -1242,10 +1250,6 @@ static int do_proc_control(struct usb_dev_state *ps,
 	}
 	ret = (i < 0 ? i : actlen);
 - recv_fault:
-	/* Linger a bit, prior to the next control message. */
-	if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
-		msleep(200);
  done:
 	kfree(dr);
 	usb_free_urb(urb);
-- 
2.25.1



