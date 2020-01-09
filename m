Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF52135CB5
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 16:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730772AbgAIP0w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 10:26:52 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:41670 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730049AbgAIP0v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 10:26:51 -0500
Received: by mail-qt1-f193.google.com with SMTP id k40so6141885qtk.8
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 07:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M2wOckotxOzM6ekMiDpizI1kiXHylocDhDMMhXrUiMc=;
        b=hKjrU4mtiCSeR+5caFJcpvslko3ZHIaE5Mrj29FGqWebOaOxKEkE/dBxtQ4ksF60CB
         61OZkWMFVFvy2KklYVLma/PLaXGjSbfL15zF0YkDyT5jqmekyDVUYlq/KymZ+oRz62P6
         xr48OrC00lnwjWzh8wKck/FwERHIxS1QAdULtdX9b/q6ckbh4BI1bznyUWfe/LBsUBps
         yM+YFKIOIg5fShSrHbkTdzB8Z+mPHgYg+N7lezoBv/s/MaydvLW1E+FuMDxjaVBgcRrv
         bH3g50khN4VdC7Ts7PiEgunyYCFbZpVNacH8/UsZeNH97IVh+eXKtUI163nZ4te5VyrM
         k/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=M2wOckotxOzM6ekMiDpizI1kiXHylocDhDMMhXrUiMc=;
        b=XxScNmN3OLd1fVOYCQ4D1uUcxJ4LnD27jFTE8c8guc0CcQyAa7jYCNn1mnqvIc0hH2
         K5SvEGKvkQVEj5SSx8JCR6EZrFGS5mbsb+PV7ibBQ5LSGdBlCAzo2ZPOgfC1tdh4vSZn
         LyvyvUu6muYV3R7ZTMHaaxpVbR8OPlAStmHOxH5tImTCSoTcySmiRPmfzXR/CitA2grv
         VB5CQps9oqO5vXzbmtQLO1r+/D2cGPgZhG+WDBP59FanvEIja8MhVmwDn/0HliB7eMDq
         ElW6krH1I9OhyHJpYEf0m3Gm96WLBGMNDycioYa6sR5BQ0FFvU9iu6wvKNTtTsmTxNnn
         c3eQ==
X-Gm-Message-State: APjAAAX3mDJGY7BIra3VhS0aPCzoc6t7kAxo3qa2/FWF19QgnJ28mn9F
        hnTR2yTaIoWd6DaR3wwZEZawpATz3sA=
X-Google-Smtp-Source: APXvYqx4vwLY65QkOKAdEDygML1eLjl0uaereccu7KRWPNaUpdKnqJVf2lr806CIvIfl499o0FVlTw==
X-Received: by 2002:aed:3e53:: with SMTP id m19mr6146174qtf.32.1578583609698;
        Thu, 09 Jan 2020 07:26:49 -0800 (PST)
Received: from billcipher.corp.mot.com ([200.110.218.188])
        by smtp.gmail.com with ESMTPSA id x16sm3120645qki.110.2020.01.09.07.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 07:26:49 -0800 (PST)
From:   =?UTF-8?q?Jer=C3=B3nimo=20Borque?= <jeronimo@borque.com.ar>
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org, greg@kroah.com,
        =?UTF-8?q?Jer=C3=B3nimo=20Borque?= <jeronimo@borque.com.ar>
Subject: [PATCH] USB: serial: simple: Add Motorola Solutions TETRA MTP3xxx and MTP85xx
Date:   Thu,  9 Jan 2020 12:23:34 -0300
Message-Id: <20200109152334.21077-1-jeronimo@borque.com.ar>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add device-ids for the Motorola Solutions TETRA radios MTP3xxx series
and MTP85xx series

$ lsusb -vd 0cad:

Bus 001 Device 009: ID 0cad:9015 Motorola CGISS TETRA PEI interface
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x0cad Motorola CGISS
  idProduct          0x9015
  bcdDevice           24.16
  iManufacturer           1
  iProduct                2
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0037
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          3
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
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
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
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
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0

Bus 001 Device 010: ID 0cad:9013 Motorola CGISS TETRA PEI interface
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x0cad Motorola CGISS
  idProduct          0x9013
  bcdDevice           24.16
  iManufacturer           1
  iProduct                2
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0037
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          3
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
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

Signed-off-by: Jerónimo Borque <jeronimo@borque.com.ar>
---
 drivers/usb/serial/usb-serial-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index edbbb13d6de6..bd23a7cb1be2 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -86,6 +86,8 @@ DEVICE(moto_modem, MOTO_IDS);
 #define MOTOROLA_TETRA_IDS()			\
 	{ USB_DEVICE(0x0cad, 0x9011) },	/* Motorola Solutions TETRA PEI */ \
 	{ USB_DEVICE(0x0cad, 0x9012) },	/* MTP6550 */ \
+	{ USB_DEVICE(0x0cad, 0x9013) },	/* MTP3xxx */ \
+	{ USB_DEVICE(0x0cad, 0x9015) },	/* MTP85xx */ \
 	{ USB_DEVICE(0x0cad, 0x9016) }	/* TPG2200 */
 DEVICE(motorola_tetra, MOTOROLA_TETRA_IDS);
 
-- 
2.24.1

