Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FAE51A389
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 17:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352091AbiEDPUh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 11:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232760AbiEDPUd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 11:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C42C419C0E
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 08:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651677415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Mi1A3ReNa36HNC0SRDW2IFs7qSLNUw4P2PtvbE52ntA=;
        b=aPTHqgixQGABW0Aig+Iqiqe3WJl0DUbT89uliXuFPLCa2PVfQ/Osb3f4hG/t5PHOmKTIiM
        XksfZBrm6fG+RtqP6raVK2Hqv+xWfEZQ+ks3DkqnOQfr0oPebcYTj7zEg4XFDk2uKxjq3o
        btaoBfpT9EPSSjiwWxyLeKl1MBCnF7s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145--Y-THeSePXS3x0xAQQuJ7Q-1; Wed, 04 May 2022 11:16:52 -0400
X-MC-Unique: -Y-THeSePXS3x0xAQQuJ7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F28E397968A;
        Wed,  4 May 2022 15:16:52 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.125])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF2B403D193;
        Wed,  4 May 2022 15:16:49 +0000 (UTC)
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Cc:     marcel@holtmann.org,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH v5] USB: core: skip unconfiguration if device doesn't support it
Date:   Wed,  4 May 2022 17:16:47 +0200
Message-Id: <20220504151647.471885-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some devices like Bluetooth Dongles with CSR chip (i.e. USB
Bluetooth V4.0 Dongle by Trust) hang when they are unbound from
'unbind' sysfs entry and can not be bound again.

For these devices, CSR chip hangs when usb configuration command
with index 0 (used to unconfigure) is sent during disconnection.

To avoid this unwanted result, it is necessary not to send this
command, so a new quirk has been created. By default, quirk is
not applied for any device and needs to be enabled by user.

For these devices, athough device is not unconfigured, it is
better to avoid device hanging to be able to operate. Even
bluetooth can be previously turned off.
On the other hand, this is not important if usb device is going to
be bound again (normal behavior), i.e. with usbip.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
V4 -> V5:
- By default, quirk is not applied for any device and needs to be enabled
by user if necessary.
V3 -> V4:
- Reorder quirk entries to be in numerical order according to the vendor
ID and product ID.
- Add patch version information.
V2 -> V3:
- Change subject (Bluetooth: btusb: CSR chip hangs when unbound ->
USB: core: skip unconfiguration if device doesn't support it).
- Improve quirk checking.
- Allow to test quirk interactively.
V1 -> V2:
- Use quirk feature for the exception.

 Documentation/admin-guide/kernel-parameters.txt |  2 ++
 drivers/usb/core/message.c                      | 12 +++++++++---
 drivers/usb/core/quirks.c                       |  3 +++
 include/linux/usb/quirks.h                      |  3 +++
 4 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3f1cc5e317ed..71651b888d14 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6183,6 +6183,8 @@
 					pause after every control message);
 				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
 					delay after resetting its port);
+				p = USB_QUIRK_SKIP_UNCONFIGURE (device doesn't
+					support unconfigure);
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 4d59d927ae3e..9c6cd0c75f4f 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2108,9 +2108,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 	}
 	kfree(new_interfaces);
 
-	ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
-				   configuration, 0, NULL, 0,
-				   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
+	if (configuration == 0 && !cp
+			&& (dev->quirks & USB_QUIRK_SKIP_UNCONFIGURE)) {
+		dev_warn(&dev->dev, "device is not unconfigured!\n");
+		ret = 0;
+	} else
+		ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
+					   configuration, 0, NULL, 0,
+					   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
+
 	if (ret && cp) {
 		/*
 		 * All the old state is gone, so what else can we do?
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index d3c14b5ed4a1..f4cdf85a9eb6 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
 			case 'o':
 				flags |= USB_QUIRK_HUB_SLOW_RESET;
 				break;
+			case 'p':
+				flags |= USB_QUIRK_SKIP_UNCONFIGURE;
+				break;
 			/* Ignore unrecognized flag characters */
 			}
 		}
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index eeb7c2157c72..79cb0616f394 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -72,4 +72,7 @@
 /* device has endpoints that should be ignored */
 #define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
 
+/* device doesn't support unconfigure. */
+#define USB_QUIRK_SKIP_UNCONFIGURE		BIT(16)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.35.1

