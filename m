Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FF8213683
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgGCIgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCIgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 04:36:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65ABAC08C5C1
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 01:36:44 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g17so12392528plq.12
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SoWMJOtoC4VF3gtGCj5O3Tu04aNeKdj58z7B8SFxIqM=;
        b=PAjn5GY0lO+ZQvQrDH9Y9MqbRQbG8LPmLZZiRjcHjugAg20GgsDeEsOU0q/16iLEpB
         z0V3w+qOkhc/yZbomHerqpe3agEdcyfx3oD9fLtOn2WcBMur73pAIHnZ++jSzfOZFovY
         KAK4q083j2p7K6n7SkOjiXah48tTMt+CImfBk7mYR/OJOfi2EqkOwqt7sCM8Q+mKtPBG
         rHkTowooO9hnNLnukEgF+HD6fpTDEHM0dQtXRxIg9zZVoDc+jIH3Wdjil9LcV2oKQ7RH
         8aME4kYzH4IKMBo78SFj0WLNT1JXooVFjcRa9LWi9imn9wpaoog46Rv5RjF89dOKUDh3
         aRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SoWMJOtoC4VF3gtGCj5O3Tu04aNeKdj58z7B8SFxIqM=;
        b=cuIfd6Dniumd7iqXAiLK1ubLcIQnZZuP2mvZy2om75rghAyzQETOzEDEKs0JloVrsG
         wx4VsscRmwFzq/bO9NBCp3fTkluOr3wzwBIUTt1PXGsWHbzhAvF+sf86Yu4Gaf0IooQF
         tCKFuKeSyJgcPnFXDS8sQlSMIvo7KMyO7XRaldDx6Ia7BVeXj4vC6bwB2VwMzpgxy1xt
         A+oPe/HiaD2hHL7iYCQRKSBajhzQIs6iJeTj4gFoVE+qlIpracB7Wzhm0F/5Gp4B8yEb
         oYDIYaSk2LgsYDK3UqyCntemI9BN7WJP/SJcYxY/Kr9wpsFcPKiQXuhdUshjtwGyFJVS
         GWYA==
X-Gm-Message-State: AOAM531hKWKqa9HKTimY00EG4DXr5Upkkl92Cm5G5KYsNUDF4zIUljE9
        DN2LuvR3y6ytRrl6AjFxSQY=
X-Google-Smtp-Source: ABdhPJz4ZrLzGTxlc6zAj7n1JxzI+lG293o9yp1Z9B3gl0GdTpo3+tQZooXUQNjz8ZkOpdYZx89nPg==
X-Received: by 2002:a17:90a:ed87:: with SMTP id k7mr27212839pjy.31.1593765403818;
        Fri, 03 Jul 2020 01:36:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-95-176-223.san.res.rr.com. [70.95.176.223])
        by smtp.gmail.com with ESMTPSA id w15sm10141937pjb.44.2020.07.03.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 01:36:43 -0700 (PDT)
From:   Chris Dickens <christopher.a.dickens@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com,
        Chris Dickens <christopher.a.dickens@gmail.com>
Subject: [PATCH] usb: gadget: composite: Remove dedicated OS Feature Descriptors request
Date:   Fri,  3 Jul 2020 01:35:34 -0700
Message-Id: <20200703083534.5292-1-christopher.a.dickens@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703072436.GB2225285@kroah.com>
References: <20200703072436.GB2225285@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently Microsoft OS Feature Descriptors are handled using a
separately allocated USB request, however everything about this USB
request is identical to the USB request used for all other control
responses. Simplify the code by removing this separate USB request and
using the same USB request as all other control responses.

While at it, simplify the composite_ep0_queue() function by removing the
req and gfp_flags arguments. The former is no longer necessary with a
single USB request and the latter is always GFP_ATOMIC.

Signed-off-by: Chris Dickens <christopher.a.dickens@gmail.com>
---
 drivers/usb/gadget/composite.c | 69 +++++-----------------------------
 drivers/usb/gadget/configfs.c  | 11 ------
 include/linux/usb/composite.h  |  9 -----
 3 files changed, 9 insertions(+), 80 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 5c1eb96a5c57..020801e70caf 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1443,26 +1443,17 @@ static void composite_setup_complete(struct usb_ep *ep, struct usb_request *req)
 
 	if (cdev->req == req)
 		cdev->setup_pending = false;
-	else if (cdev->os_desc_req == req)
-		cdev->os_desc_pending = false;
 	else
 		WARN(1, "unknown request %p\n", req);
 }
 
-static int composite_ep0_queue(struct usb_composite_dev *cdev,
-		struct usb_request *req, gfp_t gfp_flags)
+static int composite_ep0_queue(struct usb_composite_dev *cdev)
 {
 	int ret;
 
-	ret = usb_ep_queue(cdev->gadget->ep0, req, gfp_flags);
-	if (ret == 0) {
-		if (cdev->req == req)
-			cdev->setup_pending = true;
-		else if (cdev->os_desc_req == req)
-			cdev->os_desc_pending = true;
-		else
-			WARN(1, "unknown request %p\n", req);
-	}
+	ret = usb_ep_queue(cdev->gadget->ep0, cdev->req, GFP_ATOMIC);
+	if (ret == 0)
+		cdev->setup_pending = true;
 
 	return ret;
 }
@@ -1519,7 +1510,7 @@ static int fill_ext_compat(struct usb_configuration *c, u8 *buf)
 				buf += 23;
 			}
 			count += 24;
-			if (count + 24 >= USB_COMP_EP0_OS_DESC_BUFSIZ)
+			if (count + 24 >= USB_COMP_EP0_BUFSIZ)
 				return count;
 		}
 	}
@@ -1581,7 +1572,7 @@ static int fill_ext_prop(struct usb_configuration *c, int interface, u8 *buf)
 			list_for_each_entry(ext_prop, &d->ext_prop, entry) {
 				n = ext_prop->data_len +
 					ext_prop->name_len + 14;
-				if (count + n >= USB_COMP_EP0_OS_DESC_BUFSIZ)
+				if (count + n >= USB_COMP_EP0_BUFSIZ)
 					return count;
 				usb_ext_prop_put_size(buf, n);
 				usb_ext_prop_put_type(buf, ext_prop->type);
@@ -1893,12 +1884,9 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 			int				interface;
 			int				count = 0;
 
-			req = cdev->os_desc_req;
-			req->context = cdev;
-			req->complete = composite_setup_complete;
 			buf = req->buf;
 			os_desc_cfg = cdev->os_desc_config;
-			w_length = min_t(u16, w_length, USB_COMP_EP0_OS_DESC_BUFSIZ);
+			w_length = min_t(u16, w_length, USB_COMP_EP0_BUFSIZ);
 			memset(buf, 0, w_length);
 			buf[5] = 0x01;
 			switch (ctrl->bRequestType & USB_RECIP_MASK) {
@@ -2019,7 +2007,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 		req->length = value;
 		req->context = cdev;
 		req->zero = value < w_length;
-		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
+		value = composite_ep0_queue(cdev);
 		if (value < 0) {
 			DBG(cdev, "ep_queue --> %d\n", value);
 			req->status = 0;
@@ -2187,30 +2175,6 @@ int composite_dev_prepare(struct usb_composite_driver *composite,
 	return ret;
 }
 
-int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
-				  struct usb_ep *ep0)
-{
-	int ret = 0;
-
-	cdev->os_desc_req = usb_ep_alloc_request(ep0, GFP_KERNEL);
-	if (!cdev->os_desc_req) {
-		ret = -ENOMEM;
-		goto end;
-	}
-
-	cdev->os_desc_req->buf = kmalloc(USB_COMP_EP0_OS_DESC_BUFSIZ,
-					 GFP_KERNEL);
-	if (!cdev->os_desc_req->buf) {
-		ret = -ENOMEM;
-		usb_ep_free_request(ep0, cdev->os_desc_req);
-		goto end;
-	}
-	cdev->os_desc_req->context = cdev;
-	cdev->os_desc_req->complete = composite_setup_complete;
-end:
-	return ret;
-}
-
 void composite_dev_cleanup(struct usb_composite_dev *cdev)
 {
 	struct usb_gadget_string_container *uc, *tmp;
@@ -2220,15 +2184,6 @@ void composite_dev_cleanup(struct usb_composite_dev *cdev)
 		list_del(&uc->list);
 		kfree(uc);
 	}
-	if (cdev->os_desc_req) {
-		if (cdev->os_desc_pending)
-			usb_ep_dequeue(cdev->gadget->ep0, cdev->os_desc_req);
-
-		kfree(cdev->os_desc_req->buf);
-		cdev->os_desc_req->buf = NULL;
-		usb_ep_free_request(cdev->gadget->ep0, cdev->os_desc_req);
-		cdev->os_desc_req = NULL;
-	}
 	if (cdev->req) {
 		if (cdev->setup_pending)
 			usb_ep_dequeue(cdev->gadget->ep0, cdev->req);
@@ -2286,12 +2241,6 @@ static int composite_bind(struct usb_gadget *gadget,
 	if (status < 0)
 		goto fail;
 
-	if (cdev->use_os_string) {
-		status = composite_os_desc_req_prepare(cdev, gadget->ep0);
-		if (status)
-			goto fail;
-	}
-
 	update_unchanged_dev_desc(&cdev->desc, composite->dev);
 
 	/* has userspace failed to provide a serial number? */
@@ -2460,7 +2409,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
 		DBG(cdev, "%s: Completing delayed status\n", __func__);
 		req->length = 0;
 		req->context = cdev;
-		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
+		value = composite_ep0_queue(cdev);
 		if (value < 0) {
 			DBG(cdev, "ep_queue --> %d\n", value);
 			req->status = 0;
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 9dc06a4e1b30..24a86de6293c 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1232,12 +1232,6 @@ static int configfs_do_nothing(struct usb_composite_dev *cdev)
 	return -EINVAL;
 }
 
-int composite_dev_prepare(struct usb_composite_driver *composite,
-		struct usb_composite_dev *dev);
-
-int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
-				  struct usb_ep *ep0);
-
 static void purge_configs_funcs(struct gadget_info *gi)
 {
 	struct usb_configuration	*c;
@@ -1393,11 +1387,6 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
 		}
 		usb_ep_autoconfig_reset(cdev->gadget);
 	}
-	if (cdev->use_os_string) {
-		ret = composite_os_desc_req_prepare(cdev, gadget->ep0);
-		if (ret)
-			goto err_purge_funcs;
-	}
 
 	usb_ep_autoconfig_reset(cdev->gadget);
 	return 0;
diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
index 2040696d75b6..505d3509a8bb 100644
--- a/include/linux/usb/composite.h
+++ b/include/linux/usb/composite.h
@@ -54,9 +54,6 @@
 /* big enough to hold our biggest descriptor */
 #define USB_COMP_EP0_BUFSIZ	4096
 
-/* OS feature descriptor length <= 4kB */
-#define USB_COMP_EP0_OS_DESC_BUFSIZ	4096
-
 #define USB_MS_TO_HS_INTERVAL(x)	(ilog2((x * 1000 / 125)) + 1)
 struct usb_configuration;
 
@@ -423,8 +420,6 @@ extern void usb_composite_unregister(struct usb_composite_driver *driver);
 extern void usb_composite_setup_continue(struct usb_composite_dev *cdev);
 extern int composite_dev_prepare(struct usb_composite_driver *composite,
 		struct usb_composite_dev *cdev);
-extern int composite_os_desc_req_prepare(struct usb_composite_dev *cdev,
-					 struct usb_ep *ep0);
 void composite_dev_cleanup(struct usb_composite_dev *cdev);
 
 static inline struct usb_composite_driver *to_cdriver(
@@ -440,14 +435,12 @@ static inline struct usb_composite_driver *to_cdriver(
  * struct usb_composite_device - represents one composite usb gadget
  * @gadget: read-only, abstracts the gadget's usb peripheral controller
  * @req: used for control responses; buffer is pre-allocated
- * @os_desc_req: used for OS descriptors responses; buffer is pre-allocated
  * @config: the currently active configuration
  * @qw_sign: qwSignature part of the OS string
  * @b_vendor_code: bMS_VendorCode part of the OS string
  * @use_os_string: false by default, interested gadgets set it
  * @os_desc_config: the configuration to be used with OS descriptors
  * @setup_pending: true when setup request is queued but not completed
- * @os_desc_pending: true when os_desc request is queued but not completed
  *
  * One of these devices is allocated and initialized before the
  * associated device driver's bind() is called.
@@ -478,7 +471,6 @@ static inline struct usb_composite_driver *to_cdriver(
 struct usb_composite_dev {
 	struct usb_gadget		*gadget;
 	struct usb_request		*req;
-	struct usb_request		*os_desc_req;
 
 	struct usb_configuration	*config;
 
@@ -513,7 +505,6 @@ struct usb_composite_dev {
 
 	/* public: */
 	unsigned int			setup_pending:1;
-	unsigned int			os_desc_pending:1;
 };
 
 extern int usb_string_id(struct usb_composite_dev *c);
-- 
2.27.0

