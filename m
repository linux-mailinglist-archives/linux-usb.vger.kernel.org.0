Return-Path: <linux-usb+bounces-3527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D17FFE3F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 23:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6065E28197A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 22:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6274161693;
	Thu, 30 Nov 2023 22:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frida-re.20230601.gappssmtp.com header.i=@frida-re.20230601.gappssmtp.com header.b="Ls+3WLrL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5301BF2
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 14:02:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9c1e39defso18330281fa.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 14:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frida-re.20230601.gappssmtp.com; s=20230601; t=1701381719; x=1701986519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAlBHRPFYuWhXCBDYgpRgGyDh3ObfnycA2ThrNadsbU=;
        b=Ls+3WLrLIE0b3816NwC7px56eJkriHCkCn2nZwovpzfmoSL7B32F42G68hrowituOk
         t/SYgVfcjf06T4IJ3AFnF0Vo21NJ3XiVA5q1+mc3ng9kfrlPfaIQ5oIDBYvMI3/WTLHe
         /hVFUNIE+BVS74I7QX1XgtpsJnTGkCAwbwJHqG+vHi6eg4xxscLudQtuTMDvLG+uLa+M
         Y8K6aWtEdmTvJH3shQ7b8KZDjYDnp1DrgflRAlp6ZUtHE1Y11+UjlW1DgQISLizz10Zs
         3iqZ4AMT97YnmquLldkSG5bphANkFkIqXEhWQoMDNkSa4NJBRcU0uk/EiFUK5ANZdFPG
         22Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381719; x=1701986519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAlBHRPFYuWhXCBDYgpRgGyDh3ObfnycA2ThrNadsbU=;
        b=weZ5A9Zck0YPJ+usBnqaF0w3N7jXEOP+tbUBC1LZ0rJSFQrA+h8VYfbc9bkkpN0mP/
         kkA0GD8hW7oVaXm61OFEBrOSv7sELwbE/gmsFfEtUlgVPMAi95rjPpTzA4iLTGrtLKwM
         TUJtIJ53jh4oUwrU4UA+fu2Bi74hEpStmZeJ5lUM4vGEyCxYNYgCRIqYDurxsUnihBVF
         w+7g4y4AqmknOtzpmyULZzYXhWVoE4oJ9N6Zryfs9quNQDRBg6t4HjyDUGNIqdrtRb6e
         KEjXpx3L6ISh3Lr21gEimPvfq7om//flru8w872AQdVCW+QOsjnheYjfAx4FEkPS/qLn
         ZP+Q==
X-Gm-Message-State: AOJu0YwUCChLEqx1fyJAqfS8AOPC64pAdTR1PjaTNXdiq6Vc/pg4FD1j
	MNjjON91CdX+gkdjsfeeWqozpr+OwhJpmfcDMMHeNg==
X-Google-Smtp-Source: AGHT+IHyBsz/5Wj2LxxizklZny5F1yPUVCwLrScDWqzQjw6mkDDXPH+e6oBPpUKBg7g7sEQqehVPVA==
X-Received: by 2002:a2e:9d89:0:b0:2c9:d874:6ee9 with SMTP id c9-20020a2e9d89000000b002c9d8746ee9mr160552ljj.70.1701381719060;
        Thu, 30 Nov 2023 14:01:59 -0800 (PST)
Received: from fedora.. ([84.209.240.12])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e2e02000000b002c994a66b28sm249138lju.36.2023.11.30.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:01:58 -0800 (PST)
From: =?UTF-8?q?Ole=20Andr=C3=A9=20Vadla=20Ravn=C3=A5s?= <oleavr@frida.re>
To: linux-usb@vger.kernel.org
Cc: oliver@neukum.org,
	havard@hsorbo.no,
	=?UTF-8?q?Ole=20Andr=C3=A9=20Vadla=20Ravn=C3=A5s?= <oleavr@frida.re>
Subject: [PATCH] CDC-NCM: add support for Apple iDevices
Date: Thu, 30 Nov 2023 22:52:22 +0100
Message-ID: <20231130220109.90734-2-oleavr@frida.re>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130220109.90734-1-oleavr@frida.re>
References: <CA+DmxX_N2106oTDB9izU8aAQzoVJJUBYm9M0M5d6-sxDyyxJtA@mail.gmail.com>
 <20231130220109.90734-1-oleavr@frida.re>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Which lack a status endpoint, presumably because there isn't a physical
cable that can be unplugged, nor any speed changes to be notified about.

Note that NCM interfaces are not exposed until a mode switch is requested,
which macOS does automatically.

The mode switch can be performed like this:

        uint8_t status;
        libusb_control_transfer(device_handle,
                LIBUSB_RECIPIENT_DEVICE | LIBUSB_REQUEST_TYPE_VENDOR |
                LIBUSB_ENDPOINT_IN,
                82, /* bRequest */
                0,  /* wValue   */
                3,  /* wIndex   */
                &status,
                sizeof(status),
                0);

Co-developed-by: Håvard Sørbø <havard@hsorbo.no>
Signed-off-by: Håvard Sørbø <havard@hsorbo.no>
Signed-off-by: Ole André Vadla Ravnås <oleavr@frida.re>
---
 drivers/net/usb/cdc_ncm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index db05622f1f70..e97c83b7c51d 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -933,7 +933,8 @@ int cdc_ncm_bind_common(struct usbnet *dev, struct usb_interface *intf, u8 data_
 
 	cdc_ncm_find_endpoints(dev, ctx->data);
 	cdc_ncm_find_endpoints(dev, ctx->control);
-	if (!dev->in || !dev->out || !dev->status) {
+	if (!dev->in || !dev->out || (!dev->status &&
+				dev->driver_info->flags & FLAG_LINK_INTR)) {
 		dev_dbg(&intf->dev, "failed to collect endpoints\n");
 		goto error2;
 	}
@@ -1925,6 +1926,20 @@ static const struct driver_info cdc_ncm_zlp_info = {
 	.set_rx_mode = usbnet_cdc_update_filter,
 };
 
+/* Same as cdc_ncm_info, but without FLAG_LINK_INTR, and with FLAG_SEND_ZLP */
+static const struct driver_info idevice_info = {
+	.description = "Apple iDevice NCM",
+	.flags = FLAG_POINTTOPOINT | FLAG_NO_SETINT | FLAG_MULTI_PACKET
+			| FLAG_ETHER | FLAG_SEND_ZLP,
+	.bind = cdc_ncm_bind,
+	.unbind = cdc_ncm_unbind,
+	.manage_power = usbnet_manage_power,
+	.status = cdc_ncm_status,
+	.rx_fixup = cdc_ncm_rx_fixup,
+	.tx_fixup = cdc_ncm_tx_fixup,
+	.set_rx_mode = usbnet_cdc_update_filter,
+};
+
 /* Same as cdc_ncm_info, but with FLAG_WWAN */
 static const struct driver_info wwan_info = {
 	.description = "Mobile Broadband Network Device",
@@ -1954,6 +1969,18 @@ static const struct driver_info wwan_noarp_info = {
 };
 
 static const struct usb_device_id cdc_devs[] = {
+	/* iPhone */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x12a8, USB_CLASS_COMM,
+		USB_CDC_SUBCLASS_NCM, USB_CDC_PROTO_NONE),
+		.driver_info = (unsigned long)&idevice_info,
+	},
+
+	/* iPad */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x05ac, 0x12ab, USB_CLASS_COMM,
+		USB_CDC_SUBCLASS_NCM, USB_CDC_PROTO_NONE),
+		.driver_info = (unsigned long)&idevice_info,
+	},
+
 	/* Ericsson MBM devices like F5521gw */
 	{ .match_flags = USB_DEVICE_ID_MATCH_INT_INFO
 		| USB_DEVICE_ID_MATCH_VENDOR,
-- 
2.43.0


