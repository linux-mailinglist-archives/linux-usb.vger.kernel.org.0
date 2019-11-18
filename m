Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B367C100683
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 14:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfKRNdA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 08:33:00 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36869 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfKRNdA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 08:33:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so19492783wrv.4
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2019 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KufXkw97WIddtrsxSfQR9dviNiXKYvtK5o6DXjJJG34=;
        b=IY2PYKl2dVetAtGNdyuB6WtMR5QQVpdhObYfGhhif1Yn+I39q+pPGKQtuVpOBcVb6n
         nWX5HMIyHkepARPqP9K6yUhclyZHV9IZqzac2iTnodjfLUz7tF08Pu/yIjaWizYVSHGE
         W58aDBZpWtFyQRFIyYyJBHSPR6tFvlBZwn4o8TTnqqjSMbtYHflG24+4L7uIj8B7ja/l
         2jQcCbuxwoYSCt/Syo/EaYWwLlAP/87CixGBLi6P4ZmkXpVud4bq1RlWtJEIPDRueSJ1
         ezddLmu+kw6r6/NggUsaqKBLKbs6XYrqAftHKkjBGUtcXuKV2dQYMYpn/o1tvfaMnTdY
         /deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KufXkw97WIddtrsxSfQR9dviNiXKYvtK5o6DXjJJG34=;
        b=k21uy8IJRwd4GZEVdlKrwlygOUKV/g/lVtPUq7F/5+U2UHp5ahM4EiGJoeSsu44Irw
         tSQVrVt1Zk6LLwmwJbNP061q6gPXZw+DN1WX2JNZEIjNlyGbOViF+/avewv18gp1S0ln
         eRYqJHZFsNG3/JwZ532vysG6nb+bfY2bTljnKLfsWnerOiuj2Drrkf6xTannqWLl8EmI
         28ggprcuGqPiuGWgBg/Idx3ESe7IVb9/FKMUBoqkU4aFVe7p9o9uPQOJ8sKuYwN4+N77
         dpM3DrmBRAx62As4h1vBkl956rBckF48lIE11wylbugkHiaaZbKaEOm8nu4kPRTZViMI
         E/hQ==
X-Gm-Message-State: APjAAAXnQHBf6a1OUTEVU6Pgin3ckgHOtJLZyVvzxT3FUV5gdvRZkHLX
        8qUufg4gOGfzQSWEdSbzblyG8HJh0N0=
X-Google-Smtp-Source: APXvYqztPI+GiUs1spQ5Fwfbu+aFf1wRrhQjzU9tz7kNC9wT+2tFr2UvdMetYA2g5TNdfDgdW9Gr/Q==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr31458652wrw.64.1574083978506;
        Mon, 18 Nov 2019 05:32:58 -0800 (PST)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id l10sm26381852wrg.90.2019.11.18.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 05:32:57 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH RESEND 1/1] usb: serial: option: add ZLP support for 0x1bc7/0x9010
Date:   Mon, 18 Nov 2019 14:32:51 +0100
Message-Id: <20191118133251.21401-1-dnlplm@gmail.com>
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

