Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37BFD1669C3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 22:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgBTVXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 16:23:54 -0500
Received: from mon1.sibername.com ([162.144.64.251]:37126 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgBTVXy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 16:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=cfgsU2PChJMMldXV9YVnDpCQmMApjkKM9N4U49OCIYY=; b=oC31zSA43SShviTMdbJ42z021k
        jjPaLljKkoo4ytc8iGrWqurM3LGkMBza1kcFOOjpAaszdmCj4VWBIRKf5mQ2OlZef0Z2f94zn5ceF
        Xcr/eD13kX/VtnUC6LRJESieh9mz96tFPbwNQU6Ksy2tXaVRj1bAr8YhtBXnln+rUy/It/8GL+RXj
        7Ps7yx6EQ4jInEmq3yLpEJcZcVElrE8AJuEWTN4K+HoxcpnZ/HLVil80W2mZUcpnFqX//51d+1RGM
        pyWMqtdHAgCrnAipAUS+zWSxWzslehl1BEfCAtV+Oe7xyddtJMrGuPiLO3R/tplBJ9RvM0N7a8Y3Z
        Z6GilzEQ==;
Received: from 216-58-18-206.cpe.distributel.net ([216.58.18.206]:56810 helo=[192.168.1.17])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j4tIV-00A4IZ-GF
        for linux-usb@vger.kernel.org; Thu, 20 Feb 2020 16:23:53 -0500
From:   James <bjlockie@lockie.ca>
To:     linux-usb@vger.kernel.org
Subject: 5G but should be 10G?
Message-ID: <26d58dc2-acd6-6263-2791-01d94368c2f1@lockie.ca>
Date:   Thu, 20 Feb 2020 16:23:50 -0500
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

I have this https://www.adata.com/ca/specification/204
on this motherboard https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp
I think I should get 10G but it reports 5G.

lsusb -d 125f:db8a
Bus 002 Device 004: ID 125f:db8a A-DATA Technology Co., Ltd. ADATA USB 
Flash Drive

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     |__ Port 4: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 5000M

$ sudo lsusb -d 125f:db8a -v

Bus 002 Device 004: ID 125f:db8a A-DATA Technology Co., Ltd. ADATA USB 
Flash Drive
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         9
   idVendor           0x125f A-DATA Technology Co., Ltd.
   idProduct          0xdb8a
   bcdDevice           11.00
   iManufacturer           1 ADATA
   iProduct                2 ADATA USB Flash Drive
   iSerial                 3 29C0501520190025
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x002c
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              504mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      6 SCSI
       bInterfaceProtocol     80 Bulk-Only
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0400  1x 1024 bytes
         bInterval               0
         bMaxBurst               8
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0400  1x 1024 bytes
         bInterval               0
         bMaxBurst               8
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x0016
   bNumDeviceCaps          2
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000006
       BESL Link Power Management (LPM) Supported
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x000c
       Device can operate at High Speed (480Mbps)
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   2
       Lowest fully-functional device speed is High Speed (480Mbps)
     bU1DevExitLat           4 micro seconds
     bU2DevExitLat           4 micro seconds
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
   (Bus Powered)
