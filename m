Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBB51744AC
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 04:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgB2DMT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 22:12:19 -0500
Received: from mon1.sibername.com ([162.144.64.251]:55866 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB2DMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 22:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=IvUVptBP53HdJfdqdDcyCZs2De0ru0v2v/3F610PC8o=; b=pzeNIRB/tomBVmZExyg2x63qq0
        xjE4JmfL//NdaaW6ouTUV8DQT6cI4XVpSbP4UaunaNWV6WYHC7X7ObRAhKZTgYWYFPApLmiHbRXbV
        YD6kx7uAlxiQjaqDdTMlQAD53NOI5jOqubMk6+z9P/KLW7JCO7dWHdiRqJodWMp+ScCwM3Cz4ZET+
        Shfhoksusr+BePLgjmCk7nYqqJWyFqGDhRqZveOSuUr3sKBkU0jPqKKRaH/bzBZH8X31m1cIArcT+
        IFZJhZ9bytDmGLP8J7dP/w53f6nQi8/SM+2qEYi1ryB7A9up+HZMFy5dpKeot7vwUtnCOikTHuAH7
        DPmNwUzw==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:45868 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j7sY2-006nYx-6P
        for linux-usb@vger.kernel.org; Fri, 28 Feb 2020 22:12:15 -0500
From:   James <bjlockie@lockie.ca>
To:     linux-usb@vger.kernel.org
Subject: USB2 device?
Message-ID: <c9e86046-5b14-c7ab-4a52-dc5cc052eb23@lockie.ca>
Date:   Fri, 28 Feb 2020 22:12:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I plugged the Realtek in where the Kingston was expecting it too be a 
USB3 port.
I didn't know a device could change ports.

$ lsusb
Bus 004 Device 003: ID 13fe:6300 Kingston Technology Company Inc. USB 
DISK 3.0

$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M\
     |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 5000M

$ lsusb
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 006: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC

$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
     |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class, 
Driver=rtl88x2bu, 480M

   bcdUSB               2.10
Means it's USB2,  right?
It doesn't matter if it's plugged in a USB2 port?
How reliable is this?

$ sudo lsusb -v -d 0bda:b812

Bus 003 Device 006: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x0bda Realtek Semiconductor Corp.
   idProduct          0xb812
   bcdDevice            2.10
   iManufacturer           1 Realtek
   iProduct                2 802.11ac NIC
   iSerial                 3 123456
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0035
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           5
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol    255 Vendor Specific Protocol
       iInterface              2 802.11ac NIC
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x05  EP 5 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x87  EP 7 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               3
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x08  EP 8 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0016
   bNumDeviceCaps          2
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000002
       HIRD Link Power Management (LPM) Supported
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x0006
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat        1023 micro seconds
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
   (Bus Powered)
