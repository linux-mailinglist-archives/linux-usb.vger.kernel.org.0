Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA742306C4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 11:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgG1JpB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 05:45:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:56078 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728461AbgG1JpA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 05:45:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6F1A9ACF3;
        Tue, 28 Jul 2020 09:45:09 +0000 (UTC)
Message-ID: <1595929488.24221.4.camel@suse.de>
Subject: Re: [PATCH] usb: core: Solve race condition in
 usb_kill_anchored_urbs
From:   Oliver Neukum <oneukum@suse.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Eli Billauer <eli.billauer@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, hdegoede@redhat.com
Date:   Tue, 28 Jul 2020 11:44:48 +0200
In-Reply-To: <20200727144357.GB1468275@rowland.harvard.edu>
References: <20200727072225.25195-1-eli.billauer@gmail.com>
         <1595844840.13408.17.camel@suse.de> <5F1EBA04.5050109@gmail.com>
         <1595858285.13408.36.camel@suse.de>
         <20200727144357.GB1468275@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 27.07.2020, 10:43 -0400 schrieb Alan Stern:
> Given that this timeout-based API is already present and being used in a 
> separate context, I don't see anything wrong with using it here as well.

A more elegant alternative.

	Regards
		Oliver

From c37e910758b0a05d4c6b8d058974b1264f9d0aef Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 28 Jul 2020 11:38:23 +0200
Subject: [PATCH] USB: add mooring API

This is a simplified and thereby better version of the anchor API.
Anchors have the problem that they unanchor an URB upon giveback,
which creates a window during which an URB is unanchored but not
yet returned, leading to operations on anchors not having the
semantics many driver errornously assume them to have.
The new API keeps an URB on an anchor until it is explicitly
unmoored.

Signed-off-by: Oliver Neukum <oneukum@suse.de>
---
 drivers/usb/core/hcd.c |  3 ++-
 drivers/usb/core/urb.c | 27 ++++++++++++++++++++++++++-
 include/linux/usb.h    |  3 +++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index a33b849e8beb..861d30180709 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1640,7 +1640,8 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 	unmap_urb_for_dma(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
 	usb_anchor_suspend_wakeups(anchor);
-	usb_unanchor_urb(urb);
+	if (!urb->transfer_flags && URB_ANCHOR_PERMANENT)
+		usb_unanchor_urb(urb);
 	if (likely(status == 0))
 		usb_led_activity(USB_LED_EVENT_HOST);
 
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 7bc23469f4e4..1acfbd4e6323 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -123,7 +123,7 @@ EXPORT_SYMBOL_GPL(usb_get_urb);
  * This can be called to have access to URBs which are to be executed
  * without bothering to track them
  */
-void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
+static void __usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
 	unsigned long flags;
 
@@ -137,8 +137,20 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
 
 	spin_unlock_irqrestore(&anchor->lock, flags);
 }
+
+void inline usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
+{
+	__usb_anchor_urb(urb, anchor);
+}
 EXPORT_SYMBOL_GPL(usb_anchor_urb);
 
+void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor)
+{
+	urb->transfer_flags |= URB_ANCHOR_PERMANENT;
+	__usb_anchor_urb( urb, anchor);
+}
+EXPORT_SYMBOL_GPL(usb_moor_urb);
+
 static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
 {
 	return atomic_read(&anchor->suspend_wakeups) == 0 &&
@@ -185,6 +197,19 @@ void usb_unanchor_urb(struct urb *urb)
 }
 EXPORT_SYMBOL_GPL(usb_unanchor_urb);
 
+void usb_unmoor_urb(struct urb *urb)
+{
+	struct usb_anchor *anchor;
+
+	anchor = urb->anchor;
+	if (!anchor)
+		return;
+
+	__usb_unanchor_urb(urb, anchor);
+	urb->transfer_flags &= ~URB_ANCHOR_PERMANENT;
+}
+EXPORT_SYMBOL_GPL(usb_unmoor_urb);
+
 /*-------------------------------------------------------------------*/
 
 static const int pipetypes[4] = {
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 20c555db4621..cacebdb01bfd 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1347,6 +1347,7 @@ extern int usb_disabled(void);
 #define URB_SETUP_MAP_LOCAL	0x00200000	/* HCD-local setup packet */
 #define URB_DMA_SG_COMBINED	0x00400000	/* S-G entries were combined */
 #define URB_ALIGNED_TEMP_BUFFER	0x00800000	/* Temp buffer was alloc'd */
+#define URB_ANCHOR_PERMANENT	0x01000000	/* Keep anchored across callback */
 
 struct usb_iso_packet_descriptor {
 	unsigned int offset;
@@ -1732,6 +1733,8 @@ extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
 extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);
 extern void usb_unanchor_urb(struct urb *urb);
+extern void usb_moor_urb(struct urb *urb, struct usb_anchor *anchor);
+extern void usb_unmoor_urb(struct urb *urb);
 extern int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 					 unsigned int timeout);
 extern struct urb *usb_get_from_anchor(struct usb_anchor *anchor);
-- 
2.16.4

