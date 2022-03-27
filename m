Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20CC14E84C6
	for <lists+linux-usb@lfdr.de>; Sun, 27 Mar 2022 01:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbiC0A0n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Mar 2022 20:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiC0A0m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Mar 2022 20:26:42 -0400
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4531A6558
        for <linux-usb@vger.kernel.org>; Sat, 26 Mar 2022 17:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:Content-Type:
        Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=J5Tr4CW4pAWnQXKhgmegpJDahYFOkyyMsLhx8253VDw=; b=PHLyMGjd61unvKoE05ryk97jdT
        k08iGQ/G5tGblZZXK5mU/EDC8I94BX2ZIvWymT9X8OkitFrwxSFZYJ+5VT1K0qbbdi4YpLuCDTagw
        LmjzGl2JawoYpP13mPIlEaMREkAHkHJYCKwz/yBW/M4rt2eniI5ROw1Vw456ebpRQ0q4=;
Received: from [2a02:587:6a16:2a00::298]
        by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <tasos@tasossah.com>)
        id 1nYGiL-009RnZ-TK; Sun, 27 Mar 2022 02:25:02 +0200
Message-ID: <2450973f-d665-82b9-6734-4b57f95a2be3@tasossah.com>
Date:   Sun, 27 Mar 2022 02:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        tasos@tasossah.com
From:   Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH v2] usb: core: Don't block while sleeping in do_proc_control()
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

