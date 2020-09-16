Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A969726B9A4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 04:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgIPCG1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 22:06:27 -0400
Received: from freecalypso.org ([195.154.163.71]:32912 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726137AbgIPCGZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 22:06:25 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id 32BAC3740245; Wed, 16 Sep 2020 01:56:37 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH 2/3] USB: serial: ftdi_sio: pass port to quirk port_probe
 functions
Message-Id: <20200916015637.32BAC3740245@freecalypso.org>
Date:   Wed, 16 Sep 2020 01:56:36 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
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
 drivers/usb/serial/ftdi_sio.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 8d89a1650dad..cdf4f4e05fb2 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -88,15 +88,17 @@ struct ftdi_private {
 struct ftdi_sio_quirk {
 	int (*probe)(struct usb_serial *);
 	/* Special settings for probed ports. */
-	void (*port_probe)(struct ftdi_private *);
+	void (*port_probe)(struct usb_serial_port *, struct ftdi_private *);
 };
 
 static int   ftdi_jtag_probe(struct usb_serial *serial);
 static int   ftdi_NDI_device_setup(struct usb_serial *serial);
 static int   ftdi_stmclite_probe(struct usb_serial *serial);
 static int   ftdi_8u2232c_probe(struct usb_serial *serial);
-static void  ftdi_USB_UIRT_setup(struct ftdi_private *priv);
-static void  ftdi_HE_TIRA1_setup(struct ftdi_private *priv);
+static void  ftdi_USB_UIRT_setup(struct usb_serial_port *port,
+				 struct ftdi_private *priv);
+static void  ftdi_HE_TIRA1_setup(struct usb_serial_port *port,
+				 struct ftdi_private *priv);
 
 static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
 	.probe	= ftdi_jtag_probe,
@@ -2253,7 +2255,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 	mutex_init(&priv->cfg_lock);
 
 	if (quirk && quirk->port_probe)
-		quirk->port_probe(priv);
+		quirk->port_probe(port, priv);
 
 	usb_set_serial_port_data(port, priv);
 
@@ -2277,7 +2279,8 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
 /* Setup for the USB-UIRT device, which requires hardwired
  * baudrate (38400 gets mapped to 312500) */
 /* Called from usbserial:serial_probe */
-static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
+static void ftdi_USB_UIRT_setup(struct usb_serial_port *port,
+				struct ftdi_private *priv)
 {
 	priv->flags |= ASYNC_SPD_CUST;
 	priv->custom_divisor = 77;
@@ -2287,7 +2290,8 @@ static void ftdi_USB_UIRT_setup(struct ftdi_private *priv)
 /* Setup for the HE-TIRA1 device, which requires hardwired
  * baudrate (38400 gets mapped to 100000) and RTS-CTS enabled.  */
 
-static void ftdi_HE_TIRA1_setup(struct ftdi_private *priv)
+static void ftdi_HE_TIRA1_setup(struct usb_serial_port *port,
+				struct ftdi_private *priv)
 {
 	priv->flags |= ASYNC_SPD_CUST;
 	priv->custom_divisor = 240;
-- 
2.9.0

