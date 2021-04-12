Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A706435C32B
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239740AbhDLJ57 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:57:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:38562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244809AbhDLJ4n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:56:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFBA66127C;
        Mon, 12 Apr 2021 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618221378;
        bh=CO/OsevSE7pyEYTTXHabBKlXv95tMYgBZ8LKZvSgso8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BCkTZ0H5DyNnzVfr3b0BUCYMAh70v7XAi9xMv7zPiFvYeYIn5VmH5bW/wFuJF0460
         C/qYz7dVTK8XQflPekxdQoEIRCCy8tnp//J711U1bIEivlBLFYEfIlypGIR0AkIc44
         vju6KPs+usr/1XitcTdrblgAT6ce3S4tqElO6o53j/jiDwTqB4oSWFnKgrxErdiFTC
         KSZefgrF1AeAJ1haHMk6d9g/VnKkUdoveuIbO/eY5RcWVSxeQqQGM5g1JtvYkI6xLH
         bgW/5C6zFxJZOwYO0ezKGemXaQoT7k/Ys62o9pqiGUF1A53kXj+AMJlNnugB6DDEeA
         VS3iJUSEC8O1g==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtIj-0000Kt-5Z; Mon, 12 Apr 2021 11:56:13 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] USB: serial: xr: add support for XR21B1411
Date:   Mon, 12 Apr 2021 11:55:53 +0200
Message-Id: <20210412095557.1213-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412095557.1213-1-johan@kernel.org>
References: <20210412095557.1213-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The single-port XR21B1411 is similar to the XR21B142X type but uses
12-bit registers and 16-bit register addresses, the register requests
are different and are directed at the device rather than interface, and
5 and 6-bit words are not supported.

The register layout is very similar to XR21B142X except that most
registers are offset by 0xc00 (corresponding to a channel index of 12 in
the MSB of wIndex). As the device is single-port so that the derived
channel index is 0, the current register accessors can be reused after
simply changing the address width.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 64 +++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index 32055c763147..46e5e1b2f3c0 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -108,18 +108,19 @@ struct xr_type {
 	u8 set_reg;
 	u8 get_reg;
 
-	u8 uart_enable;
-	u8 flow_control;
-	u8 xon_char;
-	u8 xoff_char;
-	u8 tx_break;
-	u8 gpio_mode;
-	u8 gpio_direction;
-	u8 gpio_set;
-	u8 gpio_clear;
-	u8 gpio_status;
-	u8 custom_driver;
-
+	u16 uart_enable;
+	u16 flow_control;
+	u16 xon_char;
+	u16 xoff_char;
+	u16 tx_break;
+	u16 gpio_mode;
+	u16 gpio_direction;
+	u16 gpio_set;
+	u16 gpio_clear;
+	u16 gpio_status;
+	u16 custom_driver;
+
+	bool have_5_6_bit_mode;
 	bool have_xmit_toggle;
 
 	int (*enable)(struct usb_serial_port *port);
@@ -132,6 +133,7 @@ struct xr_type {
 enum xr_type_id {
 	XR21V141X,
 	XR21B142X,
+	XR21B1411,
 	XR_TYPE_COUNT,
 };
 
@@ -175,8 +177,27 @@ static const struct xr_type xr_types[] = {
 		.gpio_status	= 0x10,
 		.custom_driver	= 0x60,
 
+		.have_5_6_bit_mode	= true,
 		.have_xmit_toggle	= true,
 	},
+	[XR21B1411] = {
+		.reg_width	= 12,
+		.reg_recipient	= USB_RECIP_DEVICE,
+		.set_reg	= 0x00,
+		.get_reg	= 0x01,
+
+		.uart_enable	= 0xc00,
+		.flow_control	= 0xc06,
+		.xon_char	= 0xc07,
+		.xoff_char	= 0xc08,
+		.tx_break	= 0xc0a,
+		.gpio_mode	= 0xc0c,
+		.gpio_direction	= 0xc0d,
+		.gpio_set	= 0xc0e,
+		.gpio_clear	= 0xc0f,
+		.gpio_status	= 0xc10,
+		.custom_driver	= 0x20d,
+	},
 };
 
 struct xr_data {
@@ -184,7 +205,7 @@ struct xr_data {
 	u8 channel;			/* zero-based index or interface number */
 };
 
-static int xr_set_reg(struct usb_serial_port *port, u8 channel, u8 reg, u16 val)
+static int xr_set_reg(struct usb_serial_port *port, u8 channel, u16 reg, u16 val)
 {
 	struct xr_data *data = usb_get_serial_port_data(port);
 	const struct xr_type *type = data->type;
@@ -204,7 +225,7 @@ static int xr_set_reg(struct usb_serial_port *port, u8 channel, u8 reg, u16 val)
 	return 0;
 }
 
-static int xr_get_reg(struct usb_serial_port *port, u8 channel, u8 reg, u16 *val)
+static int xr_get_reg(struct usb_serial_port *port, u8 channel, u16 reg, u16 *val)
 {
 	struct xr_data *data = usb_get_serial_port_data(port);
 	const struct xr_type *type = data->type;
@@ -243,14 +264,14 @@ static int xr_get_reg(struct usb_serial_port *port, u8 channel, u8 reg, u16 *val
 	return ret;
 }
 
-static int xr_set_reg_uart(struct usb_serial_port *port, u8 reg, u16 val)
+static int xr_set_reg_uart(struct usb_serial_port *port, u16 reg, u16 val)
 {
 	struct xr_data *data = usb_get_serial_port_data(port);
 
 	return xr_set_reg(port, data->channel, reg, val);
 }
 
-static int xr_get_reg_uart(struct usb_serial_port *port, u8 reg, u16 *val)
+static int xr_get_reg_uart(struct usb_serial_port *port, u16 reg, u16 *val)
 {
 	struct xr_data *data = usb_get_serial_port_data(port);
 
@@ -646,6 +667,7 @@ static void xr21v141x_set_line_settings(struct tty_struct *tty,
 static void xr_cdc_set_line_coding(struct tty_struct *tty,
 		struct usb_serial_port *port, struct ktermios *old_termios)
 {
+	struct xr_data *data = usb_get_serial_port_data(port);
 	struct usb_host_interface *alt = port->serial->interface->cur_altsetting;
 	struct usb_device *udev = port->serial->dev;
 	struct usb_cdc_line_coding *lc;
@@ -683,6 +705,15 @@ static void xr_cdc_set_line_coding(struct tty_struct *tty,
 		lc->bParityType = USB_CDC_NO_PARITY;
 	}
 
+	if (!data->type->have_5_6_bit_mode &&
+			(C_CSIZE(tty) == CS5 || C_CSIZE(tty) == CS6)) {
+		tty->termios.c_cflag &= ~CSIZE;
+		if (old_termios)
+			tty->termios.c_cflag |= old_termios->c_cflag & CSIZE;
+		else
+			tty->termios.c_cflag |= CS8;
+	}
+
 	switch (C_CSIZE(tty)) {
 	case CS5:
 		lc->bDataBits = 5;
@@ -876,6 +907,7 @@ static void xr_port_remove(struct usb_serial_port *port)
 
 static const struct usb_device_id id_table[] = {
 	{ XR_DEVICE(0x04e2, 0x1410, XR21V141X) },
+	{ XR_DEVICE(0x04e2, 0x1411, XR21B1411) },
 	{ XR_DEVICE(0x04e2, 0x1412, XR21V141X) },
 	{ XR_DEVICE(0x04e2, 0x1414, XR21V141X) },
 	{ XR_DEVICE(0x04e2, 0x1420, XR21B142X) },
-- 
2.26.3

