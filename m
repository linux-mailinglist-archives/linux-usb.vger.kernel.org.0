Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6778C1BCC61
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 21:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgD1T1J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 15:27:09 -0400
Received: from mout02.posteo.de ([185.67.36.66]:47867 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728613AbgD1T1J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 15:27:09 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 634FD2400FB
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 21:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1588102023; bh=+Xpw0shhYHBpsX3QPHRsK+zdjS0X14PXeTwC6/eoRwI=;
        h=Date:From:To:Cc:Subject:From;
        b=QxFNzYsiEeJ7QsHiLFlNV8FHhgkGj2dI36waujkoTDpEYqAs5Zw+uSKkTxIwSvxGi
         9jCTO0hasLK8IntiRZgz0qyvP0bhTfqiEeDWKvBK24/0Bhk9X5pIT/YE9MAH3a6Tcg
         BQyzixTBRUlFxBIzgTnXM0Hy+JteLSViSDN7rKEl/3OtaG+ewpWtSraUHCK3O5O4GI
         i54WuZOHDVjXnmCpXSJtN+K01JzfnzeKaeJ7t3LxKmRE3+iQV/affy6bRPLmCtPugX
         KlvVhhPlH9Sgy28XoEcmPvmL8v5O+uLAlDhhd1bDcTCnVNOfxCTXfnZ1OG7u+QO5LZ
         kubvwrLCY8PHA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 49BWqV4RcFz6tmQ;
        Tue, 28 Apr 2020 21:27:02 +0200 (CEST)
Date:   Tue, 28 Apr 2020 21:27:01 +0200
From:   Julian =?UTF-8?B?R3Jvw58=?= <julian.g@posteo.de>
To:     hdegoede@redhat.co
Cc:     linux-usb@vger.kernel.org
Subject: unusual_uas.h additional entry
Message-ID: <20200428212701.2ee42662@motofckr9k-mint-desktop>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I would like to ask for an addition to the "unusual_uas.h" file.
According to
https://en.opensuse.org/SDB:USB_3.0_Hard_Drive_troubleshooting I went
through the usb_stor_adjust_quirks flags for my USB 3.0 storage device
and found flag "f" to fix my issue of the device needing several
minutes to connect (flag "u" of couse also fixing the issue).

As I don't understand the format of the entries, please add missing
information from the "lsusb -v" output down below.



/* Reported-by: Julian Gro=C3=9F <julian.g@posteo.de> */
UNUSUAL_DEV(0xXXXX,
		"",
		"",
		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
		US_FL_NO_REPORT_OPCODES),





Bus 002 Device 022: ID 059f:105f LaCie, Ltd=20
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0=20
  bDeviceProtocol         0=20
  bMaxPacketSize0         9
  idVendor           0x059f LaCie, Ltd
  idProduct          0x105f=20
  bcdDevice            0.01
  iManufacturer           2 LaCie
  iProduct                3 2Big Quadra USB3
  iSerial                 1 000000002598fe2400ad
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength          121
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0=20
    bmAttributes         0xc0
      Self Powered
    MaxPower               36mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           4
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     98=20
      iInterface              0=20
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-in pipe (0x03)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Data-out pipe (0x04)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
        MaxStreams             32
        Status pipe (0x02)
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
        Command pipe (0x01)
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           22
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat        2047 micro seconds
Device Status:     0x000d
  Self Powered
  U1 Enabled
  U2 Enabled
