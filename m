Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C4126B9A3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 04:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIPCG1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 22:06:27 -0400
Received: from freecalypso.org ([195.154.163.71]:32904 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbgIPCGY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 22:06:24 -0400
X-Greylist: delayed 585 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Sep 2020 22:06:24 EDT
Received: by freecalypso.org (Postfix, from userid 1001)
        id DD21A3740240; Wed, 16 Sep 2020 01:56:29 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH 1/3] USB: serial: ftdi_sio: add support for FreeCalypso
 JTAG+UART adapters
Message-Id: <20200916015629.DD21A3740240@freecalypso.org>
Date:   Wed, 16 Sep 2020 01:56:29 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There exist many FT2232-based JTAG+UART adapter designs in which
FT2232 Channel A is used for JTAG and Channel B is used for UART.
The best way to handle them in Linux is to have the ftdi_sio driver
create a ttyUSB device only for Channel B and not for Channel A:
a ttyUSB device for Channel A would be bogus and will disappear as
soon as the user runs OpenOCD or other applications that access
Channel A for JTAG from userspace, causing undesirable noise for
users.  The ftdi_sio driver already has a dedicated quirk for such
JTAG+UART FT2232 adapters, and it requires assigning custom USB IDs
to such adapters and adding these IDs to the driver with the
ftdi_jtag_quirk applied.

Boutique hardware manufacturer Falconia Partners LLC has created a
couple of JTAG+UART adapter designs (one buffered, one unbuffered)
as part of FreeCalypso project, and this hardware is specifically made
to be used with Linux hosts, with the intent that Channel A will be
accessed only from userspace via appropriate applications, and that
Channel B will be supported by the ftdi_sio kernel driver, presenting
a standard ttyUSB device to userspace.  Toward this end the hardware
manufacturer will be programming FT2232 EEPROMs with custom USB IDs,
specifically with the intent that these IDs will be recognized by
the ftdi_sio driver with the ftdi_jtag_quirk applied.

Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
---
 drivers/usb/serial/ftdi_sio.c     | 5 +++++
 drivers/usb/serial/ftdi_sio_ids.h | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 9823bb424abd..8d89a1650dad 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1037,6 +1037,11 @@ static const struct usb_device_id id_table_combined[] = {
 	/* U-Blox devices */
 	{ USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ZED_PID) },
 	{ USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ODIN_PID) },
+	/* FreeCalypso USB adapters */
+	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_BUF_PID),
+		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_UNBUF_PID),
+		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
 	{ }					/* Terminating entry */
 };
 
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index b5ca17a5967a..5b2405ac9ae0 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -589,6 +589,14 @@
 #define FTDI_CUSTOMWARE_MINIPLEX2WI_PID	0xfd4a	/* MiniPlex-2Wi */
 #define FTDI_CUSTOMWARE_MINIPLEX3_PID	0xfd4b	/* MiniPlex-3 series */
 
+/*
+ * Custom USB adapters made by Falconia Partners LLC
+ * for FreeCalypso project, ID codes allocated to Falconia by FTDI.
+ */
+#define FTDI_FALCONIA_JTAG_BUF_PID	0x7150
+#define FTDI_FALCONIA_JTAG_UNBUF_PID	0x7151
+#define FTDI_FALCONIA_DUART28C_PID	0x7152
+
 
 /********************************/
 /** third-party VID/PID combos **/
-- 
2.9.0

