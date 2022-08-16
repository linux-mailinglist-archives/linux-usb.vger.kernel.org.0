Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A864459644C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 23:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237423AbiHPVNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 17:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233835AbiHPVNV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 17:13:21 -0400
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C456852E63;
        Tue, 16 Aug 2022 14:13:18 -0700 (PDT)
Received: from debian-tgbt.home (unknown [IPv6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341])
        (Authenticated sender: thierry.guibert@free.fr)
        by smtp2-g21.free.fr (Postfix) with ESMTPSA id 960EA2003B4;
        Tue, 16 Aug 2022 23:13:11 +0200 (CEST)
From:   Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
To:     gregkh@linuxfoundation.org, oneukum@suse.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Subject: [PATCH] CDC-ACM : Add Icom PMR F3400 support (0c26:0020)
Date:   Tue, 16 Aug 2022 23:12:50 +0200
Message-Id: <20220816211250.20985-1-thierry.guibert@croix-rouge.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Supports for ICOM F3400 and ICOM F4400 PMR radios in CDC-ACM driver
enabling the AT serial port.
The Vendor Id is 0x0C26
The Product ID is 0x0020

Output of lsusb :
Bus 001 Device 009: ID 0c26:0020 Prolific Technology Inc. ICOM Radio
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x0c26 Prolific Technology Inc.
  idProduct          0x0020
  bcdDevice            0.00
  iManufacturer           1 ICOM Inc.
  iProduct                2 ICOM Radio
  iSerial                 3 *obfuscated*
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0030
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      2 Abstract (modem)
      bInterfaceProtocol      1 AT-commands (v.25ter)
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
        bInterval              12
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0
      bInterfaceProtocol      0
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

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
---
 drivers/usb/class/cdc-acm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 9b9aea24d58c..091fcfac3717 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1813,6 +1813,10 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x0ca6, 0xa050), /* Castles VEGA3000 */
 	.driver_info = NO_UNION_NORMAL, /* reports zero length descriptor */
 	},
+	{ USB_DEVICE(0x0c26, 0x0020), /* Icom ICF3400 Serie */
+	.driver_info = NO_UNION_NORMAL, /* reports zero length descriptor */
+	},
+
 
 	{ USB_DEVICE(0x2912, 0x0001), /* ATOL FPrint */
 	.driver_info = CLEAR_HALT_CONDITIONS,
-- 
2.37.2

