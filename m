Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA6D911E503
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 14:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfLMN43 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 08:56:29 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55471 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfLMN43 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 08:56:29 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so6467722wmj.5
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2019 05:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pygJ7mh0CHTJjUspwcXVaJd4XJbmxhN8/ZL1/uaW1NA=;
        b=OTwOyRGmdCGz09hjiP9E3+pHNuM1+bicUgZwcerWgnOL6OI+mA/kwK0ktZcG8GNS29
         BNn89ALuT/0n5F0GldEmDa5y9UMxyUf4OdfvAorGsHrK/spDh3mf3aakiWh6d43esSZU
         hfzF2DR7SPX/4lqVqQr0v4mV2Ly8Nro8wFOVHRCPJj2zwDhKAT0lpoUi1Pbonnr5cD9G
         TRPZamRiKsdtSAVt4Hu44CZEi6xgxfGUbQ1dIcjmINh8wKke4VruKZUZb+/WjzwbhslE
         JixPh+A13Crbh0SsyccJkeJ8yI8lWBThcAHE5CvhFD8MCq/q6K0Gc2VqUB+Wbuw2g+7v
         1/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pygJ7mh0CHTJjUspwcXVaJd4XJbmxhN8/ZL1/uaW1NA=;
        b=mRa7gzah2+31rHcNCjq7QHRrorY2I4sGbRkB7Mp4F+kx2bXvrLQzbO2TvMVHeAC2Wn
         calLO/PVsEVikoDHiSLwOTcUSfn1A9oEOHE8kzztXlgOI8CioDvjcnK2eJwwRqq9CfRK
         cWNZz/QfUmOrm7G9xzQqhNSqmlDcmD/VhMjb1NV7+GAZ++2R7n1nh0Ig5jcFtdbFrW4B
         zY70NuHk05OZkJDXKJ/ieAvpBVCUUdOu2N9ZHiUEKeeU6Ajidwbs/wE+MgYJzSnV6MiU
         jTVX9q0GthgdBz8T34ngTnQ/Qzt9797T0TfiFPtX58Sg5Z47KWXhgb4YUBM1tcHX9/gS
         ZQ6Q==
X-Gm-Message-State: APjAAAWl3HbryvxNqosqi9VRjWoFkAutglc/HRSvNfNWTdPMwEAuxvHG
        /7dEElHZeAk/Ja5sHR74+ndNYZBGPEQ=
X-Google-Smtp-Source: APXvYqzyy1aZqMCTn2tOjPRHBIJ362slLupYozAh0kFBuIQvTmSGb8Uzue1AvrBpBjFOA/QAice7Kw==
X-Received: by 2002:a1c:486:: with SMTP id 128mr14002463wme.163.1576245385980;
        Fri, 13 Dec 2019 05:56:25 -0800 (PST)
Received: from danielepa-ThinkCentre-M93p.tmt.telital.com (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id y139sm11108520wmd.24.2019.12.13.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:56:25 -0800 (PST)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] USB: serial: option: add Telit ME910G1 0x110a composition
Date:   Fri, 13 Dec 2019 14:56:15 +0100
Message-Id: <20191213135615.24286-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the following Telit ME910G1 composition:

0x110a: tty, tty, tty, rmnet

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
Hello Johan,

following lsusb output:

Bus 003 Device 003: ID 1bc7:110a Telit Wireless Solutions 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x1bc7 Telit Wireless Solutions
  idProduct          0x110a 
  bcdDevice            0.00
  iManufacturer           3 Telit
  iProduct                2 Telit ME910
  iSerial                 4 4ca930d8
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          122
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          1 Telit Configuration
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
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0 
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
  bDeviceClass            0 (Defined at Interface level)
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
index e9491d400a24..fea09a3f491f 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1172,6 +1172,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(0) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1102, 0xff),	/* Telit ME910 (ECM) */
 	  .driver_info = NCTRL(0) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x110a, 0xff),	/* Telit ME910G1 */
+	  .driver_info = NCTRL(0) | RSVD(3) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910),
 	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG4),
-- 
2.17.1

