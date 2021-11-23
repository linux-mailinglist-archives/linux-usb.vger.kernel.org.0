Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB08459CB0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Nov 2021 08:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbhKWH0s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 02:26:48 -0500
Received: from mail.acc.umu.se ([130.239.18.156]:43388 "EHLO mail.acc.umu.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233965AbhKWH0s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Nov 2021 02:26:48 -0500
X-Greylist: delayed 444 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Nov 2021 02:26:47 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by amavisd-new (Postfix) with ESMTP id A9C4244B8F
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 08:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=acc.umu.se; s=mail1;
        t=1637651774; bh=0ukZIkclx7F9vZVGZF7Ki1O3iepHPW7Q9yw6rDVZCL0=;
        h=Date:From:To:Subject:From;
        b=gQ1AzzbhM66/zqYW8TBuDOiIhK35P6LtqOX3BSluP8YidccFxKjlDTyUWuo/ExyfR
         tEy8hNG/q+buWIGtzG9nG/hMk9BCOon3bQvDBg9fjRJk3nW4sYyrYXG2FeVTkCkpe6
         dlnQMrmE9LqfD2Ms42+8V5+QWDiRhveCF62gu/G+3XQ9Ldp7Z99zrlcRmC9+860sNj
         OGRcl7IQclaDVFthNRplosotDPLTif61C5kZduymVpHyHZy/RKjCTFpiqmp0a/j30W
         gFxptAkU3zOjKozZa0La+Czzx/1fACkaOxV4lM8SAJCgcx+qO41N0vkO2Y2k9XPfIu
         HwyCxEufNbB1A==
Received: by mail.acc.umu.se (Postfix, from userid 24471)
        id 416FA44B90; Tue, 23 Nov 2021 08:16:14 +0100 (CET)
Date:   Tue, 23 Nov 2021 08:16:13 +0100
From:   Anton Lundin <glance@acc.umu.se>
To:     linux-usb@vger.kernel.org
Subject: pl2303 converter detected, unknown device type
Message-ID: <20211123071613.GZ108031@montezuma.acc.umu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I just picked up a new usb-rs232 adapter and was met by the following on
a modern kernel:

# uname -r
5.16.0-rc2

usb 3-7: new full-speed USB device number 5 using xhci_hcd
usb 3-7: New USB device found, idVendor=067b, idProduct=23a3, bcdDevice= 1.05
usb 3-7: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 3-7: Product: ATEN USB to Serial Bridge
usb 3-7: Manufacturer: Prolific Technology Inc.
pl2303 3-7:1.0: pl2303 converter detected
pl2303 3-7:1.0: unknown device type, please report to linux-usb@vger.kernel.org


# lsusb -vv -d 067b:23a3

Bus 003 Device 005: ID 067b:23a3 Prolific Technology, Inc. ATEN USB to Serial Bridge
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x23a3 
  bcdDevice            1.05
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 ATEN USB to Serial Bridge
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xbf
      (Bus Powered)
      Remote Wakeup
      Battery Powered
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
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
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
  (Bus Powered)


But it worked on a bit older Debian Bullseye kernel:

# uname -r
5.10.0-8-amd64

usb 1-2: new full-speed USB device number 5 using xhci_hcd
usb 1-2: New USB device found, idVendor=067b, idProduct=23a3, bcdDevice= 1.05
usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-2: Product: ATEN USB to Serial Bridge
usb 1-2: Manufacturer: Prolific Technology Inc.
usbcore: registered new interface driver usbserial_generic
usbserial: USB Serial support registered for generic
usbcore: registered new interface driver pl2303
usbserial: USB Serial support registered for pl2303
pl2303 1-2:1.0: pl2303 converter detected
usb 1-2: pl2303 converter now attached to ttyUSB0


I'm guessing it just needs a case for this bcdDevice.


//Anton
