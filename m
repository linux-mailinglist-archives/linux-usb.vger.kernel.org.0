Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2604C35C32C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243359AbhDLJ6G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:58:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244807AbhDLJ4n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:56:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FB3161247;
        Mon, 12 Apr 2021 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618221378;
        bh=+oc+QhwqClQRkWYDStH1OAyI8HSWT4OpOm5EMXb7MqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RmWrjlJNdissBWEuH/ckC2rlkk/ldrceOD57ll6sXoNKU14Cqv+ip/7D0fcrmz46Y
         7+17p40VL8Z7fBnOvjJbbzhL4UCSYSwa5oT/3bq+hqyIMavVAx0GWFEg64L00XGkjW
         nMZXHNWcTEIK7/09osLk6WGtU7a/tAHSCKcR8NSi+Y6DGC+2gKMsy9x71l7CJIhU1V
         1NprJ0ZBcHRvNgc00uGD61Gbc1VSP2TZrBqB3qdOV9WuMzB+pJrBxYXDtbBcrjdGFC
         vPS7k12q84FpWAJHAUpyCJEWkQ9P2OMu8DE0qLaUTnGlSSRGYcxLtlmM3lHzdmn//l
         btXJVMIzhYeDQ==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtIi-0000KY-I0; Mon, 12 Apr 2021 11:56:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] USB: serial: xr: add support for XR21V1412 and XR21V1414
Date:   Mon, 12 Apr 2021 11:55:46 +0200
Message-Id: <20210412095557.1213-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412095557.1213-1-johan@kernel.org>
References: <20210412095557.1213-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for the two- and four-port variants of XR21V1410.

Use the interface number of each control interface (e.g. 0, 2, 4, 6) to
derive the zero-based channel index:

	XR21V1410	0
	XR21V1412	0, 1
	XR21V1414	0, 1, 2, 3

Note that the UART registers reside in separate blocks per channel,
while the UART Manager functionality is implemented using per-channel
registers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/xr_serial.c | 55 +++++++++++++++++++++++++++++++---
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/xr_serial.c b/drivers/usb/serial/xr_serial.c
index 88c73f88cb26..64bc9d7b948b 100644
--- a/drivers/usb/serial/xr_serial.c
+++ b/drivers/usb/serial/xr_serial.c
@@ -109,6 +109,10 @@ struct xr_txrx_clk_mask {
 #define XR21V141X_REG_GPIO_CLR		0x1e
 #define XR21V141X_REG_GPIO_STATUS	0x1f
 
+struct xr_data {
+	u8 channel;		/* zero-based index */
+};
+
 static int xr_set_reg(struct usb_serial_port *port, u8 block, u8 reg, u8 val)
 {
 	struct usb_serial *serial = port->serial;
@@ -160,16 +164,31 @@ static int xr_get_reg(struct usb_serial_port *port, u8 block, u8 reg, u8 *val)
 
 static int xr_set_reg_uart(struct usb_serial_port *port, u8 reg, u8 val)
 {
-	return xr_set_reg(port, XR21V141X_UART_REG_BLOCK, reg, val);
+	struct xr_data *data = usb_get_serial_port_data(port);
+	u8 block;
+
+	block = XR21V141X_UART_REG_BLOCK + data->channel;
+
+	return xr_set_reg(port, block, reg, val);
 }
 
 static int xr_get_reg_uart(struct usb_serial_port *port, u8 reg, u8 *val)
 {
-	return xr_get_reg(port, XR21V141X_UART_REG_BLOCK, reg, val);
+	struct xr_data *data = usb_get_serial_port_data(port);
+	u8 block;
+
+	block = XR21V141X_UART_REG_BLOCK + data->channel;
+
+	return xr_get_reg(port, block, reg, val);
 }
 
-static int xr_set_reg_um(struct usb_serial_port *port, u8 reg, u8 val)
+static int xr_set_reg_um(struct usb_serial_port *port, u8 reg_base, u8 val)
 {
+	struct xr_data *data = usb_get_serial_port_data(port);
+	u8 reg;
+
+	reg = reg_base + data->channel;
+
 	return xr_set_reg(port, XR21V141X_UM_REG_BLOCK, reg, val);
 }
 
@@ -577,8 +596,34 @@ static int xr_probe(struct usb_serial *serial, const struct usb_device_id *id)
 	return 0;
 }
 
+static int xr_port_probe(struct usb_serial_port *port)
+{
+	struct usb_interface_descriptor *desc;
+	struct xr_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	desc = &port->serial->interface->cur_altsetting->desc;
+	data->channel = desc->bInterfaceNumber / 2;
+
+	usb_set_serial_port_data(port, data);
+
+	return 0;
+}
+
+static void xr_port_remove(struct usb_serial_port *port)
+{
+	struct xr_data *data = usb_get_serial_port_data(port);
+
+	kfree(data);
+}
+
 static const struct usb_device_id id_table[] = {
-	{ USB_DEVICE_INTERFACE_CLASS(0x04e2, 0x1410, USB_CLASS_COMM) }, /* XR21V141X */
+	{ USB_DEVICE_INTERFACE_CLASS(0x04e2, 0x1410, USB_CLASS_COMM) }, /* XR21V1410 */
+	{ USB_DEVICE_INTERFACE_CLASS(0x04e2, 0x1412, USB_CLASS_COMM) }, /* XR21V1412 */
+	{ USB_DEVICE_INTERFACE_CLASS(0x04e2, 0x1414, USB_CLASS_COMM) }, /* XR21V1414 */
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, id_table);
@@ -591,6 +636,8 @@ static struct usb_serial_driver xr_device = {
 	.id_table		= id_table,
 	.num_ports		= 1,
 	.probe			= xr_probe,
+	.port_probe		= xr_port_probe,
+	.port_remove		= xr_port_remove,
 	.open			= xr_open,
 	.close			= xr_close,
 	.break_ctl		= xr_break_ctl,
-- 
2.26.3

