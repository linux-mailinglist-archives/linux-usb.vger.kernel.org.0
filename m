Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C772722B9
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgIULh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:37:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:45696 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726860AbgIULh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:37:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600688274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=Yu2UIPZdnC3rC5zUhHQZTIJxVQ7KVQ/n4uYuoJNyZhk=;
        b=k0rulDlyohydW1hhaN/zJNsqZeVbE/FLjWpi7LdOp9oXaJ07hD8WBhIxCYf9RzRicKC8+5
        mdd80l+kkhR+5Bck/D3O6bn2F54124uPMYzzsQuZRcLh+i7ae4aJbOmAbtuM7XK2A+mGRm
        UDJZ4SRjBMc23MZeAnZvYks2cjIPgpk=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EB5B3B54A;
        Mon, 21 Sep 2020 11:38:30 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFT 2/4] chaoskey: introduce asynchronous reads
Date:   Mon, 21 Sep 2020 13:37:30 +0200
Message-Id: <20200921113732.11524-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921113732.11524-1-oneukum@suse.com>
References: <20200921113732.11524-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This divides requesting IO and waiting for IO from each other.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index ad4c0b6d02cf..d47c2cc65269 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -336,15 +336,13 @@ static void chaos_read_callback(struct urb *urb)
 	wake_up(&dev->wait_q);
 }
 
-/* Fill the buffer. Called with dev->lock held
- */
-static int _chaoskey_fill(struct chaoskey *dev)
+static int chaoskey_request_fill(struct chaoskey *dev)
 {
 	DEFINE_WAIT(wait);
 	int result;
 	bool started;
 
-	usb_dbg(dev->interface, "fill");
+	usb_dbg(dev->interface, "request fill");
 
 	/* Return immediately if someone called before the buffer was
 	 * empty */
@@ -382,10 +380,26 @@ static int _chaoskey_fill(struct chaoskey *dev)
 	 */
 	started = dev->reads_started;
 	dev->reads_started = true;
+	/*
+	 * powering down while a read is under way
+	 * is blocked in suspend()
+	 */
+	usb_autopm_put_interface(dev->interface);
+	return 0;
+out:
+	usb_autopm_put_interface(dev->interface);
+	return result;
+}
+
+static int chaoskey_wait_fill(struct chaoskey *dev)
+{
+	DEFINE_WAIT(wait);
+	int result;
+
 	result = wait_event_interruptible_timeout(
 		dev->wait_q,
 		!dev->reading,
-		(started ? NAK_TIMEOUT : ALEA_FIRST_TIMEOUT) );
+		(dev->reads_started ? NAK_TIMEOUT : ALEA_FIRST_TIMEOUT) );
 
 	if (result < 0) {
 		usb_kill_urb(dev->urb);
@@ -400,7 +414,6 @@ static int _chaoskey_fill(struct chaoskey *dev)
 	}
 out:
 	/* Let the device go back to sleep eventually */
-	usb_autopm_put_interface(dev->interface);
 
 	usb_dbg(dev->interface, "read %d bytes", dev->valid);
 
@@ -449,7 +462,12 @@ static ssize_t chaoskey_read(struct file *file,
 				goto bail;
 		}
 		if (dev->valid == dev->used) {
-			result = _chaoskey_fill(dev);
+			result = chaoskey_request_fill(dev);
+			if (result < 0) {
+				mutex_unlock(&dev->lock);
+				goto bail;
+			}
+			result = chaoskey_wait_fill(dev);
 			if (result < 0) {
 				mutex_unlock(&dev->lock);
 				goto bail;
@@ -517,7 +535,7 @@ static int chaoskey_rng_read(struct hwrng *rng, void *data,
 	 * the buffer will still be empty
 	 */
 	if (dev->valid == dev->used)
-		(void) _chaoskey_fill(dev);
+		(void) chaoskey_request_fill(dev);
 
 	this_time = dev->valid - dev->used;
 	if (this_time > max)
@@ -537,6 +555,11 @@ static int chaoskey_rng_read(struct hwrng *rng, void *data,
 static int chaoskey_suspend(struct usb_interface *interface,
 			    pm_message_t message)
 {
+	struct chaoskey *dev = usb_get_intfdata(interface);
+
+	if (dev->reading && PMSG_IS_AUTO(message))
+		return -EBUSY;
+
 	usb_dbg(interface, "suspend");
 	return 0;
 }
-- 
2.16.4

