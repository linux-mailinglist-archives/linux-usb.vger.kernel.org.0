Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602421C9728
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 19:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgEGRHQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 13:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727956AbgEGRHM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 13:07:12 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E86C05BD09
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 10:07:12 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id w6so7476910qtt.21
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cX88jRwYw6gh/fZ+XYDPimSSS7alrzjsZpkbo4YG8fk=;
        b=Gf8CMGn0vunTCJB10kQM8G2RHmmbs8MZ8+ODyTiaAMkx6ZTGaLR5//Z9M1VUSTLn4H
         iRNG6bCcHBw0FWYdJQ8t8NkP/MYNkEjXHPNktPRnwRwBN6bF8FlTib2qP7/0R309uPds
         g64AVMZ/PxbN1leiEDkv85Vhpxj3x6jbq9nH4dP/TgteXGGEbgIizuxUXLMAPojJbyTX
         upmqp9/I9vS97PxzurqBiktlQsrusJqt/0sLUkY1LPCNVFv6AJKEvfqLcqmTfed4Al29
         HX77uEfxhN5Mu/i+Ks9+erO6rwYnbpSp+sKtEWQh28IJBLkJfIbLyh7CjYn8Z+BeSKGq
         fTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cX88jRwYw6gh/fZ+XYDPimSSS7alrzjsZpkbo4YG8fk=;
        b=eQywnSoJ1CqYdcj1+cZgCdIo/qwbWOyH7PFjlkSn41LdEUL4P6cCqewzfa4Xwapxs+
         VKvoy7Lc30RT/o0RvudlheUm9Y1yWto/Lf1U+zRqqlo2L43Ay/rSoeccIGUsJBfyqrHI
         a74BNSPd7fyD7DtOM/G37qhMbrPr55KLSPxrftg3cnOS2vZHDIYfhH80BTF90TlRBhc1
         LxZ7gX8O5j294jKYmD6sVOqK2I/zUrI4E22h2kEyfOAOcsVbqtUPCaQ0NdPvDUbLORzm
         FNTgeJoBqCVYdSDfUeLnvs3V1oYPwpRjw3eQ5zmT/fGXywfS7pYhmGCOOin3TJzLYfeF
         u/8A==
X-Gm-Message-State: AGi0PuYWXXwVc62LLjEWWWMrydYqE9wgoQCBa8Wu9yO4/6uuK7ShG8gu
        DgnFmVkg/gi/PrdrL+hVj1cocQkyHkTR7r7n
X-Google-Smtp-Source: APiQypLvPqv2Xl19ym9PLleKsB/vp9+CCllsZnYITiH2hLCMsiKX4xLf2ACB1MU9t9EU//Zo09RVyvTVjxSu6Vku
X-Received: by 2002:ad4:45ac:: with SMTP id y12mr14256274qvu.227.1588871231255;
 Thu, 07 May 2020 10:07:11 -0700 (PDT)
Date:   Thu,  7 May 2020 19:06:57 +0200
In-Reply-To: <cover.1588870822.git.andreyknvl@google.com>
Message-Id: <343c0fee969a2109321dbea65a385656441af736.1588870822.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1588870822.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH USB v3 4/5] usb: raw-gadget: support stalling/halting/wedging endpoints
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Raw Gadget is currently unable to stall/halt/wedge gadget endpoints,
which is required for proper emulation of certain USB classes.

This patch adds a few more ioctls:

- USB_RAW_IOCTL_EP0_STALL allows to stall control endpoint #0 when
  there's a pending setup request for it.
- USB_RAW_IOCTL_SET/CLEAR_HALT/WEDGE allow to set/clear halt/wedge status
  on non-control non-isochronous endpoints.

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/usb/raw-gadget.rst       |   2 -
 drivers/usb/gadget/legacy/raw_gadget.c | 131 ++++++++++++++++++++++++-
 include/uapi/linux/usb/raw_gadget.h    |  15 +++
 3 files changed, 144 insertions(+), 4 deletions(-)

diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
index 4af8b1f15574..3b3d78e850b2 100644
--- a/Documentation/usb/raw-gadget.rst
+++ b/Documentation/usb/raw-gadget.rst
@@ -52,8 +52,6 @@ The typical usage of Raw Gadget looks like:
 Potential future improvements
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Implement ioctl's for setting/clearing halt status on endpoints.
-
 - Reporting more events (suspend, resume, etc.) through
   USB_RAW_IOCTL_EVENT_FETCH.
 
diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 775f22184aaf..d73ba77014c8 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -204,7 +204,7 @@ static void dev_free(struct kref *kref)
 	}
 	raw_event_queue_destroy(&dev->queue);
 	for (i = 0; i < dev->eps_num; i++) {
-		if (dev->eps[i].state != STATE_EP_ENABLED)
+		if (dev->eps[i].state == STATE_EP_DISABLED)
 			continue;
 		usb_ep_disable(dev->eps[i].ep);
 		usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
@@ -704,6 +704,50 @@ static int raw_ioctl_ep0_read(struct raw_dev *dev, unsigned long value)
 	return ret;
 }
 
+static int raw_ioctl_ep0_stall(struct raw_dev *dev, unsigned long value)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	if (value)
+		return -EINVAL;
+	spin_lock_irqsave(&dev->lock, flags);
+	if (dev->state != STATE_DEV_RUNNING) {
+		dev_dbg(dev->dev, "fail, device is not running\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (!dev->gadget) {
+		dev_dbg(dev->dev, "fail, gadget is not bound\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	if (dev->ep0_urb_queued) {
+		dev_dbg(&dev->gadget->dev, "fail, urb already queued\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	if (!dev->ep0_in_pending && !dev->ep0_out_pending) {
+		dev_dbg(&dev->gadget->dev, "fail, no request pending\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	ret = usb_ep_set_halt(dev->gadget->ep0);
+	if (ret < 0)
+		dev_err(&dev->gadget->dev,
+				"fail, usb_ep_set_halt returned %d\n", ret);
+
+	if (dev->ep0_in_pending)
+		dev->ep0_in_pending = false;
+	else
+		dev->ep0_out_pending = false;
+
+out_unlock:
+	spin_unlock_irqrestore(&dev->lock, flags);
+	return ret;
+}
+
 static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 {
 	int ret = 0, i;
@@ -798,7 +842,7 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 		ret = -EBUSY;
 		goto out_unlock;
 	}
-	if (dev->eps[i].state != STATE_EP_ENABLED) {
+	if (dev->eps[i].state == STATE_EP_DISABLED) {
 		dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
 		ret = -EINVAL;
 		goto out_unlock;
@@ -832,6 +876,74 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 	return ret;
 }
 
+static int raw_ioctl_ep_set_clear_halt_wedge(struct raw_dev *dev,
+		unsigned long value, bool set, bool halt)
+{
+	int ret = 0, i = value;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	if (dev->state != STATE_DEV_RUNNING) {
+		dev_dbg(dev->dev, "fail, device is not running\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (!dev->gadget) {
+		dev_dbg(dev->dev, "fail, gadget is not bound\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	if (i < 0 || i >= dev->eps_num) {
+		dev_dbg(dev->dev, "fail, invalid endpoint\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+	if (dev->eps[i].state == STATE_EP_DISABLED) {
+		dev_dbg(&dev->gadget->dev, "fail, endpoint is not enabled\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (dev->eps[i].disabling) {
+		dev_dbg(&dev->gadget->dev,
+				"fail, disable is in progress\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (dev->eps[i].urb_queued) {
+		dev_dbg(&dev->gadget->dev,
+				"fail, waiting for urb completion\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
+		dev_dbg(&dev->gadget->dev,
+				"fail, can't halt/wedge ISO endpoint\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (set && halt) {
+		ret = usb_ep_set_halt(dev->eps[i].ep);
+		if (ret < 0)
+			dev_err(&dev->gadget->dev,
+				"fail, usb_ep_set_halt returned %d\n", ret);
+	} else if (!set && halt) {
+		ret = usb_ep_clear_halt(dev->eps[i].ep);
+		if (ret < 0)
+			dev_err(&dev->gadget->dev,
+				"fail, usb_ep_clear_halt returned %d\n", ret);
+	} else if (set && !halt) {
+		ret = usb_ep_set_wedge(dev->eps[i].ep);
+		if (ret < 0)
+			dev_err(&dev->gadget->dev,
+				"fail, usb_ep_set_wedge returned %d\n", ret);
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(&dev->lock, flags);
+	return ret;
+}
+
 static void gadget_ep_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct raw_ep *r_ep = (struct raw_ep *)ep->driver_data;
@@ -1128,6 +1240,21 @@ static long raw_ioctl(struct file *fd, unsigned int cmd, unsigned long value)
 	case USB_RAW_IOCTL_EPS_INFO:
 		ret = raw_ioctl_eps_info(dev, value);
 		break;
+	case USB_RAW_IOCTL_EP0_STALL:
+		ret = raw_ioctl_ep0_stall(dev, value);
+		break;
+	case USB_RAW_IOCTL_EP_SET_HALT:
+		ret = raw_ioctl_ep_set_clear_halt_wedge(
+					dev, value, true, true);
+		break;
+	case USB_RAW_IOCTL_EP_CLEAR_HALT:
+		ret = raw_ioctl_ep_set_clear_halt_wedge(
+					dev, value, false, true);
+		break;
+	case USB_RAW_IOCTL_EP_SET_WEDGE:
+		ret = raw_ioctl_ep_set_clear_halt_wedge(
+					dev, value, true, false);
+		break;
 	default:
 		ret = -EINVAL;
 	}
diff --git a/include/uapi/linux/usb/raw_gadget.h b/include/uapi/linux/usb/raw_gadget.h
index c89f6341229c..0be685272eb1 100644
--- a/include/uapi/linux/usb/raw_gadget.h
+++ b/include/uapi/linux/usb/raw_gadget.h
@@ -231,4 +231,19 @@ struct usb_raw_eps_info {
  */
 #define USB_RAW_IOCTL_EPS_INFO		_IOR('U', 11, struct usb_raw_eps_info)
 
+/*
+ * Stalls a pending control request on endpoint 0.
+ * Returns 0 on success or negative error code on failure.
+ */
+#define USB_RAW_IOCTL_EP0_STALL		_IO('U', 12)
+
+/*
+ * Sets or clears halt or wedge status of the endpoint.
+ * Accepts endpoint handle as an argument.
+ * Returns 0 on success or negative error code on failure.
+ */
+#define USB_RAW_IOCTL_EP_SET_HALT	_IOW('U', 13, __u32)
+#define USB_RAW_IOCTL_EP_CLEAR_HALT	_IOW('U', 14, __u32)
+#define USB_RAW_IOCTL_EP_SET_WEDGE	_IOW('U', 15, __u32)
+
 #endif /* _UAPI__LINUX_USB_RAW_GADGET_H */
-- 
2.26.2.526.g744177e7f7-goog

