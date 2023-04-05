Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA916D7867
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 11:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237682AbjDEJcn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 05:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237788AbjDEJc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 05:32:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCD15BAB
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 02:31:50 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 204-20020a250fd5000000b00b6d6655dc35so34552157ybp.6
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680687096;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yBhMce5MJnmp23KM1dsJQjjtpNOxg2YPVBV4k7AdjEQ=;
        b=aKsY5zNFDmGcT2oLevWC/U6nVR8VVMOStPWNb4b9XzcOaVjjp+bwM1RXUgrG4WynDQ
         EAxvcUnxeK8linTrOHXJ23Neiwz4JAipa8sCiG5FwsjKyZnSg4nLhAAeeHaeGvIkyxBN
         0vxBwJODeOm8+XNgsAemb9wyJOCmS1+BVmwQwIj7dxnUwF+JhVy0qD0yKI1q8aiR2Bfp
         BqOqXQFOrEOccYY5wWn/4RG6V5hIFL7gced4oTznR9QP98pyNMjTO50nnFeJpqBjnJWN
         tHmMzJjz+MdOldH4zur6+Mfj77JQM81yJGOVtkzG2xueaSaWjstQgEmhlCbHFgtozBqT
         4ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680687096;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBhMce5MJnmp23KM1dsJQjjtpNOxg2YPVBV4k7AdjEQ=;
        b=CiJpxnrqXGVpA8dpx7E7kgRPNTVA7Gpomg2epBJ/542YA32NWbgxCOTkMHSuzo+FH7
         vSnG3vWkAPgGHt7DQ4CR3jH1mCVkkYWX6Clx/BcwklmhCjlKXe64QThWCjdfVjf3SVuu
         0kk1gqWSH330OH04m6SBc8uoj274toA/NcaoM567LYyPAjx8seUlPSU5zMFzHyfDprhF
         eA6DEo7+4Sf6SWBVZ9OPbkTj+s14Y91QT4tBvejR8PFsaeW2tzzzt2cfaM0EOyPhzp8P
         g74cgGE0u+9K3UfN1yrlMlP7/piWug/k4egG7fQra5aosbi8jykF9vMyAIrfhp0mWHLU
         gbeA==
X-Gm-Message-State: AAQBX9ezxXtVsy/DGHcD4gZlYZ/GkYwvge1JA1+WJ04RteJJYKEFxq8Z
        k8tAkC7GFdbJSJI3w0UeIQ3UE9saQVE=
X-Google-Smtp-Source: AKy350Z65mkS+F6+obV9zcmrHvkJXQkjOz7M3BWVH07O3xO+HLMKQCcCFv7crfTnz3r+DFRozrmh0MeyTAw=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a25:da4e:0:b0:a02:a3a6:78fa with SMTP id
 n75-20020a25da4e000000b00a02a3a678famr3137102ybf.12.1680687096140; Wed, 05
 Apr 2023 02:31:36 -0700 (PDT)
Date:   Wed,  5 Apr 2023 09:31:32 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405093133.1858140-1-badhri@google.com>
Subject: [PATCH v1 1/2] usb: gadget: udc: core: Invoke usb_gadget_connect only
 when started
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        colin.i.king@gmail.com, xuetao09@huawei.com,
        quic_eserrao@quicinc.com, water.zhangjiantao@huawei.com,
        peter.chen@freescale.com, balbi@ti.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_udc_connect_control does not check to see if the udc
has already been started. This causes gadget->ops->pullup
to be called through usb_gadget_connect when invoked
from usb_udc_vbus_handler even before usb_gadget_udc_start
is called. Guard this by checking for udc->started in
usb_udc_connect_control before invoking usb_gadget_connect.

Guarding udc_connect_control, udc->started and udc->vbus
with its own mutex as usb_udc_connect_control_locked
can be simulataneously invoked from different code paths.

Cc: stable@vger.kernel.org

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Fixes: 628ef0d273a6 ("usb: udc: add usb_udc_vbus_handler")
---
 drivers/usb/gadget/udc/core.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 3dcbba739db6..890f92cb6344 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -56,6 +56,8 @@ static LIST_HEAD(udc_list);
 /* Protects udc_list, udc->driver, driver->is_bound, and related calls */
 static DEFINE_MUTEX(udc_lock);
 
+/* Protects udc->vbus, udc-started and udc_connect_control_locked */
+static DEFINE_MUTEX(udc_connect_control_lock);
 /* ------------------------------------------------------------------------- */
 
 /**
@@ -1078,9 +1080,10 @@ EXPORT_SYMBOL_GPL(usb_gadget_set_state);
 
 /* ------------------------------------------------------------------------- */
 
-static void usb_udc_connect_control(struct usb_udc *udc)
+/* Acquire udc_connect_control_lock before calling this function. */
+static void usb_udc_connect_control_locked(struct usb_udc *udc)
 {
-	if (udc->vbus)
+	if (udc->vbus && udc->started)
 		usb_gadget_connect(udc->gadget);
 	else
 		usb_gadget_disconnect(udc->gadget);
@@ -1099,10 +1102,12 @@ void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
 {
 	struct usb_udc *udc = gadget->udc;
 
+	mutex_lock(&udc_connect_control_lock);
 	if (udc) {
 		udc->vbus = status;
-		usb_udc_connect_control(udc);
+		usb_udc_connect_control_locked(udc);
 	}
+	mutex_unlock(&udc_connect_control_lock);
 }
 EXPORT_SYMBOL_GPL(usb_udc_vbus_handler);
 
@@ -1140,14 +1145,18 @@ static inline int usb_gadget_udc_start(struct usb_udc *udc)
 {
 	int ret;
 
+	mutex_lock(&udc_connect_control_lock);
 	if (udc->started) {
 		dev_err(&udc->dev, "UDC had already started\n");
+		mutex_unlock(&udc_connect_control_lock);
 		return -EBUSY;
 	}
 
 	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
 	if (!ret)
 		udc->started = true;
+	usb_udc_connect_control_locked(udc);
+	mutex_unlock(&udc_connect_control_lock);
 
 	return ret;
 }
@@ -1165,13 +1174,17 @@ static inline int usb_gadget_udc_start(struct usb_udc *udc)
  */
 static inline void usb_gadget_udc_stop(struct usb_udc *udc)
 {
+	mutex_lock(&udc_connect_control_lock);
 	if (!udc->started) {
 		dev_err(&udc->dev, "UDC had already stopped\n");
+		mutex_unlock(&udc_connect_control_lock);
 		return;
 	}
 
 	udc->gadget->ops->udc_stop(udc->gadget);
 	udc->started = false;
+	usb_udc_connect_control_locked(udc);
+	mutex_unlock(&udc_connect_control_lock);
 }
 
 /**
@@ -1527,7 +1540,6 @@ static int gadget_bind_driver(struct device *dev)
 	if (ret)
 		goto err_start;
 	usb_gadget_enable_async_callbacks(udc);
-	usb_udc_connect_control(udc);
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 	return 0;

base-commit: d629c0e221cd99198b843d8351a0a9bfec6c0423
-- 
2.40.0.348.gf938b09366-goog

