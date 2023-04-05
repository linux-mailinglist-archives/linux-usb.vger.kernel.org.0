Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA48D6D85C4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 20:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjDESPa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 14:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjDESP3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 14:15:29 -0400
Received: from mail.turbocat.net (turbocat.net [88.99.82.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7008811B
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 11:15:27 -0700 (PDT)
Received: from [10.36.2.154] (unknown [46.212.121.255])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 49236262D22;
        Wed,  5 Apr 2023 20:15:25 +0200 (CEST)
Message-ID: <1ffc488a-5bce-133a-6a7d-cafed6a6dab2@selasky.org>
Date:   Wed, 5 Apr 2023 20:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [Bug 217242] CPU hard lockup related to xhci/dma
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <bug-217242-208809@https.bugzilla.kernel.org/>
 <bug-217242-208809-LGiVP9fz4d@https.bugzilla.kernel.org/>
 <7dc47823-01a1-ac19-73d4-4bf7eb07f98d@selasky.org>
 <2023040210-armband-spiffy-b5a5@gregkh>
 <c8cbd221-1cd6-4c9d-bc8e-2013558e5e1d@rowland.harvard.edu>
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <c8cbd221-1cd6-4c9d-bc8e-2013558e5e1d@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/2/23 20:57, Alan Stern wrote:
> [Bugzilla removed from the CC: list, since this isn't relevant to the bug
> report]
> 
> On Sun, Apr 02, 2023 at 07:25:27PM +0200, Greg KH wrote:
>> On Sun, Apr 02, 2023 at 05:54:18PM +0200, Hans Petter Selasky wrote:
>>> While that being said, I wish the Linux USB core would take the example of
>>> the FreeBSD USB core, and pre-allocate all memory needed for USB transfers,
>>> also called URB's, during device attach.
>>
>> Many drivers do that today already, which specific ones do you think
>> need to have this added that are not doing so?
> 
> Hans is undoubtedly referring to the host controller drivers.

Hi Alan,

Yes, I'm on the USB host side this time.

> usb_alloc_urb() allocates memory for the URB itself.  But the routine does
> not know which device or host controller the URB will eventually be used
> with, so it doesn't know which HCD to tell to set aside adequate memory
> for handling the URB once it is submitted.  And since HCDs tend to process
> URB submissions while holding a private spinlock, when their memory
> allocation does get done it cannot use GFP_KERNEL.

I remember a long time ago when memory allocation was very slow in 
FreeBSD, testing the USB control endpoint was difficult, without at the 
same time using 100% CPU. The reason was user-space applications used 
IOCTL's to do USB control endpoint requests synchronously, and that 
leaded to the request data being alloc'ed and free'd regularly. That was 
before jemalloc and per-CPU slabs. It was not the amount of data causing 
problems, but the request rate, 1000 - 8000 requests per second 
typically. Finding free holes in memory bitmaps due to fragmentation is 
_very_ expensive!

> 
> I think it's fair to call this a weak point in Linux's USB stack.
> Balancing this, it should be pointed out that we can't always know in
> advance how large an URB's transfer buffer will be, and the amount of
> memory that the HCD will need can depend on this size.
 >

In FreeBSD you have to specify a maximum length in bytes per "urb" or 
FreeBSD USB transfer, and various other static properties. Then you 
don't allocate and free those URB's so to speak, but just keep on 
re-using them, after first time allocation. All XHCI DMA structures are 
then just pre-allocated, because we know the PAGE_SIZE and how stuff is 
laid out into memory, it's easy to compute exactly the worst and best 
case for the number for hardware structures you need.

This is also very useful for boot-loaders, that FreeBSD USB can either 
run all single threaded with few fixed size memory pools, or multi 
threaded as part of a bigger OS.

>>> Frequently going through allocate
>>> and free cycles during operation, is not just inefficient, but also greatly
> 
> In fact, the original Slab memory allocator (in Solaris 2.4) was designed
> to make frequent allocate-and-free cycles extremely efficient.  So much so
> that people would just naturally do things that way instead of
> pre-allocating memory which would then just sit around unused a large
> fraction of the time.
> 
> I suspect the allocators in the Linux kernel don't end up being quite as
> efficient as the original Slab, however.
> 

FreeBSD USB is a completely different design compared to Linux. Anyway, 
back to the topic and thanks for the chat :-)

--HPS
