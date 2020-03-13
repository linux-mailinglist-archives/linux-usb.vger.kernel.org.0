Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCDC183F62
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 04:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgCMDQF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 23:16:05 -0400
Received: from mon1.sibername.com ([162.144.64.251]:56391 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgCMDQF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Mar 2020 23:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=UZObMk6GVrR86ILV6rir0JtBvD1vuc3iRsdWTtsGQZc=; b=LU4vx/csdgfzI6mC4TQHmyHdFh
        ZbqRfWfGr3xc5w8SrgsUnv9dNYmt2m0Jd2cHcp/KLU7pmSTuYMjDcpylVzWcUZgqLJ/g0sMUoNr08
        93X6wWTeZR/rC83BQ2FjM9Q0mEpH/6Yw6laKnGUX5DBCtS1qYlS955u1C2vOeFgMapARr6xv9o+Ql
        gVzOeOMhzrQYubnkqg3M1sNLfMt0+plDLjp8AMySTNbwpjfLmwJAoD7vDW2RwyeX85lJO+OP4VKBO
        NeF5Xnat+s0wJeNOVLRTehrI9MeFSkMxPOreJGtDfANBJnZwH1+TLysGXL0bf/ZGiC+5eZsAek8kY
        dO2/5oNQ==;
Received: from 216-58-17-114.cpe.distributel.net ([216.58.17.114]:38318 helo=[192.168.1.45])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1jCano-00CfFc-Lo
        for linux-usb@vger.kernel.org; Thu, 12 Mar 2020 23:16:02 -0400
To:     linux-usb <linux-usb@vger.kernel.org>
From:   James <bjlockie@lockie.ca>
Subject: USB 2?
Message-ID: <43547627-70f7-95d7-f003-97388505a19e@lockie.ca>
Date:   Thu, 12 Mar 2020 23:15:58 -0400
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

This is USB2, right?
I'm trying to buy a USB dvdrw on Amazon but even different sellers sell 
the same thing under a different "brand".

$ sudo lsusb -v -d 13fd:0840
Bus 001 Device 006: ID 13fd:0840 Initio Corporation INIC-1618L SATA
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x13fd Initio Corporation
   idProduct          0x0840 INIC-1618L SATA
   bcdDevice            1.14
   iManufacturer           1 Generic
   iProduct                2 External
   iSerial                 3 554830302020323534363832
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0020
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xc0
       Self Powered
     MaxPower                2mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         8 Mass Storage
       bInterfaceSubClass      2 SFF-8020i, MMC-2 (ATAPI)
       bInterfaceProtocol     80
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      1
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
   Self Powered
