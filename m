Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8CD588900
	for <lists+linux-usb@lfdr.de>; Wed,  3 Aug 2022 11:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiHCJC7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Aug 2022 05:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiHCJC6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Aug 2022 05:02:58 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C389A6249;
        Wed,  3 Aug 2022 02:02:57 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id f192so6431655pfa.9;
        Wed, 03 Aug 2022 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7aWJNOeI0wNeEE9TxEpJnxSjW0YsgfE4r1KcBZ+Q7E=;
        b=V3+4HcIs193GSeKyBT1AxL/JjCD9KiSa4jred6/XUWdJwlKhhAGt1z3YCxTk1+cRDK
         1q/9n0EYibWmglVPGHj7W2FhX76A9yfl04+My1HvEL49aIQcgaqDMze8TCaY73KOX7wE
         bWOQKlNrRTe7YGg2eKr6EpBFXxuO/PIihVCaYw93DNf5lhDPkDohGFOk9vbkP+5lh5vw
         EMaxv8ajbyeHOQZsxrzij0Ch8Kch3F1yuiHCs7kYO3mLeg1n3TQhgamNMA6lc28f6Vi+
         LR77PoHV3juOfTHKY6XZY03XdoXMrL4d9Fi+edEgUVv+ETSEqsbhS1LygvQgzQCpaozl
         b7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7aWJNOeI0wNeEE9TxEpJnxSjW0YsgfE4r1KcBZ+Q7E=;
        b=tIhkuSu5vPGtKC70v+tE/0ntcGf+DlqiWz9GiSiy9R7rR08yqIfiB+UHIyVSIUhlUT
         y6AteOGUzsKVJZMi7r7u8uCQ3MrQH1VLvFX7PIE+p959fwQ8ZiPYLXaXquPI2bE17/pX
         gk50/PPR2rATjWgd6ZYJrJMw3a3P4lxhl1/8QccrdQxP6hQN2czgzBdiv5wJl7VvyDq/
         /FUxUIrdqQyKsrXNIgcot2hUhe5DV9vc0FXNhIAYXgKNyW3ddCQwkRWcMeoACJB73YKM
         WvGgvAfhgeSFmzzKjPU47WNfTEfm7OuCgi2hQqaz553CeM35YmirLDrcj6Pbgh/1l3a8
         fGpA==
X-Gm-Message-State: AJIora/SnC+kyjrV0I8HXw9W8pcuCmzzBYfg/TGPSR9swT8rTo78qkoz
        zQypjOisCI1sfkb0ORnaMhUVH+gdbU8=
X-Google-Smtp-Source: AGRyM1vFHJPSkqiOpsvZ4sCzy0U4JcOXZeDCVQlp656F96jJaqtbxlvRJrtArp4nYZuIhYMTS1Umww==
X-Received: by 2002:a05:6a00:b55:b0:52a:db7b:2880 with SMTP id p21-20020a056a000b5500b0052adb7b2880mr24630179pfo.22.1659517377024;
        Wed, 03 Aug 2022 02:02:57 -0700 (PDT)
Received: from localhost.localdomain ([221.158.180.156])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902c94c00b0016ed8af2ec0sm1353137pla.29.2022.08.03.02.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 02:02:56 -0700 (PDT)
From:   Seunghun Han <kkamagui@gmail.com>
To:     oliver@neukum.org
Cc:     davem@davemloft.net, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kkamagui@gmail.com
Subject: [PATCH] net: usb: cdc_mbim: adding Microsoft mobile broadband modem
Date:   Wed,  3 Aug 2022 18:02:18 +0900
Message-Id: <20220803090218.1313187-1-kkamagui@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Microsoft branded mobile broadband modems typically used in the Surface series
don't work with the Linux kernel. When I query firmware information to the
modem using the mbimcli tool, it always returns the Failure (0x02) value like
below.

=== Start of the firmware id query ===
$> mbimcli -d /dev/cdc-wdm4 --ms-query-firmware-id -v
[26  Jul 2022, 05:24:07] [Debug] opening device...
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Queried max control message size: 4096
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Sent message...
<<<<<< RAW:
<<<<<<   length = 16
<<<<<<   data   = 01:00:00:00:10:00:00:00:01:00:00:00:00:10:00:00

[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Sent message (translated)...
<<<<<< Header:
<<<<<<   length      = 16
<<<<<<   type        = open (0x00000001)
<<<<<<   transaction = 1
<<<<<< Contents:
<<<<<<   max control transfer = 4096

[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Received message...
>>>>>> RAW:
>>>>>>   length = 16
>>>>>>   data   = 01:00:00:80:10:00:00:00:01:00:00:00:02:00:00:00

[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Received message...Message Type 80000001
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Processing process_message 864
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Processing process_message 897
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Processing process_message 923
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Processing process_message 930
[26  Jul 2022, 05:24:07] [Debug] [/dev/cdc-wdm4] Processing process_message 935
[26  Jul 2022, 05:24:07] [Debug] getting open done result failed: closed
error: couldn't open the MbimDevice: Failure
=== End of the firmware id query ===

After kernel debugging, I found that the modem reported that the dwNtbInMaxSize
value of ncm_parm was 16384 during the initialization sequence.
So the cdc_ncm_update_rxtx_max() in cdc_ncm_bind_common() didn't send
USB_CDC_SET_NTB_INPUT_SIZE command because the default input size was the same,
16384.

It's good and proper behavior. However, Microsoft branded MBMs (including the
latest one in Surface Go 3) fail until the kernel explicitly sets the input
size.

This patch adds a new table and code changes that explicitly send
the USB_CDC_SET_NTB_INPUT_SIZE command to support Microsoft branded MBMs.

Signed-off-by: Seunghun Han <kkamagui@gmail.com>
---
 drivers/net/usb/cdc_mbim.c  | 24 ++++++++++++++++++++++++
 drivers/net/usb/cdc_ncm.c   |  2 +-
 include/linux/usb/cdc_ncm.h |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_mbim.c b/drivers/net/usb/cdc_mbim.c
index c89639381eca..c0c23cfc02a7 100644
--- a/drivers/net/usb/cdc_mbim.c
+++ b/drivers/net/usb/cdc_mbim.c
@@ -618,6 +618,22 @@ static const struct driver_info cdc_mbim_info_avoid_altsetting_toggle = {
 	.data = CDC_MBIM_FLAG_AVOID_ALTSETTING_TOGGLE,
 };
 
+/* Microsoft branded modems do not work properly without setting the input size
+ * explicitly in cdc_ncm_bind_common.
+ * CDC_MBIM_FLAG_SET_INPUT_SIZE_EXPLICITLY flag is used to set the input size
+ * during initialization.
+ */
+static const struct driver_info cdc_mbim_info_set_input_size_explicitly = {
+	.description = "CDC MBIM",
+	.flags = FLAG_NO_SETINT | FLAG_MULTI_PACKET | FLAG_WWAN | FLAG_SEND_ZLP,
+	.bind = cdc_mbim_bind,
+	.unbind = cdc_mbim_unbind,
+	.manage_power = cdc_mbim_manage_power,
+	.rx_fixup = cdc_mbim_rx_fixup,
+	.tx_fixup = cdc_mbim_tx_fixup,
+	.data = CDC_MBIM_FLAG_SET_INPUT_SIZE_EXPLICITLY,
+};
+
 static const struct usb_device_id mbim_devs[] = {
 	/* This duplicate NCM entry is intentional. MBIM devices can
 	 * be disguised as NCM by default, and this is necessary to
@@ -665,6 +681,14 @@ static const struct usb_device_id mbim_devs[] = {
 	  .driver_info = (unsigned long)&cdc_mbim_info_avoid_altsetting_toggle,
 	},
 
+	/* Some Microsoft branded mobile broadband modems used in the Surface
+	 * seires are known to fail unless the input size is set explicitly.
+	 * Applying it to all Microsoft branded MBMs.
+	 */
+	{ USB_VENDOR_AND_INTERFACE_INFO(0x045e, USB_CLASS_COMM, USB_CDC_SUBCLASS_MBIM, USB_CDC_PROTO_NONE),
+	  .driver_info = (unsigned long)&cdc_mbim_info_set_input_size_explicitly,
+	},
+
 	/* default entry */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_MBIM, USB_CDC_PROTO_NONE),
 	  .driver_info = (unsigned long)&cdc_mbim_info_zlp,
diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 8d5cbda33f66..915e29c987cb 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -407,7 +407,7 @@ static void cdc_ncm_update_rxtx_max(struct usbnet *dev, u32 new_rx, u32 new_tx)
 	val = cdc_ncm_check_rx_max(dev, new_rx);
 
 	/* inform device about NTB input size changes */
-	if (val != ctx->rx_max) {
+	if (val != ctx->rx_max || ctx->drvflags & CDC_MBIM_FLAG_SET_INPUT_SIZE_EXPLICITLY) {
 		__le32 dwNtbInMaxSize = cpu_to_le32(val);
 
 		dev_info(&dev->intf->dev, "setting rx_max = %u\n", val);
diff --git a/include/linux/usb/cdc_ncm.h b/include/linux/usb/cdc_ncm.h
index 2d207cb4837d..a24f84b31a54 100644
--- a/include/linux/usb/cdc_ncm.h
+++ b/include/linux/usb/cdc_ncm.h
@@ -88,6 +88,7 @@
 #define CDC_NCM_FLAG_NDP_TO_END			0x02	/* NDP is placed at end of frame */
 #define CDC_MBIM_FLAG_AVOID_ALTSETTING_TOGGLE	0x04	/* Avoid altsetting toggle during init */
 #define CDC_NCM_FLAG_PREFER_NTB32 0x08	/* prefer NDP32 over NDP16 */
+#define CDC_MBIM_FLAG_SET_INPUT_SIZE_EXPLICITLY	0x10	/* Set input size explicitly during init */
 
 #define cdc_ncm_comm_intf_is_mbim(x)  ((x)->desc.bInterfaceSubClass == USB_CDC_SUBCLASS_MBIM && \
 				       (x)->desc.bInterfaceProtocol == USB_CDC_PROTO_NONE)
-- 
2.30.2

