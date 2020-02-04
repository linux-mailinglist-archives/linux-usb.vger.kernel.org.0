Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA801514BF
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 04:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgBDDuz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 22:50:55 -0500
Received: from mta-out1.inet.fi ([62.71.2.194]:37108 "EHLO julia1.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbgBDDuz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Feb 2020 22:50:55 -0500
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Mon, 03 Feb 2020 22:50:53 EST
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrgeekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfenuceurghilhhouhhtmecufedttdenucenucfjughrpefvhffukffffgggtgfgsehtkeertddtfeejnecuhfhrohhmpefnrghurhhiucflrghkkhhuuceolhgruhhrihdrjhgrkhhkuhesphhprdhinhgvthdrfhhiqeenucfkphepkeegrddvgeekrdeftddrudelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedruddrudefgegnpdhinhgvthepkeegrddvgeekrdeftddrudelhedpmhgrihhlfhhrohhmpeeolhgruhhjrghkqdefsehmsghogidrihhnvghtrdhfihequceuqfffjgepkeeukffvoffkoffgpdhrtghpthhtohepoehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrgheqpdhrtghpthhtohepoehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgqe
Received: from [192.168.1.134] (84.248.30.195) by julia1.inet.fi (9.0.019.26-1) (authenticated as laujak-3)
        id 5E37D3E2000387F3; Tue, 4 Feb 2020 05:44:46 +0200
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
From:   Lauri Jakku <lauri.jakku@pp.inet.fi>
Subject: USB HID random timeout failures fix proposal
Message-ID: <4bc1c5da-172a-af15-0f2c-d447efeb48d1@pp.inet.fi>
Date:   Tue, 4 Feb 2020 05:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


I made a patch that does to tackle the USB HID device random behavior by

re-trying to send command 400ms, 20ms sleep per try.

---------------------------------------------------------------------------------------

From d4214685de329ebe07dfd2298bce46dfae5f80bf Mon Sep 17 00:00:00 2001
From: Lauri Jakku <lja@iki.fi>
Date: Tue, 4 Feb 2020 04:52:01 +0200
Subject: [PATCH] USB HID random timeout failures fixed by trying 20 times
 send, 20ms apart, control messages, if error is timeout.

Signed-off-by: Lauri Jakku <lja@iki.fi>
---
 drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 5adf489428aa..5d615b2f92d8 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -20,6 +20,7 @@
 #include <linux/usb/hcd.h>     /* for usbcore internals */
 #include <linux/usb/of.h>
 #include <asm/byteorder.h>
+#include <linux/errno.h>
 
 #include "usb.h"
 
@@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
                    __u16 size, int timeout)
 {
        struct usb_ctrlrequest *dr;
-       int ret;
+       int ret = -ETIMEDOUT;
+
+       /* retry_cnt * 10ms, max retry time set to 400ms */
+       int retry_cnt = 20;
 
        dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
        if (!dr)
@@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
        dr->wIndex = cpu_to_le16(index);
        dr->wLength = cpu_to_le16(size);
 
-       ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
+       do {
+               ret = usb_internal_control_msg(dev,
+                                       pipe,
+                                       dr,
+                                       data,
+                                       size,
+                                       timeout);
+
+               /*
+                * Linger a bit, prior to the next control message
+                * or if return value is timeout, but do try few
+                * times (max 200ms) before quitting.
+                */
+               if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
+                       msleep(200);
+               else if (ret == -ETIMEDOUT)
+                       msleep(20);
+
+               /* Loop while timeout, max retry_cnt times. */
+       } while ((retry_cnt-- > 0) && (ret == -ETIMEDOUT));
 
-       /* Linger a bit, prior to the next control message. */
-       if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
-               msleep(200);
 
        kfree(dr);
 
-- 
2.25.0


-- 
Br,
Lauri J.

