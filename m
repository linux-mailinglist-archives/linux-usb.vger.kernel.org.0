Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0260115467
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 16:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfLFPiD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 10:38:03 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:36589 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfLFPiC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 10:38:02 -0500
Received: by mail-wr1-f46.google.com with SMTP id z3so8273457wru.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 07:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=LK4EMzdbzLBaDLJPruSHC/TdyMvqhwboZuNQUo7rSvU=;
        b=Gbv8cz+TZLYV8l7aMq5ngRR2PEih0coenAiXPfzETkynhiGWLYDDx1wh0zpr6o4ZKp
         gLYCd5U5/uTQ4eaTmuDcoTjKDYWGnW0lnXawdXvHLK8vvA0AGUZQ1qUEvo0m5Ztd9H5w
         H9mQLSGU7NoHcpRF+sgENqu0UL9Vst7MATmAu1qHbOjGWk+MG5YKGywozAJs/ZKrsDPA
         gn7EUC0SAzw2ArySSmRMDUgoXhRy02hrR3BxPwM7BQ2UFnBLo93rptZ+lhQC0jzfBSlF
         CnitJZCTipg6RI5HYgNKCsh6Vv8gxt7/lowMcZphdYW1sxDXi/UMctnhsc/TdW3sak/1
         HwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LK4EMzdbzLBaDLJPruSHC/TdyMvqhwboZuNQUo7rSvU=;
        b=DEe5npydnoWkwzijfom7gSx0W5kE3bcd4xmCKLUbjvFRNC9Q6n2dq/xH6Z9q+JhnAj
         DJaBb57VcUCCI7fXBfrbTQMUyP/4TINGxQR8ENm0sWrpUaosbc+AbWlEcijFMs9Gkm1e
         VDkyLAa/JbiXKZLIPLaL1+t6zD66OM3d3b6UITN1AQz30nGJEFzoQx1EaE3uTkJnrni/
         YLEIIlBRoGTC/QB1eVIAZdzeF5WR/oaZF9vVbSK1Lc1bOkaO7F8kKLiqSoto1qp7g3Hd
         2pwcehs15gCAeHCcvmokrFhsMOycIRY9QY79YFGd5Wdyf8ryMR5OIXMag+/i61GktbU1
         hHMg==
X-Gm-Message-State: APjAAAWudgadmV0yrwmiNCgdbXXW+sbgnOOTYzA/09A8nkWZt+M1MCVI
        93L2H84sIua9qkddb5FmuB8=
X-Google-Smtp-Source: APXvYqz3zahIULfER5AOpOCAaSreJTG5tIqyq/5Wde2pUzsH94o9sqeKvQUFizxXAPy/t19UQE8tsw==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr16071137wrv.316.1575646681459;
        Fri, 06 Dec 2019 07:38:01 -0800 (PST)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id c17sm16229400wrr.87.2019.12.06.07.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 07:38:00 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH V2 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
Date:   Fri,  6 Dec 2019 16:37:32 +0100
Message-Id: <20191206153732.2451-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
to be sent if out data size is equal to the endpoint max size.

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
V2: removed transfer_length calculations
---
 drivers/usb/serial/option.c   | 8 ++++++++
 drivers/usb/serial/usb-wwan.h | 1 +
 drivers/usb/serial/usb_wwan.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 06ab016be0b6..f74277c64dbc 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -566,6 +566,9 @@ static void option_instat_callback(struct urb *urb);
 /* Interface must have two endpoints */
 #define NUMEP2		BIT(16)
 
+/* Device needs ZLP */
+#define ZLP		BIT(17)
+
 
 static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE(OPTION_VENDOR_ID, OPTION_PRODUCT_COLT) },
@@ -1193,6 +1196,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1901, 0xff),	/* Telit LN940 (MBIM) */
 	  .driver_info = NCTRL(0) },
+	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
+	  .driver_info = NCTRL(0) | ZLP },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) },
@@ -2090,6 +2095,9 @@ static int option_attach(struct usb_serial *serial)
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
index 7e855c87e4f7..5e5a284a4ba3 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -228,6 +228,8 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
 		} else {
 			intfdata->in_flight++;
 			spin_unlock_irqrestore(&intfdata->susp_lock, flags);
+			if (intfdata->use_zlp)
+				this_urb->transfer_flags |= URB_ZERO_PACKET;
 			err = usb_submit_urb(this_urb, GFP_ATOMIC);
 			if (err) {
 				dev_err(&port->dev,
-- 
2.17.1

