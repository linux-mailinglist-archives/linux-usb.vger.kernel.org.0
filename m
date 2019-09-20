Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 276C2B8E75
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 12:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391879AbfITKYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 06:24:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39972 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389010AbfITKYr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 06:24:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id b24so1732894wmj.5
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2019 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fOHfvDCc5hiIxyDU1RnAC49GtoLX7L14FDTJP4nzLK8=;
        b=u7Yl+AowgVeDAmaw7wa5JmasZ2tkclQBXtT5+aCILQhBmBv3JqKa4eLvtuNM8LsyVh
         cxzmzEC3xE+NqA0H0+sfCTFPhfE/PW9Hazkjd84YHAppp3dv59j103HFDse7x0gRRWk7
         qot4dKHrnSjE5GdoOO9Llw8ZtRuvGB4mizmLHkyRph0g6OT/Q6T27kMjbsfP8pbcPSWY
         63AP0ByT6OcxeZyNaU+nibUAB5v21vfJzFdND+7auUxVnoXrG8FAnXTUl7MsBgg3RM/G
         ArQhltJXjzD7U2wDklTCepiJXza0AnvPbPuXofduUvZivkjfmUtDXT6sLBsjNLc7edep
         I/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fOHfvDCc5hiIxyDU1RnAC49GtoLX7L14FDTJP4nzLK8=;
        b=Mqs5dYTNl5wRWy+VvRNsiCeZ4aNdxkeqE+un2Jyp9tgf2G7xxMTRFVxlDR9z9McQTR
         hibFdwg/7yu2CYOg5YLBR8CehNh6aCTXmKZi1GLgBCLu2LBX7xZ7s8HPMFjn7tnzQnfa
         r6LAlbfbPILJwi9ff9OC9Q6x7be4FDsbgkvlqi/I3o8FwaJvWIFNDwvXPLiYoJI2gRig
         SrzORXO+DY8FQLQv0Oc82PNID2C5JhPOgxBliMcwQcAeZjcyRF+OkzZpEH8S+us4XL/y
         YYQYxgSMmUm7cTYEfGTU1LbJLF/ptU5Uv2dusTKjy3FJ2Fdx71iutL4qyp74H8O0U/xY
         vmgw==
X-Gm-Message-State: APjAAAV/E4HzvENdK+/v2qt1Az70jnh3ptf0OG+v9uQ/00/3MUPaoMdv
        a2F2Okl03Mq0NreXRdV3KXo=
X-Google-Smtp-Source: APXvYqwNkcHMot8UFFwJr/LotUZAFYoGwor2UF7L3etod/AN3D0wzJnFj0NGLVEJ5tj20BA1bbZtkQ==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr3019796wmo.114.1568975084710;
        Fri, 20 Sep 2019 03:24:44 -0700 (PDT)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id u10sm1341334wmm.0.2019.09.20.03.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2019 03:24:44 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
Date:   Fri, 20 Sep 2019 12:23:36 +0200
Message-Id: <20190920102336.21043-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
to be sent if out data size is equal to the endpoint max size.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/usb/serial/option.c   | 8 ++++++++
 drivers/usb/serial/usb-wwan.h | 1 +
 drivers/usb/serial/usb_wwan.c | 9 +++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 38e920ac7f82..ce5ceafe2ccd 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -565,6 +565,9 @@ static void option_instat_callback(struct urb *urb);
 /* Interface must have two endpoints */
 #define NUMEP2		BIT(16)
 
+/* Device needs ZLP */
+#define ZLP		BIT(17)
+
 
 static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
@@ -1184,6 +1187,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
 	  .driver_info = NCTRL(0) },
+	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
+	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) },
@@ -2079,6 +2084,9 @@ static int option_attach(struct usb_serial *serial)
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
index 7e855c87e4f7..8066b5e2d305 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -228,6 +228,15 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
 		} else {
 			intfdata->in_flight++;
 			spin_unlock_irqrestore(&intfdata->susp_lock, flags);
+			if (intfdata->use_zlp) {
+				unsigned int ep_maxp;
+
+				ep_maxp = usb_maxpacket(port->serial->dev,
+							this_urb->pipe, 1);
+
+				if (ep_maxp && (todo % ep_maxp == 0))
+					this_urb->transfer_flags |= URB_ZERO_PACKET;
+			}
 			err = usb_submit_urb(this_urb, GFP_ATOMIC);
 			if (err) {
 				dev_err(&port->dev,
-- 
2.17.1

