Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4A01748EC
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 20:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgB2Tmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 14:42:54 -0500
Received: from mon1.sibername.com ([162.144.64.251]:42052 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgB2Tmy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 14:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:References:To:From:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=uWW8MlfkdDHnwqiyupm2t2B6vUpnazav8ct26BltWdU=; b=LEWx+coAvvipYi36zXZ7SFgPx4
        U1P1DmQooHo5gPV7wb8b6T7wIRBgTdPE2BiplWPZ0TwxQB+tAFro9VYHgEZI4Ez1xCiRZwmAgmJbA
        K10ycDVnpgmMHldh38bPJa2Lqrogb31p+eM/bFLbKC9D6B9GlQoXh7JPDrK5B+vlvx7pEL1R8OCmK
        x62CgSQqP52SHww9L2uaZr75y3gM6gvLRhWDjD0H909iZRGLnFNA+oyPrhYgvskPJlXANEdkvpFgN
        Z/QN4a66/eE5NLJ9ceJMDYOVHuIC0pTYepAd2JMfUrYyjGnRbwp/CgTLbHQ5bulMg6OcFOHpamJDR
        ocy5Jfrg==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:58704 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j880c-00AvtX-Sc
        for linux-usb@vger.kernel.org; Sat, 29 Feb 2020 14:42:48 -0500
Subject: Re: USB2 device?
From:   James <bjlockie@lockie.ca>
To:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002291215060.16560-100000@netrider.rowland.org>
 <761ee645-1222-ebb7-39fc-3a713d5550e1@lockie.ca>
Message-ID: <78bb6ff8-6c8b-1347-7f09-cfc9b6096004@lockie.ca>
Date:   Sat, 29 Feb 2020 14:42:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <761ee645-1222-ebb7-39fc-3a713d5550e1@lockie.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: rjl@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: rjl@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I forgot sudo.

This looks like the interface is USB 3 but the device internals are USB 2.
Does that make sense?

   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x0006
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)


$ sudo lsusb -v -d 0bda:b812

Bus 003 Device 002: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC
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
