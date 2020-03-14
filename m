Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1F0185B2A
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 09:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgCOIVL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 04:21:11 -0400
Received: from mon1.sibername.com ([162.144.64.251]:33624 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbgCOIVL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 04:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=GjEP7RcYMeAc7F18KpFrL4L1Lg402ddHGLf/kN82NLY=; b=HwH3ewqmPEtz+OW8bi8Gadn0oG
        SE1wGsa9HvibuvEzUbMmNW58wFrrV0VbCbuYOWW1JWgS0uPW3tRSp9vvSvA6tI/3L5PL5lOFi1bU3
        A5xzI3Ink+r4DpXT3LgKuqJlG6ET4qLiYobs7/YFWbIiIu7u3adUjgeNyOZobLVx5bBvb2mTqp3qj
        sW6MhJ+/P2dMOOjCNz5T1sQr2RrShJgBeIltSaMrx5bhx51tGo9wJnBiwMC71ASH4ok5ol8qH/QWC
        4j48x7SuKQmP6aje4tGmQO3f4nYmDbMkSNjrrjmDyUaW/tOJxayrZpkfyUemeRv6D6cb2uKk7sgLp
        IvyQvIDA==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:56220 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1jCyjI-00DeIg-N5
        for linux-usb@vger.kernel.org; Sat, 14 Mar 2020 00:48:58 -0400
Subject: Re: USB 2?
To:     linux-usb <linux-usb@vger.kernel.org>
References: <43547627-70f7-95d7-f003-97388505a19e@lockie.ca>
 <CAL411-o0grY_oL=pXrq-zeDqwaF87rYoLFUOPWP-HrPa2DmozA@mail.gmail.com>
From:   James <bjlockie@lockie.ca>
Message-ID: <917f2afb-7edd-9dbb-dcdd-c1467af410b0@lockie.ca>
Date:   Sat, 14 Mar 2020 00:48:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAL411-o0grY_oL=pXrq-zeDqwaF87rYoLFUOPWP-HrPa2DmozA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2020-03-13 5:46 a.m., Peter Chen wrote:
> On Fri, Mar 13, 2020 at 11:17 AM James <bjlockie@lockie.ca> wrote:
>
> Yes, from below message, you could know it.
>
>>     bcdUSB               2.00
>> wMaxPacketSize     0x0200  1x 512 bytes
>> I'm trying to buy a USB dvdrw on Amazon but even different sellers sell
>> the same thing under a different "brand".
>>
>> $ sudo lsusb -v -d 13fd:0840
>> Bus 001 Device 006: ID 13fd:0840 Initio Corporation INIC-1618L SATA
>> Device Descriptor:
>>     bLength                18
>>     bDescriptorType         1
>>     bcdUSB               2.00
>>     bDeviceClass            0
>>     bDeviceSubClass         0
>>     bDeviceProtocol         0
>>     bMaxPacketSize0        64
>>     idVendor           0x13fd Initio Corporation
>>     idProduct          0x0840 INIC-1618L SATA
>>     bcdDevice            1.14
>>     iManufacturer           1 Generic
>>     iProduct                2 External
>>     iSerial                 3 554830302020323534363832
>>     bNumConfigurations      1
>>     Configuration Descriptor:
>>       bLength                 9
>>       bDescriptorType         2
>>       wTotalLength       0x0020
>>       bNumInterfaces          1
>>       bConfigurationValue     1
>>       iConfiguration          0
>>       bmAttributes         0xc0
>>         Self Powered
>>       MaxPower                2mA
>>       Interface Descriptor:
>>         bLength                 9
>>         bDescriptorType         4
>>         bInterfaceNumber        0
>>         bAlternateSetting       0
>>         bNumEndpoints           2
>>         bInterfaceClass         8 Mass Storage
>>         bInterfaceSubClass      2 SFF-8020i, MMC-2 (ATAPI)
>>         bInterfaceProtocol     80
>>         iInterface              0
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x81  EP 1 IN
>>           bmAttributes            2
>>             Transfer Type            Bulk
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0200  1x 512 bytes
>>           bInterval               0
>>         Endpoint Descriptor:
>>           bLength                 7
>>           bDescriptorType         5
>>           bEndpointAddress     0x02  EP 2 OUT
>>           bmAttributes            2
>>             Transfer Type            Bulk
>>             Synch Type               None
>>             Usage Type               Data
>>           wMaxPacketSize     0x0200  1x 512 bytes
>>           bInterval               0
>> Device Qualifier (for other device speed):
>>     bLength                10
>>     bDescriptorType         6
>>     bcdUSB               2.00
>>     bDeviceClass            0
>>     bDeviceSubClass         0
>>     bDeviceProtocol         0
>>     bMaxPacketSize0        64
>>     bNumConfigurations      1
>> can't get debug descriptor: Resource temporarily unavailable
>> Device Status:     0x0001
>>     Self Powered
Is there any chance the Linux usb subsystem might be detecting incorrectly?
Maybe is uses the same IDs as the INIC-1618L SATA product but is a 
slight upgrade to USB 3?

