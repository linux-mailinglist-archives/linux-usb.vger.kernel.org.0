Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48EA2178EB7
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 11:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387751AbgCDKnl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 05:43:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36205 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387396AbgCDKnl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Mar 2020 05:43:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id j16so1785085wrt.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2020 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cOPZZa2YeYj4bRs6Ipe06Uttlzd0Ipezkhv8/7vAJ3Y=;
        b=H2YdxMEonM48/H90ulP0bKnW4mf6ll2D/7MShaXQ0JUEexEseL5SRavAOB6kvcDxyX
         ayjDNPNuoLKP32a+o13rCE+8zgEA8rTDxq2F2N1mwYbQh6vmTQJK0IDsQVDn3Bek07fF
         UMnXcqYXkJaNyGPn0deadzKZCd2p/e2JKv/ILu8ZlzLDqWfFwhyeQdFyXY5uaUKF2Ufd
         aTTJosQ5irgVG9BvqHC75J71Dtsw22+eFG5aKT3nEa7na54Lgr2kr9rwiASNFm3pMRAv
         DAez0e+bGO5Hq0SFWJSsbNG5RBYa83K71pjnJi0aax1Xuu/fVD6Fhh8Dx558WolEg7Ns
         31/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cOPZZa2YeYj4bRs6Ipe06Uttlzd0Ipezkhv8/7vAJ3Y=;
        b=A12/kun1NX6Msvjzt8S7amUJv5QgUVjF6SRq6itiGos/bmLiG5xu6Fo82rldj6j891
         4sTtC6YRjQTNpMLqVZNKsjfCKCMzr/tVa6MhNkSRHuXid/hpACIpI1JHYIm7zPFul7Mm
         oYErZIQmXdztdhPiUy+MGtrTjPK2mIdMnUKoUUOAIsgkR6AqR70p/PIl7Q6Lr5vFtGpi
         pdnQnKASOSZyPCFLkyA1/io0igPDmP5YgKHvav/tMYGIM26LOjUgvHxDbfHx2SeAFhCd
         Os3VVR8Wpem3Vz2J+I7N8MM2U+tMDDKj5thx1R5cq+xNsQr4gmNlO536rZ4pTPPxyij3
         kLvg==
X-Gm-Message-State: ANhLgQ2AlCLElXV1r+g1Hc5JtRmtK5MBxAiWMNRClVlL20JwVZYrEAPS
        iscddDPfXmL0fvGU2E6W27g=
X-Google-Smtp-Source: ADFU+vtoYhfV/w4G2UKCqzsbMvIP9XslEixwtR7FHJH6PFjLf6rl9s+WmeopX54TdfIPkN95A28neA==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr3585686wri.95.1583318618656;
        Wed, 04 Mar 2020 02:43:38 -0800 (PST)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id b14sm29155250wrn.75.2020.03.04.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 02:43:38 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] usb: serial: option: add ME910G1 ECM composition 0x110b
Date:   Wed,  4 Mar 2020 11:43:10 +0100
Message-Id: <20200304104310.2938-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add ME910G1 ECM composition 0x110b: tty, tty, tty, ecm

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Hi Johan,

following the lsusb output, thanks.

Bus 003 Device 005: ID 1bc7:110b Telit Wireless Solutions
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 ?
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1bc7 Telit Wireless Solutions
  idProduct          0x110b 
  bcdDevice            0.00
  iManufacturer           4 Telit
  iProduct                3 Telit ME910
  iSerial                 5 d15932d6
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          171
    bNumInterfaces          5
    bConfigurationValue     1
    iConfiguration          2 Telit Configuration
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
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               5
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
      bInterfaceSubClass    254 
      bInterfaceProtocol    255 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               5
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
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         3
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass       0 
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass      6 Ethernet Networking
      bInterfaceProtocol      0 
      iInterface              0 
      CDC Header:
        bcdCDC               1.10
      CDC Ethernet:
        iMacAddress                      1 00A0C6932D60
        bmEthernetStatistics    0x00000000
        wMaxSegmentSize              16384
        wNumberMCFilters            0x0001
        bNumberPowerFilters              0
      CDC Union:
        bMasterInterface        3
        bSlaveInterface         4 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               5
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0 Unused
      bInterfaceProtocol      0 
      iInterface              0 
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
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 ?
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 084cc2fff3ae..0b5dcf973d94 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1183,6 +1183,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110a, 0xff),	/* Telit ME910G1 */
 	  .driver_info = NCTRL(0) | RSVD(3) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110b, 0xff),	/* Telit ME910G1 (ECM) */
+	  .driver_info = NCTRL(0) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG4),
-- 
2.17.1

