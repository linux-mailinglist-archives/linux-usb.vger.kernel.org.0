Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4752DB0C7
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 17:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730683AbgLOQBq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Dec 2020 11:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730483AbgLOP6B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Dec 2020 10:58:01 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28413C0617A7
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:21 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id g25so178461wmh.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Dec 2020 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mpupbpAiHl0Cv1mnbMYjW/iwG3YQylB90NQFwucdsm8=;
        b=JSvEUtIUXnrz/2Wmqi5jSql/ZAxPn9o7S77Vg2jWo/+tgsJ22H46lm8OYKbZicrNIP
         mt14h73b0ZhGZLkgnzfwuF+jzUDxRZ3KbAd2LDfWFZmw6OTyC6QZnEeclh4/mwC5P5FB
         nMo3nYPOcQxGD3mxKf7g7A8wK7VhCa8qb1shpCIL7bWcjPZOerMin9v6Fsp2jDlea657
         qdZiHlQA6yoI/whfhhZUP5hPFowUfdzXFcMlE+MrAYvF/PRRetJmR0a1FFtqRYtv71IL
         Oao+h03eF+ZPTGoz8ZWnFNsC/kTb7JVRJoIFWZqf/2N+WQO7RqyNnmiLwAaA8bYZCcX7
         W5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mpupbpAiHl0Cv1mnbMYjW/iwG3YQylB90NQFwucdsm8=;
        b=MYhl5zIhqxNaA0c0ptdRKAuHVqsVrUg0N6Pvumg0p4NcyTndA8XCPXjFPrXGqk+qbJ
         88G751zZ2zImWEXLAh0WSCTcItah1YTgPTCr9UikK9Ibfgpcgtc19JpIggV75Sb6T6cf
         PAIZMLFAazNjXi/5gL9gCMsoxtlVL+F3QQfLagvyK95ealovrveCMtsTKQr7M12Yvon+
         1PYohKDc0VFiyhgmVDgAa4nZjl1Ge0LDXPx0FntFUBb4bh1xIlpbzp962oAnuE3oTxew
         hqPsyWw8WGKd37utfyq99g0vbzyLtuM8jidOw/jyoHNtoT2iFZk6uG3z5mX3zyju0CvD
         FeLQ==
X-Gm-Message-State: AOAM5305j+XIwkNrh8vjP5T1jW8oElrZTI0InvgEQ3jnHMBmeIQs85vW
        7lOdHILQXW+Q4r24r0qvkeE=
X-Google-Smtp-Source: ABdhPJy9UgFtQAUDeoPanZMPcoiV1qo+9ROY4Zmg4uRmWWxE3Bn0qdoePdB2oc4zd47aJOhULMhMwA==
X-Received: by 2002:a05:600c:218a:: with SMTP id e10mr33322961wme.27.1608047839902;
        Tue, 15 Dec 2020 07:57:19 -0800 (PST)
Received: from egonzo.toto.net.toto.net ([88.123.121.14])
        by smtp.gmail.com with ESMTPSA id c10sm38792018wrb.92.2020.12.15.07.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:57:19 -0800 (PST)
From:   Dave Penkler <dpenkler@gmail.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     guido.kiener@rohde-schwarz.com, john.harvey@non.keysight.com,
        jian-wei_wu@keysight.com, gabe.jones@ni.com, dpenkler@gmail.com
Subject: [PATCH 1/4] USB: usbtmc: Fix reading stale status byte
Date:   Tue, 15 Dec 2020 16:56:18 +0100
Message-Id: <20201215155621.9592-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215155621.9592-1-dpenkler@gmail.com>
References: <20201215155621.9592-1-dpenkler@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ioctl USBTMC488_IOCTL_READ_STB either returns a cached status byte
(STB) sent by the device due to a service request (SRQ) condition or
the STB obtained from a query to the device with a READ_STATUS_BYTE
control message.

When the query is interrupted by an SRQ message on the interrupt pipe,
the ioctl still returns the requested STB while the STB of the
out-of-band SRQ message is cached for the next call of this
ioctl. However the cached SRQ STB represents a state that was previous
to the last returned STB.  Furthermore the cached SRQ STB can be stale
and not reflect the current state of the device.

The fixed ioctl now always reads the STB from the device and if the
associated file descriptor has the srq_asserted bit set it ors in the
RQS bit to the returned STB and clears the srq_asserted bit conformant
to subclass USB488 devices.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
Tested-by: Jian-Wei Wu <jian-wei_wu@keysight.com>
---
 drivers/usb/class/usbtmc.c | 46 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index b222b777e6a4..189f06dcb7d3 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -475,33 +475,17 @@ static int usbtmc_ioctl_abort_bulk_out(struct usbtmc_device_data *data)
 	return usbtmc_ioctl_abort_bulk_out_tag(data, data->bTag_last_write);
 }
 
-static int usbtmc488_ioctl_read_stb(struct usbtmc_file_data *file_data,
-				void __user *arg)
+static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 {
 	struct usbtmc_device_data *data = file_data->data;
 	struct device *dev = &data->intf->dev;
-	int srq_asserted = 0;
 	u8 *buffer;
 	u8 tag;
-	__u8 stb;
 	int rv;
 
 	dev_dbg(dev, "Enter ioctl_read_stb iin_ep_present: %d\n",
 		data->iin_ep_present);
 
-	spin_lock_irq(&data->dev_lock);
-	srq_asserted = atomic_xchg(&file_data->srq_asserted, srq_asserted);
-	if (srq_asserted) {
-		/* a STB with SRQ is already received */
-		stb = file_data->srq_byte;
-		spin_unlock_irq(&data->dev_lock);
-		rv = put_user(stb, (__u8 __user *)arg);
-		dev_dbg(dev, "stb:0x%02x with srq received %d\n",
-			(unsigned int)stb, rv);
-		return rv;
-	}
-	spin_unlock_irq(&data->dev_lock);
-
 	buffer = kmalloc(8, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
@@ -548,13 +532,12 @@ static int usbtmc488_ioctl_read_stb(struct usbtmc_file_data *file_data,
 				data->iin_bTag, tag);
 		}
 
-		stb = data->bNotify2;
+		*stb = data->bNotify2;
 	} else {
-		stb = buffer[2];
+		*stb = buffer[2];
 	}
 
-	rv = put_user(stb, (__u8 __user *)arg);
-	dev_dbg(dev, "stb:0x%02x received %d\n", (unsigned int)stb, rv);
+	dev_dbg(dev, "stb:0x%02x received %d\n", (unsigned int)*stb, rv);
 
  exit:
 	/* bump interrupt bTag */
@@ -567,6 +550,27 @@ static int usbtmc488_ioctl_read_stb(struct usbtmc_file_data *file_data,
 	return rv;
 }
 
+static int usbtmc488_ioctl_read_stb(struct usbtmc_file_data *file_data,
+				void __user *arg)
+{
+	int srq_asserted = 0;
+	__u8 stb;
+	int rv;
+
+	rv = usbtmc_get_stb(file_data, &stb);
+
+	if (rv > 0) {
+		srq_asserted = atomic_xchg(&file_data->srq_asserted,
+					srq_asserted);
+		if (srq_asserted)
+			stb |= 0x40; /* Set RQS bit */
+
+		rv = put_user(stb, (__u8 __user *)arg);
+	}
+	return rv;
+
+}
+
 static int usbtmc488_ioctl_wait_srq(struct usbtmc_file_data *file_data,
 				    __u32 __user *arg)
 {
-- 
2.29.2

