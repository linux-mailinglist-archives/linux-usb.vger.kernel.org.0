Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DBA6D86EE
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 21:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjDETfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 15:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDETff (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 15:35:35 -0400
Received: from mail.turbocat.net (turbocat.net [88.99.82.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D477259F9
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 12:35:33 -0700 (PDT)
Received: from [10.36.2.154] (unknown [46.212.121.255])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 00C8B260A12;
        Wed,  5 Apr 2023 21:35:31 +0200 (CEST)
Message-ID: <16cd8a7c-5154-bce0-5bd0-a159d03a01e8@selasky.org>
Date:   Wed, 5 Apr 2023 21:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Explicit status phase for DWC3
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
References: <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
 <Y9vONL8ZyQdEVkr0@rowland.harvard.edu>
 <9da07e03-7cd2-cfeb-8c67-4562948aa948@ideasonboard.com>
 <Y9vmrgeblXC7zeQj@rowland.harvard.edu>
 <20230202194823.jqhyevhbjw3x7sen@synopsys.com>
 <Y9wZ/rgw4CqZ6RxB@rowland.harvard.edu>
From:   Hans Petter Selasky <hps@selasky.org>
In-Reply-To: <Y9wZ/rgw4CqZ6RxB@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/2/23 21:15, Alan Stern wrote:
> Hans Selasky mentioned in a recent email that the only controllers he
> trusts to get this right are the ones that use a "transaction log" sort
> of approach, like xHCI does.  I'm not claiming that controllers using
> other approaches will always be wrong, but this does explain why dwc3 is
> able to manage control transfers correctly.

Yes, I confirm my stand on this topic.

A good USB controller lays out a linked schedule of DMA commands, like 
this is the expected sequence of operation, for both host- and device- 
side. That's my conclusion so far.

I know on the USB device side you typically always have to ACK the 
received SETUP packet, but besides from that it has helped me a lot to 
follow this principle, when designing various Host/Device side drivers, 
mostly for FreeBSD.

For the handful of device-side USB chips I've added support for in 
FreeBSD, ranging from ATMEL (ARM/AVR32) to STM32F, Raspberry PI and a 
few others, not one single of them described all error cases in their 
data sheets for the USB control endpoint.

In the beginning everything looks fine.

You have a 32-bit status register, one bit for SETUP packet received, 
one bit for DATA, one bit for STALL and then a corresponding 32-bit 
interrupt mask register. All USB chip vendors I've seen so far do it 
exactly the same. Just different names on the bits.

As long as the CPU on the USB device side is fast enough to handle all 
the events one by one, it's all good and sound. But at the moment 
multiple bits are set in the status register, like both SETUP and DATA 
received at the same time, then stuff starts to get difficult.

Small signal driven operating systems combined with fiddling interrupt 
masks, is the way to hell, in my opinion. When you are pushing signal 
based OS'es, at some point there is typically a growing mismatch between 
generated IRQ signals, and consumed ones, and the system runs out of 
signal memory and dies.

And you may laugh and think, that's easy to fix. Just wait for the 
signals to drain, and then you enable the interrupts again.

There is only one problem, you need to trigger the issue using a 
Microsoft Windows running USB host, and a .exe file, else it doesn't 
count. As simple as that. Many professional USB companies out there, not 
to mention any names, drive their USB business like that. If you cannot 
reproduce it on Windows, then it is not an issue.

I will not reveal how many times I've driven engineers crazy in the 
past, using my simple "usbtest" on FreeBSD, with some "hooks" in the USB 
host controller drivers, to do illegal stuff, so to speak.

https://github.com/freebsd/freebsd-src/tree/main/tools/tools/usbtest

In more recent times I've been pulled into Thunderbolt and how XHCI 
controllers are isolated behind DMAR engines, to provide protection 
towards rough devices. Personally I don't like it. The XHCI controller 
should be straight on the host computer. And the PCI memory space should 
not just return -1 when trying to access disconnected devices. I see 
that PCI express is already packet based, and they should just make an 
encapsulation for USB straight over PCI express, without the need to 
move all the logic to the other side.

Also the stuff about USB streams in super speed mode I've disabled in 
FreeBSD by default. If you want to do disk stuff, you need a proper PCI 
based disk controller, as simple as that. The same for network.

The way USB is designed, for example the BULK transport, basically 
forces you to memcpy() IP-packets into a bigger buffer, which is then 
moved in wMaxpacketSize chunks across the USB wires, typically like NCM. 
In FreeBSD there is a multi-packet feature, which just take the DMA 
pointer of all those packets, and link up a huge TD list, and then bang. 
But oh-no. Short terminated packets take just as long time as fully 
sized packets to transfer. Remember the ACK for every DATA? When already 
by design a protocol will lean on long and continuous data transfers, 
USB is no substitute for a ConnectX-4 and newer network card. And to all 
Intel engineers trying to facilitate that, by adding more and more 
features to USB: Please stop now!

10 Gbit/s is enough for USB in my opinion. If you go above that, rather 
use infiniband, which is already integrated with existing storage 
solutions. Rather than inventing yet another storage protocol. There are 
so many things going on down at the hardware level to get 100 GBit/s 
flowing without hickup, that I don't want to see any of that in the USB 
world.

Todays rant about the state of the USB world :-)

--HPS
