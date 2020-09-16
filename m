Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3F026B9A5
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 04:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgIPCG2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 22:06:28 -0400
Received: from freecalypso.org ([195.154.163.71]:32908 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgIPCGZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 22:06:25 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id B89E1374026F; Wed, 16 Sep 2020 01:56:44 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH 3/3] USB: serial: ftdi_sio: add support for FreeCalypso
 DUART28C adapter
Message-Id: <20200916015644.B89E1374026F@freecalypso.org>
Date:   Wed, 16 Sep 2020 01:56:44 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

FreeCalypso DUART28C is an FT2232D-based USB to dual UART adapter
with a special quirk: Channel B RTS and DTR outputs (BDBUS2 and BDBUS4
on the chip) have been repurposed to drive power and reset controls
on Calypso targets.  The circuit is wired such that BDBUS[24] high
(RTS/DTR inactive) is the normal state with power/reset control
NOT activated, whereas BDBUS[24] low (RTS or DTR active) turn ON
the corresponding power/reset control drivers.

A special ftdi_sio driver quirk is needed in order to suppress
automatic assertion of DTR & RTS on device open: this device's
special power and reset control drivers MUST NOT be activated
when the port is ordinarily opened for plain serial communication,
instead they must only be activated when a special userspace
application explicitly requests such activation with a TIOCMBIS ioctl.

The special quirk is conditionalized on the DUART28C adapter's custom
USB ID, and is further limited to FT2232D Channel B only: Channel A
is wired normally, with the chip's ADBUS2 and ADBUS4 outputs
actually being RTS and DTR rather than something else.

Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
---
 drivers/usb/serial/ftdi_sio.c | 51 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index cdf4f4e05fb2..73c6b4e2c3e4 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -69,6 +69,8 @@ struct ftdi_private {
 				   this value */
 	int force_rtscts;	/* if non-zero, force RTS-CTS to always
 				   be enabled */
+	int no_auto_dtr_rts;	/* if non-zero, suppress automatic assertion
+				   of DTR & RTS on device open */
 
 	unsigned int latency;		/* latency setting in use */
 	unsigned short max_packet_size;
@@ -99,6 +101,8 @@ static void  ftdi_USB_UIRT_setup(struct usb_serial_port *port,
 				 struct ftdi_private *priv);
 static void  ftdi_HE_TIRA1_setup(struct usb_serial_port *port,
 				 struct ftdi_private *priv);
+static void  ftdi_duart28c_setup(struct usb_serial_port *port,
+				 struct ftdi_private *priv);
 
 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
 	.probe	= ftdi_jtag_probe,
@@ -124,6 +128,10 @@ static const struct ftdi_sio_quirk ftdi_8u2232c_quirk = {
 	.probe	= ftdi_8u2232c_probe,
 };
 
+static const struct ftdi_sio_quirk ftdi_duart28c_quirk = {
+	.port_probe = ftdi_duart28c_setup,
+};
+
 /*
  * The 8U232AM has the same API as the sio except for:
  * - it can support MUCH higher baudrates; up to:
@@ -1044,6 +1052,8 @@ static const struct usb_device_id id_table_combined[] = {
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_UNBUF_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_DUART28C_PID),
+		.driver_info = (kernel_ulong_t)&ftdi_duart28c_quirk },
 	{ }					/* Terminating entry */
 };
 
@@ -2388,6 +2398,37 @@ static int ftdi_stmclite_probe(struct usb_serial *serial)
 	return 0;
 }
 
+/*
+ * FreeCalypso DUART28C is an FT2232D-based USB to dual UART adapter
+ * with a special quirk: Channel B RTS and DTR outputs (BDBUS2 and BDBUS4
+ * on the chip) have been repurposed to drive power and reset controls
+ * on Calypso targets.  The circuit is wired such that BDBUS[24] high
+ * (RTS/DTR inactive) is the normal state with power/reset control
+ * NOT activated, whereas BDBUS[24] low (RTS or DTR active) turn ON
+ * the corresponding power/reset control drivers.
+ *
+ * A special ftdi_sio driver quirk is needed in order to suppress
+ * automatic assertion of DTR & RTS on device open: this device's
+ * special power and reset control drivers MUST NOT be activated
+ * when the port is ordinarily opened for plain serial communication,
+ * instead they must only be activated when a special userspace
+ * application explicitly requests such activation with a TIOCMBIS ioctl.
+ *
+ * The special quirk must be applied only to FT2232D Channel B:
+ * Channel A is wired normally, with the chip's ADBUS2 and ADBUS4 outputs
+ * actually being RTS and DTR rather than something else.
+ */
+static void ftdi_duart28c_setup(struct usb_serial_port *port,
+				struct ftdi_private *priv)
+{
+	struct usb_serial *serial = port->serial;
+	struct usb_device *udev = serial->dev;
+	struct usb_interface *interface = serial->interface;
+
+	if (interface == udev->actconfig->interface[1])
+		priv->no_auto_dtr_rts = 1;
+}
+
 static int ftdi_sio_port_remove(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
@@ -2440,9 +2481,10 @@ static void ftdi_dtr_rts(struct usb_serial_port *port, int on)
 		}
 	}
 	/* drop RTS and DTR */
-	if (on)
-		set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
-	else
+	if (on) {
+		if (!priv->no_auto_dtr_rts)
+			set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
+	} else
 		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 }
 
@@ -2790,7 +2832,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
 			dev_err(ddev, "%s urb failed to set baudrate\n", __func__);
 		mutex_unlock(&priv->cfg_lock);
 		/* Ensure RTS and DTR are raised when baudrate changed from 0 */
-		if (old_termios && (old_termios->c_cflag & CBAUD) == B0)
+		if (old_termios && (old_termios->c_cflag & CBAUD) == B0
+		    && !priv->no_auto_dtr_rts)
 			set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 	}
 
-- 
2.9.0

