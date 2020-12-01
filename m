Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E4A2C9EA9
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 11:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387820AbgLAKEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 05:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLAKEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 05:04:21 -0500
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2ED7C0613CF
        for <linux-usb@vger.kernel.org>; Tue,  1 Dec 2020 02:03:40 -0800 (PST)
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 0B1A3V5t032033
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 1 Dec 2020 11:03:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1606817011; bh=gr+jLvfP9SJDyLKoHWlFmdpB39dtWpymt4/EkD07LmI=;
        h=From:To:Cc:Subject:Date:Message-Id:From;
        b=gCxITsrfRWefaMoxX6pLEGgCQyR/LUPGNGNsbnVx09AE/7CVS2WMk3SybUjSrMI6/
         DbIv3tdY/q4ijWDo1QJfG5iJggeBdDSFtvERUCmZM8e22+4LdD5tAq/90IHnIp7+Z2
         AwK+aXNsUXJbjppzYqS0sPZCHZUAwhrDTP74BeUk=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@miraculix.mork.no>)
        id 1kk2VO-0009r8-UZ; Tue, 01 Dec 2020 11:03:30 +0100
From:   =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Sebastian Sjoholm <sebastian.sjoholm@gmail.com>,
        linux-stable@vger.kernel.org
Subject: [PATCH] USB: serial: option: fix Quectel BG96 matching
Date:   Tue,  1 Dec 2020 11:03:18 +0100
Message-Id: <20201201100318.37843-1-bjorn@mork.no>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a partial revert of commit 2bb70f0a4b23 ("USB: serial:
option: support dynamic Quectel USB compositions")

The Quectel BG96 is different from most other modern Quectel modems,
having serial functions with 3 endpoints using ff/ff/ff and ff/fe/ff
class/subclass/protocol. Including it in the change to accommodate
dynamic function mapping was incorrect.

Revert to interface number matching for the BG96, assuming static
layout of the RMNET function on interface 4. This restores support
for the serial functions on interfaces 2 and 3.

Full lsusb output for the BG96:

Bus 002 Device 003: ID 2c7c:0296
Device Descriptor:
 bLength                18
 bDescriptorType         1
 bcdUSB               2.00
 bDeviceClass            0 (Defined at Interface level)
 bDeviceSubClass         0
 bDeviceProtocol         0
 bMaxPacketSize0        64
 idVendor           0x2c7c
 idProduct          0x0296
 bcdDevice            0.00
 iManufacturer           3 Qualcomm, Incorporated
 iProduct                2 Qualcomm CDMA Technologies MSM
 iSerial                 4 d1098243
 bNumConfigurations      1
 Configuration Descriptor:
   bLength                 9
   bDescriptorType         2
   wTotalLength          145
   bNumInterfaces          5
   bConfigurationValue     1
   iConfiguration          1 Qualcomm Configuration
   bmAttributes         0xe0
     Self Powered
     Remote Wakeup
   MaxPower              500mA
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        0
     bAlternateSetting       0
     bNumEndpoints           2
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass    255 Vendor Specific Subclass
     bInterfaceProtocol    255 Vendor Specific Protocol
     iInterface              0
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
     bNumEndpoints           2
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass    255 Vendor Specific Subclass
     bInterfaceProtocol    255 Vendor Specific Protocol
     iInterface              0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x82  EP 2 IN
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
     bInterfaceSubClass    255 Vendor Specific Subclass
     bInterfaceProtocol    255 Vendor Specific Protocol
     iInterface              0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x83  EP 3 IN
       bmAttributes            3
         Transfer Type            Interrupt
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               5
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x84  EP 4 IN
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
     bInterfaceSubClass    254
     bInterfaceProtocol    255
     iInterface              0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x85  EP 5 IN
       bmAttributes            3
         Transfer Type            Interrupt
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               5
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x86  EP 6 IN
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
     bInterfaceSubClass    255 Vendor Specific Subclass
     bInterfaceProtocol    255 Vendor Specific Protocol
     iInterface              0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x87  EP 7 IN
       bmAttributes            3
         Transfer Type            Interrupt
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               5
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x88  EP 8 IN
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
 bDeviceClass            0 (Defined at Interface level)
 bDeviceSubClass         0
 bDeviceProtocol         0
 bMaxPacketSize0        64
 bNumConfigurations      1
Device Status:     0x0000
 (Bus Powered)

Cc: Sebastian Sjoholm <sebastian.sjoholm@gmail.com>
Cc: linux-stable@vger.kernel.org
Fixes: 2bb70f0a4b23 ("USB: serial: option: support dynamic Quectel USB compositions")
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 drivers/usb/serial/option.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 54ca85cc920d..241baba0317a 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1105,9 +1105,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG95, 0xff, 0xff, 0xff),
 	  .driver_info = NUMEP2 },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG95, 0xff, 0, 0) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_BG96, 0xff, 0xff, 0xff),
-	  .driver_info = NUMEP2 },
-	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_BG96, 0xff, 0, 0) },
+	{ USB_DEVICE(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_BG96),
+	  .driver_info = RSVD(4) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EP06, 0xff, 0xff, 0xff),
 	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) | RSVD(4) | NUMEP2 },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EP06, 0xff, 0, 0) },
-- 
2.29.2

