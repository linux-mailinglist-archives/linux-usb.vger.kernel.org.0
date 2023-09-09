Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C9A7996D9
	for <lists+linux-usb@lfdr.de>; Sat,  9 Sep 2023 10:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343707AbjIII0C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 04:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243092AbjIII0B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 04:26:01 -0400
X-Greylist: delayed 1138 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 09 Sep 2023 01:25:53 PDT
Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330EA19BA
        for <linux-usb@vger.kernel.org>; Sat,  9 Sep 2023 01:25:52 -0700 (PDT)
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.17.2/8.17.2) with ESMTPS id 38986mET013701
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
        for <linux-usb@vger.kernel.org>; Sat, 9 Sep 2023 17:36:49 +0930
Date:   Sat, 9 Sep 2023 17:36:48 +0930
From:   Jonathan Woithe <jwoithe@just42.net>
To:     linux-usb@vger.kernel.org
Subject: Samsung T5 SSD: "Synchronize Cache(10) failed" on removal
Message-ID: <ZPwnmHV6rIV7Nsg9@marvin.atrad.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all

Recently I became aware that my system reports a "Synchronize Cache(10)
failed" error whenever a Samsung T5 500 GB SSD is unplugged:

     sd 11:0:0:0: [sdg] Synchronizing SCSI cache
     sd 11:0:0:0: [sdg] Synchronize Cache(10) failed: Result: hostbyte=0x07
                  driverbyte=DRIVER_OK

Occasionally the "hostbyte" is 0x01 instead of 0x07.  I don't think this is
a new problem since it's been occuring possibly since I started using the T5
in early 2021.  A second Samsung T5 (a 250 GB model) triggers the
same messages when removed.

To produce the failure message it is necessary to simply connect the drive
and then remove it.  Mounting a filesystem from the drive is not required. 
The Linux system does not auto-mount these drives.

I have seen the problem under kernels 5.15.38, 5.15.72, 5.15.117 and 6.1.52.

The T5 uses uas by default.  I have tried forcing the use of usb-storage
with

  options usb-storage quirks=04e8:61f5:u

This binds the device to usb-storage instead of uas (according to dmesg) but
the error is still reported on removal.

I guess the fundamental question is whether this error is significant in any
way.  If it's of no consequence then I'll happily ignore it and move on.

If on the other hand it' is something best fixed, please let me know how I
can assist with this.

The device is reported by lsusb as

  Bus 004 Device 004: ID 04e8:61f5 Samsung Electronics Co., Ltd Portable SSD T5

The verbose lsusb output is included at the end of this post[1].

The "Synchronize Cache(10) failed" message is seen regardless of what USB
sockets the drive is connected to:

 * Front panel USB2 [Intel Corporation 82801JI (ICH10 Family) USB2 EHCI]
 * Rear panel USB2  [Intel Corporation 82801JI (ICH10 Family) USB2 EHCI]
 * PCIe USB3   [ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller]
 * PCIe USB-C  [ASMedia Technology Inc. ASM1142 USB 3.1 Host Controller]

The mainboard has no onboard USB3 or USB-C sockets.  These are provided by
a PCIe card.

The Samsung T5 drive does not appear to be adversely affected by the error
report - I have not yet experienced any data loss.

I am seeing the same "Synchronize Cache(10) failed" on other machines
which have different hardware.  I can dig the hardware details up if that
would be useful.

Regards
  jonathan

[1] Samsung T5 "lsusb -v" output follows.

Bus 004 Device 004: ID 04e8:61f5 Samsung Electronics Co., Ltd Portable SSD T5
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         9
  idVendor           0x04e8 Samsung Electronics Co., Ltd
  idProduct          0x61f5 Portable SSD T5
  bcdDevice            1.00
  iManufacturer           2 Samsung
  iProduct                3 Portable SSD T5
  iSerial                 1 1234568370EF
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0079
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         8 Mass Storage
      bInterfaceSubClass      6 SCSI
      bInterfaceProtocol     80 Bulk-Only
      iInterface              0 
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
      bInterfaceProtocol     98 
      iInterface              0 
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
  wTotalLength       0x002a
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x0000f41e
      BESL Link Power Management (LPM) Supported
    BESL value     1024 us 
    Deep BESL value    61440 us 
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
  SuperSpeedPlus USB Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000001
      Sublink Speed Attribute count 1
      Sublink Speed ID count 0
    wFunctionalitySupport   0x1100
    bmSublinkSpeedAttr[0]   0x000a4030
      Speed Attribute ID: 0 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[1]   0x000a40b0
      Speed Attribute ID: 0 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0000
  (Bus Powered)
