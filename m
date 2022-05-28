Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E96536B66
	for <lists+linux-usb@lfdr.de>; Sat, 28 May 2022 09:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiE1Hg7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 May 2022 03:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353398AbiE1He7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 May 2022 03:34:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30612AE1F
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 00:34:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h11so7795914eda.8
        for <linux-usb@vger.kernel.org>; Sat, 28 May 2022 00:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T6vDHE2qN5a5RkYmUCjcpGfLTDEN3qOo5FfwBV8UOvo=;
        b=bAs/gVizW5blFZ5JLRlfdPn+/SRwCgqjf1gybutXGpr+xQ5Rpln2UEQ3vsBtVpegIV
         ddWvEab1bqV/VxRbQLk0xRHiwH+1RS9iwqgwmYC+Eh33zvZhsrgnYQYl9fuduM9kDlhm
         a3jHamIKfrOBFMfbCMc7cOvYRE6b3wZEmRRzqdLGpXYUA6BP8wMB68ns7ZfZDjTXBYLz
         mDz0HIGqfboOzzhP3aTHzXxDwYhoZNknqnFC2zYh0kqTQTn8ECmgZOYc7wtfd+EhPptO
         Lb7dywtojY1eqc7RjiJnLMNEXSBnl7ttEJomNdNeRkp9beNiR3iDSYzhxFHLmdCj/niU
         rdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T6vDHE2qN5a5RkYmUCjcpGfLTDEN3qOo5FfwBV8UOvo=;
        b=VhAVTBARVYDp5Tw8FKgohBeCxBFjseAyJmOCaqZgn16XKVKqjlaRwldxkGK5Y/vcMK
         i+dNMTpfq3utUNc/LGE1uHNbILrT7KhGdR1fPgvCwaYqhr99LVlW+JCUNsWMyyXQezYb
         2ItTNuduxICuGJ7j/EqxMJwynwhVk4RLA0R3LRfBwoN5xO0GdbjTypdhGNGLo1Tn/6tl
         KvVf1PTfJDB1zNqqw4+2TlZ+bEijWBoXrs/5R/OHzuX/dsfz7+xrQ/YoE11E4YCp12nK
         xGRI14ZFlEz7ebmOONSK2sCsOyjfO5rQf4SUPm9HjkDQqHUe2M84DCkYKOee0bXY2C8K
         S+xw==
X-Gm-Message-State: AOAM530D8Rt/HB9XXJ7pCIJjrozflxHm8spKsJN0tgkKv4ARJ78MppQF
        mV+7f3LDJeZ89TZaIPRZ/mk=
X-Google-Smtp-Source: ABdhPJwZmKwUhDx2YDSudGCz7PYsD8IsR/Y8XeEdkiTv8g05zA+YXdSAXOdJKIpDFMvMB9LZYBa45Q==
X-Received: by 2002:a05:6402:34c5:b0:42b:dd5:ef97 with SMTP id w5-20020a05640234c500b0042b0dd5ef97mr42801939edc.274.1653723292206;
        Sat, 28 May 2022 00:34:52 -0700 (PDT)
Received: from lenny.home-life.hub ([91.254.5.81])
        by smtp.gmail.com with ESMTPSA id n25-20020a1709062bd900b006febc1e9fc8sm2147368ejg.47.2022.05.28.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 00:34:51 -0700 (PDT)
From:   Carlo Lobrano <c.lobrano@gmail.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Carlo Lobrano <c.lobrano@gmail.com>
Subject: [PATCH] usb: serial: option Add Telit LN910Cx 0x1250 composition
Date:   Sat, 28 May 2022 09:34:45 +0200
Message-Id: <20220528073445.50066-1-c.lobrano@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Telit LN910Cx 0x1250 composition

0x1250: rmnet, tty, tty, tty, tty

Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
---

Hello,

here is the lsusb output, thanks.

Bus 001 Device 002: ID 1bc7:1250 Telit Wireless Solutions LE910C1-EU
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x1bc7 Telit Wireless Solutions
  idProduct          0x1250 
  bcdDevice            3.18
  iManufacturer           1 Android
  iProduct                2 LE910C1-EU
  iSerial                 3 0123456789ABCDEF
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00eb
    bNumInterfaces          5
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      ** UNRECOGNIZED:  05 24 00 10 01
      ** UNRECOGNIZED:  05 24 01 00 00
      ** UNRECOGNIZED:  04 24 02 02
      ** UNRECOGNIZED:  05 24 06 00 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x8a  EP 10 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               9
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x05  EP 5 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 152ad882657d..a0bfc9a187d8 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1255,6 +1255,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1203, 0xff),	/* Telit LE910Cx (RNDIS) */
 	  .driver_info = NCTRL(2) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),	/* Telit LE910Cx (rmnet) */
+	  .driver_info = NCTRL(0) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1204, 0xff),	/* Telit LE910Cx (MBIM) */
 	  .driver_info = NCTRL(0) | RSVD(1) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG4),
-- 
2.32.0

