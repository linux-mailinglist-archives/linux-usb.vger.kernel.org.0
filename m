Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B385A2278
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 09:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245759AbiHZH6t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 03:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245695AbiHZH6s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 03:58:48 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85B2D474B
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 00:58:44 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id m22-20020a6562d6000000b0042a7471b984so507197pgv.4
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc;
        bh=a6nmZzERx5jmaa+H9eWn+VAql7U9519YoIZhrItY5vc=;
        b=qKnQTpW6EfBm2KqU+KthgTUBLjGgE+LzDkwCVdsC6ZRuRl0KKlRuxye/RulVZAfKIO
         RpVMutX1FHKAO3UO8iTUi2cyx1TE+pOPsqxn8htKUopYETNZy80CxTKTl+1NGGrqRJfn
         U1R4tkR7Cn1b6N3P/alCxMSMqmpsPh0hjfbEIsdKWRyWtdxLm+vfDNjmdDxx51QD1AiN
         IsrMB4QodF6kUaExRQMo9K9yKlGMuRV6zcqZLxcCiuTTw+qZXTL0EVPnrr9MGljV1p/F
         jYpqJrIfGrany/KPFm7moXprdCPi6DuCbEZsJo5ue1RlNwzxjEZfZAcB44XVtHro7THi
         ibGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc;
        bh=a6nmZzERx5jmaa+H9eWn+VAql7U9519YoIZhrItY5vc=;
        b=aijFxsBTWW0gtZr1tIrIkS7svMmS/+Ike5OybCCu85MwMcq446NIsnOLIzD7duWXkT
         ditq7Gp0j1SIWfWUUe3QkDysirN1qupIfu13Hzwb8hLfOVj+o43qtNYW8bj5f4HpAY9t
         x/RHa4EJ9exSJ2Cmd4R7G+vXaxP5+Darz4HpUBcIleKuaNXIDOP6WjArgDZAnxu1e0RJ
         RtvPXmCGg7Im6S3/S0roDUtnUWdH+sO/UIMcxis0C6R4t2+xKHVOzxC36BFEcnqOU2tq
         77gTDllInW891JJc9xVhuiP8q4pK7/hYREq3zWlmH4hhb8lwcF+5IbTscWgZEAvvtXus
         ZrqA==
X-Gm-Message-State: ACgBeo38yxnXVj8UcDIIN8ZJAu5yzb/DhKiEKdLQhracFlceXhcN7dHT
        VcV7CZ0kPIBF1Li7Jk4mILCb4NRPmv0=
X-Google-Smtp-Source: AA6agR5WkTeV6YDAkISWDVu/oQCYIjdhnEyvHFCjBqbhVzVSUPixE08WUwx7ARpH3GN1fBBttpOWyRyQbQs=
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:7c89:f723:158f:fc])
 (user=raychi job=sendgmr) by 2002:aa7:8c4a:0:b0:537:aae3:783e with SMTP id
 e10-20020aa78c4a000000b00537aae3783emr2802435pfd.64.1661500724402; Fri, 26
 Aug 2022 00:58:44 -0700 (PDT)
Date:   Fri, 26 Aug 2022 15:58:39 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826075839.292615-1-raychi@google.com>
Subject: [PATCH] usb: core: stop USB enumeration if too many retries
From:   Ray Chi <raychi@google.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
        stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        albertccwang@google.com, badhri@google.com, pumahsu@google.com,
        Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a broken accessory connected to a USB host, usbcore might
keep doing enumeration retries and it will take a long time to
cause system unstable.

This patch provides a quirk to specific USB ports of the hub to
stop USB enumeration if needed.

Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/core/hub.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  3 +++
 2 files changed, 36 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2633acde7ac1..0f4097440ffb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3081,6 +3081,28 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
 	return status;
 }
 
+/* Stop enumerate if the port met errors and quirk is set */
+static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
+{
+	struct usb_port *port_dev = hub->ports[port1 - 1];
+	struct usb_device *hdev = hub->hdev;
+
+	if (retries < (PORT_INIT_TRIES - 1) / 2)
+		return false;
+
+	/*
+	 * Some USB hosts can't take a long time to keep doing enumeration
+	 * retry. After doing half of the retries, we would turn off the port
+	 * power to stop enumeration if the quirk is set.
+	 */
+	if (port_dev->quirks & USB_PORT_QUIRK_STOP_ENUM) {
+		usb_hub_set_port_power(hdev, hub, port1, false);
+		return true;
+	}
+
+	return false;
+}
+
 /* Check if a port is power on */
 int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
 {
@@ -4855,6 +4877,9 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 					buf->bMaxPacketSize0;
 			kfree(buf);
 
+			if (r < 0 && (port_dev->quirks & USB_PORT_QUIRK_STOP_ENUM))
+				goto fail;
+
 			retval = hub_port_reset(hub, port1, udev, delay, false);
 			if (retval < 0)		/* error or disconnect */
 				goto fail;
@@ -5387,6 +5412,9 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if ((status == -ENOTCONN) || (status == -ENOTSUPP))
 			break;
 
+		if (hub_port_stop_enumerate(hub, port1, i))
+			break;
+
 		/* When halfway through our retry count, power-cycle the port */
 		if (i == (PORT_INIT_TRIES - 1) / 2) {
 			dev_info(&port_dev->dev, "attempt power cycle\n");
@@ -5934,6 +5962,9 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 		ret = hub_port_init(parent_hub, udev, port1, i);
 		if (ret >= 0 || ret == -ENOTCONN || ret == -ENODEV)
 			break;
+
+		if (hub_port_stop_enumerate(parent_hub, port1, i))
+			goto stop_enumerate;
 	}
 	mutex_unlock(hcd->address0_mutex);
 
@@ -6022,6 +6053,8 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
 	udev->bos = bos;
 	return 0;
 
+stop_enumerate:
+	mutex_unlock(hcd->address0_mutex);
 re_enumerate:
 	usb_release_bos_descriptor(udev);
 	udev->bos = bos;
diff --git a/include/linux/usb.h b/include/linux/usb.h
index f7a9914fc97f..fc0fef58c706 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -490,6 +490,9 @@ enum usb_port_connect_type {
 /* Decrease TRSTRCY to 10ms during device enumeration. */
 #define USB_PORT_QUIRK_FAST_ENUM	BIT(1)
 
+/* Stop the enumeration for the given port if there are too many failures*/
+#define USB_PORT_QUIRK_STOP_ENUM	BIT(2)
+
 /*
  * USB 2.0 Link Power Management (LPM) parameters.
  */
-- 
2.37.2.672.g94769d06f0-goog

