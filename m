Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05ED227DC89
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 01:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgI2XNI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 19:13:08 -0400
Received: from freecalypso.org ([195.154.163.71]:38988 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728471AbgI2XNI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 19:13:08 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id 4195737403AE; Tue, 29 Sep 2020 23:05:25 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH v2 2/2] USB: serial: ftdi_sio: add support for FreeCalypso
 DUART28C adapter
Message-Id: <20200929230525.4195737403AE@freecalypso.org>
Date:   Tue, 29 Sep 2020 23:05:24 +0000 (UTC)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

FreeCalypso DUART28C is an FT2232D-based USB to dual UART adapter
with a special quirk: Channel B RTS and DTR outputs (BDBUS2 and BDBUS4
on the chip) have been repurposed to drive PWON and RESET controls
on Calypso targets.  The circuit is wired such that BDBUS[24] high
(RTS/DTR inactive) is the normal state with Iota VRPC controls
NOT activated, whereas BDBUS[24] low (RTS or DTR active) turn ON
the corresponding open drain control signal drivers.

A special ftdi_sio driver quirk is needed in order to suppress
automatic assertion of DTR & RTS on device open: this device's
special PWON and RESET control drivers MUST NOT be activated
when the port is ordinarily opened for plain serial communication,
instead they must only be activated when a special userspace
application explicitly requests such activation with a TIOCMBIS ioctl.
These special userspace applications are responsible for making the
needed pulse with a TIOCMBIS, delay, TIOCMBIC sequence.

The special quirk is conditionalized on the DUART28C adapter's custom
USB ID, and is further limited to FT2232D Channel B only: Channel A
is wired normally, with the chip's ADBUS2 and ADBUS4 outputs
actually being RTS and DTR rather than something else.

Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
---

Changes from the first version of this patch:

* The logic in the quirk port_probe function for determining which
interface number is being considered has been changed as asked by
the reviewer.  The specific magic for retrieving the interface number
has been copied from the existing ftdi_determine_type() function,
which is called immediately after quirk->port_probe().

* Comments have been updated in the hope of providing a better
explanation of how this quirk works in the hardware and why it is
needed.

---
 drivers/usb/serial/ftdi_sio.c     | 60 +++++++++++++++++++++++++++++++++++----
 drivers/usb/serial/ftdi_sio_ids.h |  1 +
 2 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 1e401898f2f6..5b550f1927a2 100644
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
@@ -97,6 +99,7 @@ static int   ftdi_stmclite_probe(struct usb_serial *serial);
 static int   ftdi_8u2232c_probe(struct usb_serial *serial);
 static void  ftdi_USB_UIRT_setup(struct usb_serial_port *port);
 static void  ftdi_HE_TIRA1_setup(struct usb_serial_port *port);
+static void  ftdi_duart28c_setup(struct usb_serial_port *port);
 
 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
 	.probe	= ftdi_jtag_probe,
@@ -122,6 +125,10 @@ static const struct ftdi_sio_quirk ftdi_8u2232c_quirk = {
 	.probe	= ftdi_8u2232c_probe,
 };
 
+static const struct ftdi_sio_quirk ftdi_duart28c_quirk = {
+	.port_probe = ftdi_duart28c_setup,
+};
+
 /*
  * The 8U232AM has the same API as the sio except for:
  * - it can support MUCH higher baudrates; up to:
@@ -1042,6 +1049,8 @@ static const struct usb_device_id id_table_combined[] = {
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_JTAG_UNBUF_PID),
 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+	{ USB_DEVICE(FTDI_VID, FTDI_FALCONIA_DUART28C_PID),
+		.driver_info = (kernel_ulong_t)&ftdi_duart28c_quirk },
 	{ }					/* Terminating entry */
 };
 
@@ -2388,6 +2397,38 @@ static int ftdi_stmclite_probe(struct usb_serial *serial)
 	return 0;
 }
 
+/*
+ * FreeCalypso DUART28C is an FT2232D-based USB to dual UART adapter
+ * with a special quirk: Channel B RTS and DTR outputs (BDBUS2 and BDBUS4
+ * on the chip) have been repurposed to drive PWON and RESET controls
+ * on Calypso targets.  The circuit is wired such that BDBUS[24] high
+ * (RTS/DTR inactive) is the normal state with Iota VRPC controls
+ * NOT activated, whereas BDBUS[24] low (RTS or DTR active) turn ON
+ * the corresponding open drain control signal drivers.
+ *
+ * A special ftdi_sio driver quirk is needed in order to suppress
+ * automatic assertion of DTR & RTS on device open: this device's
+ * special PWON and RESET control drivers MUST NOT be activated
+ * when the port is ordinarily opened for plain serial communication,
+ * instead they must only be activated when a special userspace
+ * application explicitly requests such activation with a TIOCMBIS ioctl.
+ * These special userspace applications are responsible for making the
+ * needed pulse with a TIOCMBIS, delay, TIOCMBIC sequence.
+ *
+ * The special quirk must be applied only to FT2232D Channel B:
+ * Channel A is wired normally, with the chip's ADBUS2 and ADBUS4 outputs
+ * actually being RTS and DTR rather than something else.
+ */
+static void ftdi_duart28c_setup(struct usb_serial_port *port)
+{
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	struct usb_serial *serial = port->serial;
+	int ifnum = serial->interface->altsetting->desc.bInterfaceNumber;
+
+	if (ifnum == 1)
+		priv->no_auto_dtr_rts = 1;
+}
+
 static int ftdi_sio_port_remove(struct usb_serial_port *port)
 {
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
@@ -2439,10 +2480,18 @@ static void ftdi_dtr_rts(struct usb_serial_port *port, int on)
 			dev_err(&port->dev, "error from flowcontrol urb\n");
 		}
 	}
-	/* drop RTS and DTR */
-	if (on)
-		set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
-	else
+	/*
+	 * Assert or negate RTS and DTR as requested.  When DUART28C
+	 * quirk is applied, we suppress automatic assertion, but
+	 * automatic negation on device close is retained - these
+	 * special control signals are meant to be pulsed, and leaving
+	 * either of them stuck on when the responsible userspace
+	 * program has terminated unexpectedly is undesirable.
+	 */
+	if (on) {
+		if (!priv->no_auto_dtr_rts)
+			set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
+	} else
 		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 }
 
@@ -2790,7 +2839,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
 			dev_err(ddev, "%s urb failed to set baudrate\n", __func__);
 		mutex_unlock(&priv->cfg_lock);
 		/* Ensure RTS and DTR are raised when baudrate changed from 0 */
-		if (old_termios && (old_termios->c_cflag & CBAUD) == B0)
+		if (old_termios && (old_termios->c_cflag & CBAUD) == B0
+		    && !priv->no_auto_dtr_rts)
 			set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
 	}
 
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 3d47c6d72256..3081b8916a0a 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -45,6 +45,7 @@
  */
 #define FTDI_FALCONIA_JTAG_BUF_PID	0x7150
 #define FTDI_FALCONIA_JTAG_UNBUF_PID	0x7151
+#define FTDI_FALCONIA_DUART28C_PID	0x7152
 
 /* Sienna Serial Interface by Secyourit GmbH */
 #define FTDI_SIENNA_PID		0x8348
-- 
2.9.0

