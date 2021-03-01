Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D00329129
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 21:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240988AbhCAUUX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 15:20:23 -0500
Received: from xaiki.net ([108.166.209.89]:50270 "EHLO mail.xaiki.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242958AbhCAURN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 15:17:13 -0500
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.xaiki.net (Postfix) with ESMTPA id 91C06F28C;
        Mon,  1 Mar 2021 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=evilgiggle.com;
        s=dkim; t=1614629789;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLOw4Q3Qa7JTB1sLEwcin/l5p95uru24aOeG1MxV2Ws=;
        b=pOQWaEH3Rc3R7cV5QEqZG+GGGTbnHl0z7TPgyRaNmToBNCvkXwMf6vkdJrvv5QcdrKDI3o
        6rmRzL0WxanbcjNcepqelNT3zbSNhW97re8RDbEDRKVwQ0BLlZUjlqNS7Qh6DCIXKEMhZr
        Jol6t8BR7bxZ3jC5N4dHQ4aFTas4qDJXj221Ts/Lmiy6NY8imTJbz5QQxG6bTUUu48yrpz
        WoMZk8KOIqGl8GMp64nC2LjI3o1UzTiniDCp/frjCSR6R6vKXZjCXa371lA1dw8x4Au2Xj
        TIfVppOR6RIoJpIh0CwJFPb/yz5G+jw7s77BL/qOzeXGrR1uJnb7i1XOI48FWg==
From:   Niv Sardi <xaiki@evilgiggle.com>
To:     linux-usb@vger.kernel.org
Cc:     Niv Sardi <xaiki@evilgiggle.com>
Subject: [PATCH v3] USB: serial: ch341: add new Product ID
Date:   Mon,  1 Mar 2021 17:16:12 -0300
Message-Id: <20210301201612.10867-2-xaiki@evilgiggle.com>
In-Reply-To: <20210301201612.10867-1-xaiki@evilgiggle.com>
References: <20210301201612.10867-1-xaiki@evilgiggle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.xaiki.net;
        auth=pass smtp.auth=x@btn.sh smtp.mailfrom=xaiki@evilgiggle.com
X-Spam-Level: ****
X-Spamd-Bar: ++++
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add PID for CH340 that's found on cheap programmers.

The driver works flawlessly as soon as the new PID (0x9986) is added to it.
These look like ANU232MI but ship with a ch341 inside. They have no special
identifiers (mine only has the string "DB9D20130716" printed on the PCB and
nothing identifiable on the packaging. The merchant i bought it from 
doesn't sell these anymore).

the lsusb -v output is:
Bus 001 Device 009: ID 9986:7523  
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         8
  idVendor           0x9986 
  idProduct          0x7523 
  bcdDevice            2.54
  iManufacturer           0 
  iProduct                0 
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower               96mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1 
      bInterfaceProtocol      2 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1

Signed-off-by: Niv Sardi <xaiki@evilgiggle.com>
---
 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 28deaaec581f..f26861246f65 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -86,6 +86,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
 	{ USB_DEVICE(0x4348, 0x5523) },
+	{ USB_DEVICE(0x9986, 0x7523) },
 	{ },
 };
 MODULE_DEVICE_TABLE(usb, id_table);
-- 
2.30.1

