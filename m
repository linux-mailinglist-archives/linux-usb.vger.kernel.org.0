Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7676F2F53
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387763AbfKGN3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:30 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44331 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbfKGN3a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:30 -0500
Received: by mail-lj1-f195.google.com with SMTP id g3so2255950ljl.11
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ltBNcSELxQBDJPS5fhj1KWRfvpuYAgMykIAsgA01P4=;
        b=REWlDSxGoUKFYetTc06RChd44c812ifjsu/bmdDo+pFJx1BfuHnr6eYZz0fD1yyss9
         ns0hTcvy2WTkUwURoCWv6Ls9Dm4KSGJLOw95pM1uUCUAKEo1cySO8iEFbpxc0WVe/WtU
         Ni0f/I8HOLmjcv6KIcXONqK7aJFtcITZEvlqq+m0kfejeu68hSQ1So+UzKH/G1TQ5saB
         yICxKZjnPlzX4gnhJz2dfMBegcbj5Ri2MgmO8257ba52wCm54LK0JjzFsAzG4htVW1Tl
         a9BtkoxroO5ro1MyMc3266XfO25qTXFfVJoqskt+LswjYzfLBCBjjxE8sLoCq5B78L8F
         OqFA==
X-Gm-Message-State: APjAAAV0MHj1z8Ism5754aFkNu9rQPbiIsiQNPMoV2BWDlKiT2YGMjid
        q5vpV6OCFHNw15QOpCaZmYw=
X-Google-Smtp-Source: APXvYqzi6DzZLj7sg5h1w4f/LUA6Iny4S/tgr8PnJl+lLuYJzBGINBW4GWd9pHbKfDMfDjjjJLJU2w==
X-Received: by 2002:a05:651c:119b:: with SMTP id w27mr2283597ljo.221.1573133366324;
        Thu, 07 Nov 2019 05:29:26 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id x187sm1143374lfa.64.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:23 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dO-8u; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 01/11] USB: serial: mos7840: clean up device-type handling
Date:   Thu,  7 Nov 2019 14:28:54 +0100
Message-Id: <20191107132904.2379-2-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current device-type detection is fragile and can't really be relied
upon. Instead of sprinkling device-id conditionals throughout the
driver, let's use the device-id table to encode the number of ports and
whether the device has a driver-controlled activity LED (MCS7810).

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/mos7840.c | 121 +++++++++++++----------------------
 1 file changed, 44 insertions(+), 77 deletions(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index ab4bf8d6d7df..f13cf723fa6c 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -89,17 +89,10 @@
 /* For higher baud Rates use TIOCEXBAUD */
 #define TIOCEXBAUD     0x5462
 
-/* vendor id and device id defines */
-
-/* The native mos7840/7820 component */
-#define USB_VENDOR_ID_MOSCHIP           0x9710
-#define MOSCHIP_DEVICE_ID_7840          0x7840
-#define MOSCHIP_DEVICE_ID_7843          0x7843
-#define MOSCHIP_DEVICE_ID_7820          0x7820
-#define MOSCHIP_DEVICE_ID_7810          0x7810
-/* The native component can have its vendor/device id's overridden
- * in vendor-specific implementations.  Such devices can be handled
- * by making a change here, in id_table.
+/*
+ * Vendor id and device id defines
+ *
+ * NOTE: Do not add new defines, add entries directly to the id_table instead.
  */
 #define USB_VENDOR_ID_BANDB              0x0856
 #define BANDB_DEVICE_ID_USO9ML2_2        0xAC22
@@ -116,18 +109,6 @@
 #define BANDB_DEVICE_ID_USOPTL4_4P       0xBC03
 #define BANDB_DEVICE_ID_USOPTL2_4        0xAC24
 
-/* This driver also supports
- * ATEN UC2324 device using Moschip MCS7840
- * ATEN UC2322 device using Moschip MCS7820
- * MOXA UPort 2210 device using Moschip MCS7820
- */
-#define USB_VENDOR_ID_ATENINTL		0x0557
-#define ATENINTL_DEVICE_ID_UC2324	0x2011
-#define ATENINTL_DEVICE_ID_UC2322	0x7820
-
-#define USB_VENDOR_ID_MOXA		0x110a
-#define MOXA_DEVICE_ID_2210		0x2210
-
 /* Interrupt Routine Defines    */
 
 #define SERIAL_IIR_RLS      0x06
@@ -179,27 +160,34 @@ enum mos7840_flag {
 	MOS7840_FLAG_LED_BUSY,
 };
 
+#define MCS_PORT_MASK	GENMASK(2, 0)
+#define MCS_PORTS(nr)	((nr) & MCS_PORT_MASK)
+#define MCS_LED		BIT(3)
+
+#define MCS_DEVICE(vid, pid, flags) \
+		USB_DEVICE((vid), (pid)), .driver_info = (flags)
+
 static const struct usb_device_id id_table[] = {
-	{USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7840)},
-	{USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7843)},
-	{USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7820)},
-	{USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7810)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_2)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_2P)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_4)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_4P)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_US9ML2_2)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_US9ML2_4)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USPTL4_2)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USPTL4_4)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_2)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_2P)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_4)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_4P)},
-	{USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL2_4)},
-	{USB_DEVICE(USB_VENDOR_ID_ATENINTL, ATENINTL_DEVICE_ID_UC2324)},
-	{USB_DEVICE(USB_VENDOR_ID_ATENINTL, ATENINTL_DEVICE_ID_UC2322)},
-	{USB_DEVICE(USB_VENDOR_ID_MOXA, MOXA_DEVICE_ID_2210)},
+	{ MCS_DEVICE(0x0557, 0x2011, MCS_PORTS(4)) },	/* ATEN UC2324 */
+	{ MCS_DEVICE(0x0557, 0x7820, MCS_PORTS(2)) },	/* ATEN UC2322 */
+	{ MCS_DEVICE(0x110a, 0x2210, MCS_PORTS(2)) },	/* Moxa UPort 2210 */
+	{ MCS_DEVICE(0x9710, 0x7810, MCS_PORTS(1) | MCS_LED) }, /* ASIX MCS7810 */
+	{ MCS_DEVICE(0x9710, 0x7820, MCS_PORTS(2)) },	/* MosChip MCS7820 */
+	{ MCS_DEVICE(0x9710, 0x7840, MCS_PORTS(4)) },	/* MosChip MCS7840 */
+	{ MCS_DEVICE(0x9710, 0x7843, MCS_PORTS(3)) },	/* ASIX MCS7840 3 port */
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_2) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_2P) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_4) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USO9ML2_4P) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_US9ML2_2) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_US9ML2_4) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USPTL4_2) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USPTL4_4) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_2) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_2P) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_4) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL4_4P) },
+	{ USB_DEVICE(USB_VENDOR_ID_BANDB, BANDB_DEVICE_ID_USOPTL2_4) },
 	{}			/* terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, id_table);
@@ -2024,22 +2012,12 @@ static int mos7810_check(struct usb_serial *serial)
 static int mos7840_probe(struct usb_serial *serial,
 				const struct usb_device_id *id)
 {
-	u16 product = le16_to_cpu(serial->dev->descriptor.idProduct);
-	u16 vid = le16_to_cpu(serial->dev->descriptor.idVendor);
+	unsigned long device_flags = id->driver_info;
 	u8 *buf;
-	int device_type;
 
-	if (product == MOSCHIP_DEVICE_ID_7810 ||
-		product == MOSCHIP_DEVICE_ID_7820 ||
-		product == MOSCHIP_DEVICE_ID_7843) {
-		device_type = product;
+	/* Skip device-type detection if we already have device flags. */
+	if (device_flags)
 		goto out;
-	}
-
-	if (vid == USB_VENDOR_ID_MOXA && product == MOXA_DEVICE_ID_2210) {
-		device_type = MOSCHIP_DEVICE_ID_7820;
-		goto out;
-	}
 
 	buf = kzalloc(VENDOR_READ_LENGTH, GFP_KERNEL);
 	if (!buf)
@@ -2051,15 +2029,15 @@ static int mos7840_probe(struct usb_serial *serial,
 
 	/* For a MCS7840 device GPIO0 must be set to 1 */
 	if (buf[0] & 0x01)
-		device_type = MOSCHIP_DEVICE_ID_7840;
+		device_flags = MCS_PORTS(4);
 	else if (mos7810_check(serial))
-		device_type = MOSCHIP_DEVICE_ID_7810;
+		device_flags = MCS_PORTS(1) | MCS_LED;
 	else
-		device_type = MOSCHIP_DEVICE_ID_7820;
+		device_flags = MCS_PORTS(2);
 
 	kfree(buf);
 out:
-	usb_set_serial_data(serial, (void *)(unsigned long)device_type);
+	usb_set_serial_data(serial, (void *)device_flags);
 
 	return 0;
 }
@@ -2067,19 +2045,10 @@ static int mos7840_probe(struct usb_serial *serial,
 static int mos7840_calc_num_ports(struct usb_serial *serial,
 					struct usb_serial_endpoints *epds)
 {
-	int device_type = (unsigned long)usb_get_serial_data(serial);
-	int num_ports;
+	unsigned long device_flags = (unsigned long)usb_get_serial_data(serial);
+	int num_ports = MCS_PORTS(device_flags);
 
-	if (device_type == MOSCHIP_DEVICE_ID_7843)
-		num_ports = 3;
-	else
-		num_ports = (device_type >> 4) & 0x000F;
-
-	/*
-	 * num_ports is currently never zero as device_type is one of
-	 * MOSCHIP_DEVICE_ID_78{1,2,4}0.
-	 */
-	if (num_ports == 0)
+	if (num_ports == 0 || num_ports > 4)
 		return -ENODEV;
 
 	if (epds->num_bulk_in < num_ports || epds->num_bulk_out < num_ports) {
@@ -2093,7 +2062,7 @@ static int mos7840_calc_num_ports(struct usb_serial *serial,
 static int mos7840_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
-	int device_type = (unsigned long)usb_get_serial_data(serial);
+	unsigned long device_flags = (unsigned long)usb_get_serial_data(serial);
 	struct moschip_port *mos7840_port;
 	int status;
 	int pnum;
@@ -2255,12 +2224,10 @@ static int mos7840_port_probe(struct usb_serial_port *port)
 		goto error;
 	}
 
-	mos7840_port->has_led = false;
+	mos7840_port->has_led = device_flags & MCS_LED;
 
 	/* Initialize LED timers */
-	if (device_type == MOSCHIP_DEVICE_ID_7810) {
-		mos7840_port->has_led = true;
-
+	if (mos7840_port->has_led) {
 		mos7840_port->led_urb = usb_alloc_urb(0, GFP_KERNEL);
 		mos7840_port->led_dr = kmalloc(sizeof(*mos7840_port->led_dr),
 								GFP_KERNEL);
-- 
2.23.0

