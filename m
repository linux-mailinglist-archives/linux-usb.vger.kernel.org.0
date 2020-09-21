Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB2D2722BA
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgIULh6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:37:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:45724 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726803AbgIULh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:37:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600688275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=kOAvk89wVGacoYWtvsN0jTXXcK4NTRAGpet9z8LSDX4=;
        b=hWQ1cc0r7FtbcFH+mFfjk5QF2rQYf134LDMF0EEG4C4wzQeWxOLr6qksdmbhlVUhYkv6Dm
        1r50H1ca1OXNXj/XuuXtsHexLf/h2ACVEyj35g9YHxNbVZnvz4rwlexV78bh9VNdEIyFGL
        8vVffhrCo8jQp0gaYEXAWzB30ruqj3U=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B621AB54D;
        Mon, 21 Sep 2020 11:38:31 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     keithp@keithp.com, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFT 4/4] chaoskey: request data asynchronously
Date:   Mon, 21 Sep 2020 13:37:32 +0200
Message-Id: <20200921113732.11524-5-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921113732.11524-1-oneukum@suse.com>
References: <20200921113732.11524-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This requests more data if a read has exhausted the buffer
just to have it ready sooner.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/chaoskey.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
index 0d80cba162a4..5773cf477e4d 100644
--- a/drivers/usb/misc/chaoskey.c
+++ b/drivers/usb/misc/chaoskey.c
@@ -358,6 +358,9 @@ static int chaoskey_request_fill(struct chaoskey *dev)
 		return -ENODEV;
 	}
 
+	if (dev->reading)
+		return -EBUSY;
+
 	/* Make sure the device is awake */
 	result = usb_autopm_get_interface(dev->interface);
 	if (result) {
@@ -500,13 +503,16 @@ static ssize_t chaoskey_read(struct file *file,
 		dev->used += this_time;
 		mutex_unlock(&dev->lock);
 	}
+	/* request data on suspicion that it will eventually be used */
+	if (dev->valid == dev->used)
+		(void)chaoskey_request_fill(dev);
 bail:
 	if (read_count) {
 		usb_dbg(dev->interface, "read %zu bytes", read_count);
 		return read_count;
 	}
 	usb_dbg(dev->interface, "empty read, result %d", result);
-	if (result == -ETIMEDOUT)
+	if (result == -ETIMEDOUT || result == -EBUSY)
 		result = -EAGAIN;
 	return result;
 }
-- 
2.16.4

