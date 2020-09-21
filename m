Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A40827222C
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgIULVT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:21:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:58154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgIULVR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 07:21:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600687276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=lAPuK4woBdNl3RoIv0cwrcWM2DcttdWFgRNJGM6HIXI=;
        b=kBgbhussuUGVt27LIDWVUCrG9jMv/3OYbYEOlyw6dSG4K2qZvjNSfXmb453v4L28cQhvwP
        zmbjvRpmlmsp2XZV4/powBXgw9eUN36g7XRI7PXxEVknlQbVC2oV9i91r39ir+Tds2XoP4
        uy9TEeRTYXsj89aDZzbS+txtCqpU+fA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 46CCCB225;
        Mon, 21 Sep 2020 11:21:52 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 7/8] CDC-WDM: implement fsync
Date:   Mon, 21 Sep 2020 13:20:51 +0200
Message-Id: <20200921112052.27943-8-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200921112052.27943-1-oneukum@suse.com>
References: <20200921112052.27943-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some users want to be very sure that data has gone out to the
device. This needs fsync.

Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index f952eec87b0f..7607ab2bbe07 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -590,6 +590,33 @@ static ssize_t wdm_read
 	return rv;
 }
 
+/*
+ * The difference to flush is that we wait forever. If you don't like
+ * that behavior, you need to send a signal.
+ */
+
+static int wdm_fsync(struct file *file, loff_t start, loff_t end, int datasync)
+{
+	struct wdm_device *desc = file->private_data;
+	int rv;
+
+	rv = wait_event_interruptible(desc->wait,
+			!test_bit(WDM_IN_USE, &desc->flags) ||
+			test_bit(WDM_DISCONNECTING, &desc->flags));
+
+	if (test_bit(WDM_DISCONNECTING, &desc->flags))
+		return -ENODEV;
+	if (rv < 0)
+		return -EINTR;
+
+	spin_lock_irq(&desc->iuspin);
+	rv = desc->werr;
+	desc->werr = 0;
+	spin_unlock_irq(&desc->iuspin);
+
+	return usb_translate_errors(rv);
+}
+
 static int wdm_flush(struct file *file, fl_owner_t id)
 {
 	struct wdm_device *desc = file->private_data;
@@ -750,6 +777,7 @@ static const struct file_operations wdm_fops = {
 	.owner =	THIS_MODULE,
 	.read =		wdm_read,
 	.write =	wdm_write,
+	.fsync =	wdm_fsync,
 	.open =		wdm_open,
 	.flush =	wdm_flush,
 	.release =	wdm_release,
-- 
2.16.4

