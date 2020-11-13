Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05FC2B22E2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 18:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgKMRqs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 12:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbgKMRqr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 12:46:47 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37EFC061A04
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 09:46:45 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id y17so9218008ilg.4
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 09:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sm0dp8m6PYoCSpzYftgx2Y3mqZEh1Lp+bGdH0kDy5dk=;
        b=JOxktDfZSV66zoJecCtVPD5DV3Oc5AicK13DHQg7s8MkflrIrX/+PMCP/1Vn5VC/D7
         /x/RSybOc2X95HeMyLAw4c1vLiKJVRIirRtIHOEwBbcvpjOVAndGhpV1d/isxVanrZXd
         Q1V5w7SZt1fdQIozxoxpp6KhEcDS2VISoLEKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sm0dp8m6PYoCSpzYftgx2Y3mqZEh1Lp+bGdH0kDy5dk=;
        b=qTQg9Gi3po6Kr8USxgfoNZ+zQzM93+P7qmtmHadvf2gR/jXRoxUUoTaxthn4K5VGQL
         fLhLqUHYDQ/K55xpY3EyZlI/xuD/OJFyY5Ky9owtK28cDIWFkFe80ar1WMDROnWmyHYH
         cOIItWFGzGBsuY56bN3HecDTNGRYdu1lzbPE//GM/Xwl+KyjuOiBbXr+mD1SooBUGFle
         K8cbGY8Iok6FHHAodGH/zH9/BMYSAvz8nAyXnf7CtlgYjq20raAXW/z5sOo3h6h1/Apu
         Ff9IsdrIorCStWnW2qkB2Z4FKOD9zriNC+P5Ps40Zqws6PrDVO++h8Zkkpzg99Fvxt1L
         mXig==
X-Gm-Message-State: AOAM531MFiDWX5LYiYbbwXz99Wlo5V34yRoUxVTQKlTMq1B88/k6t0C7
        +uEs08nGJI1UWDXzSQBMFTcp2c++NiUNEg==
X-Google-Smtp-Source: ABdhPJzkJd/du2JaXEEO+I8eBHlvnqsa7Fbuu4Q+CxUmhErClnXK++/Zonb9rRsW2jSUNHZqQq8h/g==
X-Received: by 2002:a92:cb51:: with SMTP id f17mr730291ilq.64.1605289604832;
        Fri, 13 Nov 2020 09:46:44 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y14sm4772585ilb.66.2020.11.13.09.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:46:44 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, keescook@chromium.org,
        peterz@infradead.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] usb: usbip/vhci: convert seqno to seqnum_ops
Date:   Fri, 13 Nov 2020 10:46:12 -0700
Message-Id: <8c22e939de78436afc6112d8022771121d438a83.1605287778.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1605287778.git.skhan@linuxfoundation.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sequence Number api provides interfaces for unsigned atomic up counters
leveraging atomic_t and atomic64_t ops underneath. Convert it to use
seqnum_ops.

atomic_t variables used for stats are atomic counters. Convert them to
use seqnum_ops.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/vhci.h     | 3 ++-
 drivers/usb/usbip/vhci_hcd.c | 7 ++++---
 drivers/usb/usbip/vhci_rx.c  | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
index 5659dce1526e..cb76747f423b 100644
--- a/drivers/usb/usbip/vhci.h
+++ b/drivers/usb/usbip/vhci.h
@@ -15,6 +15,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/wait.h>
+#include <linux/seqnum_ops.h>
 
 struct vhci_device {
 	struct usb_device *udev;
@@ -108,7 +109,7 @@ struct vhci_hcd {
 	unsigned resuming:1;
 	unsigned long re_timeout;
 
-	atomic_t seqnum;
+	struct seqnum32 seqnum;
 
 	/*
 	 * NOTE:
diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 66cde5e5f796..57287165537c 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/seqnum_ops.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
@@ -665,7 +666,7 @@ static void vhci_tx_urb(struct urb *urb, struct vhci_device *vdev)
 
 	spin_lock_irqsave(&vdev->priv_lock, flags);
 
-	priv->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
+	priv->seqnum = seqnum32_inc_return(&vhci_hcd->seqnum);
 	if (priv->seqnum == 0xffff)
 		dev_info(&urb->dev->dev, "seqnum max\n");
 
@@ -921,7 +922,7 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 			return -ENOMEM;
 		}
 
-		unlink->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
+		unlink->seqnum = seqnum32_inc_return(&vhci_hcd->seqnum);
 		if (unlink->seqnum == 0xffff)
 			pr_info("seqnum max\n");
 
@@ -1181,7 +1182,7 @@ static int vhci_start(struct usb_hcd *hcd)
 		vdev->rhport = rhport;
 	}
 
-	atomic_set(&vhci_hcd->seqnum, 0);
+	seqnum32_init(&vhci_hcd->seqnum);
 
 	hcd->power_budget = 0; /* no limit */
 	hcd->uses_new_polling = 1;
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index 266024cbb64f..84620538093f 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -5,6 +5,7 @@
 
 #include <linux/kthread.h>
 #include <linux/slab.h>
+#include <linux/seqnum_ops.h>
 
 #include "usbip_common.h"
 #include "vhci.h"
@@ -66,9 +67,9 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	spin_unlock_irqrestore(&vdev->priv_lock, flags);
 
 	if (!urb) {
-		pr_err("cannot find a urb of seqnum %u max seqnum %d\n",
+		pr_err("cannot find a urb of seqnum %u max seqnum %u\n",
 			pdu->base.seqnum,
-			atomic_read(&vhci_hcd->seqnum));
+			seqnum32_fetch(&vhci_hcd->seqnum));
 		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
 		return;
 	}
-- 
2.27.0

