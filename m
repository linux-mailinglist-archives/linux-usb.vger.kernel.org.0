Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0F6D67CE53
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 15:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjAZOh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 09:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjAZOhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 09:37:53 -0500
X-Greylist: delayed 573 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 26 Jan 2023 06:37:44 PST
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4CB69533
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 06:37:43 -0800 (PST)
Received: from [10.36.2.154] (unknown [46.212.121.255])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id E3F0D262E88;
        Thu, 26 Jan 2023 15:27:48 +0100 (CET)
Message-ID: <236997e1-d2db-ad2d-7161-c9e3845318f6@selasky.org>
Date:   Thu, 26 Jan 2023 15:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
To:     Troels Liebe Bentsen <troels@connectedcars.dk>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
 <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
Content-Language: en-US
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1/26/23 14:59, Troels Liebe Bentsen wrote:
> On Thu, 26 Jan 2023 at 14:12, Greg KH <gregkh@linuxfoundation.org> wrote:
>>>
>>> I would like to change /sys/bus/usb/devices/usbX/descriptors so it never blocks.
>>
>> Patches gladly reviewed to do so :)

Be careful. Been there done that for FreeBSD. You can cache the 
descriptor in memory - yes, but beware that the values inside the device 
descriptor may change after re-enumerating the device via software, like 
firmware upgrade, and that directly hits on the XHCI controller 
programming, that you need to load and configure the new bMaxPacketSize 
in there!

And the same goes for the other fields in there :-)

> 
> We will have a look and get back to you.

It's probably best to find the undocumented bits of your USB peripheral 
controller first! With USB control transactions I've seen so much 
craziness over the years you won't believe it. The only ones that get it 
right, is the ones that lay out all USB control endpoint jobs in memory 
via DMA descriptors. All the ones that simply use a few registers to 
receive the SETUP packet, DATA and status ZLP, have undocumented races. 
By races I mean, what happens if you get SETUP and DATA interrupt bits 
at the same time, or maybe all three, what is the right order, or what 
about STALL conditions and short control transfers and blah blah blah. 
This thing can really blow your mind, but yeah, many device side 
programmers simply use the example code they get from the vendor and 
give a shit about anything that can later go wrong. That is my simple 
impression so far in the USB world.

--HPS

> 
>>
>> thanks,
>>
>> greg k-h
> 
> Regards Troels

