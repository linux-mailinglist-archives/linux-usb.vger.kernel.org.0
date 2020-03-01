Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 948D4174A70
	for <lists+linux-usb@lfdr.de>; Sun,  1 Mar 2020 01:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgCAA1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 19:27:39 -0500
Received: from mon1.sibername.com ([162.144.64.251]:40348 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727175AbgCAA1j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 19:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:Cc:Subject:Sender:Reply-To:To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=XIm58KT4MBnKuT0GcA0t2n+AT7SlTf1K9MlVlo+8XFY=; b=mVNYjaFLPreJyV5o/a04nck8uf
        xATaZ0nsY5i/Mz21F4K6iD/RhQVRZfAtppgg1RQwNSH2Ft7ruduuK1fVOc3KRm5wNuN1oy+IhhFbs
        aGdXzVZx/ocNyd3Bp3zqfUo9YI6i9Knxv++NH8RXAUnXMeKXeJLTFRp7jBE4uGKLWtk/5BP2LoVFZ
        39u6RE8CvJnmYseUJwAoK0Gc6gRP1uzHFdpXm0Us3svPT0OZfxpjW5jqi3+jsL4vCCzpasM7SJhdh
        Vp+/9H7Ma78WMBZqIDuzzRfT6YWH6X7JFrsZqJCTJKvpW1IDv7jstDCfpO7jeothY9gomOJsKpVOB
        vsYyq28g==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:33358 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j8CSC-00CMfH-Q3
        for linux-usb@vger.kernel.org; Sat, 29 Feb 2020 19:27:33 -0500
Subject: Re: USB2 device?
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002291803310.32621-100000@netrider.rowland.org>
From:   James <bjlockie@lockie.ca>
Message-ID: <a8003c66-2a9b-c3ab-e7bb-d6b8a2b84a66@lockie.ca>
Date:   Sat, 29 Feb 2020 19:27:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2002291803310.32621-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=0.2
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
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2020-02-29 6:05 p.m., Alan Stern wrote:
> On Sat, 29 Feb 2020, James wrote:
>
>> I forgot sudo.
>>
>> This looks like the interface is USB 3 but the device internals are USB 2.
>> Does that make sense?
> No.
What does "SuperSpeed USB Device Capability:" mean?
>>     SuperSpeed USB Device Capability:
>>       bLength                10
>>       bDescriptorType        16
>>       bDevCapabilityType      3
>>       bmAttributes         0x00
>>       wSpeedsSupported   0x0006
>>         Device can operate at Full Speed (12Mbps)
>>         Device can operate at High Speed (480Mbps)
>> $ sudo lsusb -v -d 0bda:b812
>>
>> Bus 003 Device 002: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC
>> Device Descriptor:
>>     bLength                18
>>     bDescriptorType         1
>>     bcdUSB               2.10
>>     bDeviceClass            0
>>     bDeviceSubClass         0
>>     bDeviceProtocol         0
>>     bMaxPacketSize0        64
>>     idVendor           0x0bda Realtek Semiconductor Corp.
>>     idProduct          0xb812
>>     bcdDevice            2.10
> These are exactly the same vendor, product, and serial IDs as the first
> device.  So you should expect them to be the same.
>
> Alan Stern
>
I have another one on order, hopefully it is better.
It might have the same USB id but I know it seems like a better vendor 
(Netis).
