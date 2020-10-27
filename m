Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4699529A7BE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 10:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406277AbgJ0JZa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 05:25:30 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37626 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404542AbgJ0JZa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 05:25:30 -0400
Received: by mail-lj1-f194.google.com with SMTP id i2so947675ljg.4;
        Tue, 27 Oct 2020 02:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qHVGmQPbYqRAfNgERw/fejM3Snp6cPTLGfdKk774Xg=;
        b=AY+3SBInBXIGryRwnWw99Cqv8/wMTlsUe1iv9dnmMWi8xUqhF+8HGQJUHsbiHa703/
         C/7UPMRVWkvDdDPzt8yYoP1kBOLlhQk/Gk/QhQsjC+9dIKpRjcHNPH/LJ7ahNo3/laRC
         eyiVd2EQ+hGkmJYsPkWGOw/CQdOVMBXhhE1pamfWfAtuSGnxp3OAOEN5Zk7t+Cdz2Co9
         +7pZNZkR5vfaKWCuvvAvjW0LtnI/pghGNOHD2kPO4tl7bfCkFxUl4Luxqnjkb9MtdZpi
         Y+i2qUTWmuQFeD0eP53aBXFjjTazueoVc7rYFELWpL8yruqbToXPcaCY+Uq4uu63UA3P
         GeFA==
X-Gm-Message-State: AOAM5314vhm8PXkUp7ewGJmFyhXP5z4vcT4wEhnbisHz3La6EV97zxF9
        Y8B9vJiDAJk6og4C03LEq+7vVIwqs+e0qQ==
X-Google-Smtp-Source: ABdhPJxxLo2ZEbFtgQz90Ooosq+3QP+Ft6F84FJPBpw1NBsrUwQo2T68TnfhlU4+PENh6/EILqkOfg==
X-Received: by 2002:a2e:9847:: with SMTP id e7mr693476ljj.46.1603790724422;
        Tue, 27 Oct 2020 02:25:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id b21sm110354lfg.309.2020.10.27.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 02:25:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kXLEI-0002oN-G8; Tue, 27 Oct 2020 10:25:23 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Ahmed S . Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 11/14] USB: serial: keyspan_pda: clean up xircom/entrega support
Date:   Tue, 27 Oct 2020 10:25:02 +0100
Message-Id: <20201027092502.10761-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027080912.GA4085@localhost>
References: <20201027080912.GA4085@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the separate Kconfig symbol for Xircom / Entrega and always include
support in the keyspan_pda driver.

Note that all configs that enabled CONFIG_USB_SERIAL_XIRCOM also enable
CONFIG_USB_SERIAL_KEYSPAN_PDA.

Signed-off-by: Johan Hovold <johan@kernel.org>
---

v2
 - update the defconfigs (Sebastian)


 arch/arm/configs/badge4_defconfig     |  1 -
 arch/arm/configs/corgi_defconfig      |  1 -
 arch/arm/configs/pxa_defconfig        |  1 -
 arch/arm/configs/spitz_defconfig      |  1 -
 arch/mips/configs/mtx1_defconfig      |  1 -
 arch/mips/configs/rm200_defconfig     |  1 -
 arch/powerpc/configs/g5_defconfig     |  1 -
 arch/powerpc/configs/ppc6xx_defconfig |  1 -
 drivers/usb/serial/Kconfig            | 19 ++------
 drivers/usb/serial/Makefile           |  1 -
 drivers/usb/serial/keyspan_pda.c      | 68 ++++-----------------------
 11 files changed, 13 insertions(+), 83 deletions(-)

diff --git a/arch/arm/configs/badge4_defconfig b/arch/arm/configs/badge4_defconfig
index ef484c4cfd1a..d9119da65f48 100644
--- a/arch/arm/configs/badge4_defconfig
+++ b/arch/arm/configs/badge4_defconfig
@@ -89,7 +89,6 @@ CONFIG_USB_SERIAL_KEYSPAN=m
 CONFIG_USB_SERIAL_MCT_U232=m
 CONFIG_USB_SERIAL_PL2303=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_EXT2_FS=m
 CONFIG_EXT3_FS=m
diff --git a/arch/arm/configs/corgi_defconfig b/arch/arm/configs/corgi_defconfig
index 4fec2ec379ad..911e880f06ed 100644
--- a/arch/arm/configs/corgi_defconfig
+++ b/arch/arm/configs/corgi_defconfig
@@ -191,7 +191,6 @@ CONFIG_USB_SERIAL_PL2303=m
 CONFIG_USB_SERIAL_SAFE=m
 CONFIG_USB_SERIAL_TI=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_EMI62=m
 CONFIG_USB_EMI26=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index d7b9eaf4783c..8654ece13004 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -574,7 +574,6 @@ CONFIG_USB_SERIAL_PL2303=m
 CONFIG_USB_SERIAL_SAFE=m
 CONFIG_USB_SERIAL_TI=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_EMI62=m
 CONFIG_USB_EMI26=m
diff --git a/arch/arm/configs/spitz_defconfig b/arch/arm/configs/spitz_defconfig
index a1cdbfa064c5..8b2c14424927 100644
--- a/arch/arm/configs/spitz_defconfig
+++ b/arch/arm/configs/spitz_defconfig
@@ -185,7 +185,6 @@ CONFIG_USB_SERIAL_PL2303=m
 CONFIG_USB_SERIAL_SAFE=m
 CONFIG_USB_SERIAL_TI=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_EMI62=m
 CONFIG_USB_EMI26=m
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index 914af125a7fa..9750bcc38f05 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -565,7 +565,6 @@ CONFIG_USB_SERIAL_SAFE=m
 CONFIG_USB_SERIAL_SIERRAWIRELESS=m
 CONFIG_USB_SERIAL_TI=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_EMI62=m
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index 30d7c3db884e..3dc2da2bee0d 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -311,7 +311,6 @@ CONFIG_USB_SERIAL_PL2303=m
 CONFIG_USB_SERIAL_SAFE=m
 CONFIG_USB_SERIAL_SAFE_PADDED=y
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_LEGOTOWER=m
 CONFIG_USB_LCD=m
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index 1c674c4c1d86..1de0dbf6cbba 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -194,7 +194,6 @@ CONFIG_USB_SERIAL_SAFE=m
 CONFIG_USB_SERIAL_SAFE_PADDED=y
 CONFIG_USB_SERIAL_TI=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_APPLEDISPLAY=m
 CONFIG_EXT2_FS=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 66e9a0fd64ff..ac92cbe1f581 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -911,7 +911,6 @@ CONFIG_USB_SERIAL_SAFE_PADDED=y
 CONFIG_USB_SERIAL_SIERRAWIRELESS=m
 CONFIG_USB_SERIAL_TI=m
 CONFIG_USB_SERIAL_CYBERJACK=m
-CONFIG_USB_SERIAL_XIRCOM=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_SERIAL_OMNINET=m
 CONFIG_USB_SERIAL_DEBUG=m
diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
index 4007fa25a8ff..a21ff5ab6df9 100644
--- a/drivers/usb/serial/Kconfig
+++ b/drivers/usb/serial/Kconfig
@@ -298,12 +298,12 @@ config USB_SERIAL_IUU
 	  module will be called iuu_phoenix.o
 
 config USB_SERIAL_KEYSPAN_PDA
-	tristate "USB Keyspan PDA Single Port Serial Driver"
+	tristate "USB Keyspan PDA / Xircom Single Port Serial Driver"
 	select USB_EZUSB_FX2
 	help
-	  Say Y here if you want to use a Keyspan PDA single port USB to
-	  serial converter device.  This driver makes use of firmware
-	  developed from scratch by Brian Warner.
+	  Say Y here if you want to use a Keyspan PDA, Xircom or Entrega single
+	  port USB to serial converter device. This driver makes use of
+	  firmware developed from scratch by Brian Warner.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called keyspan_pda.
@@ -538,17 +538,6 @@ config USB_SERIAL_CYBERJACK
 
 	  If unsure, say N.
 
-config USB_SERIAL_XIRCOM
-	tristate "USB Xircom / Entrega Single Port Serial Driver"
-	select USB_EZUSB_FX2
-	help
-	  Say Y here if you want to use a Xircom or Entrega single port USB to
-	  serial converter device.  This driver makes use of firmware
-	  developed from scratch by Brian Warner.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called keyspan_pda.
-
 config USB_SERIAL_WWAN
 	tristate
 
diff --git a/drivers/usb/serial/Makefile b/drivers/usb/serial/Makefile
index 2d491e434f11..50c53aed787a 100644
--- a/drivers/usb/serial/Makefile
+++ b/drivers/usb/serial/Makefile
@@ -61,5 +61,4 @@ obj-$(CONFIG_USB_SERIAL_UPD78F0730)		+= upd78f0730.o
 obj-$(CONFIG_USB_SERIAL_VISOR)			+= visor.o
 obj-$(CONFIG_USB_SERIAL_WISHBONE)		+= wishbone-serial.o
 obj-$(CONFIG_USB_SERIAL_WHITEHEAT)		+= whiteheat.o
-obj-$(CONFIG_USB_SERIAL_XIRCOM)			+= keyspan_pda.o
 obj-$(CONFIG_USB_SERIAL_XSENS_MT)		+= xsens_mt.o
diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index aa19dd181e42..f102dbf83492 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -26,18 +26,6 @@
 #include <linux/usb/serial.h>
 #include <linux/usb/ezusb.h>
 
-/* make a simple define to handle if we are compiling keyspan_pda or xircom support */
-#if IS_ENABLED(CONFIG_USB_SERIAL_KEYSPAN_PDA)
-	#define KEYSPAN
-#else
-	#undef KEYSPAN
-#endif
-#if IS_ENABLED(CONFIG_USB_SERIAL_XIRCOM)
-	#define XIRCOM
-#else
-	#undef XIRCOM
-#endif
-
 #define DRIVER_AUTHOR "Brian Warner <warner@lothar.com>, Johan Hovold <johan@kernel.org>"
 #define DRIVER_DESC "USB Keyspan PDA Converter driver"
 
@@ -64,18 +52,13 @@ static int keyspan_pda_write_start(struct usb_serial_port *port);
 #define ENTREGA_FAKE_ID			0x8093
 
 static const struct usb_device_id id_table_combined[] = {
-#ifdef KEYSPAN
 	{ USB_DEVICE(KEYSPAN_VENDOR_ID, KEYSPAN_PDA_FAKE_ID) },
-#endif
-#ifdef XIRCOM
 	{ USB_DEVICE(XIRCOM_VENDOR_ID, XIRCOM_FAKE_ID) },
 	{ USB_DEVICE(XIRCOM_VENDOR_ID, XIRCOM_FAKE_ID_2) },
 	{ USB_DEVICE(ENTREGA_VENDOR_ID, ENTREGA_FAKE_ID) },
-#endif
 	{ USB_DEVICE(KEYSPAN_VENDOR_ID, KEYSPAN_PDA_ID) },
 	{ }						/* Terminating entry */
 };
-
 MODULE_DEVICE_TABLE(usb, id_table_combined);
 
 static const struct usb_device_id id_table_std[] = {
@@ -83,21 +66,13 @@ static const struct usb_device_id id_table_std[] = {
 	{ }						/* Terminating entry */
 };
 
-#ifdef KEYSPAN
 static const struct usb_device_id id_table_fake[] = {
 	{ USB_DEVICE(KEYSPAN_VENDOR_ID, KEYSPAN_PDA_FAKE_ID) },
-	{ }						/* Terminating entry */
-};
-#endif
-
-#ifdef XIRCOM
-static const struct usb_device_id id_table_fake_xircom[] = {
 	{ USB_DEVICE(XIRCOM_VENDOR_ID, XIRCOM_FAKE_ID) },
 	{ USB_DEVICE(XIRCOM_VENDOR_ID, XIRCOM_FAKE_ID_2) },
 	{ USB_DEVICE(ENTREGA_VENDOR_ID, ENTREGA_FAKE_ID) },
-	{ }
+	{ }						/* Terminating entry */
 };
-#endif
 
 static int keyspan_pda_get_write_room(struct keyspan_pda_private *priv)
 {
@@ -647,22 +622,21 @@ static void keyspan_pda_close(struct usb_serial_port *port)
 /* download the firmware to a "fake" device (pre-renumeration) */
 static int keyspan_pda_fake_startup(struct usb_serial *serial)
 {
+	unsigned int vid = le16_to_cpu(serial->dev->descriptor.idVendor);
 	const char *fw_name;
 
 	/* download the firmware here ... */
 	ezusb_fx1_set_reset(serial->dev, 1);
 
-	if (0) { ; }
-#ifdef KEYSPAN
-	else if (le16_to_cpu(serial->dev->descriptor.idVendor) == KEYSPAN_VENDOR_ID)
+	switch (vid) {
+	case KEYSPAN_VENDOR_ID:
 		fw_name = "keyspan_pda/keyspan_pda.fw";
-#endif
-#ifdef XIRCOM
-	else if ((le16_to_cpu(serial->dev->descriptor.idVendor) == XIRCOM_VENDOR_ID) ||
-		 (le16_to_cpu(serial->dev->descriptor.idVendor) == ENTREGA_VENDOR_ID))
+		break;
+	case XIRCOM_VENDOR_ID:
+	case ENTREGA_VENDOR_ID:
 		fw_name = "keyspan_pda/xircom_pgs.fw";
-#endif
-	else {
+		break;
+	default:
 		dev_err(&serial->dev->dev, "%s: unknown vendor, aborting.\n",
 			__func__);
 		return -ENODEV;
@@ -681,12 +655,8 @@ static int keyspan_pda_fake_startup(struct usb_serial *serial)
 	return 1;
 }
 
-#ifdef KEYSPAN
 MODULE_FIRMWARE("keyspan_pda/keyspan_pda.fw");
-#endif
-#ifdef XIRCOM
 MODULE_FIRMWARE("keyspan_pda/xircom_pgs.fw");
-#endif
 
 static int keyspan_pda_port_probe(struct usb_serial_port *port)
 {
@@ -716,7 +686,6 @@ static int keyspan_pda_port_remove(struct usb_serial_port *port)
 	return 0;
 }
 
-#ifdef KEYSPAN
 static struct usb_serial_driver keyspan_pda_fake_device = {
 	.driver = {
 		.owner =	THIS_MODULE,
@@ -727,20 +696,6 @@ static struct usb_serial_driver keyspan_pda_fake_device = {
 	.num_ports =		1,
 	.attach =		keyspan_pda_fake_startup,
 };
-#endif
-
-#ifdef XIRCOM
-static struct usb_serial_driver xircom_pgs_fake_device = {
-	.driver = {
-		.owner =	THIS_MODULE,
-		.name =		"xircom_no_firm",
-	},
-	.description =		"Xircom / Entrega PGS - (prerenumeration)",
-	.id_table =		id_table_fake_xircom,
-	.num_ports =		1,
-	.attach =		keyspan_pda_fake_startup,
-};
-#endif
 
 static struct usb_serial_driver keyspan_pda_device = {
 	.driver = {
@@ -770,12 +725,7 @@ static struct usb_serial_driver keyspan_pda_device = {
 
 static struct usb_serial_driver * const serial_drivers[] = {
 	&keyspan_pda_device,
-#ifdef KEYSPAN
 	&keyspan_pda_fake_device,
-#endif
-#ifdef XIRCOM
-	&xircom_pgs_fake_device,
-#endif
 	NULL
 };
 
-- 
2.26.2

