Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21CA64C4D5
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 09:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237511AbiLNIPi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 03:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiLNIPd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 03:15:33 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEFF332
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:15:31 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id i19-20020a63e913000000b004705d1506a6so1439698pgh.13
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bn6P4SXTcnnoGxUW7y0CYOxZKX7M0IcTnQS27FExxMo=;
        b=Z1hr+l4ixtVJKMiMdnsLY34rKqCvYqJ8iorTd8oSWri6sFQGT+myXOL4X38hHToiue
         bqESQEDRBS6pfrI9bifDCZJ5opUmEYUDKKqUZXUCMP4lvvc5ci584UH4fVwBwBwwaO+d
         7tPfeV5degxxTMJaY9NWg2y1D0EfoX2ZVYcC2mLwO3iFoqcXGWEGPg8xWItrFU/uqf4S
         yYSXuS7R9ClT4J6pOB1Qt0CjUqjRXdsRQJ5vfT51TxkC9cKJ3H9F9O+SnHx1ShazrSEl
         UkobfSc7l1wwUmZt6VG60zTe69m+NdDO3akZIElyTjolTJYiRVLkxILUWG3LbBuyB6QQ
         fpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bn6P4SXTcnnoGxUW7y0CYOxZKX7M0IcTnQS27FExxMo=;
        b=3dIYzxXw7Mi/kaQJJUXN7sDsK2uwuw3TP/rD3MPqeyKjK57bNCYGzMzGcAqZwT6CRN
         0twIbz8aLoLReOnhVdIkxbJieUY5rXurBev7kAKBaoIzfCf6RwR8MiCQffkd7fxL94Bi
         4OhiqjvZNuKhE61qyhjtwAyu76tgOAPElFpYf2g7xX4ZdocuL7x5zGWrjUP5EbZiH9Jp
         vv1umvITRFg2wo98Yzz4RU1z8Pcg2mOKvMmH8ZEt/o0ho1lNd9WPQlJeDuVo2tgYVG3s
         m04cpbr5umUa+lOdvGROn561MzI9CkalbmbqU51KQOUNTkHkd10hvZBz/2bvrWIbAyyM
         jtRw==
X-Gm-Message-State: ANoB5pkX8kz76+S9HCKC4AruxEZDPTkxqpNlWRy4iJSvUd4xL6pX8xoo
        UN0J/eCvUy+2PstSFkuBeKDltsbPLzOb
X-Google-Smtp-Source: AA0mqf7E9sUGmKs3e0FH+MCFQOXZ2gyiPI7HZUwtZyH71a6cgKc7DVNsSkEtKWmN9URNNbZ+wMdn1EwQHu2l
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:cb1:cbe3:3a49:1751])
 (user=pumahsu job=sendgmr) by 2002:a17:90a:2ecb:b0:219:5b3b:2b9f with SMTP id
 h11-20020a17090a2ecb00b002195b3b2b9fmr95411pjs.2.1671005731042; Wed, 14 Dec
 2022 00:15:31 -0800 (PST)
Date:   Wed, 14 Dec 2022 16:14:55 +0800
In-Reply-To: <20221214081456.714859-1-pumahsu@google.com>
Message-Id: <20221214081456.714859-2-pumahsu@google.com>
Mime-Version: 1.0
References: <20221214081456.714859-1-pumahsu@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Subject: [PATCH v2 1/2] usb: core: add hooks for usb suspend and resume
From:   Puma Hsu <pumahsu@google.com>
To:     gregkh@linuxfoundation.org, mka@chromium.org, dianders@chromium.org
Cc:     albertccwang@google.com, raychi@google.com, howardyen@google.com,
        leejj@google.com, hch@infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the hooks that designer can design and bypass the original
suspend/resume. When the handled is set, skip the original
suspend/resume process.

In mobile, a co-processor can be used for USB audio. When the co-processor
is working for USB audio, the co-processor is the user/owner of the USB
driver, and the ACPU is able to sleep in such condition to improve power
consumption. In original process, the ACPU will suspend/resume until the
USB suspend/resume. We add the hooks, so we can control USB suspend/resume
without affecting the ACPU.

Signed-off-by: Puma Hsu <pumahsu@google.com>

---
Changes in v2:
- Remove the wrong input in the Makefile
- Change description in commit message

---
 drivers/usb/core/driver.c | 36 ++++++++++++++++++++++++++++++++++++
 drivers/usb/core/usb.h    |  5 +++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7e7e119c253f..3d2cfb6c2277 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -35,6 +35,25 @@
 #include "usb.h"
 
 
+static struct usb_device_vendor_ops *usb_dev_vendor_ops;
+
+int usb_dev_register_vendor_ops(struct usb_device_vendor_ops *vendor_ops)
+{
+	if (vendor_ops == NULL)
+		return -EINVAL;
+
+	usb_dev_vendor_ops = vendor_ops;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_dev_register_vendor_ops);
+
+struct usb_device_vendor_ops *usb_vendor_get_ops(void)
+{
+	return usb_dev_vendor_ops;
+}
+EXPORT_SYMBOL_GPL(usb_vendor_get_ops);
+
+
 /*
  * Adds a new dynamic USBdevice ID to this driver,
  * and cause the driver to probe for all devices again.
@@ -1400,11 +1419,19 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
 	int			status = 0;
 	int			i = 0, n = 0;
 	struct usb_interface	*intf;
+	bool			handled;
+	struct usb_device_vendor_ops *ops = usb_vendor_get_ops();
 
 	if (udev->state == USB_STATE_NOTATTACHED ||
 			udev->state == USB_STATE_SUSPENDED)
 		goto done;
 
+	if (ops && ops->usb_dev_suspend) {
+		handled = ops->usb_dev_suspend(udev, msg);
+		if (handled)
+			goto done;
+	}
+
 	/* Suspend all the interfaces and then udev itself */
 	if (udev->actconfig) {
 		n = udev->actconfig->desc.bNumInterfaces;
@@ -1501,11 +1528,20 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 	int			status = 0;
 	int			i;
 	struct usb_interface	*intf;
+	bool			handled;
+	struct usb_device_vendor_ops *ops = usb_vendor_get_ops();
 
 	if (udev->state == USB_STATE_NOTATTACHED) {
 		status = -ENODEV;
 		goto done;
 	}
+
+	if (ops && ops->usb_dev_resume) {
+		handled = ops->usb_dev_resume(udev, msg);
+		if (handled)
+			goto done;
+	}
+
 	udev->can_submit = 1;
 
 	/* Resume the device */
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index 82538daac8b8..9ccb8683071d 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -220,3 +220,8 @@ extern acpi_handle usb_get_hub_port_acpi_handle(struct usb_device *hdev,
 static inline int usb_acpi_register(void) { return 0; };
 static inline void usb_acpi_unregister(void) { };
 #endif
+
+struct usb_device_vendor_ops {
+	bool (*usb_dev_suspend)(struct usb_device *udev, pm_message_t msg);
+	bool (*usb_dev_resume)(struct usb_device *udev, pm_message_t msg);
+};
-- 
2.39.0.rc1.256.g54fd8350bd-goog

