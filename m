Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFB8A125E83
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 11:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSKHW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 05:07:22 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44026 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfLSKHV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Dec 2019 05:07:21 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so5318243wre.10
        for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2019 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ISaM1cvM1y49R7TozfwdY4VBML+hvfOnadVQ/1nixwY=;
        b=jj3fsCNfB09Ouo8MgBPaNkNb7azyTTQ7xhiKz/DbJT/dzclp4DF/Fo0JV7qb50kVXm
         5EpCAYXLThV5MftMWpe8x5NxaSPPil1lVw0IVZ56UkS3cV0Pglg83dUWJB5xHqw65aJa
         jGCKqkzmpNC/N9hi+4D0FOtxJCYIcBgNYEU5HvSj2/mxrap6CzUK6huI0yXwN6WiNC2L
         ceUl2H2kvrfBQgezN2i95EyMGPOoHkf1YK2ITtD5LZTnsAqRYwbH+O4kTeaSyWkU1xcS
         aGPEdau5aeuhnmFQFPhHUZItk3ZPTU3eODIRNQS47Pd5n1nE5fiK/FRnwXWjyEx8XFSm
         AeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ISaM1cvM1y49R7TozfwdY4VBML+hvfOnadVQ/1nixwY=;
        b=eNC2aoC1M/Ap2QNVPrjM+SWyGQSglHCP1CYYEW8p5PPLQN2sNRSLAWtqz7iQ6/n2WI
         +owQTkL6nVSsHbbR5JLuEmYoygIg1UPpw5INtvHEeTyIT0Jk20MtTG1vE6mG6NAN8bfa
         NJQWiUVUZ77rVY5M/XEBUMG2u7HsZAVOMDCOlXISNm5asCsoyCpUjY/oMY8pKmU+qu1y
         Mn/nO4H44tx8sTazDsAb1udI1w6uYZ1E8KNvqaKHxNRDapa89EwBvi0RTerD44679BaU
         GjFiZIoDflHNt++XtTHhEs8wig0lforNVWdKp+1o+6khcNyMmPuGYwoA0UchnJjIN02p
         Lltw==
X-Gm-Message-State: APjAAAX4j2jHWmXc84Xg70IKNVvPbhcA5t613mko7TID6Tow+TAlWlEC
        rE7zEgweftSyaVgq/tqS9IdK18EZh18=
X-Google-Smtp-Source: APXvYqxmt7XakGQ68vsLUCWmKBf2keigXMtdy3FZi67iN119voBxleFWBgVtPScqnkotjEVWVgpMsA==
X-Received: by 2002:adf:8150:: with SMTP id 74mr8338115wrm.114.1576750039161;
        Thu, 19 Dec 2019 02:07:19 -0800 (PST)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id t5sm5815317wrr.35.2019.12.19.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 02:07:18 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH V3 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
Date:   Thu, 19 Dec 2019 11:07:07 +0100
Message-Id: <20191219100707.21916-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
to be sent if out data size is equal to the endpoint max size.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
V3: moved zlp setting to urb setup
V2: removed transfer_length calculations
---
 drivers/usb/serial/option.c   | 8 ++++++++
 drivers/usb/serial/usb-wwan.h | 1 +
 drivers/usb/serial/usb_wwan.c | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e9491d400a24..c13e063cb399 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -567,6 +567,9 @@ static void option_instat_callback(struct urb *urb);
 /* Interface must have two endpoints */
 #define NUMEP2		BIT(16)
 
+/* Device needs ZLP */
+#define ZLP		BIT(17)
+
 
 static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
@@ -1196,6 +1199,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
 	  .driver_info = NCTRL(0) },
+	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
+	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) },
@@ -2097,6 +2102,9 @@ static int option_attach(struct usb_serial *serial)
 	if (!(device_flags & NCTRL(iface_desc->bInterfaceNumber)))
 		data->use_send_setup = 1;
 
+	if (device_flags & ZLP)
+		data->use_zlp = 1;
+
 	spin_lock_init(&data->susp_lock);
 
 	usb_set_serial_data(serial, data);
diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
index 1c120eaf4091..934e9361cf6b 100644
--- a/drivers/usb/serial/usb-wwan.h
+++ b/drivers/usb/serial/usb-wwan.h
@@ -38,6 +38,7 @@ struct usb_wwan_intf_private {
 	spinlock_t susp_lock;
 	unsigned int suspended:1;
 	unsigned int use_send_setup:1;
+	unsigned int use_zlp:1;
 	int in_flight;
 	unsigned int open_ports;
 	void *private;
diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index 7e855c87e4f7..66325aaee149 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -462,6 +462,7 @@ static struct urb *usb_wwan_setup_urb(struct usb_serial_port *port,
 {
 	struct usb_serial *serial = port->serial;
 	struct urb *urb;
+	struct usb_wwan_intf_private *intfdata = usb_get_serial_data(serial);
 
 	urb = usb_alloc_urb(0, GFP_KERNEL);	/* No ISO */
 	if (!urb)
@@ -470,6 +471,8 @@ static struct urb *usb_wwan_setup_urb(struct usb_serial_port *port,
 	usb_fill_bulk_urb(urb, serial->dev,
 			  usb_sndbulkpipe(serial->dev, endpoint) | dir,
 			  buf, len, callback, ctx);
+	if (dir == USB_DIR_OUT && intfdata->use_zlp)
+		urb->transfer_flags |= URB_ZERO_PACKET;
 
 	return urb;
 }
-- 
2.17.1

