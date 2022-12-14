Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B27164C4D9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 09:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237630AbiLNIQW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 03:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237603AbiLNIPl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 03:15:41 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA259631F
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:15:39 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id c12-20020a170902d48c00b00189e5443387so2016936plg.15
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwk10ScpIHN3TWeoCLrvB+vfcB+zS8T8ixzqnuDxGoQ=;
        b=dkcTJ5yY0DPuZjIwNfNUh0clfXYOIg6v+BRa60N2SdhsarYnRZ3ACBNpqFPdZ+JIgf
         rhVss6RLEXghltsYgubXVsy4QQ1bOvcYFIfD6VmQC9Ke9WQDEl+JvzE7lSGUdDc3nEHu
         mlrwozBeVIQvflG/LgXvDlGqU0d2b2S9lb4xQl509RKjmZr4jN25PFQOr/RWcqBpx+w0
         1uUeUFI2tGYYHDZyJk/mKw8nu3mUltU+nT9izejge1P9xmWwp2otB+B04CQTwUg1VBuP
         ma7PFx2xBI43X1LprzqckTNUkinyU/ljwglaIKC9n7D9pi6qX0SLo+4ilSCue3Uk5BEW
         REkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwk10ScpIHN3TWeoCLrvB+vfcB+zS8T8ixzqnuDxGoQ=;
        b=k5p6FC3yjVMYjsKunAi/hNM+XLTAnJb8+KHuzXyBcQpcqB0M84wzaE4magDwGNBINK
         8Mui2diQn+EkWWbOL5NbSvoy4MgJw6qoWdOjLJ7dMhTV2C7CdfHLWU274u3OSuIPZzRY
         SIdLdAzM+dNhrdB+kgpxL8EADRXzp2Vt9IqdIsHx18VXAjAaMa7JCB85dZGnN3Nf/PKg
         6b79jBlaXb2ib3NTT9hwOTj0UKHtE5gOjdgo/BbLNd90mBDBwxmpF4l5GwnpGbuDIie7
         yr/+BQWhNZhDvxpwrjb4xEtRIa2CcjhXT/wBt/KopdbhzJPrDV5eHB2tbSkaT3Hzldbp
         FY/w==
X-Gm-Message-State: ANoB5pm7gncwk80i+KD46Q3buJxZgmwR0SYDMS88l3OsMYH2lynpXOml
        xV3am++YvdhJj/1NVmkA0KwNjD2T6NiS
X-Google-Smtp-Source: AA0mqf5x5mm8q42pvr7qS1/4HKVynW1FNFZYEG9MRq8p/qRAj14cWfw2S015p02u7YaTPAS97nj60eebwqBP
X-Received: from pumahsu.ntc.corp.google.com ([2401:fa00:fc:202:cb1:cbe3:3a49:1751])
 (user=pumahsu job=sendgmr) by 2002:a17:902:e80c:b0:189:f899:bc23 with SMTP id
 u12-20020a170902e80c00b00189f899bc23mr7111469plg.33.1671005739282; Wed, 14
 Dec 2022 00:15:39 -0800 (PST)
Date:   Wed, 14 Dec 2022 16:14:56 +0800
In-Reply-To: <20221214081456.714859-1-pumahsu@google.com>
Message-Id: <20221214081456.714859-3-pumahsu@google.com>
Mime-Version: 1.0
References: <20221214081456.714859-1-pumahsu@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Subject: [PATCH v2 2/2] usb: core: add implementations for usb suspend/resume hooks
From:   Puma Hsu <pumahsu@google.com>
To:     gregkh@linuxfoundation.org, mka@chromium.org, dianders@chromium.org
Cc:     albertccwang@google.com, raychi@google.com, howardyen@google.com,
        leejj@google.com, hch@infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In mobile, a co-processor can be used for USB audio. When the co-processor
is working for USB audio, the co-processor is the user/owner of the USB
driver, and the ACPU is able to sleep in such condition to improve power
consumption. In order to support this, we implement the hooks to handle USB
suspend/resume requests.

This commit introduces two hook implementations:
- usb_device_vendor_suspend()
  Determine whether we should skip suspend request according to the status
  of USB audio playback/capture.
  Return:
  - true: let driver.c know that we "handled" and it can just return
          succeeded to ACPU to continue system suspend process.
  - false: let driver.c know that it still run original suspend process.

- usb_device_vendor_resume()
  Determine whether we should skip resume request according to the USB
  device's suspend state.
  Return:
  - true: let driver.c know that it doesn't need to run resume process.
  - false: let driver.c know that it still run original resume process.

Signed-off-by: Puma Hsu <pumahsu@google.com>
---
 drivers/usb/core/usb-hooks-impl-goog.c | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 drivers/usb/core/usb-hooks-impl-goog.c

diff --git a/drivers/usb/core/usb-hooks-impl-goog.c b/drivers/usb/core/usb-hooks-impl-goog.c
new file mode 100644
index 000000000000..89dc360babed
--- /dev/null
+++ b/drivers/usb/core/usb-hooks-impl-goog.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Google Corp.
+ *
+ * Author:
+ *  Puma Hsu <pumahsu@google.com>
+ */
+
+#include <linux/usb.h>
+#include "usb.h"
+
+extern int usb_dev_register_vendor_ops(struct usb_device_vendor_ops *vendor_ops);
+
+static bool usb_device_vendor_suspend(struct usb_device *udev, pm_message_t msg)
+{
+	bool usb_playback = false;
+	bool usb_capture = false;
+	bool handled = false;
+
+	if (!udev)
+		return handled;
+
+	/*
+	 * Note: Our private driver provides APIs to know the device is in audio playback
+	 * or capture.
+	 *
+	 * usb_playback = usb_audio_playback_enabled();
+	 * usb_capture = usb_audio_capture_enabled();
+	 */
+
+	/*
+	 * Note: When the USB audio is working, we will not let the usb device suspend.
+	 * Return handled = true so that the System core can it's suspend process.
+	 */
+	if (usb_playback || usb_capture) {
+		dev_info(&udev->dev, "%s: skip suspend process (playback:%d,capture:%d)\n",
+			 __func__, usb_playback, usb_capture);
+		handled = true;
+	}
+
+	return handled;
+}
+
+static bool usb_device_vendor_resume(struct usb_device *udev, pm_message_t msg)
+{
+	bool handled = false;
+
+	if (!udev)
+		return handled;
+
+	/*
+	 * Note: If the udev didn't suspend actually, we don't need to do resume.
+	 */
+	if (udev->port_is_suspended || udev->state == USB_STATE_SUSPENDED) {
+		handled = false;
+	} else {
+		dev_info(&udev->dev, "%s: skip resume process\n", __func__);
+		handled = true;
+	}
+
+	return handled;
+}
+
+static struct usb_device_vendor_ops usb_dev_vendor_ops = {
+	.usb_dev_suspend = usb_device_vendor_suspend,
+	.usb_dev_resume = usb_device_vendor_resume,
+};
+
+int usb_vendor_helper_init(void)
+{
+	return usb_dev_register_vendor_ops(&usb_dev_vendor_ops);
+}
-- 
2.39.0.rc1.256.g54fd8350bd-goog

