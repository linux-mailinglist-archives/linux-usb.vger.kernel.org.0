Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8DD257437
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 09:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgHaHVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 03:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgHaHVf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 03:21:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471C6C061573
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 00:21:30 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c15so4800875wrs.11
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 00:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:date:user-agent:mime-version;
        bh=V0QDA2LF9Wto87E+ppn4aL/Wy/RYphM3G8hdy2RQoF0=;
        b=Ya4EKweK7fHvvmxZ69jxxjVD/5cwbuirrmorXVp69JzFI7Lrrwksy7108TAZI8QBji
         RYdSqrcmQ53IXTHUQqeJoSgbCYh4Od5VipjzXBoMpWDb2p1pUzoTjAtiFng0eiPiggKx
         bv1IspAVdzfl7/IQMAUHBPNqj9NpR1enUk2DWenPPEo8ZH2vCuIEhAmlH9ghquEvqW0L
         LPjFxFFwCf1YtrEe340FqveoNdJt+u/YpHDFjxAnevU4DSC1WWE5GVotUnbTwW1057Qw
         DcOc8zdmMKezhrcMSPXha/OmH1hT9YwVDtjsmQOZVhybuwPvlQuI/MgBLMCBOqUMbq02
         XApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:date:user-agent
         :mime-version;
        bh=V0QDA2LF9Wto87E+ppn4aL/Wy/RYphM3G8hdy2RQoF0=;
        b=QUaFPDWBOBs+xw09oqjcT0uuaUO5a49y/HKZ2cswwX8p0wlOYlK+m+ZS3CxBAC5RJp
         uoOSeWTUdVfRepiWnGlAJd/SMV5l32LksWCsLsoIksDmi9PQ+FjoQ9RBMbyQWlLnctoj
         lY6hveYbIzf1cjyPlqeHx19k/HSIXsxbZh2NGxPd+4pdIue+laZBGn0+Vl178X1x0uva
         lzmbbi/s4lOrN5/9LvXXnatcO1cZDes+Kmk7ibKLA7Mh+abuX9K64wVOLWtkIP/BWerW
         OoJ20NsTt6laQfmkkilX4ERhGR/QqarbKlHn8XnGc7hBx06RAU/KRUPCoAPgcHh56kGy
         N1pA==
X-Gm-Message-State: AOAM533+RSYLWE85gZ9Z9xUUZVwemBG9Iy7zDu+gZkeyQ2qqH26pSt6M
        zCBcX9ECY9qg0SOKzEThlIQ7CuT1ReOhIg==
X-Google-Smtp-Source: ABdhPJx2+W0cIOWwvOFi4Har4lWhz7eEu8v2qSFakt/JksKlnS+N7wXtPoRtdBBux1qC9o8UMTTtOA==
X-Received: by 2002:adf:e94a:: with SMTP id m10mr306726wrn.249.1598858489164;
        Mon, 31 Aug 2020 00:21:29 -0700 (PDT)
Received: from daniel-ThinkPad-X230 ([2a01:e35:1387:1640:4059:1936:4cf5:a56d])
        by smtp.gmail.com with ESMTPSA id g9sm11013701wrw.63.2020.08.31.00.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 00:21:28 -0700 (PDT)
Message-ID: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
X-Google-Original-Message-ID: <87blirb7rc.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie support.
Date:   Mon, 31 Aug 2020 09:21:27 +0200
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

   Whistler TRX serie radio scanners provide 2 USB subclass devices: one
usb mass storage and one serial device.
The problem is USB serial is unusable, as the cdc_acm fails with
error -22.
Enabling the support in the usb_simple_serial driver make it works.


Cheers.
---
Daniel


lsusb -v output:
Bus 003 Device 003: ID 2a59:0012 Whistler Whistler TRX-1e Scanner
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         8
  idVendor           0x2a59 
  idProduct          0x0012 
  bcdDevice            0.01
  iManufacturer           1 Whistler
  iProduct                2 Whistler TRX-1e Scanner
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0059
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          2 Whistler TRX-1e Scanner
    bmAttributes         0xc0
      Self Powered
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
        ** UNRECOGNIZED:  08 11 01 02 02 02 01 00
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1 
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               2
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)




From 7f47321863c9dd4827460d65e985633c16efbb0f Mon Sep 17 00:00:00 2001
From: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date: Thu, 27 Aug 2020 10:28:52 +0200
Subject: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie support.

Whistler's firmware CDC support seems incomplete or buggy, but usb-serial works.

Signed-off-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
---
 drivers/usb/class/cdc-acm.c            | 14 ++++++++++++++
 drivers/usb/serial/Kconfig             |  1 +
 drivers/usb/serial/usb-serial-simple.c | 10 ++++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 991786876dbb..12929f65bcfb 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1915,6 +1915,20 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = SEND_ZERO_PACKET,
 	},
 
+	/* Exclude Whistler radio scanners */
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0010, USB_CLASS_COMM), /* TRX-1  */
+	.driver_info = IGNORE_DEVICE,
+	},
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0011, USB_CLASS_COMM), /* TRX-2  */
+	.driver_info = IGNORE_DEVICE,
+	},
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0012, USB_CLASS_COMM), /* TRX-1e  */
+	.driver_info = IGNORE_DEVICE,
+	},
+ 	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0013, USB_CLASS_COMM), /* TRX-2e */
+	.driver_info = IGNORE_DEVICE,
+	},
+
 	/* control interfaces without any protocol set */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
 		USB_CDC_PROTO_NONE) },
diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
index 4007fa25a8ff..cd23e33c0ea4 100644
--- a/drivers/usb/serial/Kconfig
+++ b/drivers/usb/serial/Kconfig
@@ -71,6 +71,7 @@ config USB_SERIAL_SIMPLE
 		- ViVOtech ViVOpay USB device.
 		- Infineon Modem Flashloader USB interface
 		- ZIO Motherboard USB serial interface
+		- Whistler TRX radio scanners
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called usb-serial-simple.
diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index bd23a7cb1be2..af32a0fc9447 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -112,6 +112,14 @@ DEVICE(suunto, SUUNTO_IDS);
 	{ USB_DEVICE(0x908, 0x0004) }
 DEVICE(siemens_mpi, SIEMENS_IDS);
 
+/* Whistler radio scanners */
+#define WHISTLER_IDS()						\
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0010, USB_CLASS_COMM) }, /* TRX-1  */ \
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0011, USB_CLASS_COMM) }, /* TRX-2  */ \
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0012, USB_CLASS_COMM) }, /* TRX-1e */ \
+	{ USB_DEVICE_INTERFACE_CLASS(0x2a59, 0x0013, USB_CLASS_COMM) }  /* TRX-2e */
+DEVICE(whistler, WHISTLER_IDS);
+
 /* All of the above structures mushed into two lists */
 static struct usb_serial_driver * const serial_drivers[] = {
 	&carelink_device,
@@ -127,6 +135,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
 	&hp4x_device,
 	&suunto_device,
 	&siemens_mpi_device,
+	&whistler_device,
 	NULL
 };
 
@@ -144,6 +153,7 @@ static const struct usb_device_id id_table[] = {
 	HP4X_IDS(),
 	SUUNTO_IDS(),
 	SIEMENS_IDS(),
+	WHISTLER_IDS(),
 	{ },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.25.1




