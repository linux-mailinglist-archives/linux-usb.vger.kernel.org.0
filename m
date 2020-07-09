Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68E5121955D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 02:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgGIAw4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 20:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGIAwz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 20:52:55 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E428C061A0B
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 17:52:55 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id h17so252931qvr.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 17:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcMRywPNH+vsgrFAeurilry6X+FPT5EQZAj21KdXsco=;
        b=q3bwBMGYF+YfcFRhhJR2o+qqs5VBe8d4UQnQLGC4ucN7q0cI81T6x+JCHq0h/auHpS
         ZUuGi918bxz+pUedk0yscQLJ44Wy/+Mr+qYPrbSDfMlSmGkkCTF1x9Zqa3DEvkLpfNaH
         aLOM4T+aVDADw06dPiFCAZy22Mrg4b+nhaVtjOAHbh0E2oMM+2pIBvXIQYnyeBv6BUxa
         XgbSKquJ0QtGLAKENRtwX00dlzP7VjrhPh0SMumDOw82Pu1svE5Un+QxQOkIOadBZj2A
         xEgjtYqNe2HTTJn0MU8/6do4Rzia3s1GITEpm7U0OdIPoePKyi2ngx9dNMq62xtTT2jo
         wKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcMRywPNH+vsgrFAeurilry6X+FPT5EQZAj21KdXsco=;
        b=b9B5T744won+HCvscNUIuYqqeeSTZgvB2QXnDcDqfbxzCo8/0X+nYR81dFFBf5jksf
         9qNgFbJNYHEfK6gFXF0y8zuYdOb3M3ngFtUUk/wh3LEYc/7RKXUiSU4/B6JMYsrGS5UG
         RJZlRkfX5k3sW0wx9fFd3ScL6xLwWbdj8OKl4XN8B5fUaI6w7ciiklrEzsVFJGVqmfFt
         UL3PMM3b4tKGaoRq2pxDS1caL/ZnTvVsoKjslGV4SWYEOS+zL4kgLT7V/h9zIy1i79P1
         1dTAGF+/MTDKwz61UW/+gHJyr+7guqZU08HI++BYZxWFOmxaP7KZ0LMJPJwzUsRgmF33
         CrDA==
X-Gm-Message-State: AOAM532yMOuG3Ua9bVRg9fA12eH5JS3+UULtOrAIwgUikvHsJncGUNiP
        249aajMBZJh+6n/ersZDjrZg+t/4KV3DBg==
X-Google-Smtp-Source: ABdhPJzNQzkGMD25iDfjLVWoXNb3q5o0MbME791WOYwAGS2aNsib6r2Fj4aq0NWjpW8Bnh7sFtJv5g==
X-Received: by 2002:a0c:8603:: with SMTP id p3mr58351466qva.227.1594255974508;
        Wed, 08 Jul 2020 17:52:54 -0700 (PDT)
Received: from dfj.bfc.timesys.com (host-79-30-36-203.retail.telecomitalia.it. [79.30.36.203])
        by smtp.gmail.com with ESMTPSA id o184sm1931535qkd.41.2020.07.08.17.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 17:52:53 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     johan@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] USB: serial: add support for MaxLinear XR21V1412
Date:   Thu,  9 Jul 2020 03:00:08 +0200
Message-Id: <20200709010008.2784747-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From some researches, this driver was available from the IC
constructor site, but for older kernel versions. From there, decided
to add a much simplier mainline version, written from sratch.

This initial simple version is implemented without any flow control,
tested mainly at 115200, but all standard baud rates are supported
and applied as per serial terminal setting.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 drivers/usb/serial/Kconfig     |   9 +
 drivers/usb/serial/Makefile    |   1 +
 drivers/usb/serial/xr21v1412.c | 361 +++++++++++++++++++++++++++++++++
 3 files changed, 371 insertions(+)
 create mode 100644 drivers/usb/serial/xr21v1412.c

diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
index 4007fa25a8ff..5f215a736618 100644
--- a/drivers/usb/serial/Kconfig
+++ b/drivers/usb/serial/Kconfig
@@ -644,6 +644,15 @@ config USB_SERIAL_UPD78F0730
 	  To compile this driver as a module, choose M here: the
 	  module will be called upd78f0730.
 
+config USB_SERIAL_XR21V1412
+	tristate "USB MaxLinear XR21V1412 serial driver"
+	help
+	  Say Y here if you want to use the MaxLinear XR21V1412
+	  serial driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called xr21v1412.
+
 config USB_SERIAL_DEBUG
 	tristate "USB Debugging Device"
 	help
diff --git a/drivers/usb/serial/Makefile b/drivers/usb/serial/Makefile
index 2d491e434f11..8b4afcc44b46 100644
--- a/drivers/usb/serial/Makefile
+++ b/drivers/usb/serial/Makefile
@@ -62,4 +62,5 @@ obj-$(CONFIG_USB_SERIAL_VISOR)			+= visor.o
 obj-$(CONFIG_USB_SERIAL_WISHBONE)		+= wishbone-serial.o
 obj-$(CONFIG_USB_SERIAL_WHITEHEAT)		+= whiteheat.o
 obj-$(CONFIG_USB_SERIAL_XIRCOM)			+= keyspan_pda.o
+obj-$(CONFIG_USB_SERIAL_XR21V1412)		+= xr21v1412.o
 obj-$(CONFIG_USB_SERIAL_XSENS_MT)		+= xsens_mt.o
diff --git a/drivers/usb/serial/xr21v1412.c b/drivers/usb/serial/xr21v1412.c
new file mode 100644
index 000000000000..9c9ace46bc41
--- /dev/null
+++ b/drivers/usb/serial/xr21v1412.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MaxLinear XR21V1412 USB to serial adaptor driver
+ *
+ * Copyright (C) 2020 Angelo Dureghello <angelo.dureghello@timesys.com>
+ *
+ * This driver has been started looking into ch341.c and f81232.c
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+#include <linux/usb.h>
+#include <linux/usb/serial.h>
+
+/*
+ * The internal register set of the XR21V1412 consists of 3 different
+ * blocks of registers:
+ * UART Manager,
+ * UART registers,
+ * UART miscellaneous.
+ */
+
+#define index(reg, block)	((block << 8) | reg)
+
+#define REG_BLOCK_UART_A	0x0
+#define REG_BLOCK_UART_B	0x1
+#define REG_BLOCK_UART_MGR	0x4
+#define REG_BLOCK_I2C_EE	0x65
+#define REG_BLOCK_UART_CUSTOM	0x66
+
+#define REQ_CDC_ACM		35
+#define REQ_SET_REG		0
+#define REQ_GETN_REG		1
+
+#define REQ_TYPE_XR_SET_REG	0x40
+
+#define FIFO_ENABLE_CHA		0x10
+#define FIFO_ENABLE_CHB		0x11
+#define FIFO_ENABLE_TX		BIT(0)
+#define FIFO_ENABLE_RX		BIT(1)
+
+#define REG_UART_ENABLE		0x03
+#define REG_UART_DIV0		0x04
+#define REG_UART_DIV1		0x05
+#define REG_UART_DIV2		0x06
+#define REG_UART_TXCLOCK_MASK0	0x07
+#define REG_UART_TXCLOCK_MASK1	0x08
+#define REG_UART_RXCLOCK_MASK0	0x09
+#define REG_UART_RXCLOCK_MASK1	0x0a
+#define REG_UART_CHAR_FMT	0x0b
+
+#define REG_SET_RETRY		2
+
+#define	REG_DIV0_MASK		GENMASK(7, 0)
+#define REG_DIV1_MASK		GENMASK(15, 8)
+#define REG_DIV2_MASK		GENMASK(18, 16)
+#define	REG_DIV0(x)		(x & REG_DIV0_MASK)
+#define	REG_DIV1(x)		((x & REG_DIV1_MASK) >> 8)
+#define	REG_DIV2(x)		((x & REG_DIV2_MASK) >> 16)
+
+#define INT_OSC			48000000
+
+#define CLKM_TABLE_ENTRIES	32
+#define CLKM_TX			0
+#define CLKM_RX_ODD		1
+#define CLKM_RX_EVEN		2
+#define CLKM_ENTRIES		3
+
+#define	PARITY_NONE		0
+#define	PARITY_ODD		1
+#define	PARITY_EVEN		2
+
+#define DEFAULT_BAUDRATE	115200
+#define DEFAULT_DATA_BITS	8
+#define DEFAULT_PARITY		PARITY_NONE
+#define DEFAULT_STOP_BITS	1
+
+static const int mask_lookup_table[CLKM_TABLE_ENTRIES][CLKM_ENTRIES] = {
+	{0x0000, 0x0000, 0x0000},
+	{0x0000, 0x0000, 0x0000},
+	{0x0100, 0x0000, 0x0100},
+	{0x0020, 0x0400, 0x0020},
+	{0x0010, 0x0100, 0x0010},
+	{0x0208, 0x0040, 0x0208},
+	{0x0104, 0x0820, 0x0108},
+	{0x0844, 0x0210, 0x0884},
+	{0x0444, 0x0110, 0x0444},
+	{0x0122, 0x0888, 0x0224},
+	{0x0912, 0x0448, 0x0924},
+	{0x0492, 0x0248, 0x0492},
+	{0x0252, 0x0928, 0x0292},
+	{0x094A, 0x04A4, 0x0A52},
+	{0x052A, 0x0AA4, 0x054A},
+	{0x0AAA, 0x0954, 0x04AA},
+	{0x0AAA, 0x0554, 0x0AAA},
+	{0x0555, 0x0AD4, 0x05AA},
+	{0x0B55, 0x0AB4, 0x055A},
+	{0x06B5, 0x05AC, 0x0B56},
+	{0x05B5, 0x0D6C, 0x06D6},
+	{0x0B6D, 0x0B6A, 0x0DB6},
+	{0x076D, 0x06DA, 0x0BB6},
+	{0x0EDD, 0x0DDA, 0x076E},
+	{0x0DDD, 0x0BBA, 0x0EEE},
+	{0x07BB, 0x0F7A, 0x0DDE},
+	{0x0F7B, 0x0EF6, 0x07DE},
+	{0x0DF7, 0x0BF6, 0x0F7E},
+	{0x07F7, 0x0FEE, 0x0EFE},
+	{0x0FDF, 0x0FBE, 0x07FE},
+	{0x0F7F, 0x0EFE, 0x0FFE},
+	{0x0FFF, 0x0FFE, 0x0FFD},
+};
+
+struct xr21v1412_private {
+	int baudrate;
+	u8 parity;
+	u8 data_bits;
+	u8 stop_bits;
+};
+
+static const struct usb_device_id id_table[] = {
+	{ USB_DEVICE(0x04e2, 0x1412) },
+	{ },
+};
+MODULE_DEVICE_TABLE(usb, id_table);
+
+static u8 xr21v1412_interface_num(struct usb_serial *serial)
+{
+	struct usb_host_interface *cur_altsetting;
+
+	cur_altsetting = serial->interface->cur_altsetting;
+
+	return cur_altsetting->desc.bInterfaceNumber;
+}
+
+static int xr21v1412_xr_set_register(struct usb_device *udev, u16 reg, u16 val)
+{
+	int retry = REG_SET_RETRY;
+	int status, size;
+
+	while (retry--) {
+		status = usb_control_msg(udev,
+					 usb_sndctrlpipe(udev, 0),
+					 REQ_SET_REG,
+					 REQ_TYPE_XR_SET_REG,
+					 val & 0xff,
+					 reg,
+					 0,
+					 0,
+					 USB_CTRL_SET_TIMEOUT);
+		if (status < 0) {
+			status = usb_translate_errors(status);
+			if (status == -EIO)
+				continue;
+		} else if (status != size) {
+			/* Retry on short transfers */
+			status = -EIO;
+			continue;
+		} else {
+			status = 0;
+		}
+
+		break;
+	}
+
+	if (status) {
+		dev_err(&udev->dev, "failed to set register 0x%x: %d\n",
+				reg, status);
+	}
+
+	return status;
+}
+
+static inline int xr21v1412_get_clock_divisor(int baudrate)
+{
+	return (INT_OSC / baudrate);
+}
+
+static inline int xr21v1412_get_mask_table_idx(int baudrate, int clock_divisor)
+{
+	uint32_t value;
+
+	value = (INT_OSC * 10) / (baudrate / 10);
+	value -= (clock_divisor * 100);
+	value = value * 32 / 100;
+
+	return value;
+}
+
+static void xr21v1412_configure_port(struct usb_serial_port *port)
+{
+	struct xr21v1412_private *priv = usb_get_serial_port_data(port);
+	struct usb_device *udev = port->serial->dev;
+	int block, fifo_enable, clock_divisor, table_index, char_fmt;
+	u8 div0, div1, div2;
+	u16 mask_rx, mask_tx;
+
+	block = xr21v1412_interface_num(port->serial) >> 1;
+
+	fifo_enable = (block == 0) ? FIFO_ENABLE_CHA : FIFO_ENABLE_CHB;
+
+	xr21v1412_xr_set_register(udev,
+				  index(fifo_enable, REG_BLOCK_UART_MGR),
+				  FIFO_ENABLE_TX);
+	xr21v1412_xr_set_register(udev, index(REG_UART_ENABLE, block), 0x3);
+	xr21v1412_xr_set_register(udev,
+				  index(fifo_enable, REG_BLOCK_UART_MGR),
+				  FIFO_ENABLE_TX | FIFO_ENABLE_RX);
+
+	clock_divisor = xr21v1412_get_clock_divisor(priv->baudrate);
+
+	div0 = REG_DIV0(clock_divisor);
+	div1 = REG_DIV1(clock_divisor);
+	div2 = REG_DIV2(clock_divisor);
+
+	xr21v1412_xr_set_register(udev, index(REG_UART_DIV0, block), div0);
+	xr21v1412_xr_set_register(udev, index(REG_UART_DIV1, block), div1);
+	xr21v1412_xr_set_register(udev, index(REG_UART_DIV2, block), div2);
+
+	table_index = xr21v1412_get_mask_table_idx(priv->baudrate,
+						   clock_divisor);
+
+	if (table_index > CLKM_TABLE_ENTRIES - 1)
+		table_index = CLKM_TABLE_ENTRIES - 1;
+
+	mask_tx = mask_lookup_table[table_index][CLKM_TX];
+	mask_rx = (clock_divisor & 1) ?
+			mask_lookup_table[table_index][CLKM_RX_ODD] :
+			mask_lookup_table[table_index][CLKM_RX_EVEN];
+
+	xr21v1412_xr_set_register(udev, index(REG_UART_TXCLOCK_MASK0, block),
+				  mask_tx & 0xff);
+	xr21v1412_xr_set_register(udev, index(REG_UART_TXCLOCK_MASK1, block),
+				  mask_tx >> 8);
+	xr21v1412_xr_set_register(udev, index(REG_UART_RXCLOCK_MASK0, block),
+				  mask_rx & 0xff);
+	xr21v1412_xr_set_register(udev, index(REG_UART_RXCLOCK_MASK1, block),
+				  mask_rx >> 8);
+
+	char_fmt = priv->data_bits;
+	char_fmt |= priv->parity << 4;
+	char_fmt |= (priv->stop_bits - 1) << 7;
+
+	xr21v1412_xr_set_register(udev, index(REG_UART_CHAR_FMT, block),
+				  char_fmt);
+}
+
+static int xr21v1412_port_probe(struct usb_serial_port *port)
+{
+	struct xr21v1412_private *priv;
+
+	if (!port->bulk_in_size || !port->bulk_out_size)
+		return -ENODEV;
+
+	priv = kzalloc(sizeof(struct xr21v1412_private), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->baudrate = DEFAULT_BAUDRATE;
+	priv->data_bits = DEFAULT_DATA_BITS;
+	priv->stop_bits = DEFAULT_STOP_BITS;
+	priv->parity = DEFAULT_PARITY;
+
+	usb_set_serial_port_data(port, priv);
+
+	xr21v1412_configure_port(port);
+
+	return 0;
+}
+
+static int xr21v1412_port_remove(struct usb_serial_port *port)
+{
+	struct xr21v1412_private *priv;
+
+	priv = usb_get_serial_port_data(port);
+	kfree(priv);
+
+	return 0;
+}
+
+static void xr21v1412_set_termios(struct tty_struct *tty,
+				  struct usb_serial_port *port,
+				  struct ktermios *old_termios)
+{
+	struct xr21v1412_private *priv = usb_get_serial_port_data(port);
+
+	/* Redundant changes may cause the chip to lose bytes */
+	if (old_termios && !tty_termios_hw_change(&tty->termios, old_termios))
+		return;
+
+	priv->baudrate = tty_get_baud_rate(tty);
+
+	switch (C_CSIZE(tty)) {
+	case CS7:
+		priv->data_bits = 7;
+		break;
+	case CS8:
+	default:
+		priv->data_bits = 8;
+		break;
+	}
+
+	if (C_PARENB(tty)) {
+		priv->parity = (C_PARODD(tty) == 0) ?
+			 PARITY_EVEN : PARITY_ODD;
+	} else {
+		priv->parity = PARITY_NONE;
+	}
+
+	priv->stop_bits = (C_CSTOPB(tty)) ? 2 : 1;
+
+	xr21v1412_configure_port(port);
+}
+
+static int xr21v1412_open(struct tty_struct *tty, struct usb_serial_port *port)
+{
+	int result;
+
+	result = usb_serial_generic_open(tty, port);
+	if (result) {
+		usb_kill_urb(port->interrupt_in_urb);
+		return result;
+	}
+
+	/* Setup termios */
+	if (tty)
+		xr21v1412_set_termios(tty, port, NULL);
+
+	return 0;
+}
+
+static void xr21v1412_close(struct usb_serial_port *port)
+{
+	usb_serial_generic_close(port);
+	usb_kill_urb(port->interrupt_in_urb);
+}
+
+static struct usb_serial_driver xr21v1412_device = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name =	"xr21v1412",
+	},
+	.id_table = id_table,
+	.num_ports = 1,
+	.open = xr21v1412_open,
+	.close = xr21v1412_close,
+	.set_termios = xr21v1412_set_termios,
+	.port_probe = xr21v1412_port_probe,
+	.port_remove = xr21v1412_port_remove,
+};
+
+static struct usb_serial_driver * const serial_drivers[] = {
+	&xr21v1412_device, NULL,
+};
+
+module_usb_serial_driver(serial_drivers, id_table);
+
+MODULE_DESCRIPTION("MaxLinear XR21V1412 USB to serial driver");
+MODULE_AUTHOR("Angelo Dureghello <angelo.dureghello@timesys.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

