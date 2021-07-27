Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036DA3D7528
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 14:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhG0Mhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 08:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbhG0Mhe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 08:37:34 -0400
Received: from mail.cyber-anlage.de (cyber-anlage.de [IPv6:2a03:4000:6:30d5::1337])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8325C061757
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 05:37:34 -0700 (PDT)
Received: from cyber-bucket.localnet (p200300f197121200264bfefffe4ac6f3.dip0.t-ipconnect.de [IPv6:2003:f1:9712:1200:264b:feff:fe4a:c6f3])
        by mail.cyber-anlage.de (Postfix) with ESMTPSA id 8DA875139F
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 14:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cyber-anlage.de;
        s=cyber; t=1627389453;
        bh=wFSnGfQuC6dy5z1HLKOL5etz5pVV6HS0OXb6chOmKlI=;
        h=From:To:Subject:Date;
        b=FSl+64JgtsH0O44VfnLZOxwjqQT0icJL9XpG9OHmx4wHqOpeDftq6mIZs8S8Ib6yN
         6c0dUKxecyCCKZC/P6jaUHcA/2vQV1BlHHs5Nf59MkSAYCeICxxAhplMfCqWyri3zD
         839jMV/O/lBEdctoBt8xxTXNnvhACOg/fTA4dWW25nVR0YdtrnOXRn/Xx9YuHYZ3sI
         NpPcbgzj3iWNgUTQ5+0fuBOTSX5gRefwu9grR5YSqnCJm1W5JKXn/drIYsVHo7VjC/
         QzIp09dz2Uzs76CKMTL0ZQzZaGLYXe+AH5smpNgOwto7Yrv9Y8Wvllowl9x9ookDNK
         GddWle6w4mkNA==
From:   Chris <chris@cyber-anlage.de>
To:     linux-usb@vger.kernel.org
Subject: pl2303 : unknown device type
Date:   Tue, 27 Jul 2021 14:37:23 +0200
Message-ID: <2560053.x2KRyp2eMa@cyber-bucket>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2278172.MlrV8VzQz5"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--nextPart2278172.MlrV8VzQz5
Content-Type: multipart/mixed; boundary="nextPart2512815.1ik1ktxZ7K"; protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Chris <chris@cyber-anlage.de>
To: linux-usb@vger.kernel.org
Subject: pl2303 : unknown device type
Date: Tue, 27 Jul 2021 14:37:23 +0200
Message-ID: <2560053.x2KRyp2eMa@cyber-bucket>

This is a multi-part message in MIME format.

--nextPart2512815.1ik1ktxZ7K
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

This problem was introduced with 5.13 and still persists in 5.13.5
After downgrading to 5.12.x, everything works like expected. Tested on 
archlinux. The device is an "ICP-DAS I-7561"


--nextPart2512815.1ik1ktxZ7K
Content-Disposition: attachment; filename="dmsg"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="dmsg"

dmesg -w 

[ 1999.689678] usb 2-4: new full-speed USB device number 3 using ohci-pci
[ 1999.919763] usb 2-4: New USB device found, idVendor=067b, idProduct=2303, bcdDevice=5d.ca
[ 1999.919772] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1999.919775] usb 2-4: Product: USB-Serial Controller
[ 1999.919777] usb 2-4: Manufacturer: Prolific Technology Inc.
[ 1999.923348] pl2303 2-4:1.0: pl2303 converter detected
[ 1999.923365] pl2303 2-4:1.0: unknown device type, please report to linux-usb@vger.kernel.org 

--nextPart2512815.1ik1ktxZ7K
Content-Disposition: attachment; filename="lsusb"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="lsusb"

lsusb -v

Bus 002 Device 002: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port / Mobile Action MA-8910P
Couldn't open device, some information will be missing

Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x2303 PL2303 Serial Port / Mobile Action MA-8910P
  bcdDevice           5d.ca
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
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

--nextPart2512815.1ik1ktxZ7K--

--nextPart2278172.MlrV8VzQz5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEn472JWEQLcP1NoSxpPnvy7Wy1NUFAmD//gMACgkQpPnvy7Wy
1NVqxAf7Bjynbjt4S2kZ9XQeh88I8GI7MspSqUhryCBrrqYVAddiNPRkigyLBORY
2Te07f2arCkzyUfPbHpZSu1dJ6z84JUYjpCsW6cJiSZ+tkxjHBtPcq/hGnwMpkXU
W/KNq/ZnM+bzqWHAj0HcDQQynjLeEt9DT8SDbrCQh6gUx/2+oAT2eMNb4ao3tOGA
7eHn4rD7ME/sgqcB5lNrxqjE+XzpEDM0CgeXmmSi+dXf6lghIcq9IbovXrqtSinD
8UhBLPl0oW5/psoJ6Cz0KrgQ26B25+dkpC4D5IcL1whju5WTYh29cUorb3bUk1vs
R5obNVs75oxl8IHlue2P6Xt0d+0KFA==
=w1lY
-----END PGP SIGNATURE-----

--nextPart2278172.MlrV8VzQz5--



