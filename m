Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B9D393F17
	for <lists+linux-usb@lfdr.de>; Fri, 28 May 2021 10:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbhE1JBR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 May 2021 05:01:17 -0400
Received: from cable.insite.cz ([84.242.75.189]:42769 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229911AbhE1JBR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 May 2021 05:01:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id EE031A1A3D401;
        Fri, 28 May 2021 10:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1622192379; bh=5j4AXxdOAPeZ/TwLAaKhe7vshMP7p0kxkvPnwi8sT9o=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=pQIOpC3OfLOYyIPnphBnWObFM2yK9WkxnSHN/ly3y1IVSkITIyHpo1ny0nhT6/Qtq
         zj3bWMlQ7TE5tXuxrqjSV4MMQvoIuRRmEf9nGOniid9Np/nTvMZgic0dnArm1H9ggd
         Olh7sb45lDhFNWxL6p2EynPn43Z47L+0lp3l6hC4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZutnDJaB4KHQ; Fri, 28 May 2021 10:59:34 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 088E8A1A3D400;
        Fri, 28 May 2021 10:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1622192374; bh=5j4AXxdOAPeZ/TwLAaKhe7vshMP7p0kxkvPnwi8sT9o=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=c5PG5v1RhNcCw7Px+/jt1ahnDHyWh6bANlvG/kqqzdvaM0bupxG1OrLaAyIuns4us
         xNg2ZD31fM9VlQ4WPcOcm+DIpYeTsFP9d1k1xc2gkEcfEYHT6S78y56iWEYGunIAE3
         Pu0u12/QupSG2iA3tNBZa1rjrf5H7a6LQcpBPJyM=
Subject: Re: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
References: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
 <44d8f7e0-b2d0-8547-7367-7a35af68efe6@i2se.com>
 <7c2e3e1f-db10-b376-9b87-ef93c8d8289c@ivitera.com>
 <f9c90203-a67e-0e33-09a8-f173af63e771@i2se.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <a5b12552-1340-aa71-caca-fbef98b8b3e3@ivitera.com>
Date:   Fri, 28 May 2021 10:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f9c90203-a67e-0e33-09a8-f173af63e771@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 27. 05. 21 v 15:47 Stefan Wahren napsal(a):

>> I think I see the problem.
>>
>> IIUC the calculations and checks, all g-tx-fifo-size values +
>> g-rx-fifo-size + g-np-tx-fifo-size must not exceed total_fifo_size. My
>> RPi4 reports the total_fifo_size as 4080 (in
>> /sys/kernel/debug/usb/fe980000.usb/hw_params).
>>
>> Linux mainline
>> https://github.com/torvalds/linux/search?p=3&q=g-tx-fifo-size :
>>
>> The increase in value of g-rx-fifo-size exceeds the limit for the DTSI
>> files we patched:
>>
>> Both bcm283x-rpi-usb-peripheral.dtsi and bcm283x-rpi-usb-otg.dtsi:
>> 558 + 32 + 256 + 256 + 512 + 512 + 512 + 768 + 768 = 4174 > 4080
>>
>> while the sum with the previous value of 256 reached just 3872 < 4080.
>>
>>
>> The raspberrypi repo
>> https://github.com/raspberrypi/linux/search?q=g-tx-fifo-size :
>>
>> It has a different mix of the DTSI files
>> dwc2-overlay.dts
>> upstream-overlay.dts
>> upstream-pi4-overlay.dts
> yes these overlay files are vendor specific and doesn't exist in
> mainline. The upstream*dts were intended to "simulate" mainline
> behavior, but unfortunately differ in this case.
>>
>> all of which define
>> g-tx-fifo-size = <512 512 512 512 512 256 256>;
>>
>> Here the calculation holds:
>> 558 + 32 + 512 + 512 + 512 + 512 + 512 + 256 + 256 = 3662 < 4080
>>
>> My RPi4 uses one of these DTSIs, because my
>> /sys/kernel/debug/usb/fe980000.usb/params says:
>>
>> g_rx_fifo_size                : 558
>> g_np_tx_fifo_size             : 32
>> g_tx_fifo_size[0]             : 0
>> g_tx_fifo_size[1]             : 512
>> g_tx_fifo_size[2]             : 512
>> g_tx_fifo_size[3]             : 512
>> g_tx_fifo_size[4]             : 512
>> g_tx_fifo_size[5]             : 512
>> g_tx_fifo_size[6]             : 256
>> g_tx_fifo_size[7]             : 256
>>
>>
>> IIUC the tx_fifo values in bcm283x-rpi-usb-peripheral.dtsi and
>> bcm283x-rpi-usb-otg.dtsi files can be lowered to the values used and
>> tested (at least by me) in the RPi repo. But this is outside of my
>> knowledge, honestly I do not know what is the most appropriate
>> distribution of the remaining fifo space among the g_tx_fifo buffers.
>> Please can the RPi developers (Phil?) suggest a fix?
> 
> As author of the mainline bcm283x-rpi-usb-otg.dtsi i was trying to
> optimize the fifo sizes for EP 6 and 7. But i don't remember why. So my
> suggestion for a fix would be:
> 
> g-tx-fifo-size = <256 256 256 512 512 768 768>;
> 
> But i'm also unsure about the values.
> 

IIUC this code
https://github.com/torvalds/linux/blob/master/drivers/usb/dwc2/gadget.c#L4091
optimizes the FIFO assignment to endpoints. From that I would conclude
that correct values are specific for each use-case configuration of
endpoints. Maybe a varied selection (256, 512, 768) is more convenient
than just 256 and 512. I really do not know what use cases need what TX
fifo values.


BTW perhaps this comment
https://github.com/torvalds/linux/blob/master/drivers/usb/dwc2/gadget.c#L327
is a bit misleading since that code does not do the assignment, just
stores the size distribution to the DPTXFSIZN register, IIUC.

Best regards,

Pavel.
