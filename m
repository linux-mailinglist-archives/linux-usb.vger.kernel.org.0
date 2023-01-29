Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A4367FEA9
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jan 2023 12:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjA2Lu3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 29 Jan 2023 06:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA2Lu2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Jan 2023 06:50:28 -0500
X-Greylist: delayed 326 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 29 Jan 2023 03:50:27 PST
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B4A20D10
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 03:50:27 -0800 (PST)
Received: from [192.168.0.36] (ip-037-201-145-251.um10.pools.vodafone-ip.de [37.201.145.251])
        by voltaic.bi-co.net (Postfix) with ESMTPSA id 107B520E99
        for <linux-usb@vger.kernel.org>; Sun, 29 Jan 2023 12:45:00 +0100 (CET)
Message-ID: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
Subject: Cypress CDC ACM serial port not working correctly with autosuspend
From:   Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To:     linux-usb@vger.kernel.org
Date:   Sun, 29 Jan 2023 12:44:59 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I noticed an issue with the following USB to serial adapter when
autosuspend is enabled for that device:

    ID 04b4:0008 Cypress Semiconductor Corp. CDC ACM serial port

The problem is that the device silently drops any data received from
the serial connection whenever there is a pause in communication for
longer than one or two seconds. Then one needs to either touch the
device (e.g., /dev/ttyACM0) or send some characters via USB to receive
data again.

The problem can be circumvented by the following udev rule:
ACTION=="add|change", SUBSYSTEM=="usb", ATTR{idVendor}=="04b4", ATTR{idProduct}=="0008", TEST=="power/control", ATTR{power/control}="on"

Is this something that should already be applied by the kernel?

I'm running Linux 6.1.8. Below you find outputs of lspci and lsusb for
the relevant devices.


lspci -v for the USB controler:

06:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 (prog-if 30 [XHCI])
        Subsystem: Lenovo Device 5082
        Flags: bus master, fast devsel, latency 0, IRQ 75, IOMMU group 7
        Memory at fd100000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci


lsusb -v for the USB device:

Bus 006 Device 010: ID 04b4:0008 Cypress Semiconductor Corp. CDC ACM serial port
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            2 Communications
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         8
  idVendor           0x04b4 Cypress Semiconductor Corp.
  idProduct          0x0008 CDC ACM serial port
  bcdDevice            0.00
  iManufacturer           1 2012 Cypress Semiconductor
  iProduct                2 Cypress-USB2UART-Ver1.0G
  iSerial                 4 827211C2091B
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0043
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          3 USB-UART Configuration
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
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
      CDC Header:
        bcdCDC               1.10
      CDC ACM:
        bmCapabilities       0x02
          line coding and serial state
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1 
      CDC Call Management:
        bmCapabilities       0x00
        bDataInterface          1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               2
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
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)



Best regards,
Michael
