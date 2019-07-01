Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D513F59CD8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 15:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfF1NUX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 09:20:23 -0400
Received: from mail.unjo.com ([83.218.68.154]:56742 "EHLO mail.unjo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbfF1NUX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 09:20:23 -0400
X-Greylist: delayed 496 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jun 2019 09:20:22 EDT
Received: from revengegrundet.unjo.local (unknown [10.239.181.186])
        by mail.unjo.com (Postfix) with ESMTP id C54226075A4;
        Fri, 28 Jun 2019 15:12:03 +0200 (CEST)
From:   Andreas Fritiofson <andreas.fritiofson@unjo.com>
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Andreas Fritiofson <andreas.fritiofson@unjo.com>
Subject: [PATCH] USB: serial: ftdi_sio: add ID for isodebug v1
Date:   Fri, 28 Jun 2019 15:08:34 +0200
Message-Id: <20190628130834.32432-1-andreas.fritiofson@unjo.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds the vid:pid of the isodebug v1 isolated JTAG/SWD+UART. Only the
second channel is available for use as a serial port.

Signed-off-by: Andreas Fritiofson <andreas.fritiofson@unjo.com>
---
 drivers/usb/serial/ftdi_sio.c     | 1 +
 drivers/usb/serial/ftdi_sio_ids.h | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 8f5b17471..ba74c2ad6 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1027,6 +1027,7 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(AIRBUS_DS_VID, AIRBUS_DS_P8GR) },
 	/* EZPrototypes devices */
 	{ USB_DEVICE(EZPROTOTYPES_VID, HJELMSLUND_USB485_ISO_PID) },
+	{ USB_DEVICE_INTERFACE_NUMBER(UNJO_VID, ISODEBUG_V1_PID, 1) },
 	{ }					/* Terminating entry */
 };
 
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index b863bedb5..5c681f494 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1541,3 +1541,9 @@
 #define CHETCO_SEASMART_DISPLAY_PID	0xA5AD /* SeaSmart NMEA2000 Display */
 #define CHETCO_SEASMART_LITE_PID	0xA5AE /* SeaSmart Lite USB Adapter */
 #define CHETCO_SEASMART_ANALOG_PID	0xA5AF /* SeaSmart Analog Adapter */
+
+/*
+ * Unjo AB
+ */
+#define UNJO_VID			0x22B7
+#define ISODEBUG_V1_PID			0x150D
-- 
2.17.1

