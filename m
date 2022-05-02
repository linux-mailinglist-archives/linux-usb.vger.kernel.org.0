Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAF0516B14
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 09:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358493AbiEBHLe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 03:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354251AbiEBHLc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 03:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CA2E369FC
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651475284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Q0MdT8wV/+aiB+RqQZTDcoaBUC3v+WT+dHQmdgPXELM=;
        b=MnOiCjimmX93bHJK5pQ3pO4e9Ukt13GE52+j/JNs2bGOysMpdoqJ7oDQJu8GxDk12THtjx
        3K6nEVDOUTY+FLT9Ulci0RbNcGhzKd2GoKFIBpZjS5dAN3JBXcZYaPsZQw6rELEmXHGLs/
        P0pfF3YFOg6EhhfxNDCrbHzRH99LW14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-KR1y3eeeMm2PfWzGONhv0A-1; Mon, 02 May 2022 03:08:02 -0400
X-MC-Unique: KR1y3eeeMm2PfWzGONhv0A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A0CA833962;
        Mon,  2 May 2022 07:08:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.125])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B3FD3403152;
        Mon,  2 May 2022 07:08:00 +0000 (UTC)
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     marcel@holtmann.org,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH] Bluetooth: btusb: CSR chip hangs when unbound
Date:   Mon,  2 May 2022 09:07:58 +0200
Message-Id: <20220502070758.67396-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
Trust) hang when they are unbound from 'unbind' sysfs entry and
can not be bound again.

The reason is CSR chip hangs when usb configuration command with
index 0 (used to unconfigure) is sent during disconnection.

To avoid this unwanted result, it is necessary not to send this
command for CSR chip when usb device is unbound, so a new quirk
has been created for this device.

Athough device is not unconfigured, it is better to avoid device
hanging to be able to operate. Even bluetooth can be previously
turned off.
On the other hand, this is not important if usb device is going to
be bound again (normal behavior), i.e. with usbip.
---
 drivers/usb/core/generic.c | 3 ++-
 drivers/usb/core/quirks.c  | 3 +++
 include/linux/usb/quirks.h | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index 740342a2812a..ea770b83d876 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -22,6 +22,7 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <uapi/linux/usb/audio.h>
+#include <linux/usb/quirks.h>
 #include "usb.h"
 
 static inline const char *plural(int n)
@@ -256,7 +257,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
 
 	/* if this is only an unbind, not a physical disconnect, then
 	 * unconfigure the device */
-	if (udev->actconfig)
+	if (!(udev->quirks & USB_QUIRK_SKIP_UNCONFIGURE) && udev->actconfig)
 		usb_set_configuration(udev, -1);
 }
 
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index d3c14b5ed4a1..13989629d743 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -510,6 +510,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* INTEL VALUE SSD */
 	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* CSR Bluetooth */
+	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = USB_QUIRK_SKIP_UNCONFIGURE },
+
 	{ }  /* terminating entry must be last */
 };
 
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index eeb7c2157c72..84ab0a369931 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -72,4 +72,7 @@
 /* device has endpoints that should be ignored */
 #define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
 
+/* device doesn't support unconfigure when unbound. */
+#define USB_QUIRK_SKIP_UNCONFIGURE		BIT(16)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.35.1

