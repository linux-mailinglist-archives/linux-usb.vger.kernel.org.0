Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672632758F6
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 15:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgIWNoU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 09:44:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:33434 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgIWNoT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 09:44:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600868656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=4yQO5dvm56CHVNtVMdAMru2KacTYIoVq4tbBEx254NA=;
        b=C2RWhmxRGcFCmoCYz7fRYvMb1PVDIZiEl840168BOzktv8M0sFE8ph8dFgGGRUhkiVtdtB
        a6AD1Y7AlfvxExlWh7f0/FCJJ8aSlABl4AaRPSTTqPvIRjJWZqm102oLZ6TCNeEji/BvPR
        k+rdh3qls0Ul1RtAIC5yi/978g3WxEw=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 13C59AD46;
        Wed, 23 Sep 2020 13:44:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     himadrispandya@gmail.com, gregKH@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [RFC 06/14] Revert "sound: usx2y: move to use usb_control_msg_send()"
Date:   Wed, 23 Sep 2020 15:43:40 +0200
Message-Id: <20200923134348.23862-7-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200923134348.23862-1-oneukum@suse.com>
References: <20200923134348.23862-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit ec8eeceb06b7a6efb6d924fd2f4ba4ec79ddc7bf.
The API has to be changed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 sound/usb/usx2y/us122l.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index 6d35303b0948..f86f7a61fb36 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -82,13 +82,40 @@ static int us144_create_usbmidi(struct snd_card *card)
 				  &US122L(card)->midi_list, &quirk);
 }
 
+/*
+ * Wrapper for usb_control_msg().
+ * Allocates a temp buffer to prevent dmaing from/to the stack.
+ */
+static int us122l_ctl_msg(struct usb_device *dev, unsigned int pipe,
+			  __u8 request, __u8 requesttype,
+			  __u16 value, __u16 index, void *data,
+			  __u16 size, int timeout)
+{
+	int err;
+	void *buf = NULL;
+
+	if (size > 0) {
+		buf = kmemdup(data, size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+	err = usb_control_msg(dev, pipe, request, requesttype,
+			      value, index, buf, size, timeout);
+	if (size > 0) {
+		memcpy(data, buf, size);
+		kfree(buf);
+	}
+	return err;
+}
+
 static void pt_info_set(struct usb_device *dev, u8 v)
 {
 	int ret;
 
-	ret = usb_control_msg_send(dev, 0, 'I',
-				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-				   v, 0, NULL, 0, 1000);
+	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+			      'I',
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      v, 0, NULL, 0, 1000);
 	snd_printdd(KERN_DEBUG "%i\n", ret);
 }
 
@@ -278,11 +305,10 @@ static int us122l_set_sample_rate(struct usb_device *dev, int rate)
 	data[0] = rate;
 	data[1] = rate >> 8;
 	data[2] = rate >> 16;
-	err = usb_control_msg_send(dev, 0, UAC_SET_CUR,
-				   USB_TYPE_CLASS | USB_RECIP_ENDPOINT | USB_DIR_OUT,
-				   UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep, data, 3,
-				   1000);
-	if (err)
+	err = us122l_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC_SET_CUR,
+			     USB_TYPE_CLASS|USB_RECIP_ENDPOINT|USB_DIR_OUT,
+			     UAC_EP_CS_ATTR_SAMPLE_RATE << 8, ep, data, 3, 1000);
+	if (err < 0)
 		snd_printk(KERN_ERR "%d: cannot set freq %d to ep 0x%x\n",
 			   dev->devnum, rate, ep);
 	return err;
-- 
2.16.4

