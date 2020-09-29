Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A90527DC87
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 01:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgI2XMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 19:12:37 -0400
Received: from freecalypso.org ([195.154.163.71]:38984 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728206AbgI2XMh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 19:12:37 -0400
X-Greylist: delayed 444 seconds by postgrey-1.27 at vger.kernel.org; Tue, 29 Sep 2020 19:12:36 EDT
Received: by freecalypso.org (Postfix, from userid 1001)
        id 243E937403A7; Tue, 29 Sep 2020 23:05:18 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH v2 1/2] USB: serial: ftdi_sio: pass port to quirk port_probe
 functions
Message-Id: <20200929230518.243E937403A7@freecalypso.org>
Date:   Tue, 29 Sep 2020 23:05:17 +0000 (UTC)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The original code passed only the pointer to the ftdi_private struct
to quirk port_probe functions.  However, some quirks may need to be
applied conditionally only to some channels of a multichannel FT2232x
or FT4232H device, and if a given quirk's port_probe function needs
to figure out which channel of a multichannel device is currently
being considered, it needs access to the port pointer passed to the
ftdi_sio_port_probe() function, so it can traverse USB data structures
from there.

Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
---

Change from the first version of this patch: the present version
reorders the usb_set_serial_port_data() and quirk->port_probe() calls
(puts the usb_set_serial_port_data() call first) and passes only port
instead of priv to quirk port_probe functions, letting the latter
retrieve priv themselves when they need it.

---
 drivers/usb/serial/ftdi_sio.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 8d89a1650dad..1e401898f2f6 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -88,15 +88,15 @@ struct ftdi_private {
 struct ftdi_sio_quirk {
 	int (*probe)(struct usb_serial *);
 	/* Special settings for probed ports. */
-	void (*port_probe)(struct ftdi_private *);
+	void (*port_probe)(struct usb_serial_port *);
 };
 
 static int   ftdi_jtag_probe(struct usb_serial *serial);
 static int   ftdi_NDI_device_setup(struct usb_serial *serial);
 static int   ftdi_stmclite_probe(struct usb_serial *serial);
 static int   ftdi_8u2232c_probe(struct usb_serial *serial);
-static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
-static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
+static void  ftdi_USB_UIRT_setup(struct usb_serial_port *port);
+static void  ftdi_HE_TIRA1_setup(struct usb_serial_port *port);
 
 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
 	.probe	= ftdi_jtag_probe,
@@ -2252,11 +2252,11 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 
 	mutex_init(&priv->cfg_lock);
 
-	if (quirk && quirk->port_probe)
-		quirk->port_probe(priv);
-
 	usb_set_serial_port_data(port, priv);
 
+	if (quirk && quirk->port_probe)
+		quirk->port_probe(port);
+
 	ftdi_determine_type(port);
 	ftdi_set_max_packet_size(port);
 	if (read_latency_timer(port) < 0)
@@ -2277,8 +2277,10 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 /* Setup for the USB-UIRT device, which requires hardwired
  * baudrate (38400 gets mapped to 312500) */
 /* Called from usbserial:serial_probe */
-static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
+static void ftdi_USB_UIRT_setup(struct usb_serial_port *port)
 {
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+
 	priv->flags |= ASYNC_SPD_CUST;
 	priv->custom_divisor = 77;
 	priv->force_baud = 38400;
@@ -2287,8 +2289,10 @@ static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
 /* Setup for the HE-TIRA1 device, which requires hardwired
  * baudrate (38400 gets mapped to 100000) and RTS-CTS enabled.  */
 
-static void ftdi_HE_TIRA1_setup(struct ftdi_private *priv)
+static void ftdi_HE_TIRA1_setup(struct usb_serial_port *port)
 {
+	struct ftdi_private *priv = usb_get_serial_port_data(port);
+
 	priv->flags |= ASYNC_SPD_CUST;
 	priv->custom_divisor = 240;
 	priv->force_baud = 38400;
-- 
2.9.0

