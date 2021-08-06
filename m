Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37383E2CEA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 16:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241409AbhHFOrF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 10:47:05 -0400
Received: from cable.insite.cz ([84.242.75.189]:42294 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232160AbhHFOqv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 10:46:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 7C6FBA1A3D401;
        Fri,  6 Aug 2021 16:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1628261193; bh=5AEm7eU8DUwYfsjEhma67kaXYIpvAenvtmEtvc7e24M=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=eJ9e0tBL7Rl+ntz0+GGgGFKHAgAuooIwHq3K5xuIHra3+j7HorYO7SRwLPDbrXWE5
         dKKJ6OhFePSvaWWAyI6ZwO4MWNaHaIMn+3EwEQuIErPlGmXrR9Ij/wU8PCn9LR1KK9
         oHcUsT04CLzH0SvfW7zwiyE1KB6Qw1QlA3M0xdO4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8D6Rf19_LPFP; Fri,  6 Aug 2021 16:46:26 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 7301DA1A3D400;
        Fri,  6 Aug 2021 16:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1628261186; bh=5AEm7eU8DUwYfsjEhma67kaXYIpvAenvtmEtvc7e24M=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=OE06YQ8bbWunhXjq46okep9xzeX60rEMYNaNO0w0Tqn4fQhQHGdMsUvv9hCbn7HwS
         VLB+DzcdSc/UjoDrkSU/19rx/MP6ZTmh4oh7CG9+9/pl/YY1mB7ySGoe5FpYCEFCLT
         vGp1yW1b/Up3l0U7LBHicva7wASZXzgaRINdDxoQ=
Subject: Re: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Phil Elwell <phil@raspberrypi.com>
References: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
 <44d8f7e0-b2d0-8547-7367-7a35af68efe6@i2se.com>
 <7c2e3e1f-db10-b376-9b87-ef93c8d8289c@ivitera.com>
 <f9c90203-a67e-0e33-09a8-f173af63e771@i2se.com>
 <a5b12552-1340-aa71-caca-fbef98b8b3e3@ivitera.com>
 <b95c479a-43bc-b9bc-1e83-cf2fab2fbd95@ivitera.com>
 <76d98dbe-61b3-148e-e9d6-ceba1db600d6@i2se.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <791c432f-fd65-870f-3167-6b2056d6d5bd@ivitera.com>
Date:   Fri, 6 Aug 2021 16:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <76d98dbe-61b3-148e-e9d6-ceba1db600d6@i2se.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Stefan,

Dne 06. 08. 21 v 16:08 Stefan Wahren napsal(a):
> Hi Pavel,
> 
> Am 06.08.21 um 15:03 schrieb Pavel Hofman:
>> Dne 28. 05. 21 v 10:59 Pavel Hofman napsal(a):
>>> Dne 27. 05. 21 v 15:47 Stefan Wahren napsal(a):
>>>
>>>>> I think I see the problem.
>>>>>
>>>>> IIUC the calculations and checks, all g-tx-fifo-size values +
>>>>> g-rx-fifo-size + g-np-tx-fifo-size must not exceed total_fifo_size. My
>>>>> RPi4 reports the total_fifo_size as 4080 (in
>>>>> /sys/kernel/debug/usb/fe980000.usb/hw_params).
>>>>>
>>>>> Linux mainline
>>>>> https://github.com/torvalds/linux/search?p=3&q=g-tx-fifo-size :
>>>>>
>>>>> The increase in value of g-rx-fifo-size exceeds the limit for the DTSI
>>>>> files we patched:
>>>>>
>>>>> Both bcm283x-rpi-usb-peripheral.dtsi and bcm283x-rpi-usb-otg.dtsi:
>>>>> 558 + 32 + 256 + 256 + 512 + 512 + 512 + 768 + 768 = 4174 > 4080
>>>>>
>>>>> while the sum with the previous value of 256 reached just 3872 < 4080.
>>>>>
>>>>>
>>>>> The raspberrypi repo
>>>>> https://github.com/raspberrypi/linux/search?q=g-tx-fifo-size :
>>>>>
>>>>> It has a different mix of the DTSI files
>>>>> dwc2-overlay.dts
>>>>> upstream-overlay.dts
>>>>> upstream-pi4-overlay.dts
>>>> yes these overlay files are vendor specific and doesn't exist in
>>>> mainline. The upstream*dts were intended to "simulate" mainline
>>>> behavior, but unfortunately differ in this case.
>>>>>
>>>>> all of which define
>>>>> g-tx-fifo-size = <512 512 512 512 512 256 256>;
>>>>>
>>>>> Here the calculation holds:
>>>>> 558 + 32 + 512 + 512 + 512 + 512 + 512 + 256 + 256 = 3662 < 4080
>>>>>
>>>>> My RPi4 uses one of these DTSIs, because my
>>>>> /sys/kernel/debug/usb/fe980000.usb/params says:
>>>>>
>>>>> g_rx_fifo_size                : 558
>>>>> g_np_tx_fifo_size             : 32
>>>>> g_tx_fifo_size[0]             : 0
>>>>> g_tx_fifo_size[1]             : 512
>>>>> g_tx_fifo_size[2]             : 512
>>>>> g_tx_fifo_size[3]             : 512
>>>>> g_tx_fifo_size[4]             : 512
>>>>> g_tx_fifo_size[5]             : 512
>>>>> g_tx_fifo_size[6]             : 256
>>>>> g_tx_fifo_size[7]             : 256
>>>>>
>>>>>
>>>>> IIUC the tx_fifo values in bcm283x-rpi-usb-peripheral.dtsi and
>>>>> bcm283x-rpi-usb-otg.dtsi files can be lowered to the values used and
>>>>> tested (at least by me) in the RPi repo. But this is outside of my
>>>>> knowledge, honestly I do not know what is the most appropriate
>>>>> distribution of the remaining fifo space among the g_tx_fifo buffers.
>>>>> Please can the RPi developers (Phil?) suggest a fix?
>>>>
>>>> As author of the mainline bcm283x-rpi-usb-otg.dtsi i was trying to
>>>> optimize the fifo sizes for EP 6 and 7. But i don't remember why. So my
>>>> suggestion for a fix would be:
>>>>
>>>> g-tx-fifo-size = <256 256 256 512 512 768 768>;
>>>>
>>>> But i'm also unsure about the values.
>>>>
>>>
>>> IIUC this code
>>> https://github.com/torvalds/linux/blob/master/drivers/usb/dwc2/gadget.c#L4091
>>>
>>> optimizes the FIFO assignment to endpoints. From that I would conclude
>>> that correct values are specific for each use-case configuration of
>>> endpoints. Maybe a varied selection (256, 512, 768) is more convenient
>>> than just 256 and 512. I really do not know what use cases need what TX
>>> fifo values.
>>>
>>
>> My patch raising  g-rx-fifo-size = 558 has been reverted back to
>> g-rx-fifo-size = 256 in upstream. 256 is clearly a wrong value. 558 is
>> enough for 2 packets per microframe. How about raising the value in
>> the mainline DTS files to 301 instead which will correctly work with 1
>> packet per microframe (the most common scenario) and comply with the
>> 4080 limit of the RX + all TXs sum of the TX configs in the mainline?
> 
> thank for your feedback. It has been reverted because the last patch
> broke USB completely on Raspberry Pi Zero and the only explanation for
> me is it has never been tested. The workflow is that the submitter is
> responsibly for testing. In case this is not possible the patch must be
> tagged with RFT or at least it must be mentioned in the commit message.
> 
> In case you want to have a different value, please feel free to send a
> patch, but please test it against a mainline kernel before. In case you
> have problems with it, feel free to ask.
> 
> Sorry, in case this sounds grumpy but it's very annoying to hunt down
> especially avoidable regressions with every kernel release. This wastes
> other developers time to get their patches upstream.
> 

I understand your points. I really did not test the patch with mainline 
combination of the TX values, sorry for that. I have no problem with the 
revert at all, just pointing out that the value of 256 is incorrect. It 
took a number of hours with patient help of Minas to find the culprit of 
the dwc2 gadget dropping audio samples with packet sizes over 980 bytes.

However, even if I did test and changed the TX values on my RPi4 
accordingly, I would not have been able to test on RPi Zero and the 
other RPi models. The questions are:

* Why did your TX values, changed to comply with the 4080 limit, break 
RPi Zero, what are the rules apart of the max sum of 4080?

* Why does mainline config have different RX and TX sizes than the 
RPi-vendor specific config (which I happen/ed to use)?

Maybe these questions should be resolved, allowing for safer developing 
the gadget on the RPi hardware.

Best regards,

Pavel.
