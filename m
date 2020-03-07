Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF9D17D008
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2020 21:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgCGUgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Mar 2020 15:36:45 -0500
Received: from mon1.sibername.com ([162.144.64.251]:36684 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgCGUgp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Mar 2020 15:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=qDdBZoXNL1CkkvFleang1Fkca1BzfdT8osmB33+8AKI=; b=NMYUHS2BV1lGiJ+xCZQ/+ADc9F
        MyHGl6n5jfIAegD/zRqB8LldKkS3YjjUnxrND32qO65D5TcpGo9DEfZBd1BEgVuOz2uCJdAYHMgTx
        FDepwWgcPOYG/3wU2OfqzGDeVEcCkZR0xzpd9A6n+xbJa5LYZWhMPLQKGuosdvZ9unuEo6pGsfH1P
        CD/xJ1S4bBVK9Le1K/bTWxx02HYdQvrW5d8rT/uX7e1iq+4BBy3D9zX0FMWbh+htkog259unBB4LF
        IG6z5gs5pg+uzppbhLCqGveftd/+3hFFXk+tTEBxC2quJDm1Y8jMFHWcKhAg9oL7PODbliIs1kP5L
        5x+BcDKQ==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:37968 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1jAgBe-004dRc-Em; Sat, 07 Mar 2020 15:36:43 -0500
Subject: Re: dvdrw USB3 drive seen as USB2
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
        linux-usb <linux-usb@vger.kernel.org>
References: <Pine.LNX.4.44L0.2003071517430.17115-100000@netrider.rowland.org>
From:   James <bjlockie@lockie.ca>
Message-ID: <5d16425c-a054-779e-cc3d-efad46ee07f0@lockie.ca>
Date:   Sat, 7 Mar 2020 15:36:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2003071517430.17115-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-0.5
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

https://github.com/aircrack-ng/rtl8812au/blob/v5.6.4.2/README.md
> USB Mode Switch
>
> 0: doesn't switch, 1: switch from usb2.0 to usb 3.0 2: switch from 
> usb3.0 to usb 2.0
>
> $ rmmod 88XXau
> $ modprobe 88XXau rtw_switch_usb_mode:int (0: no switch 1: switch from 
> usb2 to usb3 2: switch from usb3 to usb2)

Windows:
https://store.rokland.com/blogs/news/76663941-understanding-mode-switching-in-realtek-rtl8812au-802-11ac-windows-drivers
> The chipset uses smart switching to go into either mode depending on 
> what type of network to which you are connected. 
I don't know WHY Realtek does this (maybe it lowers power draw).


On 2020-03-07 3:23 p.m., Alan Stern wrote:
> On Sat, 7 Mar 2020, James wrote:
>
>> The cable is attached to the drive.
>> I guess the cable could be defective.
>>
>> I found out my Realtek USB adapter is USB2 by default but there is a
>> parameter in the driver to make it USB3.
> Do you have a pointer or URL for an explanation of that parameter?
>
>> I wonder if it is becoming more common to have USB2 by default and then
>> USB3 by software.
> I have not heard of such a thing.  It seems like a bad idea; why would
> anybody want their device to run at USB-2 speed by default when it
> could be running at USB-3 speed?
>
>> Unfortunately, I think Linux uses generic drivers.
> The drivers are largely generic, but they include device-specific quirk
> lists, so they are not entirely generic.
>
> Alan Stern
>

