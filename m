Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1663550AB
	for <lists+linux-usb@lfdr.de>; Tue,  6 Apr 2021 12:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245069AbhDFKTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Apr 2021 06:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242771AbhDFKTH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Apr 2021 06:19:07 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98771C06174A;
        Tue,  6 Apr 2021 03:18:58 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id d10so5159445pgf.12;
        Tue, 06 Apr 2021 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qzq0bAfP85p3idkk6POcQXlrPA280RqdFgVGmSALFI=;
        b=EQCFgoSM5kTVlQelvE8xV6ySAzuV7jV12W8vBx2WWqDr/I9Vzr9SFhQQzIU2ldHlmk
         RGKnKCHHJ/7muAIQcOg/wmyQ4DtABuHAKBQzBFtiitBSI29sp5+cLT5Z4SNX4EjxbQBX
         y3ilBCiFovZMlrvpgNwalb3xxths7C2S94JA6pIAzApytW6Cie3sQ60vc3TzVXPTAs4v
         bbyuGGeLmhZTkmItCi6/2s9h80Y/rm5eoHTp8Z6VghcMYMT839Yh1v/gVowSWkTdg92D
         O2dpItqrM/XuSveKzoQ3aNHcp+sv6f3hm2svYlf7t0wcbAkuRSAL5ymzIwOoS+NdpP3Z
         kmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qzq0bAfP85p3idkk6POcQXlrPA280RqdFgVGmSALFI=;
        b=VJ68UeK8oOG/VMthp62nfVdgJa0xiwijf3J2AMxBEU9/ywKeakTKG9gFAY51299Bvq
         0mpuXuSQmBHgRpcNivl1HmMMBDrJFODgJgmD6bWstwmxrUjlk9DcfvK1258Rso0UJD0V
         KTIYjoXiw8E8x+CmPtei8X0HuFywmzANq1xS7WMeikz0siXIOaR1t8ePji77fF1ANlUu
         LScpmZZKr+nr3MoX8JkzNhKlNzr7mhZxYLS+qwLGw4EmUiqLs1G6K9HQwkH3LF5t01JH
         Fv9EFBovzu2W2bkft/V9y8QOAkurWcjGZPRz00nYolN2EY9aUdtsT4s8Mx4TjZ280izC
         yPTA==
X-Gm-Message-State: AOAM533xE4eNPs58rxtPgx5svsxrb86DPoiuTG656JgIBhDVMcjrZRUz
        vq4GKKYOggBo6SJ+FLOh/69jgTQaWBKE3PJO
X-Google-Smtp-Source: ABdhPJyGTOORa4/2d+U1ZsUa3msLYIHNyBP4wdCKmntgdiVNmYsNuvl4fQW6qKpFTmoURqpFBws+xA==
X-Received: by 2002:a65:47ca:: with SMTP id f10mr26826996pgs.206.1617704338005;
        Tue, 06 Apr 2021 03:18:58 -0700 (PDT)
Received: from localhost.localdomain ([171.255.116.3])
        by smtp.gmail.com with ESMTPSA id w17sm16956679pfu.29.2021.04.06.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:18:57 -0700 (PDT)
From:   Pho Tran <photranvan0712@gmail.com>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hung.Nguyen@silabs.com, Tung.Pham@silabs.com,
        Pho Tran <pho.tran@silabs.com>
Subject: [PATCH v8] USB: serial: cp210x: Add support for GPIOs on CP2108
Date:   Tue,  6 Apr 2021 17:18:50 +0700
Message-Id: <20210406101850.3111-1-photranvan0712@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pho Tran <pho.tran@silabs.com>

Similar to other CP210x devices, GPIO interfaces (gpiochip) should be
supported for CP2108.

CP2108 has 4 serial interfaces but only 1 set of GPIO pins are shared
to all of those interfaces. So, just need to initialize GPIOs of CP2108
with only one interface (I use interface 0). It means just only 1 gpiochip
device file will be created for CP2108.

CP2108 has 16 GPIOs, So data types of several variables need to be is u16
instead of u8(in struct cp210x_serial_private). This doesn't affect other
CP210x devices.

Because CP2108 has 16 GPIO pins, the parameter passed by cp210x functions
will be different from other CP210x devices. So need to check part number
of the device to use correct data format  before sending commands to
devices.

Like CP2104, CP2108 have GPIO pins with configurable options. Therefore,
should be mask all pins which are not in GPIO mode in cp2108_gpio_init()
function.

Signed-off-by: Pho Tran <pho.tran@silabs.com>
---

04/05/2021: Patch v7 Modified commit message follow Greg's comment.
04/05/2021: Patch v6 Fixed build warning reported by kernel test robot.
03/15/2021: Patch v5 Modified code according to comment of Johan:
	1. Unified the handling of CP2108 and other types and
	take care about endianness.
	2. Used suitable types data for variable.
	3. Fixed cp2108_gpio_init and add more detail on
	commit message and comment.
	4. Dropped some of the ones that don't add any value.
03/12/2021: Patch v4 used git send-mail instead of send patch by manual
follow the instructions of Johan Hovold <johan@kernel.org>.
03/05/2021: Patch v3 modified format and contents of changelog follow feedback
from Johan Hovold <johan@kernel.org>.
03/04/2021: Patch v2 modified format patch as comment from
Johan Hovold <johan@kernel.org>:
	1. Break commit message lines at 80 cols
	2. Use kernel u8 and u16 instead of the c99 ones.
03/01/2021: Initialed submission of patch "Make the CP210x driver work with
GPIOs of CP2108.".

 drivers/usb/serial/cp210x.c | 253 +++++++++++++++++++++++++++++++-----
 1 file changed, 219 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 7bec1e730b20..300e4b77c26c 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -245,9 +245,9 @@ struct cp210x_serial_private {
 #ifdef CONFIG_GPIOLIB
 	struct gpio_chip	gc;
 	bool			gpio_registered;
-	u8			gpio_pushpull;
-	u8			gpio_altfunc;
-	u8			gpio_input;
+	u16			gpio_pushpull;
+	u16			gpio_altfunc;
+	u16			gpio_input;
 #endif
 	u8			partnum;
 	speed_t			min_speed;
@@ -399,6 +399,18 @@ static struct usb_serial_driver * const serial_drivers[] = {
 #define CP210X_PARTNUM_CP2102N_QFN20	0x22
 #define CP210X_PARTNUM_UNKNOWN	0xFF
 
+/*
+ * CP2108 Define bit locations for EnhancedFxn_IFCx
+ * Refer to https://www.silabs.com/documents/public/application-notes/an978-cp210x-usb-to-uart-api-specification.pdf
+ * for more information.
+ */
+#define EF_IFC_GPIO_TXLED		0x01
+#define EF_IFC_GPIO_RXLED		0x02
+#define EF_IFC_GPIO_RS485		0x04
+#define EF_IFC_GPIO_RS485_LOGIC 0x08
+#define EF_IFC_GPIO_CLOCK		0x10
+#define EF_IFC_DYNAMIC_SUSPEND	0x40
+
 /* CP210X_GET_COMM_STATUS returns these 0x13 bytes */
 struct cp210x_comm_status {
 	__le32   ulErrors;
@@ -500,6 +512,45 @@ struct cp210x_single_port_config {
 	u8	device_cfg;
 } __packed;
 
+/*
+ * Quad Port Config definitions
+ * Refer to https://www.silabs.com/documents/public/application-notes/an978-cp210x-usb-to-uart-api-specification.pdf
+ * for more information.
+ * CP210X_VENDOR_SPECIFIC, CP210X_GET_PORTCONFIG call reads these 0x49 bytes
+ * on a CP2108 chip.
+ * CP2108 Quad Port State structure(used in Quad Port Config structure)
+ */
+struct cp210x_quad_port_state {
+	__le16 gpio_mode_PB0;
+	__le16 gpio_mode_PB1;
+	__le16 gpio_mode_PB2;
+	__le16 gpio_mode_PB3;
+	__le16 gpio_mode_PB4;
+
+
+	__le16 gpio_lowpower_PB0;
+	__le16 gpio_lowpower_PB1;
+	__le16 gpio_lowpower_PB2;
+	__le16 gpio_lowpower_PB3;
+	__le16 gpio_lowpower_PB4;
+
+	__le16 gpio_latch_PB0;
+	__le16 gpio_latch_PB1;
+	__le16 gpio_latch_PB2;
+	__le16 gpio_latch_PB3;
+	__le16 gpio_latch_PB4;
+};
+
+// Cp2108 Quad Port Config structure
+struct cp210x_quad_port_config {
+	struct cp210x_quad_port_state reset_state;
+	struct cp210x_quad_port_state suspend_state;
+	u8 ipdelay_IFC[4];
+	u8 enhancedfxn_IFC[4];
+	u8 enhancedfxn_device;
+	u8 extclkfreq[4];
+} __packed;
+
 /* GPIO modes */
 #define CP210X_SCI_GPIO_MODE_OFFSET	9
 #define CP210X_SCI_GPIO_MODE_MASK	GENMASK(11, 9)
@@ -510,6 +561,9 @@ struct cp210x_single_port_config {
 #define CP210X_GPIO_MODE_OFFSET		8
 #define CP210X_GPIO_MODE_MASK		GENMASK(11, 8)
 
+#define CP2108_GPIO_MODE_OFFSET		0
+#define CP2108_GPIO_MODE_MASK		GENMASK(15, 0)
+
 /* CP2105 port configuration values */
 #define CP2105_GPIO0_TXLED_MODE		BIT(0)
 #define CP2105_GPIO1_RXLED_MODE		BIT(1)
@@ -526,12 +580,31 @@ struct cp210x_single_port_config {
 #define CP210X_2NCONFIG_GPIO_RSTLATCH_IDX	587
 #define CP210X_2NCONFIG_GPIO_CONTROL_IDX	600
 
-/* CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these 0x2 bytes. */
-struct cp210x_gpio_write {
+/*
+ * CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these
+ * 0x04 bytes on CP2108.
+ */
+struct cp210x_16gpios_write {
+	__le16	mask;
+	__le16	state;
+};
+
+/*
+ * CP210X_VENDOR_SPECIFIC, CP210X_WRITE_LATCH call writes these
+ * 0x02 bytes on CP2102N, Cp2103, Cp2104 and CP2105.
+ */
+struct cp210x_8gpios_write {
 	u8	mask;
 	u8	state;
 };
 
+//Struct cp210x_gpio_write include devices have both of 8 gpios and 16 gpios.
+struct cp210x_gpio_write {
+	struct cp210x_8gpios_write cp210x_8gpios;
+	struct cp210x_16gpios_write cp210x_16gpios;
+};
+
+
 /*
  * Helper to get interface number when we only have struct usb_serial.
  */
@@ -1298,21 +1371,45 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 	u8 req_type = REQTYPE_DEVICE_TO_HOST;
 	int result;
-	u8 buf;
-
-	if (priv->partnum == CP210X_PARTNUM_CP2105)
-		req_type = REQTYPE_INTERFACE_TO_HOST;
+	u16 buf;
 
 	result = usb_autopm_get_interface(serial->interface);
 	if (result)
 		return result;
-
-	result = cp210x_read_vendor_block(serial, req_type,
-					  CP210X_READ_LATCH, &buf, sizeof(buf));
-	usb_autopm_put_interface(serial->interface);
+/*
+ * This function will be read latch value of gpio and storage to buf(16bit)
+ * where bit 0 is GPIO0, bit 1 is GPIO1, etc. Up to GPIOn where n is
+ * total number of GPIO pins the interface supports.
+ * Interfaces on CP2102N supports 7 GPIOs
+ * Interfaces on CP2103 amd CP2104 supports 4 GPIOs
+ * Enhanced interfaces on CP2105 support 3 GPIOs
+ * Standard interfaces on CP2105 support 4 GPIOs
+ * Interfaces on CP2108 supports 16 GPIOs
+ */
+	switch (priv->partnum) {
+	/*
+	 * Request type to Read_Latch of CP2105 and Cp2108
+	 * is 0xc1 <REQTYPE_INTERFACE_TO_HOST>
+	 */
+	case CP210X_PARTNUM_CP2108:
+		req_type = REQTYPE_INTERFACE_TO_HOST;
+		result = cp210x_read_vendor_block(serial, req_type,
+						CP210X_READ_LATCH, &buf, sizeof(__le16));
+		break;
+	case CP210X_PARTNUM_CP2105:
+		req_type = REQTYPE_INTERFACE_TO_HOST;
+		result = cp210x_read_vendor_block(serial, req_type,
+						CP210X_READ_LATCH, &buf, sizeof(u8));
+		break;
+	default:
+		result = cp210x_read_vendor_block(serial, req_type,
+						CP210X_READ_LATCH, &buf, sizeof(u8));
+		break;
+	}
 	if (result < 0)
 		return result;
-
+	buf = le16_to_cpu(buf);
+	usb_autopm_put_interface(serial->interface);
 	return !!(buf & BIT(gpio));
 }
 
@@ -1321,37 +1418,49 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	struct usb_serial *serial = gpiochip_get_data(gc);
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 	struct cp210x_gpio_write buf;
+	u16 wIndex;
 	int result;
 
-	if (value == 1)
-		buf.state = BIT(gpio);
-	else
-		buf.state = 0;
-
-	buf.mask = BIT(gpio);
+	if (value == 1) {
+		buf.cp210x_8gpios.state = BIT(gpio);
+		buf.cp210x_16gpios.state = cpu_to_le16(BIT(gpio));
+	} else {
+		buf.cp210x_8gpios.state = 0;
+		buf.cp210x_16gpios.state = 0;
+	}
+	buf.cp210x_8gpios.mask = BIT(gpio);
+	buf.cp210x_16gpios.mask = cpu_to_le16(BIT(gpio));
 
 	result = usb_autopm_get_interface(serial->interface);
 	if (result)
 		goto out;
 
-	if (priv->partnum == CP210X_PARTNUM_CP2105) {
+	switch (priv->partnum) {
+	case CP210X_PARTNUM_CP2108:
 		result = cp210x_write_vendor_block(serial,
-						   REQTYPE_HOST_TO_INTERFACE,
-						   CP210X_WRITE_LATCH, &buf,
-						   sizeof(buf));
-	} else {
-		u16 wIndex = buf.state << 8 | buf.mask;
-
+							REQTYPE_HOST_TO_INTERFACE,
+							CP210X_WRITE_LATCH, &buf.cp210x_16gpios,
+							sizeof(buf.cp210x_16gpios));
+		break;
+	case CP210X_PARTNUM_CP2105:
+		result = cp210x_write_vendor_block(serial,
+							REQTYPE_HOST_TO_INTERFACE,
+							CP210X_WRITE_LATCH, &buf.cp210x_8gpios,
+							sizeof(buf.cp210x_8gpios));
+		break;
+	default:
+		wIndex = buf.cp210x_8gpios.state << 8 | buf.cp210x_8gpios.mask;
 		result = usb_control_msg(serial->dev,
-					 usb_sndctrlpipe(serial->dev, 0),
-					 CP210X_VENDOR_SPECIFIC,
-					 REQTYPE_HOST_TO_DEVICE,
-					 CP210X_WRITE_LATCH,
-					 wIndex,
-					 NULL, 0, USB_CTRL_SET_TIMEOUT);
+							usb_sndctrlpipe(serial->dev, 0),
+							CP210X_VENDOR_SPECIFIC,
+							REQTYPE_HOST_TO_DEVICE,
+							CP210X_WRITE_LATCH,
+							wIndex,
+							NULL, 0, USB_CTRL_SET_TIMEOUT);
+		break;
 	}
-
 	usb_autopm_put_interface(serial->interface);
+
 out:
 	if (result < 0) {
 		dev_err(&serial->interface->dev, "failed to set GPIO value: %d\n",
@@ -1420,6 +1529,73 @@ static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
 	return -ENOTSUPP;
 }
 
+static int cp2108_gpio_init(struct usb_serial *serial)
+{
+	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+	struct cp210x_quad_port_config config;
+	u16 gpio_latch;
+	u16 temp;
+	int result;
+	u8 i;
+
+	result = cp210x_read_vendor_block(serial, REQTYPE_DEVICE_TO_HOST,
+					  CP210X_GET_PORTCONFIG, &config,
+					  sizeof(config));
+	if (result < 0)
+		return result;
+	priv->gc.ngpio = 16;
+	temp = le16_to_cpu(config.reset_state.gpio_mode_PB1);
+	priv->gpio_pushpull = (temp & CP2108_GPIO_MODE_MASK) >> CP2108_GPIO_MODE_OFFSET;
+	temp = le16_to_cpu(config.reset_state.gpio_latch_PB1);
+	gpio_latch = (temp & CP2108_GPIO_MODE_MASK) >> CP2108_GPIO_MODE_OFFSET;
+	/*
+	 * Mark all pins which are not in GPIO mode
+	 * Refer to table 9.1: GPIO Mode alternate Functions on CP2108 datasheet:
+	 * https://www.silabs.com/documents/public/data-sheets/cp2108-datasheet.pdf
+	 * Alternate Functions of GPIO0 to GPIO3 is determine by enhancedfxn_IFC[0]
+	 * and the same for other pins, enhancedfxn_IFC[1]: GPIO4 to GPIO7,
+	 * enhancedfxn_IFC[2]: GPIO8 to GPIO11, enhancedfxn_IFC[3]: GPIO12 to GPIO15.
+	 */
+	for (i = 0; i < 4; i++) {
+		switch (config.enhancedfxn_IFC[i]) {
+		case EF_IFC_GPIO_TXLED:
+			priv->gpio_altfunc |= BIT(i * 4);
+			break;
+		case EF_IFC_GPIO_RXLED:
+			priv->gpio_altfunc |= BIT((i * 4) + 1);
+			break;
+		case EF_IFC_GPIO_RS485_LOGIC:
+		case EF_IFC_GPIO_RS485:
+			priv->gpio_altfunc |= BIT((i * 4) + 2);
+			break;
+		case EF_IFC_GPIO_CLOCK:
+			priv->gpio_altfunc |= BIT((i * 4) + 3);
+			break;
+		case EF_IFC_DYNAMIC_SUSPEND:
+			priv->gpio_altfunc |= BIT(i * 4);
+			priv->gpio_altfunc |= BIT((i * 4) + 1);
+			priv->gpio_altfunc |= BIT((i * 4) + 2);
+			priv->gpio_altfunc |= BIT((i * 4) + 3);
+			break;
+		}
+	}
+	/*
+	 * Like CP2102N, CP2108 has also no strict input and output pin
+	 * modes.
+	 * Do the same input mode emulation as CP2102N.
+	 */
+	for (i = 0; i < priv->gc.ngpio; ++i) {
+		/*
+		 * Set direction to "input" iff pin is open-drain and reset
+		 * value is 1.
+		 */
+		if (!(priv->gpio_pushpull & BIT(i)) && (gpio_latch & BIT(i)))
+			priv->gpio_input |= BIT(i);
+	}
+
+	return 0;
+}
+
 /*
  * This function is for configuring GPIO using shared pins, where other signals
  * are made unavailable by configuring the use of GPIO. This is believed to be
@@ -1649,6 +1825,15 @@ static int cp210x_gpio_init(struct usb_serial *serial)
 	case CP210X_PARTNUM_CP2102N_QFN20:
 		result = cp2102n_gpioconf_init(serial);
 		break;
+	case CP210X_PARTNUM_CP2108:
+		/*
+		 * The GPIOs are not tied to any specific port so onlu register
+		 * once for interface 0.
+		 */
+		if (cp210x_interface_num(serial) != 0)
+			return 0;
+		result = cp2108_gpio_init(serial);
+		break;
 	default:
 		return 0;
 	}
-- 
2.17.1

