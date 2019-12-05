Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC8F011406C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 13:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbfLEMAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 07:00:20 -0500
Received: from nef2.ens.fr ([129.199.96.40]:48558 "EHLO nef.ens.fr"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729072AbfLEMAU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Dec 2019 07:00:20 -0500
X-ENS-nef-client: 129.199.127.85
Received: from mail.phys.ens.fr (mail.phys.ens.fr [129.199.127.85])
          by nef.ens.fr (8.14.4/1.01.28121999) with ESMTP id xB5C0BVj020332
          for <linux-usb@vger.kernel.org>; Thu, 5 Dec 2019 13:00:12 +0100
Received: from dalek.localnet (tudia.pck.nerim.net [213.41.147.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mail.phys.ens.fr (Postfix) with ESMTPSA id 11FB61A152B
        for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2019 13:00:08 +0100 (CET)
From:   =?ISO-8859-1?Q?=C9ric?= Brunet <eric.brunet@ens.fr>
To:     linux-usb@vger.kernel.org
Subject: Re: Bug report: dvd player on USB3 port shows first GiB only
Date:   Thu, 05 Dec 2019 13:00:07 +0100
Message-ID: <6180569.GeGCjV7vS5@dalek>
In-Reply-To: <1575542136.6107.3.camel@suse.com>
References: <7725295.NyiUUSuA9g@dalek> <9269932.zcQTiTrDoZ@dalek> <1575542136.6107.3.camel@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1900202.VYddPnLWQK"
Content-Transfer-Encoding: 7Bit
X-Rspamd-Queue-Id: 11FB61A152B
X-Spamd-Result: default: False [-3.53 / 150.00];
         ARC_NA(0.00)[];
         BAYES_HAM(-3.00)[100.00%];
         R_SPF_NEUTRAL(0.00)[?all:c];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         HAS_ATTACHMENT(0.00)[];
         MIME_GOOD(-0.10)[multipart/mixed,text/plain];
         TO_DN_NONE(0.00)[];
         RCPT_COUNT_ONE(0.00)[1];
         HFILTER_HELO_NORES_A_OR_MX(0.30)[dalek.localnet];
         HFILTER_HELO_IP_A(1.00)[dalek.localnet];
         CTYPE_MIXED_BOGUS(1.00)[];
         DMARC_NA(0.00)[ens.fr];
         NEURAL_HAM(-0.00)[-1.000,0];
         IP_SCORE(-3.73)[ip: (-9.80), ipnet: 213.41.128.0/17(-4.90), asn: 13193(-3.89), country: FR(-0.06)];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         R_DKIM_NA(0.00)[];
         MID_RHS_NOT_FQDN(0.50)[];
         ASN(0.00)[asn:13193, ipnet:213.41.128.0/17, country:FR];
         MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+];
         CTE_CASE(0.50)[]
X-Rspamd-Server: mail
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (nef.ens.fr [129.199.96.32]); Thu, 05 Dec 2019 13:00:12 +0100 (CET)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart1900202.VYddPnLWQK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Le jeudi 5 d=E9cembre 2019 11:35:36 CET, vous avez =E9crit :
> Am Donnerstag, den 05.12.2019, 01:40 +0100 schrieb =C9ric Brunet:
> > I am not sure what information to provide. Here is what happens in dmesg
>=20
> > when I plug in the DVD:
> Hi,
>=20
> we need "lsusb -v" for both the error and the working case and "dmesg"
> for the working and the failing case (clearly labled please) and
> depending on that maybe a usbmon trace later on.


Hi, thanks for your interest.

nonworking case:
=2D---------------
Shut down the computer, boot, log in, plug the dvd player, wait for the mot=
or to stop, check that=20
the reported size is wrong (1GiB only), run "dmesg" and "sudo lsusb -v"

working case:
=2D------------
Shut down the computer, plug the dvd player, boot, log in, check that the r=
eported size is=20
correct (6.9 GiB), run "dmesg" and "sudo lsusb -v"

I am attaching the dmesg for both cases, but only the lsusb for the non-wor=
king case, because it=20
is easier to give the diff:

% diff -U0 lsusb_nonworking lsusb_working=20
=2D-- lsusb_nonworking    2019-12-05 12:06:02.541757500 +0100
+++ lsusb_working       2019-12-05 12:09:32.281072735 +0100
@@ -293 +293 @@
=2DBus 001 Device 003: ID 0489:e0a2 Foxconn / Hon Hai=20
+Bus 001 Device 004: ID 0489:e0a2 Foxconn / Hon Hai=20
@@ -543 +543 @@
=2DBus 001 Device 002: ID 0c45:6723 Microdia Integrated_Webcam_HD
+Bus 001 Device 003: ID 0c45:6723 Microdia Integrated_Webcam_HD
@@ -1054 +1054 @@
=2DBus 001 Device 004: ID 0e8d:1887 MediaTek Inc. HP External USB Optical D=
rive
+Bus 001 Device 002: ID 0e8d:1887 MediaTek Inc. HP External USB Optical Dri=
ve

Thanks,

        =C9ric Brunet

--nextPart1900202.VYddPnLWQK
Content-Disposition: attachment; filename="lsusb_nonworking"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="lsusb_nonworking"

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            5.03
  iManufacturer           3 Linux 5.3.13-300.fc31.x86_64 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:39:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             2
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.02a0 lowspeed L1
   Port 2: 0000.02a0 lowspeed L1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002b
  bNumDeviceCaps          2
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         512 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000023
      Sublink Speed Attribute count 3
      Sublink Speed ID count 1
    wFunctionalitySupport   0x0001
    bmSublinkSpeedAttr[0]   0x00050034
      Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[1]   0x000500b4
      Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[2]   0x000a4035
      Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[3]   0x000a40b5
      Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
  Self Powered

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            5.03
  iManufacturer           3 Linux 5.3.13-300.fc31.x86_64 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:39:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength               9
  bDescriptorType      41
  nNbrPorts             2
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x00
  PortPwrCtrlMask    0xff
 Hub Port Status:
   Port 1: 0000.0100 power
   Port 2: 0000.0100 power
Device Status:     0x0001
  Self Powered

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0003 3.0 root hub
  bcdDevice            5.03
  iManufacturer           3 Linux 5.3.13-300.fc31.x86_64 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             6
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.02a0 lowspeed L1
   Port 2: 0000.02a0 lowspeed L1
   Port 3: 0000.02a0 lowspeed L1
   Port 4: 0000.02a0 lowspeed L1
   Port 5: 0000.02a0 lowspeed L1
   Port 6: 0000.02a0 lowspeed L1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x005b
  bNumDeviceCaps          2
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   3
      Lowest fully-functional device speed is SuperSpeed (5Gbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         918 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                76
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x000000ef
      Sublink Speed Attribute count 15
      Sublink Speed ID count 7
    wFunctionalitySupport   0x0001
    bmSublinkSpeedAttr[0]   0x00050034
      Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[1]   0x000500b4
      Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[2]   0x000a4035
      Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[3]   0x000a40b5
      Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
    bmSublinkSpeedAttr[4]   0x04e00026
      Speed Attribute ID: 6 1248Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[5]   0x04e000a6
      Speed Attribute ID: 6 1248Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[6]   0x09c00027
      Speed Attribute ID: 7 2496Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[7]   0x09c000a7
      Speed Attribute ID: 7 2496Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[8]   0x13800028
      Speed Attribute ID: 8 4992Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[9]   0x138000a8
      Speed Attribute ID: 8 4992Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[10]   0x05b10029
      Speed Attribute ID: 9 1457Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[11]   0x05b100a9
      Speed Attribute ID: 9 1457Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[12]   0x0b63002a
      Speed Attribute ID: 10 2915Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[13]   0x0b6300aa
      Speed Attribute ID: 10 2915Mb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[14]   0x16c6002b
      Speed Attribute ID: 11 5830Mb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[15]   0x16c600ab
      Speed Attribute ID: 11 5830Mb/s Symmetric TX SuperSpeed
Device Status:     0x0001
  Self Powered

Bus 001 Device 003: ID 0489:e0a2 Foxconn / Hon Hai 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          224 Wireless
  bDeviceSubClass         1 Radio Frequency
  bDeviceProtocol         1 Bluetooth
  bMaxPacketSize0        64
  idVendor           0x0489 Foxconn / Hon Hai
  idProduct          0xe0a2 
  bcdDevice            0.01
  iManufacturer           0 
  iProduct                0 
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00b1
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
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
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0000  1x 0 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0009  1x 9 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0011  1x 17 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0019  1x 25 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0021  1x 33 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           2
      bInterfaceClass       224 Wireless
      bInterfaceSubClass      1 Radio Frequency
      bInterfaceProtocol      1 Bluetooth
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0031  1x 49 bytes
        bInterval               1
Device Status:     0x0001
  Self Powered

Bus 001 Device 002: ID 0c45:6723 Microdia Integrated_Webcam_HD
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.01
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0c45 Microdia
  idProduct          0x6723 
  bcdDevice           80.08
  iManufacturer           2 CN09357GLOG008CLA26CA01
  iProduct                1 Integrated_Webcam_HD
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x02a3
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    ** UNRECOGNIZED:  28 ff 42 49 53 54 00 01 06 01 10 00 00 00 00 00 d1 10 d0 07 d2 11 f4 01 d3 12 f4 01 d4 13 f4 01 d5 14 d0 07 d6 15 f4 01
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 Integrated Webcam
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              5 Integrated Webcam
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x0067
        dwClockFrequency       15.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             5
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               4
        iTerminal               0 
      VideoControl Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {28f03370-6311-4a2e-ba2c-6890eb334016}
        bNumControl             8
        bNrPins                 1
        baSourceID( 0)          2
        bControlSize            1
        bmControls( 0)       0x9f
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 4
        guidExtensionCode         {0fb885c3-68c2-4547-90f7-8f47579d95fc}
        bNumControl             8
        bNrPins                 1
        baSourceID( 0)          3
        bControlSize            1
        bmControls( 0)       0x0f
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0020000e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000177f
          Brightness
          Contrast
          Hue
          Saturation
          Sharpness
          Gamma
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               6
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            15
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         2
        wTotalLength                   0x0185
        bEndPointAddress                  129
        bmInfo                              0
        bTerminalLink                       5
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                5
        bFlags                              0
          Fixed-size samples: No
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                442368000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843789
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                248832000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1037389
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                195379200
        dwMaxBitRate                195379200
        dwMaxVideoFrameBufferSize      814669
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614989
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                110592000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      461389
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        2
        bNumFrameDescriptors                6
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                147456000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                110592000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                 48844800
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 36864000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           180
        dwMinBitRate                 27648000
        dwMaxBitRate                 27648000
        dwMaxVideoFrameBufferSize      115200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            160
        wHeight                           120
        dwMinBitRate                  9216000
        dwMaxBitRate                  9216000
        dwMaxVideoFrameBufferSize       38400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  1
        dwFrameInterval( 0)            333333
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0320  1x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0b20  2x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1320  3x 800 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x1400  3x 1024 bytes
        bInterval               1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0021
  bNumDeviceCaps          1
  Platform Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType      5
    bReserved               0
    PlatformCapabilityUUID    {d8dd60df-4589-4cc7-9cd2-659d9e648a9f}
    CapabilityData[0]    0x00
    CapabilityData[1]    0x00
    CapabilityData[2]    0x00
    CapabilityData[3]    0x0a
    CapabilityData[4]    0x06
    CapabilityData[5]    0x03
    CapabilityData[6]    0x01
    CapabilityData[7]    0x00
Device Status:     0x0002
  (Bus Powered)
  Remote Wakeup Enabled

Bus 001 Device 004: ID 0e8d:1887 MediaTek Inc. HP External USB Optical Drive
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0e8d MediaTek Inc.
  idProduct          0x1887 
  bcdDevice            0.00
  iManufacturer           1 Hewlett-Packard Company
  iProduct                2 HP External USB Optical Drive
  iSerial                 3 KZ6E4D43127         
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0020
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          4 Default
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      2 SFF-8020i, MMC-2 (ATAPI)
      bInterfaceProtocol     80 
      iInterface              5 6238--Storage
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
        bEndpointAddress     0x02  EP 2 OUT
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

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0 
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            5.03
  iManufacturer           3 Linux 5.3.13-300.fc31.x86_64 xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength              11
  bDescriptorType      41
  nNbrPorts            12
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0xa0 0x04
  PortPwrCtrlMask    0xff 0xff
 Hub Port Status:
   Port 1: 0000.0503 highspeed power enable connect
   Port 2: 0000.0100 power
   Port 3: 0000.0100 power
   Port 4: 0000.0100 power
   Port 5: 0000.0503 highspeed power enable connect
   Port 6: 0000.0100 power
   Port 7: 0000.0103 power enable connect
   Port 8: 0000.0100 power
   Port 9: 0000.0100 power
   Port 10: 0000.0100 power
   Port 11: 0000.0100 power
   Port 12: 0000.0100 power
Device Status:     0x0001
  Self Powered

--nextPart1900202.VYddPnLWQK
Content-Disposition: attachment; filename="dmesg_nonworking"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="dmesg_nonworking"

[    0.000000] microcode: microcode updated early to revision 0xca, date =
=3D 2019-10-03
[    0.000000] Linux version 5.3.13-300.fc31.x86_64 (mockbuild@bkernel04.ph=
x2.fedoraproject.org) (gcc version 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC)) =
#1 SMP Mon Nov 25 17:25:25 UTC 2019
[    0.000000] Command line: BOOT_IMAGE=3D(lvmid/2fpC6u-zHOJ-Jr5U-XaBQ-P0QB=
=2D3Cwd-7iVMYZ/M43qac-mfuc-oBTi-wezy-5poB-N7dU-qCxdCO)/boot/vmlinuz-5.3.13-=
300.fc31.x86_64 root=3D/dev/mapper/dalek-root ro resume=3D/dev/mapper/dalek=
=2Dswap rd.lvm.lv=3Ddalek/root rd.lvm.lv=3Ddalek/swap rhgb quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registe=
rs'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 b=
ytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000034393fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000034394000-0x0000000034394fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000034395000-0x0000000034395fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000034396000-0x000000003c314fff] usable
[    0.000000] BIOS-e820: [mem 0x000000003c315000-0x000000003f122fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003f123000-0x000000003f19ffff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000003f1a0000-0x000000003f26afff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000003f26b000-0x000000003fffefff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003ffff000-0x000000003fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040000000-0x0000000047ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000048000000-0x0000000048dfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000048e00000-0x000000004f7fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000004ae7fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi:  ACPI 2.0=3D0x3f13c000  ACPI=3D0x3f13c000  SMBIOS=3D0xf=
0000  SMBIOS 3.0=3D0xf0020  TPMFinalLog=3D0x3f1c9000  ESRT=3D0x3fa95218  ME=
MATTR=3D0x39f2e018  TPMEventLog=3D0x3449c018=20
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.2.1 present.
[    0.000000] DMI: Dell Inc. XPS 13 9380/0KTW76, BIOS 1.7.0 08/05/2019
[    0.000000] tsc: Detected 2000.000 MHz processor
[    0.001262] tsc: Detected 1999.968 MHz TSC
[    0.001262] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.001263] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001268] last_pfn =3D 0x4ae800 max_arch_pfn =3D 0x400000000
[    0.001275] MTRR default type: write-back
[    0.001276] MTRR fixed ranges enabled:
[    0.001276]   00000-9FFFF write-back
[    0.001277]   A0000-BFFFF uncachable
[    0.001277]   C0000-FFFFF write-protect
[    0.001278] MTRR variable ranges enabled:
[    0.001279]   0 base 0080000000 mask 7F80000000 uncachable
[    0.001279]   1 base 0060000000 mask 7FE0000000 uncachable
[    0.001280]   2 base 0050000000 mask 7FF0000000 write-combining
[    0.001280]   3 base 004C000000 mask 7FFC000000 uncachable
[    0.001281]   4 base 004B000000 mask 7FFF000000 uncachable
[    0.001281]   5 disabled
[    0.001281]   6 disabled
[    0.001282]   7 disabled
[    0.001282]   8 disabled
[    0.001282]   9 disabled
[    0.001745] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.001883] last_pfn =3D 0x48e00 max_arch_pfn =3D 0x400000000
[    0.007689] esrt: Reserving ESRT space from 0x000000003fa95218 to 0x0000=
00003fa95250.
[    0.007696] Using GB pages for direct mapping
[    0.007697] BRK [0x37b001000, 0x37b001fff] PGTABLE
[    0.007698] BRK [0x37b002000, 0x37b002fff] PGTABLE
[    0.007699] BRK [0x37b003000, 0x37b003fff] PGTABLE
[    0.007734] BRK [0x37b004000, 0x37b004fff] PGTABLE
[    0.007735] BRK [0x37b005000, 0x37b005fff] PGTABLE
[    0.007877] BRK [0x37b006000, 0x37b006fff] PGTABLE
[    0.007950] BRK [0x37b007000, 0x37b007fff] PGTABLE
[    0.007985] BRK [0x37b008000, 0x37b008fff] PGTABLE
[    0.008007] BRK [0x37b009000, 0x37b009fff] PGTABLE
[    0.008070] RAMDISK: [mem 0x2f841000-0x315e2fff]
[    0.008081] ACPI: Early table checksum verification disabled
[    0.008083] ACPI: RSDP 0x000000003F13C000 000024 (v02 DELL  )
[    0.008085] ACPI: XSDT 0x000000003F13C0B0 0000E4 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008088] ACPI: FACP 0x000000003F179720 000114 (v06 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008093] ACPI: DSDT 0x000000003F13C228 03D4F7 (v02 DELL   CBX3     01=
072009 INTL 20160527)
[    0.008097] ACPI: FACS 0x000000003F269C00 000040
[    0.008103] ACPI: APIC 0x000000003F179838 0000BC (v04 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008105] ACPI: FPDT 0x000000003F1798F8 000044 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008106] ACPI: FIDT 0x000000003F179940 00009C (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008108] ACPI: MCFG 0x000000003F1799E0 00003C (v01 DELL   CBX3     01=
072009 MSFT 00000097)
[    0.008110] ACPI: SSDT 0x000000003F179A20 001B1C (v02 CpuRef CpuSsdt  00=
003000 INTL 20160527)
[    0.008112] ACPI: BOOT 0x000000003F17B540 000028 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008114] ACPI: SSDT 0x000000003F17B568 001663 (v02 SaSsdt SaSsdt   00=
003000 INTL 20160527)
[    0.008115] ACPI: HPET 0x000000003F17CBD0 000038 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.008117] ACPI: SSDT 0x000000003F17CC08 001FE2 (v02 DELL\x WHL_Tbt_ 00=
001000 INTL 20160527)
[    0.008118] ACPI: SSDT 0x000000003F17EBF0 0030D7 (v02 INTEL  xh_whlt4 00=
000000 INTL 20160527)
[    0.008120] ACPI: NHLT 0x000000003F181CC8 00002D (v00 DELL\x CBX3     00=
000002      01000013)
[    0.008121] ACPI: UEFI 0x000000003F181CF8 000042 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.008123] ACPI: LPIT 0x000000003F181D40 000094 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.008124] ACPI: SSDT 0x000000003F181DD8 0027DE (v02 DELL\x PtidDevc 00=
001000 INTL 20160527)
[    0.008126] ACPI: SSDT 0x000000003F1845B8 00132E (v02 DELL\x TbtTypeC 00=
000000 INTL 20160527)
[    0.008128] ACPI: DBGP 0x000000003F1858E8 000034 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.008129] ACPI: DBG2 0x000000003F185920 000054 (v00 DELL\x CBX3     00=
000002      01000013)
[    0.008130] ACPI: SSDT 0x000000003F185978 00081C (v02 DELL\x UsbCTabl 00=
001000 INTL 20160527)
[    0.008132] ACPI: SSDT 0x000000003F186198 007FBF (v02 DptfTa DptfTabl 00=
001000 INTL 20160527)
[    0.008133] ACPI: DMAR 0x000000003F18E158 0000A8 (v01 INTEL  EDK2     00=
000002      01000013)
[    0.008135] ACPI: SSDT 0x000000003F18E200 000144 (v02 Intel  ADebTabl 00=
001000 INTL 20160527)
[    0.008137] ACPI: BGRT 0x000000003F18E348 000038 (v00 DELL   CBX3     01=
072009 AMI  00010013)
[    0.008138] ACPI: TPM2 0x000000003F18E380 000034 (v04 DELL\x CBX3     00=
000001 AMI  00000000)
[    0.008144] ACPI: Local APIC address 0xfee00000
[    0.008315] No NUMA configuration found
[    0.008315] Faking a node at [mem 0x0000000000000000-0x00000004ae7fffff]
[    0.008321] NODE_DATA(0) allocated [mem 0x4ae7d5000-0x4ae7fffff]
[    0.050273] Zone ranges:
[    0.050274]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.050275]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.050275]   Normal   [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.050276]   Device   empty
[    0.050276] Movable zone start for each node
[    0.050278] Early memory node ranges
[    0.050279]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.050279]   node   0: [mem 0x000000000009f000-0x000000000009ffff]
[    0.050280]   node   0: [mem 0x0000000000100000-0x0000000034393fff]
[    0.050280]   node   0: [mem 0x0000000034396000-0x000000003c314fff]
[    0.050281]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.050281]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.050281]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.050741] Zeroed struct page in unavailable ranges: 44878 pages
[    0.050742] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7ff=
fff]
[    0.050743] On node 0 totalpages: 4110514
[    0.050744]   DMA zone: 64 pages used for memmap
[    0.050744]   DMA zone: 22 pages reserved
[    0.050745]   DMA zone: 3998 pages, LIFO batch:0
[    0.050775]   DMA32 zone: 3845 pages used for memmap
[    0.050776]   DMA32 zone: 246036 pages, LIFO batch:63
[    0.055917]   Normal zone: 60320 pages used for memmap
[    0.055918]   Normal zone: 3860480 pages, LIFO batch:63
[    0.097056] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7ffff=
f]
[    0.097517] ACPI: PM-Timer IO Port: 0x1808
[    0.097518] ACPI: Local APIC address 0xfee00000
[    0.097523] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.097523] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.097524] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.097524] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.097524] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.097525] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.097525] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.097525] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.097578] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.097579] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.097580] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.097581] ACPI: IRQ0 used by override.
[    0.097581] ACPI: IRQ9 used by override.
[    0.097582] Using ACPI (MADT) for SMP configuration information
[    0.097583] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.097587] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.097601] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.097602] PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
[    0.097603] PM: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.097604] PM: Registered nosave memory: [mem 0x34394000-0x34394fff]
[    0.097604] PM: Registered nosave memory: [mem 0x34395000-0x34395fff]
[    0.097605] PM: Registered nosave memory: [mem 0x3c315000-0x3f122fff]
[    0.097605] PM: Registered nosave memory: [mem 0x3f123000-0x3f19ffff]
[    0.097606] PM: Registered nosave memory: [mem 0x3f1a0000-0x3f26afff]
[    0.097606] PM: Registered nosave memory: [mem 0x3f26b000-0x3fffefff]
[    0.097607] PM: Registered nosave memory: [mem 0x40000000-0x47ffffff]
[    0.097608] PM: Registered nosave memory: [mem 0x48e00000-0x4f7fffff]
[    0.097608] PM: Registered nosave memory: [mem 0x4f800000-0xdfffffff]
[    0.097608] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.097609] PM: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.097609] PM: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.097609] PM: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.097609] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.097610] PM: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.097610] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.097610] PM: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.097611] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.097614] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.097622] Booting paravirtualized kernel on bare hardware
[    0.097633] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.168175] setup_percpu: NR_CPUS:1024 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.168403] percpu: Embedded 52 pages/cpu s176128 r8192 d28672 u262144
[    0.168408] pcpu-alloc: s176128 r8192 d28672 u262144 alloc=3D1*2097152
[    0.168408] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.168427] Built 1 zonelists, mobility grouping on.  Total pages: 40462=
63
[    0.168428] Policy zone: Normal
[    0.168429] Kernel command line: BOOT_IMAGE=3D(lvmid/2fpC6u-zHOJ-Jr5U-Xa=
BQ-P0QB-3Cwd-7iVMYZ/M43qac-mfuc-oBTi-wezy-5poB-N7dU-qCxdCO)/boot/vmlinuz-5.=
3.13-300.fc31.x86_64 root=3D/dev/mapper/dalek-root ro resume=3D/dev/mapper/=
dalek-swap rd.lvm.lv=3Ddalek/root rd.lvm.lv=3Ddalek/swap rhgb quiet
[    0.169678] Dentry cache hash table entries: 2097152 (order: 12, 1677721=
6 bytes, linear)
[    0.170282] Inode-cache hash table entries: 1048576 (order: 11, 8388608 =
bytes, linear)
[    0.170347] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.224329] Memory: 15970440K/16442056K available (12291K kernel code, 1=
542K rwdata, 4568K rodata, 2276K init, 4464K bss, 471616K reserved, 0K cma-=
reserved)
[    0.224436] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.224446] ftrace: allocating 40084 entries in 157 pages
[    0.236500] rcu: Hierarchical RCU implementation.
[    0.236501] rcu: 	RCU restricting CPUs from NR_CPUS=3D1024 to nr_cpu_ids=
=3D8.
[    0.236501] 	Tasks RCU enabled.
[    0.236502] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.236502] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.238402] NR_IRQS: 65792, nr_irqs: 2048, preallocated irqs: 16
[    0.238807] random: crng done (trusting CPU's manufacturer)
[    0.238826] Console: colour dummy device 80x25
[    0.238850] printk: console [tty0] enabled
[    0.238862] ACPI: Core revision 20190703
[    0.239197] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 79635855245 ns
[    0.239300] APIC: Switch to symmetric I/O mode setup
[    0.239301] DMAR: Host address width 39
[    0.239302] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.239306] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660=
462 ecap 19e2ff0505e
[    0.239307] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.239309] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c406604=
62 ecap f050da
[    0.239310] DMAR: RMRR base: 0x0000003f07f000 end: 0x0000003f09efff
[    0.239310] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.239312] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.239312] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.239313] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.241850] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.241851] x2apic enabled
[    0.241874] Switched APIC routing to cluster x2apic.
[    0.247742] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
=2D1
[    0.252215] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x39a8208cdd2, max_idle_ns: 881590748921 ns
[    0.252218] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 3999.93 BogoMIPS (lpj=3D1999968)
[    0.252220] pid_max: default: 32768 minimum: 301
[    0.254252] LSM: Security Framework initializing
[    0.254260] Yama: becoming mindful.
[    0.254284] SELinux:  Initializing.
[    0.254296] *** VALIDATE SELinux ***
[    0.254339] Mount-cache hash table entries: 32768 (order: 6, 262144 byte=
s, linear)
[    0.254373] Mountpoint-cache hash table entries: 32768 (order: 6, 262144=
 bytes, linear)
[    0.254504] *** VALIDATE proc ***
[    0.254556] *** VALIDATE cgroup1 ***
[    0.254557] *** VALIDATE cgroup2 ***
[    0.254597] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.254612] process: using mwait in idle threads
[    0.254614] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.254615] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.254617] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.254618] Spectre V2 : Mitigation: Full generic retpoline
[    0.254618] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.254619] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.254620] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.254620] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    0.254621] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    0.254622] MDS: Mitigation: Clear CPU buffers
[    0.254839] Freeing SMP alternatives memory: 36K
[    0.256294] TSC deadline timer enabled
[    0.256299] smpboot: CPU0: Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz (fam=
ily: 0x6, model: 0x8e, stepping: 0xb)
[    0.256382] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR,=
 full-width counters, Intel PMU driver.
[    0.256386] ... version:                4
[    0.256387] ... bit width:              48
[    0.256387] ... generic registers:      4
[    0.256387] ... value mask:             0000ffffffffffff
[    0.256388] ... max period:             00007fffffffffff
[    0.256388] ... fixed-purpose events:   3
[    0.256388] ... event mask:             000000070000000f
[    0.256415] rcu: Hierarchical SRCU implementation.
[    0.257074] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.257133] smp: Bringing up secondary CPUs ...
[    0.257185] x86: Booting SMP configuration:
[    0.257185] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.259299] MDS CPU bug present and SMT on, data leak possible. See http=
s://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more de=
tails.
[    0.259318]  #5 #6 #7
[    0.260657] smp: Brought up 1 node, 8 CPUs
[    0.260657] smpboot: Max logical packages: 1
[    0.260657] smpboot: Total of 8 processors activated (31999.48 BogoMIPS)
[    0.261633] devtmpfs: initialized
[    0.261633] x86/mm: Memory block size: 128MB
[    0.262783] PM: Registering ACPI NVS region [mem 0x34394000-0x34394fff] =
(4096 bytes)
[    0.262783] PM: Registering ACPI NVS region [mem 0x3f1a0000-0x3f26afff] =
(831488 bytes)
[    0.262783] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.262783] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    0.262783] pinctrl core: initialized pinctrl subsystem
[    0.262783] PM: RTC time: 11:04:42, date: 2019-12-05
[    0.263279] NET: Registered protocol family 16
[    0.263359] audit: initializing netlink subsys (disabled)
[    0.263363] audit: type=3D2000 audit(1575543882.019:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.263363] cpuidle: using governor menu
[    0.263363] Simple Boot Flag at 0x47 set to 0x80
[    0.263363] ACPI: bus type PCI registered
[    0.263363] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.263363] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
=2D0xefffffff] (base 0xe0000000)
[    0.263363] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.263363] PCI: Using configuration type 1 for base access
[    0.263931] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.265239] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.265239] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.352351] cryptd: max_cpu_qlen set to 1000
[    0.353395] alg: No test for lzo-rle (lzo-rle-generic)
[    0.353395] alg: No test for lzo-rle (lzo-rle-scomp)
[    0.353395] alg: No test for 842 (842-generic)
[    0.353395] alg: No test for 842 (842-scomp)
[    0.355332] ACPI: Added _OSI(Module Device)
[    0.355332] ACPI: Added _OSI(Processor Device)
[    0.355332] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.355332] ACPI: Added _OSI(Processor Aggregator Device)
[    0.355332] ACPI: Added _OSI(Linux-Dell-Video)
[    0.355332] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.355332] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.394596] ACPI: 10 ACPI AML tables successfully acquired and loaded
[    0.451836] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.461882] ACPI: Dynamic OEM Table Load:
[    0.461894] ACPI: SSDT 0xFFFF91131BFF2900 0000F4 (v02 PmRef  Cpu0Psd  00=
003000 INTL 20160527)
[    0.463416] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
[    0.464399] ACPI: Dynamic OEM Table Load:
[    0.464404] ACPI: SSDT 0xFFFF91131B809C00 000400 (v02 PmRef  Cpu0Cst  00=
003001 INTL 20160527)
[    0.466029] ACPI: Dynamic OEM Table Load:
[    0.466034] ACPI: SSDT 0xFFFF91131BC18000 00053F (v02 PmRef  Cpu0Ist  00=
003000 INTL 20160527)
[    0.467584] ACPI: Dynamic OEM Table Load:
[    0.467587] ACPI: SSDT 0xFFFF91131B801600 00011B (v02 PmRef  Cpu0Hwp  00=
003000 INTL 20160527)
[    0.468865] ACPI: Dynamic OEM Table Load:
[    0.468870] ACPI: SSDT 0xFFFF91131BC1E800 000724 (v02 PmRef  HwpLvt   00=
003000 INTL 20160527)
[    0.470418] ACPI: Dynamic OEM Table Load:
[    0.470423] ACPI: SSDT 0xFFFF91131BC19000 0005FC (v02 PmRef  ApIst    00=
003000 INTL 20160527)
[    0.471851] ACPI: Dynamic OEM Table Load:
[    0.471854] ACPI: SSDT 0xFFFF91131B80F400 000317 (v02 PmRef  ApHwp    00=
003000 INTL 20160527)
[    0.473116] ACPI: Dynamic OEM Table Load:
[    0.473120] ACPI: SSDT 0xFFFF91131BC69000 000AB0 (v02 PmRef  ApPsd    00=
003000 INTL 20160527)
[    0.474742] ACPI: Dynamic OEM Table Load:
[    0.474749] ACPI: SSDT 0xFFFF91131B80B800 00030A (v02 PmRef  ApCst    00=
003000 INTL 20160527)
[    0.478011] ACPI: EC: EC started
[    0.478012] ACPI: EC: interrupt blocked
[    0.485340] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as first EC
[    0.485342] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x6e, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    0.485343] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions
[    0.485343] ACPI: Interpreter enabled
[    0.485381] ACPI: (supports S0 S3 S4 S5)
[    0.485383] ACPI: Using IOAPIC for interrupt routing
[    0.485439] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.485867] ACPI: Enabled 9 GPEs in block 00 to 7F
[    0.490260] ACPI: Power Resource [WRST] (on)
[    0.490291] ACPI: Power Resource [DRST] (on)
[    0.490550] ACPI: Power Resource [PXP] (on)
[    0.495794] ACPI: Power Resource [USBC] (on)
[    0.495904] ACPI: Power Resource [PAUD] (on)
[    0.498237] ACPI: Power Resource [V0PR] (on)
[    0.498348] ACPI: Power Resource [V1PR] (on)
[    0.498441] ACPI: Power Resource [V2PR] (on)
[    0.502484] ACPI: Power Resource [WRST] (on)
[    0.510412] ACPI: Power Resource [PIN] (off)
[    0.510695] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.510699] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.511734] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.513699] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotp=
lug PME PCIeCapability LTR]
[    0.514375] PCI host bridge to bus 0000:00
[    0.514377] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.514378] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.514378] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.514379] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3ff=
f window]
[    0.514380] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7ff=
f window]
[    0.514380] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbff=
f window]
[    0.514381] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cfff=
f window]
[    0.514381] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3ff=
f window]
[    0.514382] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7ff=
f window]
[    0.514382] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbff=
f window]
[    0.514383] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dfff=
f window]
[    0.514384] pci_bus 0000:00: root bus resource [mem 0x4f800000-0xdffffff=
f window]
[    0.514384] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7ffff=
f window]
[    0.514385] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.514407] pci 0000:00:00.0: [8086:3e34] type 00 class 0x060000
[    0.514503] pci 0000:00:02.0: [8086:3ea0] type 00 class 0x030000
[    0.514512] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
[    0.514516] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit=
 pref]
[    0.514520] pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
[    0.514534] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.514622] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.514633] pci 0000:00:04.0: reg 0x10: [mem 0xdc510000-0xdc517fff 64bit]
[    0.514758] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[    0.514769] pci 0000:00:08.0: reg 0x10: [mem 0xdc524000-0xdc524fff 64bit]
[    0.514901] pci 0000:00:12.0: [8086:9df9] type 00 class 0x118000
[    0.514923] pci 0000:00:12.0: reg 0x10: [mem 0xdc523000-0xdc523fff 64bit]
[    0.515088] pci 0000:00:14.0: [8086:9ded] type 00 class 0x0c0330
[    0.515105] pci 0000:00:14.0: reg 0x10: [mem 0xdc500000-0xdc50ffff 64bit]
[    0.515157] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.515265] pci 0000:00:14.2: [8086:9def] type 00 class 0x050000
[    0.515283] pci 0000:00:14.2: reg 0x10: [mem 0xdc51c000-0xdc51dfff 64bit]
[    0.515293] pci 0000:00:14.2: reg 0x18: [mem 0xdc522000-0xdc522fff 64bit]
[    0.515455] pci 0000:00:15.0: [8086:9de8] type 00 class 0x0c8000
[    0.515547] pci 0000:00:15.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.515941] pci 0000:00:15.1: [8086:9de9] type 00 class 0x0c8000
[    0.516034] pci 0000:00:15.1: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.516443] pci 0000:00:16.0: [8086:9de0] type 00 class 0x078000
[    0.516467] pci 0000:00:16.0: reg 0x10: [mem 0xdc51f000-0xdc51ffff 64bit]
[    0.516537] pci 0000:00:16.0: PME# supported from D3hot
[    0.516697] pci 0000:00:1c.0: [8086:9dbc] type 01 class 0x060400
[    0.516770] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.516785] pci 0000:00:1c.0: PTM enabled (root), 4dns granularity
[    0.516923] pci 0000:00:1c.6: [8086:9dbe] type 01 class 0x060400
[    0.516995] pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold
[    0.517010] pci 0000:00:1c.6: PTM enabled (root), 4dns granularity
[    0.517122] pci 0000:00:1d.0: [8086:9db0] type 01 class 0x060400
[    0.517225] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.517239] pci 0000:00:1d.0: PTM enabled (root), 4dns granularity
[    0.517373] pci 0000:00:1d.4: [8086:9db4] type 01 class 0x060400
[    0.517456] pci 0000:00:1d.4: PME# supported from D0 D3hot D3cold
[    0.517473] pci 0000:00:1d.4: PTM enabled (root), 4dns granularity
[    0.517598] pci 0000:00:1f.0: [8086:9d84] type 00 class 0x060100
[    0.517762] pci 0000:00:1f.3: [8086:9dc8] type 00 class 0x040380
[    0.517801] pci 0000:00:1f.3: reg 0x10: [mem 0xdc518000-0xdc51bfff 64bit]
[    0.517837] pci 0000:00:1f.3: reg 0x20: [mem 0xdc200000-0xdc2fffff 64bit]
[    0.517911] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.518056] pci 0000:00:1f.4: [8086:9da3] type 00 class 0x0c0500
[    0.518082] pci 0000:00:1f.4: reg 0x10: [mem 0xdc51e000-0xdc51e0ff 64bit]
[    0.518110] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[    0.518214] pci 0000:00:1f.5: [8086:9da4] type 00 class 0x0c8000
[    0.518229] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.518431] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.518460] pci 0000:01:00.0: reg 0x14: [mem 0xdc400000-0xdc400fff]
[    0.518559] pci 0000:01:00.0: supports D1 D2
[    0.518560] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.518670] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.518674] pci 0000:00:1c.0:   bridge window [mem 0xdc400000-0xdc4fffff]
[    0.519003] pci 0000:02:00.0: [168c:003e] type 00 class 0x028000
[    0.519326] pci 0000:02:00.0: reg 0x10: [mem 0xdc000000-0xdc1fffff 64bit]
[    0.520333] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.521222] pci 0000:00:1c.6: PCI bridge to [bus 02]
[    0.521230] pci 0000:00:1c.6:   bridge window [mem 0xdc000000-0xdc1fffff]
[    0.521320] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[    0.521376] pci 0000:03:00.0: enabling Extended Tags
[    0.521451] pci 0000:03:00.0: supports D1 D2
[    0.521451] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.521543] pci 0000:00:1d.0: PCI bridge to [bus 03-6d]
[    0.521546] pci 0000:00:1d.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.521562] pci 0000:00:1d.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.521614] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[    0.521674] pci 0000:04:00.0: enabling Extended Tags
[    0.521752] pci 0000:04:00.0: supports D1 D2
[    0.521753] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.521827] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[    0.521887] pci 0000:04:01.0: enabling Extended Tags
[    0.521966] pci 0000:04:01.0: supports D1 D2
[    0.521967] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522040] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[    0.522100] pci 0000:04:02.0: enabling Extended Tags
[    0.522175] pci 0000:04:02.0: supports D1 D2
[    0.522176] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522254] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[    0.522314] pci 0000:04:04.0: enabling Extended Tags
[    0.522393] pci 0000:04:04.0: supports D1 D2
[    0.522394] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522485] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[    0.522493] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.522498] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.522546] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[    0.522577] pci 0000:05:00.0: reg 0x10: [mem 0xda000000-0xda03ffff]
[    0.522587] pci 0000:05:00.0: reg 0x14: [mem 0xda040000-0xda040fff]
[    0.522643] pci 0000:05:00.0: enabling Extended Tags
[    0.522737] pci 0000:05:00.0: supports D1 D2
[    0.522737] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522862] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.522869] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[    0.522908] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.522915] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[    0.522920] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff=
 64bit pref]
[    0.522978] pci 0000:39:00.0: [8086:15d4] type 00 class 0x0c0330
[    0.523012] pci 0000:39:00.0: reg 0x10: [mem 0xc3f00000-0xc3f0ffff]
[    0.523087] pci 0000:39:00.0: enabling Extended Tags
[    0.523185] pci 0000:39:00.0: supports D1 D2
[    0.523186] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.523245] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s x4 link at 0000:04:02.0 (capable of 31.504 Gb/s with 8 GT/s =
x4 link)
[    0.523335] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.523342] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[    0.523381] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[    0.523388] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[    0.523393] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff=
 64bit pref]
[    0.523641] pci 0000:6e:00.0: [144d:a808] type 00 class 0x010802
[    0.523668] pci 0000:6e:00.0: reg 0x10: [mem 0xdc300000-0xdc303fff 64bit]
[    0.523873] pci 0000:00:1d.4: PCI bridge to [bus 6e]
[    0.523876] pci 0000:00:1d.4:   bridge window [mem 0xdc300000-0xdc3fffff]
[    0.528476] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.528533] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 11 12 14 15=
) *1
[    0.528588] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.528642] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.528697] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.528752] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.528806] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.528861] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.539279] ACPI: EC: interrupt unblocked
[    0.539287] ACPI: EC: event unblocked
[    0.539306] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x6e, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    0.539308] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions and events
[    0.540238] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.540238] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.540238] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.540238] vgaarb: loaded
[    0.540302] SCSI subsystem initialized
[    0.540321] libata version 3.00 loaded.
[    0.540321] ACPI: bus type USB registered
[    0.540321] usbcore: registered new interface driver usbfs
[    0.540321] usbcore: registered new interface driver hub
[    0.540321] usbcore: registered new device driver usb
[    0.540321] pps_core: LinuxPPS API ver. 1 registered
[    0.540321] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.540321] PTP clock support registered
[    0.540321] EDAC MC: Ver: 3.0.0
[    0.541225] Registered efivars operations
[    0.541246] PCI: Using ACPI for IRQ routing
[    0.570785] PCI: pci_cache_line_size set to 64 bytes
[    0.571382] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.571383] e820: reserve RAM buffer [mem 0x34394000-0x37ffffff]
[    0.571383] e820: reserve RAM buffer [mem 0x3c315000-0x3fffffff]
[    0.571384] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.571384] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.571450] NetLabel: Initializing
[    0.571450] NetLabel:  domain hash size =3D 128
[    0.571450] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.571459] NetLabel:  unlabeled traffic allowed by default
[    0.571461] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.571461] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.577233] clocksource: Switched to clocksource tsc-early
[    0.587304] VFS: Disk quotas dquot_6.6.0
[    0.587313] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.587328] *** VALIDATE hugetlbfs ***
[    0.587366] pnp: PnP ACPI init
[    0.587424] system 00:00: [mem 0x40000000-0x403fffff] could not be reser=
ved
[    0.587427] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.587559] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.587559] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.587561] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.587590] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.587660] system 00:03: [io  0x1854-0x1857] has been reserved
[    0.587662] system 00:03: Plug and Play ACPI device, IDs INT3f0d PNP0c02=
 (active)
[    0.587749] pnp 00:04: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.587758] pnp 00:05: Plug and Play ACPI device, IDs DLL08af PNP0f13 (a=
ctive)
[    0.587877] system 00:06: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.587878] system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.587878] system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.587879] system 00:06: [mem 0xe0000000-0xefffffff] has been reserved
[    0.587880] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.587881] system 00:06: [mem 0xfed90000-0xfed93fff] could not be reser=
ved
[    0.587881] system 00:06: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.587882] system 00:06: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.587884] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.588040] system 00:07: [io  0x1800-0x18fe] could not be reserved
[    0.588041] system 00:07: [mem 0xfd000000-0xfd69ffff] has been reserved
[    0.588042] system 00:07: [mem 0xfd6b0000-0xfd6cffff] has been reserved
[    0.588043] system 00:07: [mem 0xfd6f0000-0xfdffffff] has been reserved
[    0.588043] system 00:07: [mem 0xfe000000-0xfe01ffff] could not be reser=
ved
[    0.588044] system 00:07: [mem 0xfe200000-0xfe7fffff] has been reserved
[    0.588045] system 00:07: [mem 0xff000000-0xffffffff] has been reserved
[    0.588047] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.588746] system 00:08: [io  0x2000-0x20fe] has been reserved
[    0.588748] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.589453] system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.593703] pnp: PnP ACPI: found 10 devices
[    0.594467] thermal_sys: Registered thermal governor 'fair_share'
[    0.594468] thermal_sys: Registered thermal governor 'bang_bang'
[    0.594468] thermal_sys: Registered thermal governor 'step_wise'
[    0.594469] thermal_sys: Registered thermal governor 'user_space'
[    0.598991] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.599028] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to [bus =
06-38] add_size 1000
[    0.599029] pci 0000:04:04.0: bridge window [io  0x1000-0x0fff] to [bus =
3a-6d] add_size 1000
[    0.599030] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to [bus =
04-6d] add_size 2000
[    0.599031] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus =
03-6d] add_size 3000
[    0.599039] pci 0000:00:15.0: BAR 0: assigned [mem 0x4f800000-0x4f800fff=
 64bit]
[    0.599096] pci 0000:00:15.1: BAR 0: assigned [mem 0x4f801000-0x4f801fff=
 64bit]
[    0.599149] pci 0000:00:1d.0: BAR 13: assigned [io  0x4000-0x6fff]
[    0.599150] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.599153] pci 0000:00:1c.0:   bridge window [mem 0xdc400000-0xdc4fffff]
[    0.599158] pci 0000:00:1c.6: PCI bridge to [bus 02]
[    0.599160] pci 0000:00:1c.6:   bridge window [mem 0xdc000000-0xdc1fffff]
[    0.599165] pci 0000:03:00.0: BAR 13: assigned [io  0x4000-0x5fff]
[    0.599166] pci 0000:04:01.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.599167] pci 0000:04:04.0: BAR 13: assigned [io  0x5000-0x5fff]
[    0.599167] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.599171] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[    0.599179] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.599180] pci 0000:04:01.0:   bridge window [io  0x4000-0x4fff]
[    0.599184] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[    0.599187] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff=
 64bit pref]
[    0.599192] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.599196] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[    0.599203] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[    0.599205] pci 0000:04:04.0:   bridge window [io  0x5000-0x5fff]
[    0.599209] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[    0.599212] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff=
 64bit pref]
[    0.599218] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[    0.599220] pci 0000:03:00.0:   bridge window [io  0x4000-0x5fff]
[    0.599224] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.599227] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.599231] pci 0000:00:1d.0: PCI bridge to [bus 03-6d]
[    0.599233] pci 0000:00:1d.0:   bridge window [io  0x4000-0x6fff]
[    0.599235] pci 0000:00:1d.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.599237] pci 0000:00:1d.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.599240] pci 0000:00:1d.4: PCI bridge to [bus 6e]
[    0.599243] pci 0000:00:1d.4:   bridge window [mem 0xdc300000-0xdc3fffff]
[    0.599247] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.599248] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.599249] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.599249] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff windo=
w]
[    0.599250] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff windo=
w]
[    0.599251] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff windo=
w]
[    0.599251] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff wind=
ow]
[    0.599252] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff wind=
ow]
[    0.599253] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff wind=
ow]
[    0.599253] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff wind=
ow]
[    0.599254] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff wind=
ow]
[    0.599254] pci_bus 0000:00: resource 15 [mem 0x4f800000-0xdfffffff wind=
ow]
[    0.599255] pci_bus 0000:00: resource 16 [mem 0xfc800000-0xfe7fffff wind=
ow]
[    0.599256] pci_bus 0000:01: resource 1 [mem 0xdc400000-0xdc4fffff]
[    0.599257] pci_bus 0000:02: resource 1 [mem 0xdc000000-0xdc1fffff]
[    0.599257] pci_bus 0000:03: resource 0 [io  0x4000-0x6fff]
[    0.599258] pci_bus 0000:03: resource 1 [mem 0xac000000-0xda0fffff]
[    0.599258] pci_bus 0000:03: resource 2 [mem 0x60000000-0xa9ffffff 64bit=
 pref]
[    0.599259] pci_bus 0000:04: resource 0 [io  0x4000-0x5fff]
[    0.599260] pci_bus 0000:04: resource 1 [mem 0xac000000-0xda0fffff]
[    0.599260] pci_bus 0000:04: resource 2 [mem 0x60000000-0xa9ffffff 64bit=
 pref]
[    0.599261] pci_bus 0000:05: resource 1 [mem 0xda000000-0xda0fffff]
[    0.599261] pci_bus 0000:06: resource 0 [io  0x4000-0x4fff]
[    0.599262] pci_bus 0000:06: resource 1 [mem 0xac000000-0xc3efffff]
[    0.599263] pci_bus 0000:06: resource 2 [mem 0x60000000-0x7fffffff 64bit=
 pref]
[    0.599263] pci_bus 0000:39: resource 1 [mem 0xc3f00000-0xc3ffffff]
[    0.599264] pci_bus 0000:3a: resource 0 [io  0x5000-0x5fff]
[    0.599264] pci_bus 0000:3a: resource 1 [mem 0xc4000000-0xd9ffffff]
[    0.599265] pci_bus 0000:3a: resource 2 [mem 0x80000000-0xa9ffffff 64bit=
 pref]
[    0.599265] pci_bus 0000:6e: resource 1 [mem 0xdc300000-0xdc3fffff]
[    0.599371] NET: Registered protocol family 2
[    0.599460] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5,=
 131072 bytes, linear)
[    0.599499] TCP established hash table entries: 131072 (order: 8, 104857=
6 bytes, linear)
[    0.599651] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,=
 linear)
[    0.599806] TCP: Hash tables configured (established 131072 bind 65536)
[    0.599828] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.599882] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, l=
inear)
[    0.599943] NET: Registered protocol family 1
[    0.599946] NET: Registered protocol family 44
[    0.599952] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.600437] pci 0000:03:00.0: CLS mismatch (64 !=3D 128), using 64 bytes
[    0.600519] pci 0000:03:00.0: enabling device (0006 -> 0007)
[    0.600689] Trying to unpack rootfs image as initramfs...
[    0.921174] Freeing initrd memory: 30344K
[    0.927273] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.927275] software IO TLB: mapped [mem 0x2b83e000-0x2f83e000] (64MB)
[    0.930130] Initialise system trusted keyrings
[    0.930154] Key type blacklist registered
[    0.930190] workingset: timestamp_bits=3D36 max_order=3D22 bucket_order=
=3D0
[    0.931678] zbud: loaded
[    0.932320] Platform Keyring initialized
[    0.936678] NET: Registered protocol family 38
[    0.936679] Key type asymmetric registered
[    0.936680] Asymmetric key parser 'x509' registered
[    0.936686] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.936723] io scheduler mq-deadline registered
[    0.936724] io scheduler kyber registered
[    0.936745] io scheduler bfq registered
[    0.936816] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    0.937149] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.937366] pcieport 0000:00:1c.6: PME: Signaling with IRQ 123
[    0.937470] pcieport 0000:00:1d.0: PME: Signaling with IRQ 124
[    0.937490] pcieport 0000:00:1d.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    0.937729] pcieport 0000:00:1d.4: PME: Signaling with IRQ 125
[    0.938049] pcieport 0000:04:01.0: enabling device (0006 -> 0007)
[    0.938158] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL=
=2D AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    0.938386] pcieport 0000:04:04.0: enabling device (0006 -> 0007)
[    0.938485] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL=
=2D AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    0.938635] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.938653] efifb: probing for efifb
[    0.938666] efifb: showing boot graphics
[    0.942343] efifb: framebuffer at 0x50000000, using 32400k, total 32400k
[    0.942343] efifb: mode is 3840x2160x32, linelength=3D15360, pages=3D1
[    0.942344] efifb: scrolling: redraw
[    0.942344] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.942374] fbcon: Deferring console take-over
[    0.942375] fb0: EFI VGA frame buffer device
[    0.942380] intel_idle: MWAIT substates: 0x11142120
[    0.942381] intel_idle: v0.4.1 model 0x8E
[    0.942757] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.946508] ACPI: AC Adapter [AC] (off-line)
[    0.946589] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input0
[    0.946597] ACPI: Lid Switch [LID0]
[    0.946616] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input1
[    0.946621] ACPI: Power Button [PBTN]
[    0.946637] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input2
[    0.946644] ACPI: Sleep Button [SBTN]
[    0.948684] thermal LNXTHERM:00: registered as thermal_zone0
[    0.948685] ACPI: Thermal Zone [THM] (25 C)
[    0.948861] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.950447] Non-volatile memory driver v1.3
[    0.950493] Linux agpgart interface v0.103
[    0.977445] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.980726] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.999346] libphy: Fixed MDIO Bus: probed
[    0.999416] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.999430] ehci-pci: EHCI PCI platform driver
[    0.999442] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.999443] ohci-pci: OHCI PCI platform driver
[    0.999448] uhci_hcd: USB Universal Host Controller Interface driver
[    0.999545] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.999618] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 1
[    1.000688] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
10 quirks 0x0000000000009810
[    1.000691] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    1.000820] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.03
[    1.000821] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.000823] usb usb1: Product: xHCI Host Controller
[    1.000825] usb usb1: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    1.000825] usb usb1: SerialNumber: 0000:00:14.0
[    1.000922] hub 1-0:1.0: USB hub found
[    1.000937] hub 1-0:1.0: 12 ports detected
[    1.001638] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.001687] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 2
[    1.001689] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.001707] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.03
[    1.001708] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.001708] usb usb2: Product: xHCI Host Controller
[    1.001709] usb usb2: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    1.001709] usb usb2: SerialNumber: 0000:00:14.0
[    1.001789] hub 2-0:1.0: USB hub found
[    1.001797] hub 2-0:1.0: 6 ports detected
[    1.001942] usb: port power management may be unreliable
[    1.002159] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    1.002221] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus =
number 3
[    1.003383] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0x1=
10 quirks 0x0000000200009810
[    1.003547] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.03
[    1.003548] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.003548] usb usb3: Product: xHCI Host Controller
[    1.003549] usb usb3: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    1.003549] usb usb3: SerialNumber: 0000:39:00.0
[    1.003627] hub 3-0:1.0: USB hub found
[    1.003633] hub 3-0:1.0: 2 ports detected
[    1.003841] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    1.003890] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus =
number 4
[    1.003891] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    1.003909] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.03
[    1.003909] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.003910] usb usb4: Product: xHCI Host Controller
[    1.003910] usb usb4: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    1.003911] usb usb4: SerialNumber: 0000:39:00.0
[    1.003978] hub 4-0:1.0: USB hub found
[    1.003983] hub 4-0:1.0: 2 ports detected
[    1.004127] usbcore: registered new interface driver usbserial_generic
[    1.004129] usbserial: USB Serial support registered for generic
[    1.004151] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[    1.004591] i8042: Warning: Keylock active
[    1.006277] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.006291] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.006384] mousedev: PS/2 mouse device common for all mice
[    1.006677] rtc_cmos 00:02: RTC can wake from S4
[    1.007658] rtc_cmos 00:02: registered as rtc0
[    1.007658] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes nvram
[    1.007694] device-mapper: uevent: version 1.0.3
[    1.007765] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised:=
 dm-devel@redhat.com
[    1.007888] intel_pstate: Intel P-state driver initializing
[    1.008149] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input3
[    1.008699] intel_pstate: HWP enabled
[    1.008918] hidraw: raw HID events driver (C) Jiri Kosina
[    1.008935] usbcore: registered new interface driver usbhid
[    1.008935] usbhid: USB HID core driver
[    1.008979] intel_pmc_core INT33A1:00:  initialized
[    1.009028] drop_monitor: Initializing network drop monitor service
[    1.009111] Initializing XFRM netlink socket
[    1.009193] NET: Registered protocol family 10
[    1.012214] Segment Routing with IPv6
[    1.012233] mip6: Mobile IPv6
[    1.012234] NET: Registered protocol family 17
[    1.013041] RAS: Correctable Errors collector initialized.
[    1.013060] microcode: sig=3D0x806eb, pf=3D0x80, revision=3D0xca
[    1.013165] microcode: Microcode Update Driver: v2.2.
[    1.013172] AVX2 version of gcm_enc/dec engaged.
[    1.013173] AES CTR mode by8 optimization enabled
[    1.041252] sched_clock: Marking stable (1035793936, 5452377)->(10581870=
96, -16940783)
[    1.041632] registered taskstats version 1
[    1.041638] Loading compiled-in X.509 certificates
[    1.062974] Loaded X.509 cert 'Fedora kernel signing key: 70738b6865ae04=
583ee7b9d87c5795efc30cc4af'
[    1.062989] zswap: loaded using pool lzo/zbud
[    1.068797] Key type big_key registered
[    1.071459] Key type encrypted registered
[    1.072647] integrity: Loading X.509 certificate: UEFI:db
[    1.072662] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc88=
0660055ba0bc131886bb630a639e7'
[    1.072663] integrity: Loading X.509 certificate: UEFI:db
[    1.072675] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.072676] integrity: Loading X.509 certificate: UEFI:db
[    1.072691] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.073852] ima: Allocated hash algorithm: sha256
[    1.099382] No architecture policies found
[    1.100636] PM:   Magic number: 15:91:74
[    1.100989] rtc_cmos 00:02: setting system clock to 2019-12-05T11:04:43 =
UTC (1575543883)
[    1.326520] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    1.470671] usb 1-5: New USB device found, idVendor=3D0c45, idProduct=3D=
6723, bcdDevice=3D80.08
[    1.470676] usb 1-5: New USB device strings: Mfr=3D2, Product=3D1, Seria=
lNumber=3D0
[    1.470679] usb 1-5: Product: Integrated_Webcam_HD
[    1.470682] usb 1-5: Manufacturer: CN09357GLOG008CLA26CA01
[    1.587381] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    1.714389] usb 1-7: config 1 interface 1 altsetting 0 endpoint 0x83 has=
 wMaxPacketSize 0, skipping
[    1.714394] usb 1-7: config 1 interface 1 altsetting 0 endpoint 0x3 has =
wMaxPacketSize 0, skipping
[    1.714403] usb 1-7: New USB device found, idVendor=3D0489, idProduct=3D=
e0a2, bcdDevice=3D 0.01
[    1.714406] usb 1-7: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    1.838569] psmouse serio1: synaptics: queried max coordinates: x [..566=
6], y [..4734]
[    1.867527] psmouse serio1: synaptics: queried min coordinates: x [1276.=
=2E], y [1118..]
[    1.867538] psmouse serio1: synaptics: Your touchpad (PNP: DLL08af PNP0f=
13) says it can support a different bus. If i2c-hid and hid-rmi are not use=
d, you might want to try setting psmouse.synaptics_intertouch to 1 and repo=
rt this to linux-input@vger.kernel.org.
[    1.925051] psmouse serio1: synaptics: Touchpad model: 1, fw: 9.16, id: =
0x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x500000, board id: 3038, fw id: =
2767034
[    1.940400] tsc: Refined TSC clocksource calibration: 1991.995 MHz
[    1.940436] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x396=
d48bcfa5, max_idle_ns: 881590611924 ns
[    1.940514] clocksource: Switched to clocksource tsc
[    1.961880] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042=
/serio1/input/input5
[    1.967323] Freeing unused decrypted memory: 2040K
[    1.968241] Freeing unused kernel image memory: 2276K
[    1.968252] Write protecting the kernel read-only data: 20480k
[    1.969360] Freeing unused kernel image memory: 2016K
[    1.969615] Freeing unused kernel image memory: 1576K
[    1.975202] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.975206] rodata_test: all tests were successful
[    1.975207] Run /init as init process
[    2.055698] systemd[1]: systemd v243.4-1.fc31 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[    2.067556] systemd[1]: Detected architecture x86-64.
[    2.067558] systemd[1]: Running in initial RAM disk.
[    2.067582] systemd[1]: Set hostname to <dalek>.
[    2.107544] systemd[1]: Created slice system-systemd\x2dhibernate\x2dres=
ume.slice.
[    2.107605] systemd[1]: Reached target Slices.
[    2.107615] systemd[1]: Reached target Swap.
[    2.107620] systemd[1]: Reached target Timers.
[    2.107749] systemd[1]: Listening on Journal Audit Socket.
[    2.107824] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.124591] fuse: init (API version 7.31)
[    2.348495] audit: type=3D1130 audit(1575543884.746:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-jour=
nald comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    2.418500] audit: type=3D1130 audit(1575543884.816:3): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
d comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? t=
erminal=3D? res=3Dsuccess'
[    2.487590] audit: type=3D1130 audit(1575543884.885:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
=2Dtrigger comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
[    2.503501] audit: type=3D1130 audit(1575543884.901:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dplymouth-sta=
rt comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? =
terminal=3D? res=3Dsuccess'
[    2.513386] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.513467] wmi_bus wmi_bus-PNP0C14:03: WQBC data block query control me=
thod not found
[    2.513468] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.513788] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    2.516453] acpi PNP0C14:04: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.523868] acpi PNP0C14:05: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.545577] nvme nvme0: pci function 0000:6e:00.0
[    2.678305] checking generic (50000000 1fa4000) vs hw (50000000 10000000)
[    2.678306] fb0: switching to inteldrmfb from EFI VGA
[    2.678432] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.680189] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.680189] [drm] Driver supports precise vblank timestamp query.
[    2.681053] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[    2.681566] [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin=
 (v1.4)
[    2.711973] [drm] Initialized i915 1.6.0 20190619 for 0000:00:02.0 on mi=
nor 0
[    2.714261] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: n=
o)
[    2.714917] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:00/input/input6
[    2.722959] fbcon: i915drmfb (fb0) is primary device
[    2.722960] fbcon: Deferring console take-over
[    2.722963] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    2.757373] nvme nvme0: Shutdown timeout set to 8 seconds
[    2.771443] nvme nvme0: 8/0/0 default/read/poll queues
[    2.784891]  nvme0n1: p1 p2
[    3.170415] PM: Image not found (code -22)
[    3.172738] audit: type=3D1130 audit(1575543885.570:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-hibe=
rnate-resume@dev-mapper-dalek\x2dswap comm=3D"systemd" exe=3D"/usr/lib/syst=
emd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    3.172747] audit: type=3D1131 audit(1575543885.570:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-hibe=
rnate-resume@dev-mapper-dalek\x2dswap comm=3D"systemd" exe=3D"/usr/lib/syst=
emd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    3.194087] audit: type=3D1130 audit(1575543885.591:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-tmpf=
iles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
[    3.208758] audit: type=3D1130 audit(1575543885.606:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Ddracut-initq=
ueue comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    3.241190] audit: type=3D1130 audit(1575543885.638:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-fsc=
k-root comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dsuccess'
[    3.255175] EXT4-fs (dm-0): mounted filesystem with ordered data mode. O=
pts: (null)
[    4.142715] systemd-journald[309]: Received SIGTERM from PID 1 (systemd).
[    4.155698] printk: systemd: 23 output lines suppressed due to ratelimit=
ing
[    4.523618] SELinux:  policy capability network_peer_controls=3D1
[    4.523619] SELinux:  policy capability open_perms=3D1
[    4.523619] SELinux:  policy capability extended_socket_class=3D1
[    4.523620] SELinux:  policy capability always_check_network=3D0
[    4.523620] SELinux:  policy capability cgroup_seclabel=3D1
[    4.523620] SELinux:  policy capability nnp_nosuid_transition=3D1
[    4.543090] systemd[1]: Successfully loaded SELinux policy in 352.123ms.
[    4.572689] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 16.884ms.
[    4.574757] systemd[1]: systemd v243.4-1.fc31 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[    4.586423] systemd[1]: Detected architecture x86-64.
[    4.586638] systemd[1]: Set hostname to <dalek>.
[    4.670832] systemd[1]: /usr/lib/systemd/system/sssd.service:12: PIDFile=
=3D references a path below legacy directory /var/run/, updating /var/run/s=
ssd.pid =E2=86=92 /run/sssd.pid; please update the unit file accordingly.
[    4.683921] systemd[1]: /usr/lib/systemd/system/iscsiuio.service:13: PID=
=46ile=3D references a path below legacy directory /var/run/, updating /var=
/run/iscsiuio.pid =E2=86=92 /run/iscsiuio.pid; please update the unit file =
accordingly.
[    4.684113] systemd[1]: /usr/lib/systemd/system/iscsid.service:11: PIDFi=
le=3D references a path below legacy directory /var/run/, updating /var/run=
/iscsid.pid =E2=86=92 /run/iscsid.pid; please update the unit file accordin=
gly.
[    4.692764] systemd[1]: /usr/lib/systemd/system/sssd-kcm.socket:7: Liste=
nStream=3D references a path below legacy directory /var/run/, updating /va=
r/run/.heim_org.h5l.kcm-socket =E2=86=92 /run/.heim_org.h5l.kcm-socket; ple=
ase update the unit file accordingly.
[    4.693516] systemd[1]: /usr/lib/systemd/system/pcscd.socket:5: ListenSt=
ream=3D references a path below legacy directory /var/run/, updating /var/r=
un/pcscd/pcscd.comm =E2=86=92 /run/pcscd/pcscd.comm; please update the unit=
 file accordingly.
[    4.694108] systemd[1]: /usr/lib/systemd/system/cups.socket:6: ListenStr=
eam=3D references a path below legacy directory /var/run/, updating /var/ru=
n/cups/cups.sock =E2=86=92 /run/cups/cups.sock; please update the unit file=
 accordingly.
[    4.717710] systemd[1]: initrd-switch-root.service: Succeeded.
[    4.740231] Adding 8388604k swap on /dev/mapper/dalek-swap.  Priority:-2=
 extents:1 across:8388604k SSFS
[    4.742984] EXT4-fs (dm-0): re-mounted. Opts: (null)
[    4.961500] systemd-journald[657]: Received client request to flush runt=
ime journal.
[    5.131643] input: Intel HID events as /devices/platform/INT33D5:00/inpu=
t/input7
[    5.132331] intel-hid INT33D5:00: platform supports 5 button array
[    5.132371] input: Intel HID 5 button array as /devices/platform/INT33D5=
:00/input/input8
[    5.210809] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    5.232136] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    5.246234] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    5.246905] mc: Linux media interface: v0.10
[    5.247549] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    5.275197] intel_rapl_common: Found RAPL domain package
[    5.275199] intel_rapl_common: Found RAPL domain dram
[    5.275365] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THE=
RMAL_PCI
[    5.307733] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    5.307807] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    5.320330] videodev: Linux video capture interface: v2.00
[    5.324109] dcdbas dcdbas: Dell Systems Management Base Driver (version =
5.6.0-3.3)
[    5.351361] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.351485] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360=
 ms ovfl timer
[    5.351486] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.351487] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.351488] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    5.351488] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.351489] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    5.353071] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.359669] Bluetooth: Core ver 2.22
[    5.359692] NET: Registered protocol family 31
[    5.359692] Bluetooth: HCI device and connection manager initialized
[    5.359696] Bluetooth: HCI socket layer initialized
[    5.359698] Bluetooth: L2CAP socket layer initialized
[    5.359702] Bluetooth: SCO socket layer initialized
[    5.360522] input: Dell WMI hotkeys as /devices/platform/PNP0C14:03/wmi_=
bus/wmi_bus-PNP0C14:03/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input9
[    5.412997] i2c_hid i2c-ELAN292F:00: i2c-ELAN292F:00 supply vdd not foun=
d, using dummy regulator
[    5.413018] i2c_hid i2c-ELAN292F:00: i2c-ELAN292F:00 supply vddl not fou=
nd, using dummy regulator
[    5.432475] usbcore: registered new interface driver btusb
[    5.434509] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000=
302.bin
[    5.434511] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware=
 rome 0x302 build 0x111
[    5.437381] input: ELAN292F:00 04F3:292F Touchscreen as /devices/pci0000=
:00/0000:00:15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001=
/input/input10
[    5.438361] input: ELAN292F:00 04F3:292F as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001/input/input=
11
[    5.438420] input: ELAN292F:00 04F3:292F as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001/input/input=
12
[    5.439841] hid-generic 0018:04F3:292F.0001: input,hidraw0: I2C HID v1.0=
0 Device [ELAN292F:00 04F3:292F] on i2c-ELAN292F:00
[    5.480795] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    5.481989] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    5.482496] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0c45:6=
723)
[    5.487629] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not=
 initialized!
[    5.487631] uvcvideo 1-5:1.0: Entity type for entity Extension 3 was not=
 initialized!
[    5.487633] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was no=
t initialized!
[    5.487634] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not in=
itialized!
[    5.487720] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:0=
0/0000:00:14.0/usb1/1-5/1-5:1.0/input/input14
[    5.487815] usbcore: registered new interface driver uvcvideo
[    5.487816] USB Video Class driver (1.1.1)
[    5.488678] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
[    5.541406] intel_rapl_common: Found RAPL domain package
[    5.541408] intel_rapl_common: Found RAPL domain core
[    5.541409] intel_rapl_common: Found RAPL domain uncore
[    5.541410] intel_rapl_common: Found RAPL domain dram
[    5.548977] kauditd_printk_skb: 46 callbacks suppressed
[    5.548978] audit: type=3D1130 audit(1575543887.946:57): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-rfkill comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.585893] iTCO_vendor_support: vendor-support=3D0
[    5.594092] audit: type=3D1130 audit(1575543887.991:58): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-ask-password-plymouth comm=3D"systemd" exe=3D"/usr/lib/s=
ystemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.605306] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    5.605403] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x=
00c5fffc-0x00c5ffff]
[    5.605406] iTCO_wdt: probe of iTCO_wdt failed with error -16
[    5.624705] audit: type=3D1130 audit(1575543888.022:59): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dlvm2-monitor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.626422] i2c_hid i2c-DELL08AF:00: i2c-DELL08AF:00 supply vdd not foun=
d, using dummy regulator
[    5.626445] i2c_hid i2c-DELL08AF:00: i2c-DELL08AF:00 supply vddl not fou=
nd, using dummy regulator
[    5.627685] audit: type=3D1130 audit(1575543888.022:60): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dlvm2-pvscan@259:2 comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.644598] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[    5.650111] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    5.658488] input: DELL08AF:00 06CB:76AF Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-9/i2c-DELL08AF:00/0018:06CB:76AF.0002/input=
/input15
[    5.659255] input: DELL08AF:00 06CB:76AF Touchpad as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-9/i2c-DELL08AF:00/0018:06CB:76AF.0002/in=
put/input16
[    5.659444] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.0=
0 Mouse [DELL08AF:00 06CB:76AF] on i2c-DELL08AF:00
[    5.666746] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.669120] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_aud=
io_component_bind_ops [i915])
[    5.724278] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3271: l=
ine_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    5.724280] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    5.724282] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[    5.724283] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[    5.724284] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    5.724285] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
[    5.724287] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=3D0x1b
[    5.724288] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
[    5.787226] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/00=
00:00:1f.3/sound/card0/input18
[    5.793688] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input19
[    5.801410] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input20
[    5.809393] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input21
[    5.809486] input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input22
[    5.809581] input: HDA Intel PCH HDMI/DP,pcm=3D10 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input23
[    5.822644] input: ELAN292F:00 04F3:292F as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001/input/input=
24
[    5.822789] hid-multitouch 0018:04F3:292F.0001: input,hidraw0: I2C HID v=
1.00 Device [ELAN292F:00 04F3:292F] on i2c-ELAN292F:00
[    5.831168] leds platform::micmute: Setting an LED's brightness failed (=
=2D19)
[    5.832233] i2c_hid i2c-ELAN292F:00: i2c_hid_get_input: IRQ triggered bu=
t there's no data
[    5.840989] audit: type=3D1130 audit(1575543888.238:61): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-backlight@leds:dell::kbd_backlight comm=3D"systemd" exe=
=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsucc=
ess'
[    5.854646] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chi=
p_id 0x00340aff sub 1a56:143a
[    5.854650] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0=
 dfs 0 testmode 0
[    5.855177] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00140-QC=
ARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 29eb8ca1
[    5.884292] input: DELL08AF:00 06CB:76AF Touchpad as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-9/i2c-DELL08AF:00/0018:06CB:76AF.0002/in=
put/input29
[    5.884394] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v=
1.00 Mouse [DELL08AF:00 06CB:76AF] on i2c-DELL08AF:00
[    5.918933] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 4=
ed3569e
[    5.992691] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[    5.993028] audit: type=3D1130 audit(1575543888.390:62): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-udev-settle comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.011948] audit: type=3D1130 audit(1575543888.409:63): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddmraid-activation comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.011951] audit: type=3D1131 audit(1575543888.409:64): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddmraid-activation comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    6.012101] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal =
otp max-sta 32 raw 0 hwcrypto 1
[    6.044473] audit: type=3D1130 audit(1575543888.442:65): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-disk-by\x2duuid-A4EF\x2d2338 comm=3D"systemd" e=
xe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsu=
ccess'
[    6.074097] ath: EEPROM regdomain: 0x6c
[    6.074098] ath: EEPROM indicates we should expect a direct regpair map
[    6.074099] ath: Country alpha2 being used: 00
[    6.074099] ath: Regpair used: 0x6c
[    6.081978] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[   11.094874] audit: type=3D1131 audit(1575543893.492:66): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-rfkill comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.561834] audit: type=3D1130 audit(1575543894.959:67): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-cryptsetup@luks\x2dca346aed\x2dfe1e\x2d40a5\x2dbdc9\x2d9=
2a20c589575 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? =
addr=3D? terminal=3D? res=3Dsuccess'
[   12.578939] audit: type=3D1130 audit(1575543894.976:68): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-mapper-luks\x2dca346aed\x2dfe1e\x2d40a5\x2dbdc9=
\x2d92a20c589575 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=
=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.594889] EXT4-fs (dm-3): mounted filesystem with ordered data mode. O=
pts: (null)
[   12.605626] audit: type=3D1130 audit(1575543895.003:69): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddracut-shutdown comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.621184] audit: type=3D1130 audit(1575543895.018:70): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dplymouth-read-write comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.621218] audit: type=3D1131 audit(1575543895.018:71): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dplymouth-read-write comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.656576] audit: type=3D1130 audit(1575543895.054:72): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dimport-state comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.695047] audit: type=3D1130 audit(1575543895.092:73): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-tmpfiles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/=
systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.705029] audit: type=3D1305 audit(1575543895.102:74): op=3Dset audit_=
enabled=3D1 old=3D1 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:syst=
em_r:auditd_t:s0 res=3D1
[   12.705031] audit: type=3D1305 audit(1575543895.102:75): op=3Dset audit_=
pid=3D892 old=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system=
_r:auditd_t:s0 res=3D1
[   12.726582] RPC: Registered named UNIX socket transport module.
[   12.726583] RPC: Registered udp transport module.
[   12.726584] RPC: Registered tcp transport module.
[   12.726584] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   13.030131] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   13.030132] Bluetooth: BNEP filters: protocol multicast
[   13.030136] Bluetooth: BNEP socket layer initialized
[   13.830628] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[   14.129120] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[   14.326628] broken atomic modeset userspace detected, disabling atomic
[   15.909235] Bluetooth: RFCOMM TTY layer initialized
[   15.909241] Bluetooth: RFCOMM socket layer initialized
[   15.909295] Bluetooth: RFCOMM ver 1.11
[   30.783203] usb 1-1: new high-speed USB device number 4 using xhci_hcd
[   30.925209] usb 1-1: New USB device found, idVendor=3D0e8d, idProduct=3D=
1887, bcdDevice=3D 0.00
[   30.925214] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   30.925218] usb 1-1: Product: HP External USB Optical Drive
[   30.925220] usb 1-1: Manufacturer: Hewlett-Packard Company
[   30.925223] usb 1-1: SerialNumber: KZ6E4D43127        =20
[   30.957047] usb-storage 1-1:1.0: USB Mass Storage device detected
[   30.957125] scsi host0: usb-storage 1-1:1.0
[   30.957207] usbcore: registered new interface driver usb-storage
[   32.029105] scsi 0:0:0:0: CD-ROM            hp       CDDVDW GP60NB50  RP=
02 PQ: 0 ANSI: 0
[   32.035956] sr 0:0:0:0: Power-on or device reset occurred
[   32.051212] sr 0:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd=
/rw xa/form2 cdda tray
[   32.051218] cdrom: Uniform CD-ROM driver Revision: 3.20
[   32.052301] sr 0:0:0:0: Attached scsi CD-ROM sr0
[   32.052770] sr 0:0:0:0: Attached scsi generic sg0 type 5
[   32.190964] pktcdvd: pktcdvd0: writer mapped to sr0
[   44.683679] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[   44.683686] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[   44.683691] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[   44.683697] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 02 00 00 0=
0 02 00 00 00
[   44.683702] blk_update_request: I/O error, dev sr0, sector 2048 op 0x0:(=
READ) flags 0x80700 phys_seg 1 prio class 0
[   44.824391] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[   44.824397] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[   44.824402] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[   44.824407] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 02 01 00 0=
0 01 00 00 00
[   44.824412] blk_update_request: I/O error, dev sr0, sector 2052 op 0x0:(=
READ) flags 0x0 phys_seg 1 prio class 0
[   44.824416] Buffer I/O error on dev sr0, logical block 513, async page r=
ead
[   45.662929] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[   45.662936] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[   45.662941] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[   45.662946] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 07 fe 80 00 0=
0 3c 00 00 00
[   45.662977] blk_update_request: I/O error, dev sr0, sector 2095616 op 0x=
0:(READ) flags 0x80700 phys_seg 30 prio class 0
[   45.734237] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[   45.734243] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[   45.734248] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[   45.734253] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 07 fe 80 00 0=
0 01 00 00 00
[   45.734258] blk_update_request: I/O error, dev sr0, sector 2095616 op 0x=
0:(READ) flags 0x0 phys_seg 1 prio class 0
[   45.734263] Buffer I/O error on dev sr0, logical block 523904, async pag=
e read
[   45.805870] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[   45.805876] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[   45.805882] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[   45.805886] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 07 fe 81 00 0=
0 01 00 00 00
[   45.805891] blk_update_request: I/O error, dev sr0, sector 2095620 op 0x=
0:(READ) flags 0x0 phys_seg 1 prio class 0
[   45.805896] Buffer I/O error on dev sr0, logical block 523905, async pag=
e read
[   51.461119] wlp2s0: authenticate with e0:91:f5:58:98:24
[   51.500658] wlp2s0: send auth to e0:91:f5:58:98:24 (try 1/3)
[   51.504253] wlp2s0: authenticated
[   51.511944] wlp2s0: associate with e0:91:f5:58:98:24 (try 1/3)
[   51.519740] wlp2s0: RX AssocResp from e0:91:f5:58:98:24 (capab=3D0x431 s=
tatus=3D0 aid=3D1)
[   51.522737] wlp2s0: associated
[   51.522964] ath: EEPROM regdomain: 0x8114
[   51.522966] ath: EEPROM indicates we should expect a country code
[   51.522967] ath: doing EEPROM country->regdmn map search
[   51.522969] ath: country maps to regdmn code: 0x37
[   51.522971] ath: Country alpha2 being used: DE
[   51.522972] ath: Regpair used: 0x37
[   51.522974] ath: regdomain 0x8114 dynamically updated by country element
[   51.559437] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready

--nextPart1900202.VYddPnLWQK
Content-Disposition: attachment; filename="dmesg_working"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; name="dmesg_working"

[    0.000000] microcode: microcode updated early to revision 0xca, date =
=3D 2019-10-03
[    0.000000] Linux version 5.3.13-300.fc31.x86_64 (mockbuild@bkernel04.ph=
x2.fedoraproject.org) (gcc version 9.2.1 20190827 (Red Hat 9.2.1-1) (GCC)) =
#1 SMP Mon Nov 25 17:25:25 UTC 2019
[    0.000000] Command line: BOOT_IMAGE=3D(lvmid/2fpC6u-zHOJ-Jr5U-XaBQ-P0QB=
=2D3Cwd-7iVMYZ/M43qac-mfuc-oBTi-wezy-5poB-N7dU-qCxdCO)/boot/vmlinuz-5.3.13-=
300.fc31.x86_64 root=3D/dev/mapper/dalek-root ro resume=3D/dev/mapper/dalek=
=2Dswap rd.lvm.lv=3Ddalek/root rd.lvm.lv=3Ddalek/swap rhgb quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registe=
rs'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 b=
ytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e000-0x000000000009efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000034393fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000034394000-0x0000000034394fff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000034395000-0x0000000034395fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000034396000-0x000000003c314fff] usable
[    0.000000] BIOS-e820: [mem 0x000000003c315000-0x000000003f122fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003f123000-0x000000003f19ffff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x000000003f1a0000-0x000000003f26afff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x000000003f26b000-0x000000003fffefff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x000000003ffff000-0x000000003fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000040000000-0x0000000047ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000048000000-0x0000000048dfffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000048e00000-0x000000004f7fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000004ae7fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi:  ACPI 2.0=3D0x3f13c000  ACPI=3D0x3f13c000  SMBIOS=3D0xf=
0000  SMBIOS 3.0=3D0xf0020  TPMFinalLog=3D0x3f1c9000  ESRT=3D0x3fa95218  ME=
MATTR=3D0x39f2e018  TPMEventLog=3D0x3449c018=20
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.2.1 present.
[    0.000000] DMI: Dell Inc. XPS 13 9380/0KTW76, BIOS 1.7.0 08/05/2019
[    0.000000] tsc: Detected 2000.000 MHz processor
[    0.001053] tsc: Detected 1999.968 MHz TSC
[    0.001053] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.001054] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.001059] last_pfn =3D 0x4ae800 max_arch_pfn =3D 0x400000000
[    0.001061] MTRR default type: write-back
[    0.001062] MTRR fixed ranges enabled:
[    0.001063]   00000-9FFFF write-back
[    0.001063]   A0000-BFFFF uncachable
[    0.001064]   C0000-FFFFF write-protect
[    0.001064] MTRR variable ranges enabled:
[    0.001065]   0 base 0080000000 mask 7F80000000 uncachable
[    0.001066]   1 base 0060000000 mask 7FE0000000 uncachable
[    0.001066]   2 base 0050000000 mask 7FF0000000 write-combining
[    0.001066]   3 base 004C000000 mask 7FFC000000 uncachable
[    0.001067]   4 base 004B000000 mask 7FFF000000 uncachable
[    0.001067]   5 disabled
[    0.001068]   6 disabled
[    0.001068]   7 disabled
[    0.001068]   8 disabled
[    0.001068]   9 disabled
[    0.001552] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.001692] last_pfn =3D 0x48e00 max_arch_pfn =3D 0x400000000
[    0.007498] esrt: Reserving ESRT space from 0x000000003fa95218 to 0x0000=
00003fa95250.
[    0.007505] Using GB pages for direct mapping
[    0.007506] BRK [0x1f9001000, 0x1f9001fff] PGTABLE
[    0.007507] BRK [0x1f9002000, 0x1f9002fff] PGTABLE
[    0.007508] BRK [0x1f9003000, 0x1f9003fff] PGTABLE
[    0.007531] BRK [0x1f9004000, 0x1f9004fff] PGTABLE
[    0.007532] BRK [0x1f9005000, 0x1f9005fff] PGTABLE
[    0.007616] BRK [0x1f9006000, 0x1f9006fff] PGTABLE
[    0.007653] BRK [0x1f9007000, 0x1f9007fff] PGTABLE
[    0.007677] BRK [0x1f9008000, 0x1f9008fff] PGTABLE
[    0.007687] BRK [0x1f9009000, 0x1f9009fff] PGTABLE
[    0.007734] RAMDISK: [mem 0x2f841000-0x315e2fff]
[    0.007744] ACPI: Early table checksum verification disabled
[    0.007746] ACPI: RSDP 0x000000003F13C000 000024 (v02 DELL  )
[    0.007748] ACPI: XSDT 0x000000003F13C0B0 0000E4 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007751] ACPI: FACP 0x000000003F179720 000114 (v06 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007755] ACPI: DSDT 0x000000003F13C228 03D4F7 (v02 DELL   CBX3     01=
072009 INTL 20160527)
[    0.007756] ACPI: FACS 0x000000003F269C00 000040
[    0.007758] ACPI: APIC 0x000000003F179838 0000BC (v04 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007759] ACPI: FPDT 0x000000003F1798F8 000044 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007760] ACPI: FIDT 0x000000003F179940 00009C (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007762] ACPI: MCFG 0x000000003F1799E0 00003C (v01 DELL   CBX3     01=
072009 MSFT 00000097)
[    0.007763] ACPI: SSDT 0x000000003F179A20 001B1C (v02 CpuRef CpuSsdt  00=
003000 INTL 20160527)
[    0.007765] ACPI: BOOT 0x000000003F17B540 000028 (v01 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007767] ACPI: SSDT 0x000000003F17B568 001663 (v02 SaSsdt SaSsdt   00=
003000 INTL 20160527)
[    0.007768] ACPI: HPET 0x000000003F17CBD0 000038 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.007770] ACPI: SSDT 0x000000003F17CC08 001FE2 (v02 DELL\x WHL_Tbt_ 00=
001000 INTL 20160527)
[    0.007771] ACPI: SSDT 0x000000003F17EBF0 0030D7 (v02 INTEL  xh_whlt4 00=
000000 INTL 20160527)
[    0.007773] ACPI: NHLT 0x000000003F181CC8 00002D (v00 DELL\x CBX3     00=
000002      01000013)
[    0.007774] ACPI: UEFI 0x000000003F181CF8 000042 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.007776] ACPI: LPIT 0x000000003F181D40 000094 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.007777] ACPI: SSDT 0x000000003F181DD8 0027DE (v02 DELL\x PtidDevc 00=
001000 INTL 20160527)
[    0.007779] ACPI: SSDT 0x000000003F1845B8 00132E (v02 DELL\x TbtTypeC 00=
000000 INTL 20160527)
[    0.007780] ACPI: DBGP 0x000000003F1858E8 000034 (v01 DELL\x CBX3     00=
000002      01000013)
[    0.007782] ACPI: DBG2 0x000000003F185920 000054 (v00 DELL\x CBX3     00=
000002      01000013)
[    0.007783] ACPI: SSDT 0x000000003F185978 00081C (v02 DELL\x UsbCTabl 00=
001000 INTL 20160527)
[    0.007785] ACPI: SSDT 0x000000003F186198 007FBF (v02 DptfTa DptfTabl 00=
001000 INTL 20160527)
[    0.007786] ACPI: DMAR 0x000000003F18E158 0000A8 (v01 INTEL  EDK2     00=
000002      01000013)
[    0.007788] ACPI: SSDT 0x000000003F18E200 000144 (v02 Intel  ADebTabl 00=
001000 INTL 20160527)
[    0.007789] ACPI: BGRT 0x000000003F18E348 000038 (v00 DELL   CBX3     01=
072009 AMI  00010013)
[    0.007791] ACPI: TPM2 0x000000003F18E380 000034 (v04 DELL\x CBX3     00=
000001 AMI  00000000)
[    0.007796] ACPI: Local APIC address 0xfee00000
[    0.007968] No NUMA configuration found
[    0.007969] Faking a node at [mem 0x0000000000000000-0x00000004ae7fffff]
[    0.007989] NODE_DATA(0) allocated [mem 0x4ae7d5000-0x4ae7fffff]
[    0.049778] Zone ranges:
[    0.049778]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.049779]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.049780]   Normal   [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.049780]   Device   empty
[    0.049781] Movable zone start for each node
[    0.049783] Early memory node ranges
[    0.049783]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.049784]   node   0: [mem 0x000000000009f000-0x000000000009ffff]
[    0.049784]   node   0: [mem 0x0000000000100000-0x0000000034393fff]
[    0.049785]   node   0: [mem 0x0000000034396000-0x000000003c314fff]
[    0.049785]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.049785]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.049786]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.050261] Zeroed struct page in unavailable ranges: 44878 pages
[    0.050262] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7ff=
fff]
[    0.050263] On node 0 totalpages: 4110514
[    0.050264]   DMA zone: 64 pages used for memmap
[    0.050264]   DMA zone: 22 pages reserved
[    0.050265]   DMA zone: 3998 pages, LIFO batch:0
[    0.050296]   DMA32 zone: 3845 pages used for memmap
[    0.050296]   DMA32 zone: 246036 pages, LIFO batch:63
[    0.055502]   Normal zone: 60320 pages used for memmap
[    0.055503]   Normal zone: 3860480 pages, LIFO batch:63
[    0.096664] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7ffff=
f]
[    0.097131] ACPI: PM-Timer IO Port: 0x1808
[    0.097132] ACPI: Local APIC address 0xfee00000
[    0.097137] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.097137] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.097137] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.097138] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.097138] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.097138] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.097139] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.097139] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.097193] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.097195] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.097201] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.097207] ACPI: IRQ0 used by override.
[    0.097207] ACPI: IRQ9 used by override.
[    0.097211] Using ACPI (MADT) for SMP configuration information
[    0.097212] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.097216] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.097230] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.097231] PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
[    0.097232] PM: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.097233] PM: Registered nosave memory: [mem 0x34394000-0x34394fff]
[    0.097233] PM: Registered nosave memory: [mem 0x34395000-0x34395fff]
[    0.097234] PM: Registered nosave memory: [mem 0x3c315000-0x3f122fff]
[    0.097234] PM: Registered nosave memory: [mem 0x3f123000-0x3f19ffff]
[    0.097235] PM: Registered nosave memory: [mem 0x3f1a0000-0x3f26afff]
[    0.097235] PM: Registered nosave memory: [mem 0x3f26b000-0x3fffefff]
[    0.097236] PM: Registered nosave memory: [mem 0x40000000-0x47ffffff]
[    0.097237] PM: Registered nosave memory: [mem 0x48e00000-0x4f7fffff]
[    0.097237] PM: Registered nosave memory: [mem 0x4f800000-0xdfffffff]
[    0.097238] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.097238] PM: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.097238] PM: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.097239] PM: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.097239] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.097239] PM: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.097240] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.097240] PM: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.097240] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.097241] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.097242] Booting paravirtualized kernel on bare hardware
[    0.097244] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.167982] setup_percpu: NR_CPUS:1024 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.168190] percpu: Embedded 52 pages/cpu s176128 r8192 d28672 u262144
[    0.168199] pcpu-alloc: s176128 r8192 d28672 u262144 alloc=3D1*2097152
[    0.168202] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.168227] Built 1 zonelists, mobility grouping on.  Total pages: 40462=
63
[    0.168227] Policy zone: Normal
[    0.168229] Kernel command line: BOOT_IMAGE=3D(lvmid/2fpC6u-zHOJ-Jr5U-Xa=
BQ-P0QB-3Cwd-7iVMYZ/M43qac-mfuc-oBTi-wezy-5poB-N7dU-qCxdCO)/boot/vmlinuz-5.=
3.13-300.fc31.x86_64 root=3D/dev/mapper/dalek-root ro resume=3D/dev/mapper/=
dalek-swap rd.lvm.lv=3Ddalek/root rd.lvm.lv=3Ddalek/swap rhgb quiet
[    0.169477] Dentry cache hash table entries: 2097152 (order: 12, 1677721=
6 bytes, linear)
[    0.170100] Inode-cache hash table entries: 1048576 (order: 11, 8388608 =
bytes, linear)
[    0.170165] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.224125] Memory: 15970440K/16442056K available (12291K kernel code, 1=
542K rwdata, 4568K rodata, 2276K init, 4464K bss, 471616K reserved, 0K cma-=
reserved)
[    0.224231] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.224240] ftrace: allocating 40084 entries in 157 pages
[    0.236487] rcu: Hierarchical RCU implementation.
[    0.236488] rcu: 	RCU restricting CPUs from NR_CPUS=3D1024 to nr_cpu_ids=
=3D8.
[    0.236489] 	Tasks RCU enabled.
[    0.236489] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.236490] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.238412] NR_IRQS: 65792, nr_irqs: 2048, preallocated irqs: 16
[    0.238810] random: crng done (trusting CPU's manufacturer)
[    0.238830] Console: colour dummy device 80x25
[    0.238833] printk: console [tty0] enabled
[    0.238846] ACPI: Core revision 20190703
[    0.239191] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 79635855245 ns
[    0.239316] APIC: Switch to symmetric I/O mode setup
[    0.239318] DMAR: Host address width 39
[    0.239319] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.239323] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660=
462 ecap 19e2ff0505e
[    0.239323] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.239326] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c406604=
62 ecap f050da
[    0.239327] DMAR: RMRR base: 0x0000003f07f000 end: 0x0000003f09efff
[    0.239327] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.239329] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.239329] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.239330] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.241785] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.241786] x2apic enabled
[    0.241810] Switched APIC routing to cluster x2apic.
[    0.247909] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
=2D1
[    0.252231] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x39a8208cdd2, max_idle_ns: 881590748921 ns
[    0.252236] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 3999.93 BogoMIPS (lpj=3D1999968)
[    0.252238] pid_max: default: 32768 minimum: 301
[    0.254274] LSM: Security Framework initializing
[    0.254280] Yama: becoming mindful.
[    0.254286] SELinux:  Initializing.
[    0.254297] *** VALIDATE SELinux ***
[    0.254340] Mount-cache hash table entries: 32768 (order: 6, 262144 byte=
s, linear)
[    0.254394] Mountpoint-cache hash table entries: 32768 (order: 6, 262144=
 bytes, linear)
[    0.254517] *** VALIDATE proc ***
[    0.254552] *** VALIDATE cgroup1 ***
[    0.254553] *** VALIDATE cgroup2 ***
[    0.254594] mce: CPU0: Thermal monitoring enabled (TM1)
[    0.254609] process: using mwait in idle threads
[    0.254611] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.254611] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.254613] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.254614] Spectre V2 : Mitigation: Full generic retpoline
[    0.254615] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.254615] Spectre V2 : Enabling Restricted Speculation for firmware ca=
lls
[    0.254616] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.254616] Spectre V2 : User space: Mitigation: STIBP via seccomp and p=
rctl
[    0.254617] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    0.254619] MDS: Mitigation: Clear CPU buffers
[    0.254836] Freeing SMP alternatives memory: 36K
[    0.256294] TSC deadline timer enabled
[    0.256299] smpboot: CPU0: Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz (fam=
ily: 0x6, model: 0x8e, stepping: 0xb)
[    0.256383] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR,=
 full-width counters, Intel PMU driver.
[    0.256388] ... version:                4
[    0.256388] ... bit width:              48
[    0.256389] ... generic registers:      4
[    0.256389] ... value mask:             0000ffffffffffff
[    0.256389] ... max period:             00007fffffffffff
[    0.256390] ... fixed-purpose events:   3
[    0.256390] ... event mask:             000000070000000f
[    0.256417] rcu: Hierarchical SRCU implementation.
[    0.257074] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.257142] smp: Bringing up secondary CPUs ...
[    0.257189] x86: Booting SMP configuration:
[    0.257190] .... node  #0, CPUs:      #1 #2 #3 #4
[    0.259319] MDS CPU bug present and SMT on, data leak possible. See http=
s://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more de=
tails.
[    0.259335]  #5 #6 #7
[    0.260673] smp: Brought up 1 node, 8 CPUs
[    0.260673] smpboot: Max logical packages: 1
[    0.260673] smpboot: Total of 8 processors activated (31999.48 BogoMIPS)
[    0.261649] devtmpfs: initialized
[    0.261649] x86/mm: Memory block size: 128MB
[    0.262834] PM: Registering ACPI NVS region [mem 0x34394000-0x34394fff] =
(4096 bytes)
[    0.262834] PM: Registering ACPI NVS region [mem 0x3f1a0000-0x3f26afff] =
(831488 bytes)
[    0.262834] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.262834] futex hash table entries: 2048 (order: 5, 131072 bytes, line=
ar)
[    0.262834] pinctrl core: initialized pinctrl subsystem
[    0.262834] PM: RTC time: 11:08:32, date: 2019-12-05
[    0.263330] NET: Registered protocol family 16
[    0.263410] audit: initializing netlink subsys (disabled)
[    0.263414] audit: type=3D2000 audit(1575544112.019:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.263414] cpuidle: using governor menu
[    0.263414] Simple Boot Flag at 0x47 set to 0x80
[    0.263414] ACPI: bus type PCI registered
[    0.263414] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.263414] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000=
=2D0xefffffff] (base 0xe0000000)
[    0.263414] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.263414] PCI: Using configuration type 1 for base access
[    0.263953] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.265281] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.265281] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.352369] cryptd: max_cpu_qlen set to 1000
[    0.353433] alg: No test for lzo-rle (lzo-rle-generic)
[    0.353433] alg: No test for lzo-rle (lzo-rle-scomp)
[    0.354236] alg: No test for 842 (842-generic)
[    0.354240] alg: No test for 842 (842-scomp)
[    0.356236] ACPI: Added _OSI(Module Device)
[    0.356236] ACPI: Added _OSI(Processor Device)
[    0.356236] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.356236] ACPI: Added _OSI(Processor Aggregator Device)
[    0.356236] ACPI: Added _OSI(Linux-Dell-Video)
[    0.356236] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.356236] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.393582] ACPI: 10 ACPI AML tables successfully acquired and loaded
[    0.450831] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.461107] ACPI: Dynamic OEM Table Load:
[    0.461114] ACPI: SSDT 0xFFFF8B55DB9E2B00 0000F4 (v02 PmRef  Cpu0Psd  00=
003000 INTL 20160527)
[    0.462960] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
[    0.463935] ACPI: Dynamic OEM Table Load:
[    0.463941] ACPI: SSDT 0xFFFF8B55DBA5E400 000400 (v02 PmRef  Cpu0Cst  00=
003001 INTL 20160527)
[    0.465563] ACPI: Dynamic OEM Table Load:
[    0.465568] ACPI: SSDT 0xFFFF8B55DBD21800 00053F (v02 PmRef  Cpu0Ist  00=
003000 INTL 20160527)
[    0.467242] ACPI: Dynamic OEM Table Load:
[    0.467246] ACPI: SSDT 0xFFFF8B55DBE3C400 00011B (v02 PmRef  Cpu0Hwp  00=
003000 INTL 20160527)
[    0.468645] ACPI: Dynamic OEM Table Load:
[    0.468650] ACPI: SSDT 0xFFFF8B55DBD27000 000724 (v02 PmRef  HwpLvt   00=
003000 INTL 20160527)
[    0.470188] ACPI: Dynamic OEM Table Load:
[    0.470192] ACPI: SSDT 0xFFFF8B55DBD24800 0005FC (v02 PmRef  ApIst    00=
003000 INTL 20160527)
[    0.471606] ACPI: Dynamic OEM Table Load:
[    0.471610] ACPI: SSDT 0xFFFF8B55DBA58000 000317 (v02 PmRef  ApHwp    00=
003000 INTL 20160527)
[    0.473037] ACPI: Dynamic OEM Table Load:
[    0.473041] ACPI: SSDT 0xFFFF8B55DBD77000 000AB0 (v02 PmRef  ApPsd    00=
003000 INTL 20160527)
[    0.474640] ACPI: Dynamic OEM Table Load:
[    0.474644] ACPI: SSDT 0xFFFF8B55DBA5CC00 00030A (v02 PmRef  ApCst    00=
003000 INTL 20160527)
[    0.477999] ACPI: EC: EC started
[    0.478000] ACPI: EC: interrupt blocked
[    0.485348] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as first EC
[    0.485350] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x6e, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    0.485351] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions
[    0.485351] ACPI: Interpreter enabled
[    0.485389] ACPI: (supports S0 S3 S4 S5)
[    0.485390] ACPI: Using IOAPIC for interrupt routing
[    0.485445] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.485862] ACPI: Enabled 9 GPEs in block 00 to 7F
[    0.490209] ACPI: Power Resource [WRST] (on)
[    0.490239] ACPI: Power Resource [DRST] (on)
[    0.490486] ACPI: Power Resource [PXP] (on)
[    0.495675] ACPI: Power Resource [USBC] (on)
[    0.495790] ACPI: Power Resource [PAUD] (on)
[    0.498120] ACPI: Power Resource [V0PR] (on)
[    0.498221] ACPI: Power Resource [V1PR] (on)
[    0.498321] ACPI: Power Resource [V2PR] (on)
[    0.502330] ACPI: Power Resource [WRST] (on)
[    0.509957] ACPI: Power Resource [PIN] (off)
[    0.510236] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.510241] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI HPX-Type3]
[    0.511281] acpi PNP0A08:00: _OSC: platform does not support [AER]
[    0.513238] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotp=
lug PME PCIeCapability LTR]
[    0.513908] PCI host bridge to bus 0000:00
[    0.513909] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.513910] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.513911] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.513911] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3ff=
f window]
[    0.513912] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7ff=
f window]
[    0.513912] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbff=
f window]
[    0.513913] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cfff=
f window]
[    0.513913] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3ff=
f window]
[    0.513914] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7ff=
f window]
[    0.513915] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbff=
f window]
[    0.513915] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dfff=
f window]
[    0.513916] pci_bus 0000:00: root bus resource [mem 0x4f800000-0xdffffff=
f window]
[    0.513916] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7ffff=
f window]
[    0.513917] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.513924] pci 0000:00:00.0: [8086:3e34] type 00 class 0x060000
[    0.514019] pci 0000:00:02.0: [8086:3ea0] type 00 class 0x030000
[    0.514029] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
[    0.514034] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit=
 pref]
[    0.514037] pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
[    0.514048] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.514137] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.514147] pci 0000:00:04.0: reg 0x10: [mem 0xdc510000-0xdc517fff 64bit]
[    0.514274] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[    0.514286] pci 0000:00:08.0: reg 0x10: [mem 0xdc524000-0xdc524fff 64bit]
[    0.514418] pci 0000:00:12.0: [8086:9df9] type 00 class 0x118000
[    0.514440] pci 0000:00:12.0: reg 0x10: [mem 0xdc523000-0xdc523fff 64bit]
[    0.514599] pci 0000:00:14.0: [8086:9ded] type 00 class 0x0c0330
[    0.514616] pci 0000:00:14.0: reg 0x10: [mem 0xdc500000-0xdc50ffff 64bit]
[    0.514669] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.514772] pci 0000:00:14.2: [8086:9def] type 00 class 0x050000
[    0.514790] pci 0000:00:14.2: reg 0x10: [mem 0xdc51c000-0xdc51dfff 64bit]
[    0.514800] pci 0000:00:14.2: reg 0x18: [mem 0xdc522000-0xdc522fff 64bit]
[    0.514965] pci 0000:00:15.0: [8086:9de8] type 00 class 0x0c8000
[    0.515059] pci 0000:00:15.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.515482] pci 0000:00:15.1: [8086:9de9] type 00 class 0x0c8000
[    0.515575] pci 0000:00:15.1: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.515956] pci 0000:00:16.0: [8086:9de0] type 00 class 0x078000
[    0.515978] pci 0000:00:16.0: reg 0x10: [mem 0xdc51f000-0xdc51ffff 64bit]
[    0.516048] pci 0000:00:16.0: PME# supported from D3hot
[    0.516208] pci 0000:00:1c.0: [8086:9dbc] type 01 class 0x060400
[    0.516281] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.516296] pci 0000:00:1c.0: PTM enabled (root), 4dns granularity
[    0.516435] pci 0000:00:1c.6: [8086:9dbe] type 01 class 0x060400
[    0.516508] pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold
[    0.516523] pci 0000:00:1c.6: PTM enabled (root), 4dns granularity
[    0.516644] pci 0000:00:1d.0: [8086:9db0] type 01 class 0x060400
[    0.516747] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.516761] pci 0000:00:1d.0: PTM enabled (root), 4dns granularity
[    0.516887] pci 0000:00:1d.4: [8086:9db4] type 01 class 0x060400
[    0.516970] pci 0000:00:1d.4: PME# supported from D0 D3hot D3cold
[    0.516986] pci 0000:00:1d.4: PTM enabled (root), 4dns granularity
[    0.517120] pci 0000:00:1f.0: [8086:9d84] type 00 class 0x060100
[    0.517283] pci 0000:00:1f.3: [8086:9dc8] type 00 class 0x040380
[    0.517323] pci 0000:00:1f.3: reg 0x10: [mem 0xdc518000-0xdc51bfff 64bit]
[    0.517359] pci 0000:00:1f.3: reg 0x20: [mem 0xdc200000-0xdc2fffff 64bit]
[    0.517433] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.517577] pci 0000:00:1f.4: [8086:9da3] type 00 class 0x0c0500
[    0.517603] pci 0000:00:1f.4: reg 0x10: [mem 0xdc51e000-0xdc51e0ff 64bit]
[    0.517631] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[    0.517738] pci 0000:00:1f.5: [8086:9da4] type 00 class 0x0c8000
[    0.517752] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.517950] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.517979] pci 0000:01:00.0: reg 0x14: [mem 0xdc400000-0xdc400fff]
[    0.518078] pci 0000:01:00.0: supports D1 D2
[    0.518079] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.518187] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.518190] pci 0000:00:1c.0:   bridge window [mem 0xdc400000-0xdc4fffff]
[    0.518521] pci 0000:02:00.0: [168c:003e] type 00 class 0x028000
[    0.518845] pci 0000:02:00.0: reg 0x10: [mem 0xdc000000-0xdc1fffff 64bit]
[    0.519893] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.520783] pci 0000:00:1c.6: PCI bridge to [bus 02]
[    0.520786] pci 0000:00:1c.6:   bridge window [mem 0xdc000000-0xdc1fffff]
[    0.520871] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[    0.520927] pci 0000:03:00.0: enabling Extended Tags
[    0.521002] pci 0000:03:00.0: supports D1 D2
[    0.521002] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.521094] pci 0000:00:1d.0: PCI bridge to [bus 03-6d]
[    0.521097] pci 0000:00:1d.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.521100] pci 0000:00:1d.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.521148] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[    0.521208] pci 0000:04:00.0: enabling Extended Tags
[    0.521287] pci 0000:04:00.0: supports D1 D2
[    0.521288] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.521364] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[    0.521424] pci 0000:04:01.0: enabling Extended Tags
[    0.521504] pci 0000:04:01.0: supports D1 D2
[    0.521504] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.521577] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[    0.521638] pci 0000:04:02.0: enabling Extended Tags
[    0.521714] pci 0000:04:02.0: supports D1 D2
[    0.521714] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.521791] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[    0.521851] pci 0000:04:04.0: enabling Extended Tags
[    0.521931] pci 0000:04:04.0: supports D1 D2
[    0.521931] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522024] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[    0.522031] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.522036] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.522083] pci 0000:05:00.0: [8086:15d2] type 00 class 0x088000
[    0.522113] pci 0000:05:00.0: reg 0x10: [mem 0xda000000-0xda03ffff]
[    0.522124] pci 0000:05:00.0: reg 0x14: [mem 0xda040000-0xda040fff]
[    0.522180] pci 0000:05:00.0: enabling Extended Tags
[    0.522275] pci 0000:05:00.0: supports D1 D2
[    0.522276] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522401] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.522409] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[    0.522447] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.522455] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[    0.522460] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff=
 64bit pref]
[    0.522519] pci 0000:39:00.0: [8086:15d4] type 00 class 0x0c0330
[    0.522552] pci 0000:39:00.0: reg 0x10: [mem 0xc3f00000-0xc3f0ffff]
[    0.522625] pci 0000:39:00.0: enabling Extended Tags
[    0.522723] pci 0000:39:00.0: supports D1 D2
[    0.522724] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.522783] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, limit=
ed by 2.5 GT/s x4 link at 0000:04:02.0 (capable of 31.504 Gb/s with 8 GT/s =
x4 link)
[    0.522875] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.522882] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[    0.522920] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[    0.522928] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[    0.522933] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff=
 64bit pref]
[    0.523180] pci 0000:6e:00.0: [144d:a808] type 00 class 0x010802
[    0.523207] pci 0000:6e:00.0: reg 0x10: [mem 0xdc300000-0xdc303fff 64bit]
[    0.523410] pci 0000:00:1d.4: PCI bridge to [bus 6e]
[    0.523414] pci 0000:00:1d.4:   bridge window [mem 0xdc300000-0xdc3fffff]
[    0.526731] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.526786] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 10 11 12 14 15=
) *1
[    0.526840] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.526893] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.526946] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.526999] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.527052] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.527105] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 11 12 14 15=
) *0
[    0.537614] ACPI: EC: interrupt unblocked
[    0.537622] ACPI: EC: event unblocked
[    0.537640] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=3D0x6e, EC_CMD/EC_SC=3D0x934=
, EC_DATA=3D0x930
[    0.537641] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tran=
sactions and events
[    0.537747] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.537747] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.537747] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.537747] vgaarb: loaded
[    0.537747] SCSI subsystem initialized
[    0.537747] libata version 3.00 loaded.
[    0.537747] ACPI: bus type USB registered
[    0.537747] usbcore: registered new interface driver usbfs
[    0.537747] usbcore: registered new interface driver hub
[    0.538236] usbcore: registered new device driver usb
[    0.538236] pps_core: LinuxPPS API ver. 1 registered
[    0.538236] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.538236] PTP clock support registered
[    0.538378] EDAC MC: Ver: 3.0.0
[    0.538867] Registered efivars operations
[    0.538873] PCI: Using ACPI for IRQ routing
[    0.569138] PCI: pci_cache_line_size set to 64 bytes
[    0.569751] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.569752] e820: reserve RAM buffer [mem 0x34394000-0x37ffffff]
[    0.569753] e820: reserve RAM buffer [mem 0x3c315000-0x3fffffff]
[    0.569753] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.569754] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.569841] NetLabel: Initializing
[    0.569842] NetLabel:  domain hash size =3D 128
[    0.569842] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.569850] NetLabel:  unlabeled traffic allowed by default
[    0.569852] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.569852] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.572252] clocksource: Switched to clocksource tsc-early
[    0.582234] VFS: Disk quotas dquot_6.6.0
[    0.582246] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.582278] *** VALIDATE hugetlbfs ***
[    0.582296] pnp: PnP ACPI init
[    0.582357] system 00:00: [mem 0x40000000-0x403fffff] could not be reser=
ved
[    0.582359] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.582493] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.582494] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.582495] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.582535] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.582595] system 00:03: [io  0x1854-0x1857] has been reserved
[    0.582597] system 00:03: Plug and Play ACPI device, IDs INT3f0d PNP0c02=
 (active)
[    0.582681] pnp 00:04: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.582690] pnp 00:05: Plug and Play ACPI device, IDs DLL08af PNP0f13 (a=
ctive)
[    0.582806] system 00:06: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.582807] system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.582807] system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.582808] system 00:06: [mem 0xe0000000-0xefffffff] has been reserved
[    0.582809] system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.582810] system 00:06: [mem 0xfed90000-0xfed93fff] could not be reser=
ved
[    0.582810] system 00:06: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.582811] system 00:06: [mem 0xfee00000-0xfeefffff] could not be reser=
ved
[    0.582813] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.582964] system 00:07: [io  0x1800-0x18fe] could not be reserved
[    0.582965] system 00:07: [mem 0xfd000000-0xfd69ffff] has been reserved
[    0.582966] system 00:07: [mem 0xfd6b0000-0xfd6cffff] has been reserved
[    0.582966] system 00:07: [mem 0xfd6f0000-0xfdffffff] has been reserved
[    0.582967] system 00:07: [mem 0xfe000000-0xfe01ffff] could not be reser=
ved
[    0.582968] system 00:07: [mem 0xfe200000-0xfe7fffff] has been reserved
[    0.582969] system 00:07: [mem 0xff000000-0xffffffff] has been reserved
[    0.582970] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.583172] system 00:08: [io  0x2000-0x20fe] has been reserved
[    0.583174] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.583846] system 00:09: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.587958] pnp: PnP ACPI: found 10 devices
[    0.588955] thermal_sys: Registered thermal governor 'fair_share'
[    0.588956] thermal_sys: Registered thermal governor 'bang_bang'
[    0.588956] thermal_sys: Registered thermal governor 'step_wise'
[    0.588957] thermal_sys: Registered thermal governor 'user_space'
[    0.593479] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.593532] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to [bus =
06-38] add_size 1000
[    0.593534] pci 0000:04:04.0: bridge window [io  0x1000-0x0fff] to [bus =
3a-6d] add_size 1000
[    0.593535] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to [bus =
04-6d] add_size 2000
[    0.593536] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to [bus =
03-6d] add_size 3000
[    0.593544] pci 0000:00:15.0: BAR 0: assigned [mem 0x4f800000-0x4f800fff=
 64bit]
[    0.593601] pci 0000:00:15.1: BAR 0: assigned [mem 0x4f801000-0x4f801fff=
 64bit]
[    0.593653] pci 0000:00:1d.0: BAR 13: assigned [io  0x4000-0x6fff]
[    0.593655] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.593658] pci 0000:00:1c.0:   bridge window [mem 0xdc400000-0xdc4fffff]
[    0.593662] pci 0000:00:1c.6: PCI bridge to [bus 02]
[    0.593665] pci 0000:00:1c.6:   bridge window [mem 0xdc000000-0xdc1fffff]
[    0.593669] pci 0000:03:00.0: BAR 13: assigned [io  0x4000-0x5fff]
[    0.593671] pci 0000:04:01.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.593671] pci 0000:04:04.0: BAR 13: assigned [io  0x5000-0x5fff]
[    0.593672] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.593676] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[    0.593683] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.593685] pci 0000:04:01.0:   bridge window [io  0x4000-0x4fff]
[    0.593689] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[    0.593692] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff=
 64bit pref]
[    0.593697] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.593701] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[    0.593708] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[    0.593710] pci 0000:04:04.0:   bridge window [io  0x5000-0x5fff]
[    0.593714] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[    0.593717] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff=
 64bit pref]
[    0.593721] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[    0.593723] pci 0000:03:00.0:   bridge window [io  0x4000-0x5fff]
[    0.593727] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.593730] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.593734] pci 0000:00:1d.0: PCI bridge to [bus 03-6d]
[    0.593736] pci 0000:00:1d.0:   bridge window [io  0x4000-0x6fff]
[    0.593738] pci 0000:00:1d.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.593740] pci 0000:00:1d.0:   bridge window [mem 0x60000000-0xa9ffffff=
 64bit pref]
[    0.593743] pci 0000:00:1d.4: PCI bridge to [bus 6e]
[    0.593745] pci 0000:00:1d.4:   bridge window [mem 0xdc300000-0xdc3fffff]
[    0.593750] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.593751] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.593752] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.593753] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff windo=
w]
[    0.593753] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff windo=
w]
[    0.593754] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff windo=
w]
[    0.593754] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff wind=
ow]
[    0.593755] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff wind=
ow]
[    0.593756] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff wind=
ow]
[    0.593756] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff wind=
ow]
[    0.593757] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff wind=
ow]
[    0.593757] pci_bus 0000:00: resource 15 [mem 0x4f800000-0xdfffffff wind=
ow]
[    0.593758] pci_bus 0000:00: resource 16 [mem 0xfc800000-0xfe7fffff wind=
ow]
[    0.593759] pci_bus 0000:01: resource 1 [mem 0xdc400000-0xdc4fffff]
[    0.593760] pci_bus 0000:02: resource 1 [mem 0xdc000000-0xdc1fffff]
[    0.593761] pci_bus 0000:03: resource 0 [io  0x4000-0x6fff]
[    0.593761] pci_bus 0000:03: resource 1 [mem 0xac000000-0xda0fffff]
[    0.593762] pci_bus 0000:03: resource 2 [mem 0x60000000-0xa9ffffff 64bit=
 pref]
[    0.593762] pci_bus 0000:04: resource 0 [io  0x4000-0x5fff]
[    0.593763] pci_bus 0000:04: resource 1 [mem 0xac000000-0xda0fffff]
[    0.593764] pci_bus 0000:04: resource 2 [mem 0x60000000-0xa9ffffff 64bit=
 pref]
[    0.593764] pci_bus 0000:05: resource 1 [mem 0xda000000-0xda0fffff]
[    0.593765] pci_bus 0000:06: resource 0 [io  0x4000-0x4fff]
[    0.593765] pci_bus 0000:06: resource 1 [mem 0xac000000-0xc3efffff]
[    0.593766] pci_bus 0000:06: resource 2 [mem 0x60000000-0x7fffffff 64bit=
 pref]
[    0.593767] pci_bus 0000:39: resource 1 [mem 0xc3f00000-0xc3ffffff]
[    0.593767] pci_bus 0000:3a: resource 0 [io  0x5000-0x5fff]
[    0.593768] pci_bus 0000:3a: resource 1 [mem 0xc4000000-0xd9ffffff]
[    0.593768] pci_bus 0000:3a: resource 2 [mem 0x80000000-0xa9ffffff 64bit=
 pref]
[    0.593769] pci_bus 0000:6e: resource 1 [mem 0xdc300000-0xdc3fffff]
[    0.593860] NET: Registered protocol family 2
[    0.593973] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5,=
 131072 bytes, linear)
[    0.593992] TCP established hash table entries: 131072 (order: 8, 104857=
6 bytes, linear)
[    0.594163] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes,=
 linear)
[    0.594328] TCP: Hash tables configured (established 131072 bind 65536)
[    0.594349] UDP hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.594404] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes, l=
inear)
[    0.594466] NET: Registered protocol family 1
[    0.594469] NET: Registered protocol family 44
[    0.594475] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.594936] pci 0000:03:00.0: CLS mismatch (64 !=3D 128), using 64 bytes
[    0.595010] pci 0000:03:00.0: enabling device (0006 -> 0007)
[    0.595189] Trying to unpack rootfs image as initramfs...
[    0.916092] Freeing initrd memory: 30344K
[    0.920311] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.920313] software IO TLB: mapped [mem 0x2b83e000-0x2f83e000] (64MB)
[    0.923519] Initialise system trusted keyrings
[    0.923529] Key type blacklist registered
[    0.923578] workingset: timestamp_bits=3D36 max_order=3D22 bucket_order=
=3D0
[    0.925165] zbud: loaded
[    0.925799] Platform Keyring initialized
[    0.930354] NET: Registered protocol family 38
[    0.930355] Key type asymmetric registered
[    0.930356] Asymmetric key parser 'x509' registered
[    0.930362] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.930396] io scheduler mq-deadline registered
[    0.930397] io scheduler kyber registered
[    0.930418] io scheduler bfq registered
[    0.930486] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    0.930824] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
[    0.931033] pcieport 0000:00:1c.6: PME: Signaling with IRQ 123
[    0.931144] pcieport 0000:00:1d.0: PME: Signaling with IRQ 124
[    0.931165] pcieport 0000:00:1d.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    0.931406] pcieport 0000:00:1d.4: PME: Signaling with IRQ 125
[    0.931723] pcieport 0000:04:01.0: enabling device (0006 -> 0007)
[    0.931828] pcieport 0000:04:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL=
=2D AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    0.932070] pcieport 0000:04:04.0: enabling device (0006 -> 0007)
[    0.932177] pcieport 0000:04:04.0: pciehp: Slot #4 AttnBtn- PwrCtrl- MRL=
=2D AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ LLActRep+
[    0.932309] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.932331] efifb: probing for efifb
[    0.932347] efifb: showing boot graphics
[    0.936089] efifb: framebuffer at 0x50000000, using 32400k, total 32400k
[    0.936090] efifb: mode is 3840x2160x32, linelength=3D15360, pages=3D1
[    0.936090] efifb: scrolling: redraw
[    0.936091] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    0.936118] fbcon: Deferring console take-over
[    0.936119] fb0: EFI VGA frame buffer device
[    0.936124] intel_idle: MWAIT substates: 0x11142120
[    0.936125] intel_idle: v0.4.1 model 0x8E
[    0.936507] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.937387] ACPI: AC Adapter [AC] (off-line)
[    0.937444] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input0
[    0.937452] ACPI: Lid Switch [LID0]
[    0.937472] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input1
[    0.937480] ACPI: Power Button [PBTN]
[    0.937504] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input2
[    0.937508] ACPI: Sleep Button [SBTN]
[    0.939828] thermal LNXTHERM:00: registered as thermal_zone0
[    0.939829] ACPI: Thermal Zone [THM] (25 C)
[    0.940015] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.941806] Non-volatile memory driver v1.3
[    0.941820] Linux agpgart interface v0.103
[    0.968452] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.970854] battery: ACPI: Battery Slot [BAT0] (battery present)
[    0.990341] libphy: Fixed MDIO Bus: probed
[    0.990404] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.990406] ehci-pci: EHCI PCI platform driver
[    0.990411] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.990412] ohci-pci: OHCI PCI platform driver
[    0.990416] uhci_hcd: USB Universal Host Controller Interface driver
[    0.990530] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.990582] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 1
[    0.991676] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
10 quirks 0x0000000000009810
[    0.991679] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    0.991803] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.03
[    0.991803] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.991804] usb usb1: Product: xHCI Host Controller
[    0.991804] usb usb1: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    0.991805] usb usb1: SerialNumber: 0000:00:14.0
[    0.991900] hub 1-0:1.0: USB hub found
[    0.991913] hub 1-0:1.0: 12 ports detected
[    0.992583] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    0.992627] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 2
[    0.992629] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    0.992667] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.03
[    0.992667] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.992668] usb usb2: Product: xHCI Host Controller
[    0.992668] usb usb2: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    0.992669] usb usb2: SerialNumber: 0000:00:14.0
[    0.992741] hub 2-0:1.0: USB hub found
[    0.992764] hub 2-0:1.0: 6 ports detected
[    0.992901] usb: port power management may be unreliable
[    0.993093] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    0.993138] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus =
number 3
[    0.994284] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0x1=
10 quirks 0x0000000200009810
[    0.994483] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.03
[    0.994483] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.994484] usb usb3: Product: xHCI Host Controller
[    0.994484] usb usb3: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    0.994485] usb usb3: SerialNumber: 0000:39:00.0
[    0.994553] hub 3-0:1.0: USB hub found
[    0.994559] hub 3-0:1.0: 2 ports detected
[    0.994764] xhci_hcd 0000:39:00.0: xHCI Host Controller
[    0.994806] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus =
number 4
[    0.994808] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperS=
peed
[    0.994827] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.03
[    0.994828] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    0.994828] usb usb4: Product: xHCI Host Controller
[    0.994829] usb usb4: Manufacturer: Linux 5.3.13-300.fc31.x86_64 xhci-hcd
[    0.994829] usb usb4: SerialNumber: 0000:39:00.0
[    0.994910] hub 4-0:1.0: USB hub found
[    0.994916] hub 4-0:1.0: 2 ports detected
[    0.995063] usbcore: registered new interface driver usbserial_generic
[    0.995066] usbserial: USB Serial support registered for generic
[    0.995098] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0=
x60,0x64 irq 1,12
[    0.995599] i8042: Warning: Keylock active
[    0.998418] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.998449] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.998523] mousedev: PS/2 mouse device common for all mice
[    0.998876] rtc_cmos 00:02: RTC can wake from S4
[    0.999806] rtc_cmos 00:02: registered as rtc0
[    0.999806] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes nvram
[    0.999832] device-mapper: uevent: version 1.0.3
[    0.999955] device-mapper: ioctl: 4.40.0-ioctl (2019-01-18) initialised:=
 dm-devel@redhat.com
[    1.000092] intel_pstate: Intel P-state driver initializing
[    1.000094] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input3
[    1.001551] intel_pstate: HWP enabled
[    1.001780] hidraw: raw HID events driver (C) Jiri Kosina
[    1.001799] usbcore: registered new interface driver usbhid
[    1.001799] usbhid: USB HID core driver
[    1.001858] intel_pmc_core INT33A1:00:  initialized
[    1.001894] drop_monitor: Initializing network drop monitor service
[    1.001977] Initializing XFRM netlink socket
[    1.002041] NET: Registered protocol family 10
[    1.005016] Segment Routing with IPv6
[    1.005031] mip6: Mobile IPv6
[    1.005043] NET: Registered protocol family 17
[    1.005566] RAS: Correctable Errors collector initialized.
[    1.005617] microcode: sig=3D0x806eb, pf=3D0x80, revision=3D0xca
[    1.005823] microcode: Microcode Update Driver: v2.2.
[    1.005829] AVX2 version of gcm_enc/dec engaged.
[    1.005829] AES CTR mode by8 optimization enabled
[    1.031748] sched_clock: Marking stable (1026270059, 5473199)->(10478788=
21, -16135563)
[    1.031989] registered taskstats version 1
[    1.031995] Loading compiled-in X.509 certificates
[    1.056398] Loaded X.509 cert 'Fedora kernel signing key: 70738b6865ae04=
583ee7b9d87c5795efc30cc4af'
[    1.056415] zswap: loaded using pool lzo/zbud
[    1.062062] Key type big_key registered
[    1.064565] Key type encrypted registered
[    1.065864] integrity: Loading X.509 certificate: UEFI:db
[    1.065876] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc88=
0660055ba0bc131886bb630a639e7'
[    1.065876] integrity: Loading X.509 certificate: UEFI:db
[    1.065888] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA =
2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    1.065889] integrity: Loading X.509 certificate: UEFI:db
[    1.065898] integrity: Loaded X.509 cert 'Microsoft Windows Production P=
CA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    1.067112] ima: Allocated hash algorithm: sha256
[    1.090440] No architecture policies found
[    1.091172] PM:   Magic number: 15:641:124
[    1.091495] rtc_cmos 00:02: setting system clock to 2019-12-05T11:08:33 =
UTC (1575544113)
[    1.318536] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    1.455200] usb 1-1: New USB device found, idVendor=3D0e8d, idProduct=3D=
1887, bcdDevice=3D 0.00
[    1.455206] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    1.455210] usb 1-1: Product: HP External USB Optical Drive
[    1.455212] usb 1-1: Manufacturer: Hewlett-Packard Company
[    1.455215] usb 1-1: SerialNumber: KZ6E4D43127        =20
[    1.572274] usb 1-5: new high-speed USB device number 3 using xhci_hcd
[    1.716100] usb 1-5: New USB device found, idVendor=3D0c45, idProduct=3D=
6723, bcdDevice=3D80.08
[    1.716104] usb 1-5: New USB device strings: Mfr=3D2, Product=3D1, Seria=
lNumber=3D0
[    1.716107] usb 1-5: Product: Integrated_Webcam_HD
[    1.716110] usb 1-5: Manufacturer: CN09357GLOG008CLA26CA01
[    1.831589] psmouse serio1: synaptics: queried max coordinates: x [..566=
6], y [..4734]
[    1.832337] usb 1-7: new full-speed USB device number 4 using xhci_hcd
[    1.862053] psmouse serio1: synaptics: queried min coordinates: x [1276.=
=2E], y [1118..]
[    1.862084] psmouse serio1: synaptics: Your touchpad (PNP: DLL08af PNP0f=
13) says it can support a different bus. If i2c-hid and hid-rmi are not use=
d, you might want to try setting psmouse.synaptics_intertouch to 1 and repo=
rt this to linux-input@vger.kernel.org.
[    1.919324] psmouse serio1: synaptics: Touchpad model: 1, fw: 9.16, id: =
0x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x500000, board id: 3038, fw id: =
2767034
[    1.940450] tsc: Refined TSC clocksource calibration: 1991.995 MHz
[    1.940470] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x396=
d48bcfa5, max_idle_ns: 881590611924 ns
[    1.940571] clocksource: Switched to clocksource tsc
[    1.956695] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042=
/serio1/input/input5
[    1.959283] usb 1-7: config 1 interface 1 altsetting 0 endpoint 0x83 has=
 wMaxPacketSize 0, skipping
[    1.959287] usb 1-7: config 1 interface 1 altsetting 0 endpoint 0x3 has =
wMaxPacketSize 0, skipping
[    1.959294] usb 1-7: New USB device found, idVendor=3D0489, idProduct=3D=
e0a2, bcdDevice=3D 0.01
[    1.959297] usb 1-7: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D0
[    1.964326] Freeing unused decrypted memory: 2040K
[    1.965255] Freeing unused kernel image memory: 2276K
[    1.965258] Write protecting the kernel read-only data: 20480k
[    1.966484] Freeing unused kernel image memory: 2016K
[    1.967091] Freeing unused kernel image memory: 1576K
[    1.973062] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.973070] rodata_test: all tests were successful
[    1.973072] Run /init as init process
[    2.055796] systemd[1]: systemd v243.4-1.fc31 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[    2.067642] systemd[1]: Detected architecture x86-64.
[    2.067649] systemd[1]: Running in initial RAM disk.
[    2.067727] systemd[1]: Set hostname to <dalek>.
[    2.168083] systemd[1]: Created slice system-systemd\x2dhibernate\x2dres=
ume.slice.
[    2.168219] systemd[1]: Reached target Slices.
[    2.168242] systemd[1]: Reached target Swap.
[    2.168253] systemd[1]: Reached target Timers.
[    2.168479] systemd[1]: Listening on Journal Audit Socket.
[    2.168613] systemd[1]: Listening on Journal Socket (/dev/log).
[    2.189808] fuse: init (API version 7.31)
[    2.404930] audit: type=3D1130 audit(1575544114.812:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-jour=
nald comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    2.479030] audit: type=3D1130 audit(1575544114.886:3): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
d comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? t=
erminal=3D? res=3Dsuccess'
[    2.628009] audit: type=3D1130 audit(1575544115.035:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
=2Dtrigger comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
[    2.646676] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.646736] wmi_bus wmi_bus-PNP0C14:03: WQBC data block query control me=
thod not found
[    2.646738] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.647592] audit: type=3D1130 audit(1575544115.055:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dplymouth-sta=
rt comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? =
terminal=3D? res=3Dsuccess'
[    2.650153] acpi PNP0C14:04: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.658745] acpi PNP0C14:05: duplicate WMI GUID 05901221-D566-11D1-B2F0-=
00A0C9062910 (first instance was on PNP0C14:01)
[    2.664737] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    2.666536] usb-storage 1-1:1.0: USB Mass Storage device detected
[    2.667066] scsi host0: usb-storage 1-1:1.0
[    2.667185] usbcore: registered new interface driver usb-storage
[    2.672196] nvme nvme0: pci function 0000:6e:00.0
[    2.826507] checking generic (50000000 1fa4000) vs hw (50000000 10000000)
[    2.826509] fb0: switching to inteldrmfb from EFI VGA
[    2.826556] i915 0000:00:02.0: vgaarb: deactivate vga console
[    2.827564] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.827565] [drm] Driver supports precise vblank timestamp query.
[    2.828131] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[    2.828661] [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin=
 (v1.4)
[    2.836433] psmouse serio1: synaptics: queried max coordinates: x [..566=
6], y [..4734]
[    2.857073] [drm] Initialized i915 1.6.0 20190619 for 0000:00:02.0 on mi=
nor 0
[    2.865489] psmouse serio1: synaptics: queried min coordinates: x [1276.=
=2E], y [1118..]
[    2.865497] psmouse serio1: synaptics: Your touchpad (PNP: DLL08af PNP0f=
13) says it can support a different bus. If i2c-hid and hid-rmi are not use=
d, you might want to try setting psmouse.synaptics_intertouch to 1 and repo=
rt this to linux-input@vger.kernel.org.
[    2.865946] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: n=
o)
[    2.867436] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:00/input/input8
[    2.882487] fbcon: i915drmfb (fb0) is primary device
[    2.882489] fbcon: Deferring console take-over
[    2.882492] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
[    2.885454] nvme nvme0: Shutdown timeout set to 8 seconds
[    2.899211] nvme nvme0: 8/0/0 default/read/poll queues
[    2.911440]  nvme0n1: p1 p2
[    2.923522] psmouse serio1: synaptics: Touchpad model: 1, fw: 9.16, id: =
0x1e2a1, caps: 0xf00323/0x840300/0x12e800/0x500000, board id: 3038, fw id: =
2767034
[    2.964298] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042=
/serio1/input/input7
[    3.208762] PM: Image not found (code -22)
[    3.210992] audit: type=3D1130 audit(1575544115.618:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-hibe=
rnate-resume@dev-mapper-dalek\x2dswap comm=3D"systemd" exe=3D"/usr/lib/syst=
emd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    3.211019] audit: type=3D1131 audit(1575544115.618:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-hibe=
rnate-resume@dev-mapper-dalek\x2dswap comm=3D"systemd" exe=3D"/usr/lib/syst=
emd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    3.232542] audit: type=3D1130 audit(1575544115.640:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-tmpf=
iles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
[    3.245852] audit: type=3D1130 audit(1575544115.653:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Ddracut-initq=
ueue comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    3.275579] audit: type=3D1130 audit(1575544115.683:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-fsc=
k-root comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dsuccess'
[    3.287417] EXT4-fs (dm-0): mounted filesystem with ordered data mode. O=
pts: (null)
[    3.674401] scsi 0:0:0:0: CD-ROM            hp       CDDVDW GP60NB50  RP=
02 PQ: 0 ANSI: 0
[    3.676336] sr 0:0:0:0: Power-on or device reset occurred
[    3.680394] sr 0:0:0:0: [sr0] scsi3-mmc drive: 31x/31x writer dvd-ram cd=
/rw xa/form2 cdda tray
[    3.680397] cdrom: Uniform CD-ROM driver Revision: 3.20
[    3.681009] sr 0:0:0:0: Attached scsi CD-ROM sr0
[    3.681198] sr 0:0:0:0: Attached scsi generic sg0 type 5
[    4.237892] systemd-journald[304]: Received SIGTERM from PID 1 (systemd).
[    4.251775] printk: systemd: 23 output lines suppressed due to ratelimit=
ing
[    4.646779] SELinux:  policy capability network_peer_controls=3D1
[    4.646780] SELinux:  policy capability open_perms=3D1
[    4.646780] SELinux:  policy capability extended_socket_class=3D1
[    4.646780] SELinux:  policy capability always_check_network=3D0
[    4.646781] SELinux:  policy capability cgroup_seclabel=3D1
[    4.646781] SELinux:  policy capability nnp_nosuid_transition=3D1
[    4.666417] systemd[1]: Successfully loaded SELinux policy in 378.014ms.
[    4.697097] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 17.264ms.
[    4.699083] systemd[1]: systemd v243.4-1.fc31 running in system mode. (+=
PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +G=
CRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCR=
E2 default-hierarchy=3Dunified)
[    4.711427] systemd[1]: Detected architecture x86-64.
[    4.711653] systemd[1]: Set hostname to <dalek>.
[    4.801135] systemd[1]: /usr/lib/systemd/system/sssd.service:12: PIDFile=
=3D references a path below legacy directory /var/run/, updating /var/run/s=
ssd.pid =E2=86=92 /run/sssd.pid; please update the unit file accordingly.
[    4.813714] systemd[1]: /usr/lib/systemd/system/iscsiuio.service:13: PID=
=46ile=3D references a path below legacy directory /var/run/, updating /var=
/run/iscsiuio.pid =E2=86=92 /run/iscsiuio.pid; please update the unit file =
accordingly.
[    4.813895] systemd[1]: /usr/lib/systemd/system/iscsid.service:11: PIDFi=
le=3D references a path below legacy directory /var/run/, updating /var/run=
/iscsid.pid =E2=86=92 /run/iscsid.pid; please update the unit file accordin=
gly.
[    4.822179] systemd[1]: /usr/lib/systemd/system/sssd-kcm.socket:7: Liste=
nStream=3D references a path below legacy directory /var/run/, updating /va=
r/run/.heim_org.h5l.kcm-socket =E2=86=92 /run/.heim_org.h5l.kcm-socket; ple=
ase update the unit file accordingly.
[    4.822915] systemd[1]: /usr/lib/systemd/system/pcscd.socket:5: ListenSt=
ream=3D references a path below legacy directory /var/run/, updating /var/r=
un/pcscd/pcscd.comm =E2=86=92 /run/pcscd/pcscd.comm; please update the unit=
 file accordingly.
[    4.823510] systemd[1]: /usr/lib/systemd/system/cups.socket:6: ListenStr=
eam=3D references a path below legacy directory /var/run/, updating /var/ru=
n/cups/cups.sock =E2=86=92 /run/cups/cups.sock; please update the unit file=
 accordingly.
[    4.846781] systemd[1]: initrd-switch-root.service: Succeeded.
[    4.866256] Adding 8388604k swap on /dev/mapper/dalek-swap.  Priority:-2=
 extents:1 across:8388604k SSFS
[    4.872730] EXT4-fs (dm-0): re-mounted. Opts: (null)
[    5.078590] systemd-journald[654]: Received client request to flush runt=
ime journal.
[    5.252584] input: Intel HID events as /devices/platform/INT33D5:00/inpu=
t/input9
[    5.253812] intel-hid INT33D5:00: platform supports 5 button array
[    5.253831] input: Intel HID 5 button array as /devices/platform/INT33D5=
:00/input/input10
[    5.315517] kauditd_printk_skb: 45 callbacks suppressed
[    5.315518] audit: type=3D1130 audit(1575544117.723:56): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-backlight@backlight:intel_backlight comm=3D"systemd" exe=
=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsucc=
ess'
[    5.330949] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    5.333657] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    5.333664] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    5.345442] intel_rapl_common: Found RAPL domain package
[    5.345443] intel_rapl_common: Found RAPL domain dram
[    5.345575] proc_thermal 0000:00:04.0: Creating sysfs group for PROC_THE=
RMAL_PCI
[    5.401409] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    5.403763] mc: Linux media interface: v0.10
[    5.420457] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    5.421502] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    5.422361] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    5.422410] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    5.424317] videodev: Linux video capture interface: v2.00
[    5.499388] dcdbas dcdbas: Dell Systems Management Base Driver (version =
5.6.0-3.3)
[    5.500582] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360=
 ms ovfl timer
[    5.500585] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    5.500586] RAPL PMU: hw unit of domain package 2^-14 Joules
[    5.500587] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    5.500587] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    5.500588] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    5.547579] Bluetooth: Core ver 2.22
[    5.547598] NET: Registered protocol family 31
[    5.547599] Bluetooth: HCI device and connection manager initialized
[    5.547602] Bluetooth: HCI socket layer initialized
[    5.547604] Bluetooth: L2CAP socket layer initialized
[    5.547608] Bluetooth: SCO socket layer initialized
[    5.565069] input: Dell WMI hotkeys as /devices/platform/PNP0C14:03/wmi_=
bus/wmi_bus-PNP0C14:03/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input11
[    5.567157] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0c45:6=
723)
[    5.573099] i2c_hid i2c-ELAN292F:00: i2c-ELAN292F:00 supply vdd not foun=
d, using dummy regulator
[    5.573114] i2c_hid i2c-ELAN292F:00: i2c-ELAN292F:00 supply vddl not fou=
nd, using dummy regulator
[    5.575961] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not=
 initialized!
[    5.575963] uvcvideo 1-5:1.0: Entity type for entity Extension 3 was not=
 initialized!
[    5.575964] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was no=
t initialized!
[    5.575965] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not in=
itialized!
[    5.576033] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:0=
0/0000:00:14.0/usb1/1-5/1-5:1.0/input/input12
[    5.576097] usbcore: registered new interface driver uvcvideo
[    5.576098] USB Video Class driver (1.1.1)
[    5.601429] input: ELAN292F:00 04F3:292F Touchscreen as /devices/pci0000=
:00/0000:00:15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001=
/input/input13
[    5.602315] input: ELAN292F:00 04F3:292F as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001/input/input=
14
[    5.602384] input: ELAN292F:00 04F3:292F as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001/input/input=
15
[    5.602490] hid-generic 0018:04F3:292F.0001: input,hidraw0: I2C HID v1.0=
0 Device [ELAN292F:00 04F3:292F] on i2c-ELAN292F:00
[    5.638479] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    5.638788] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    5.656986] usbcore: registered new interface driver btusb
[    5.659823] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000=
302.bin
[    5.659824] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmware=
 rome 0x302 build 0x111
[    5.708431] intel_rapl_common: Found RAPL domain package
[    5.708433] intel_rapl_common: Found RAPL domain core
[    5.708434] intel_rapl_common: Found RAPL domain uncore
[    5.708435] intel_rapl_common: Found RAPL domain dram
[    5.709263] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    5.709542] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_aud=
io_component_bind_ops [i915])
[    5.714022] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
[    5.728491] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[    5.731924] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    5.741489] iTCO_vendor_support: vendor-support=3D0
[    5.751995] audit: type=3D1130 audit(1575544118.159:57): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-rfkill comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.759362] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    5.759440] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x=
00c5fffc-0x00c5ffff]
[    5.759444] iTCO_wdt: probe of iTCO_wdt failed with error -16
[    5.776314] audit: type=3D1130 audit(1575544118.184:58): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-ask-password-plymouth comm=3D"systemd" exe=3D"/usr/lib/s=
ystemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.779161] audit: type=3D1130 audit(1575544118.186:59): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dlvm2-monitor comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.779735] audit: type=3D1130 audit(1575544118.187:60): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dlvm2-pvscan@259:2 comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    5.788166] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3271: l=
ine_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    5.788169] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x0/=
0x0/0x0/0x0/0x0)
[    5.788171] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x0/=
0x0/0x0/0x0)
[    5.788172] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
[    5.788173] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    5.788175] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
[    5.788177] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=3D0x1b
[    5.788178] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
[    5.859410] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/00=
00:00:1f.3/sound/card0/input17
[    5.859481] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input18
[    5.859534] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input19
[    5.859589] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input20
[    5.859641] input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input21
[    5.859694] input: HDA Intel PCH HDMI/DP,pcm=3D10 as /devices/pci0000:00=
/0000:00:1f.3/sound/card0/input22
[    5.876920] i2c_hid i2c-DELL08AF:00: i2c-DELL08AF:00 supply vdd not foun=
d, using dummy regulator
[    5.877243] i2c_hid i2c-DELL08AF:00: i2c-DELL08AF:00 supply vddl not fou=
nd, using dummy regulator
[    5.903362] input: DELL08AF:00 06CB:76AF Mouse as /devices/pci0000:00/00=
00:00:15.1/i2c_designware.1/i2c-9/i2c-DELL08AF:00/0018:06CB:76AF.0002/input=
/input23
[    5.903465] input: DELL08AF:00 06CB:76AF Touchpad as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-9/i2c-DELL08AF:00/0018:06CB:76AF.0002/in=
put/input24
[    5.903550] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.0=
0 Mouse [DELL08AF:00 06CB:76AF] on i2c-DELL08AF:00
[    5.941062] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chi=
p_id 0x00340aff sub 1a56:143a
[    5.941064] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 0=
 dfs 0 testmode 0
[    5.941604] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00140-QC=
ARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp crc32 29eb8ca1
[    5.974070] audit: type=3D1130 audit(1575544118.381:61): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-backlight@leds:dell::kbd_backlight comm=3D"systemd" exe=
=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsucc=
ess'
[    6.004567] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[    6.004868] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[    6.004870] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[    6.004872] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 02 00 00 0=
0 02 00 00 00
[    6.004874] blk_update_request: I/O error, dev sr0, sector 2048 op 0x0:(=
READ) flags 0x80700 phys_seg 1 prio class 0
[    6.009973] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 4=
ed3569e
[    6.011783] input: ELAN292F:00 04F3:292F as /devices/pci0000:00/0000:00:=
15.0/i2c_designware.0/i2c-8/i2c-ELAN292F:00/0018:04F3:292F.0001/input/input=
26
[    6.011928] hid-multitouch 0018:04F3:292F.0001: input,hidraw0: I2C HID v=
1.00 Device [ELAN292F:00 04F3:292F] on i2c-ELAN292F:00
[    6.076416] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[    6.076418] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[    6.076419] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[    6.076420] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 02 00 00 0=
0 02 00 00 00
[    6.076422] blk_update_request: I/O error, dev sr0, sector 2048 op 0x0:(=
READ) flags 0x0 phys_seg 2 prio class 0
[    6.076424] Buffer I/O error on dev sr0, logical block 512, async page r=
ead
[    6.076425] Buffer I/O error on dev sr0, logical block 513, async page r=
ead
[    6.083469] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[    6.090416] input: DELL08AF:00 06CB:76AF Touchpad as /devices/pci0000:00=
/0000:00:15.1/i2c_designware.1/i2c-9/i2c-DELL08AF:00/0018:06CB:76AF.0002/in=
put/input31
[    6.091282] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v=
1.00 Mouse [DELL08AF:00 06CB:76AF] on i2c-DELL08AF:00
[    6.195040] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3 cal =
otp max-sta 32 raw 0 hwcrypto 1
[    6.256145] ath: EEPROM regdomain: 0x6c
[    6.256146] ath: EEPROM indicates we should expect a direct regpair map
[    6.256146] ath: Country alpha2 being used: 00
[    6.256147] ath: Regpair used: 0x6c
[    6.265971] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[    6.990394] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[    6.990396] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[    6.990397] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[    6.990399] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 37 1b 3c 00 0=
0 3c 00 00 00
[    6.990400] blk_update_request: I/O error, dev sr0, sector 14445808 op 0=
x0:(READ) flags 0x80700 phys_seg 2 prio class 0
[    7.062707] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[    7.062708] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[    7.062709] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[    7.062710] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 37 1b 40 00 0=
0 01 00 00 00
[    7.062711] blk_update_request: I/O error, dev sr0, sector 14445824 op 0=
x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    7.062712] Buffer I/O error on dev sr0, logical block 3611456, async pa=
ge read
[    7.133325] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=3DDID_OK dri=
verbyte=3DDRIVER_SENSE
[    7.133327] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current=
]=20
[    7.133328] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled sector=
 without authentication
[    7.133329] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 37 1b 41 00 0=
0 01 00 00 00
[    7.133330] blk_update_request: I/O error, dev sr0, sector 14445828 op 0=
x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    7.133330] Buffer I/O error on dev sr0, logical block 3611457, async pa=
ge read
[    7.369937] pktcdvd: pktcdvd0: writer mapped to sr0
[    7.417609] audit: type=3D1130 audit(1575544119.825:62): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-udev-settle comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.436779] audit: type=3D1130 audit(1575544119.844:63): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddmraid-activation comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.436792] audit: type=3D1131 audit(1575544119.844:64): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddmraid-activation comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.461811] audit: type=3D1130 audit(1575544119.869:65): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-disk-by\x2duuid-A4EF\x2d2338 comm=3D"systemd" e=
xe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsu=
ccess'
[   11.278094] audit: type=3D1131 audit(1575544123.685:66): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-rfkill comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.226824] audit: type=3D1130 audit(1575544124.634:67): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-cryptsetup@luks\x2dca346aed\x2dfe1e\x2d40a5\x2dbdc9\x2d9=
2a20c589575 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? =
addr=3D? terminal=3D? res=3Dsuccess'
[   12.247754] audit: type=3D1130 audit(1575544124.655:68): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck@dev-mapper-luks\x2dca346aed\x2dfe1e\x2d40a5\x2dbdc9=
\x2d92a20c589575 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=
=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.264150] EXT4-fs (dm-3): mounted filesystem with ordered data mode. O=
pts: (null)
[   12.277155] audit: type=3D1130 audit(1575544124.684:69): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Ddracut-shutdown comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd=
" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.291091] audit: type=3D1130 audit(1575544124.698:70): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dplymouth-read-write comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.291108] audit: type=3D1131 audit(1575544124.698:71): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dplymouth-read-write comm=3D"systemd" exe=3D"/usr/lib/systemd/sys=
temd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.314871] audit: type=3D1130 audit(1575544124.722:72): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dimport-state comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.371115] audit: type=3D1130 audit(1575544124.778:73): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-tmpfiles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/=
systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[   12.380619] audit: type=3D1305 audit(1575544124.788:74): op=3Dset audit_=
enabled=3D1 old=3D1 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:syst=
em_r:auditd_t:s0 res=3D1
[   12.380622] audit: type=3D1305 audit(1575544124.788:75): op=3Dset audit_=
pid=3D898 old=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system=
_r:auditd_t:s0 res=3D1
[   12.400653] RPC: Registered named UNIX socket transport module.
[   12.400655] RPC: Registered udp transport module.
[   12.400655] RPC: Registered tcp transport module.
[   12.400655] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   12.704581] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   12.704583] Bluetooth: BNEP filters: protocol multicast
[   12.704586] Bluetooth: BNEP socket layer initialized
[   13.444826] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[   13.754169] ath10k_pci 0000:02:00.0: unsupported HTC service id: 1536
[   15.720441] broken atomic modeset userspace detected, disabling atomic
[   16.986756] Bluetooth: RFCOMM TTY layer initialized
[   16.986765] Bluetooth: RFCOMM socket layer initialized
[   16.986853] Bluetooth: RFCOMM ver 1.11
[   32.797217] wlp2s0: authenticate with e0:91:f5:58:98:24
[   32.837225] wlp2s0: send auth to e0:91:f5:58:98:24 (try 1/3)
[   32.842660] wlp2s0: authenticated
[   32.845099] wlp2s0: associate with e0:91:f5:58:98:24 (try 1/3)
[   32.851166] wlp2s0: RX AssocResp from e0:91:f5:58:98:24 (capab=3D0x431 s=
tatus=3D0 aid=3D1)
[   32.854031] wlp2s0: associated
[   32.854355] ath: EEPROM regdomain: 0x8114
[   32.854357] ath: EEPROM indicates we should expect a country code
[   32.854360] ath: doing EEPROM country->regdmn map search
[   32.854363] ath: country maps to regdmn code: 0x37
[   32.854366] ath: Country alpha2 being used: DE
[   32.854368] ath: Regpair used: 0x37
[   32.854372] ath: regdomain 0x8114 dynamically updated by country element
[   32.896264] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready

--nextPart1900202.VYddPnLWQK--



