Return-Path: <linux-usb+bounces-11008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1A8FFD5D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 09:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34B91C21470
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 07:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAD3156C6A;
	Fri,  7 Jun 2024 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frida-re.20230601.gappssmtp.com header.i=@frida-re.20230601.gappssmtp.com header.b="tTcLtCpO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F11C2BE
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717746116; cv=none; b=RR79TD3xQu4Tb38ExUXE7xlTw5CsdQKNnEmX4BOM+zfTh5buQuiRdEf4hE46kxGtiylZzUgfczIeArMQd2+BYrpNJgVUmPUIzz2FfylQLVKusfeSoXaj/T/D56hCRiGM+Jya18CURa7lAlylQhDBQqC/Qh+3UytG90LPemWtJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717746116; c=relaxed/simple;
	bh=bxHk5juL2BwApQbEfrDkXVE6NAyGLzESh9yj98zWu7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sFpS4hiLg38ZCF4gVgnmBHP9/+so9aWA1D7n6hKT1UWRYX70M+p9ufWbCITgLmb2y7uI8E5aJzpTgYYhAKE4SbAv4i1LP2x1S+qoxplwIV6pKyTAGHEdI5yvcAfdFjL+5iPb/EikU6dHGHlnkBWNmMNJlOuavevbAI8HPEy/2UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frida.re; spf=none smtp.mailfrom=frida.re; dkim=pass (2048-bit key) header.d=frida-re.20230601.gappssmtp.com header.i=@frida-re.20230601.gappssmtp.com header.b=tTcLtCpO; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=frida.re
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=frida.re
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b88335dd7so2238758e87.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Jun 2024 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frida-re.20230601.gappssmtp.com; s=20230601; t=1717746113; x=1718350913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwY0JwFMiJzMlaWNetx19cuzpZpfePjhFAyTDmYWxao=;
        b=tTcLtCpOCN5aAvir0/Z9s6ZJ8XHhAN49QqJGJ/6NZKs3nQzuQYBw9zztWC/cmAY8sl
         g7x0sQr2kXS0mv0cLRbXrLT9Ibfh0SVTRhVsx4VT0IgFkB/D5BPD4C8/dIVQf6Onp7lh
         2rNds3RQJqBbhW3x6Er8sMBzMzE+EayR36xEitYxasiTK6aYo2VdWvzwVd3QgYvCTN9n
         N4x96egRHe8Pg93rezLjhxZPVNJWnO77RXmAAxc+bH6rRnBQlgV7gKYlgNgAT8WgHIiN
         YV81fSjPuccSDWEfcZyB4ZoiN3RQ4ifS5pimmAupiZSzHv7CQqTvGzzfk+PhwykBp2VD
         bhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717746113; x=1718350913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwY0JwFMiJzMlaWNetx19cuzpZpfePjhFAyTDmYWxao=;
        b=TklpCawoj5qAPmPPrq9hCEg4k85SigjVXUMKdHQHJuqDYjHFbLB+aLMWsPYRTaV7PU
         h9YH29eOtGzUE2iFfFjt3B4/5v4zJm99l4H0XZc7wyJ1yzW0cx6Ywc6I7GGfdyNdscwq
         4+zsU1Z7yT7ur6KCfwtdxTHM3D1vcug0FxUNE0r+u0cNfk8CALkrjsLV/mXj9KgnuV3E
         9Rsvd9xG87JUbgO6HCyzkE5g5L5ai7oAHmd6SAA/Z/HhgN/JPU7nh8DFz1JMIBKtkzyP
         pZUE0ry+AY/bCKJ6PjJxJolW1PIemKFr/4xYmV2t+TQ7uSSlYsEIM4hpumJMOkBnyOIR
         eDjQ==
X-Gm-Message-State: AOJu0Ywi5eijuaxenM/OUKPoVS5rIkxIJRUPxoNJDZfLhdw4frV3loQ/
	g8V435ZnjDh77XMIstQ04IVXfyOVrHmryv1oFH5RQQNbdy+MU3gHHBdO7C17qiCzBoHIwLOkjGq
	ahro=
X-Google-Smtp-Source: AGHT+IHuE937leKgNwyYXsF7/ru7SERRnRL9LfAh13X/fheWO4uiKX17Isn3y9RyhdCSIhWwfBMSnA==
X-Received: by 2002:a05:6512:1cd:b0:52b:7c41:698 with SMTP id 2adb3069b0e04-52bb9f6ab36mr1174486e87.18.1717746112692;
        Fri, 07 Jun 2024 00:41:52 -0700 (PDT)
Received: from localhost.localdomain ([109.247.171.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1d6esm438251e87.11.2024.06.07.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 00:41:52 -0700 (PDT)
From: =?UTF-8?q?Ole=20Andr=C3=A9=20Vadla=20Ravn=C3=A5s?= <oleavr@frida.re>
To: linux-usb@vger.kernel.org
Cc: oleavr@frida.re,
	=?UTF-8?q?Ha=CC=8Avard=20S=C3=B8rb=C3=B8?= <havard@hsorbo.no>,
	Oliver Neukum <oliver@neukum.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] CDC-NCM: add support for Apple's private interface
Date: Fri,  7 Jun 2024 09:40:17 +0200
Message-ID: <20240607074117.31322-1-oleavr@frida.re>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Available on iOS/iPadOS >= 17, where this new interface is used by
developer tools using the new RemoteXPC protocol.

This private interface lacks a status endpoint, presumably because there
isn't a physical cable that can be unplugged, nor any speed changes to
be notified about.

Note that NCM interfaces are not exposed until a mode switch is
requested, which macOS does automatically.

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

Newer versions of usbmuxd do this automatically.

Co-developed-by: Håvard Sørbø <havard@hsorbo.no>
Signed-off-by: Håvard Sørbø <havard@hsorbo.no>
Signed-off-by: Ole André Vadla Ravnås <oleavr@frida.re>
---
 drivers/net/usb/cdc_ncm.c | 47 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index bf76ecccc2e6..d5c47a2a62dc 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -933,7 +933,8 @@ int cdc_ncm_bind_common(struct usbnet *dev, struct usb_interface *intf, u8 data_
 
 	cdc_ncm_find_endpoints(dev, ctx->data);
 	cdc_ncm_find_endpoints(dev, ctx->control);
-	if (!dev->in || !dev->out || !dev->status) {
+	if (!dev->in || !dev->out ||
+	    (!dev->status && dev->driver_info->flags & FLAG_LINK_INTR)) {
 		dev_dbg(&intf->dev, "failed to collect endpoints\n");
 		goto error2;
 	}
@@ -1925,6 +1926,34 @@ static const struct driver_info cdc_ncm_zlp_info = {
 	.set_rx_mode = usbnet_cdc_update_filter,
 };
 
+/* Same as cdc_ncm_info, but with FLAG_SEND_ZLP */
+static const struct driver_info apple_tethering_interface_info = {
+	.description = "CDC NCM (Apple Tethering)",
+	.flags = FLAG_POINTTOPOINT | FLAG_NO_SETINT | FLAG_MULTI_PACKET
+			| FLAG_LINK_INTR | FLAG_ETHER | FLAG_SEND_ZLP,
+	.bind = cdc_ncm_bind,
+	.unbind = cdc_ncm_unbind,
+	.manage_power = usbnet_manage_power,
+	.status = cdc_ncm_status,
+	.rx_fixup = cdc_ncm_rx_fixup,
+	.tx_fixup = cdc_ncm_tx_fixup,
+	.set_rx_mode = usbnet_cdc_update_filter,
+};
+
+/* Same as apple_tethering_interface_info, but without FLAG_LINK_INTR */
+static const struct driver_info apple_private_interface_info = {
+	.description = "CDC NCM (Apple Private)",
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
@@ -1954,6 +1983,22 @@ static const struct driver_info wwan_noarp_info = {
 };
 
 static const struct usb_device_id cdc_devs[] = {
+	/* iPhone */
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x12a8, 2),
+		.driver_info = (unsigned long)&apple_tethering_interface_info,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x12a8, 4),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+
+	/* iPad */
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x12ab, 2),
+		.driver_info = (unsigned long)&apple_tethering_interface_info,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x12ab, 4),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+
 	/* Ericsson MBM devices like F5521gw */
 	{ .match_flags = USB_DEVICE_ID_MATCH_INT_INFO
 		| USB_DEVICE_ID_MATCH_VENDOR,
-- 
2.45.2


