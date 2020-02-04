Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B0215223B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2020 23:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgBDWH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Feb 2020 17:07:58 -0500
Received: from smtp.mujha-vel.cz ([81.30.225.246]:60701 "EHLO
        smtp.mujha-vel.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727500AbgBDWH6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Feb 2020 17:07:58 -0500
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Feb 2020 17:07:57 EST
Received: from [81.30.250.3] (helo=[172.16.1.2])
        by smtp.mujha-vel.cz with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jn@forever.cz>)
        id 1iz6Gl-0004sm-CW
        for linux-usb@vger.kernel.org; Tue, 04 Feb 2020 23:02:08 +0100
To:     linux-usb@vger.kernel.org
From:   jakub nantl <jn@forever.cz>
Subject: ch341 garbage read with 5.5.x kernel
Message-ID: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
Date:   Tue, 4 Feb 2020 23:02:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have arduino nano (ch341) connected to my pc and after upgrading
kernel to 5.5.x  I am getting garbage instead of text while reading it
(with both 5.5.1 and 5.5.2 kernels):

Feb  4 09:24:20 sopa read.pl[2070]: StX.XXA(aurXXXŅstXC#021XX XJXR
FuX,#027XX#005
Feb  4 09:24:20 sopa read.pl[2070]: XtX,+XX HXX#026XX go.XXRXXXXXng*Xery
XXX5XUXiXY'XX4
Feb  4 09:24:20 sopa read.pl[2070]: XP5逮#013XXteXX11XS4
Feb  4 09:24:20 sopa read.pl[2070]:
XP5逮#013XXhuXZ.XX=6SHX#005XAXXXpXKVX}XXt=MXXj
Feb  4 09:24:20 sopa read.pl[2070]: DXUu X#013X-XXXXXeXNMSX
Feb  4 09:24:20 sopa read.pl[2070]: XP)}XNXC

with 5.4.17 I get:

Feb  4 22:43:10 sopa read.pl[2040]: Started (auriol_last)
Feb  4 22:43:11 sopa read.pl[2040]: Reporting every 300s
Feb  4 22:43:11 sopa read.pl[2040]: Uptime: 60
Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-temp=11.21
Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-humidity=60
Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-dewpoint=3.68
Feb  4 22:43:11 sopa read.pl[2040]: DATA: sopa-pressure=97136
Feb  4 22:43:11 sopa read.pl[2040]: DATA_END

any suggestions?

jn



00:15.0 USB controller: Intel Corporation Device 31a8 (rev 03) (prog-if
30 [XHCI])
    Subsystem: ASRock Incorporation Device 31a8
    Flags: bus master, medium devsel, latency 0, IRQ 126
    Memory at a1300000 (64-bit, non-prefetchable) [size=64K]
    Capabilities: [70] Power Management version 2
    Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
    Capabilities: [90] Vendor Specific Information: Len=14 <?>
    Kernel driver in use: xhci_hcd

Bus 001 Device 003: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial
adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x1a86 QinHeng Electronics
  idProduct          0x7523 HL-340 USB-Serial adapter
  bcdDevice            2.63
  iManufacturer           0
  iProduct                2 USB2.0-Serial
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           39
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              482mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      1
      bInterfaceProtocol      2
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)

