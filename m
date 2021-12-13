Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE06472D87
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 14:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237732AbhLMNiP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 08:38:15 -0500
Received: from cable.insite.cz ([84.242.75.189]:48110 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237716AbhLMNiN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Dec 2021 08:38:13 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 48BA8A1A3D405;
        Mon, 13 Dec 2021 14:38:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639402692; bh=eUkfGVf+uSLeYKbNZfd6Myf4iXTcMCHKztvkv3GyTEw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Cd6CBiT7pWQXs9GWWLAQwl8A/v0yP/9XsaCyK+G8CFHye1Tq9a1cndX3DDflHNBBj
         /3BGqae6Ti29L29aUY2D4ia64DKS8nE5O0g05nlyMcioatkLDYvm4fq9UORg0JpN/+
         YpFJsET+V2kW12X83XP6CneYdoecQZQZH2qogvTs=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SxuPUTUEf-Po; Mon, 13 Dec 2021 14:38:12 +0100 (CET)
Received: from [192.168.100.21] (unknown [192.168.100.21])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 1CD3AA1A3D404;
        Mon, 13 Dec 2021 14:38:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639402692; bh=eUkfGVf+uSLeYKbNZfd6Myf4iXTcMCHKztvkv3GyTEw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Cd6CBiT7pWQXs9GWWLAQwl8A/v0yP/9XsaCyK+G8CFHye1Tq9a1cndX3DDflHNBBj
         /3BGqae6Ti29L29aUY2D4ia64DKS8nE5O0g05nlyMcioatkLDYvm4fq9UORg0JpN/+
         YpFJsET+V2kW12X83XP6CneYdoecQZQZH2qogvTs=
Subject: Re: usb: dwc2: Detecting cable disconnection in OTG mode?
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <7cce9f05-d659-1fe8-2862-aeca75693808@ivitera.com>
 <ace0e7e0-bf55-e2e4-a17f-c411de8a5266@ivitera.com>
 <897c79d2-eb88-01f5-95b6-67d5ab12954d@ivitera.com>
 <5aada8e3-f385-0589-8d58-187abd1a924d@synopsys.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <3d6d6212-41d9-dcea-637d-0ebeec835220@ivitera.com>
Date:   Mon, 13 Dec 2021 14:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5aada8e3-f385-0589-8d58-187abd1a924d@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: cs-CZ
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 13. 12. 21 v 11:58 Minas Harutyunyan napsal(a):
> Hi Pavel,
> 
> On 12/12/2021 5:47 PM, Pavel Hofman wrote:
>> Dne 11. 12. 21 v 10:59 Pavel Hofman napsal(a):
>>> Dne 11. 12. 21 v 10:55 Pavel Hofman napsal(a):
>>>> Hi Minas,
>>>>
>>>> I am trying to find if dwc2 in OTG mode can pass information to
>>>> gadget functions that the host has been disconnected. I am testing on
>>>> RPi4. In a datasheet for a different dwc2 implementation
>>>> https://urldefense.com/v3/__https://www.mouser.cn/datasheet/2/196/Infineon-xmc4500_rm_v1.6_2016-UM-v01_06-EN-598157.pdf__;!!A4F2R9G_pg!MEHtWBYLNFmrcqrgWFVPEBTCgO8uc0-Csekg1qk6WkiSEqzoGkWH8OMo9aZtgRJGugkkc6Kq$
>>>> - chapter "16.8.3 Device Disconnection" I found:
>>>>
>>>>
>>>> ===========
>>>> The device session ends when the USB cable is disconnected or if the
>>>> VBUS is switched off by the host.
>>>> The device disconnect flow is as follows:
>>>>
>>>> 1. When the USB cable is unplugged or when the VBUS is switched off
>>>> by the host, the device core triggers GINTSTS.OTGInt [bit 2]
>>>> interrupt bit
>>>> ============
>>>>
>>>> I put a printk to core_intr.c:dwc2_handle_otg_intr() which is called
>>>> only from handling the OTGInt interrupt
>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/core_intr.c*L803__;Iw!!A4F2R9G_pg!MEHtWBYLNFmrcqrgWFVPEBTCgO8uc0-Csekg1qk6WkiSEqzoGkWH8OMo9aZtgRJGumkIC5EA$
>>>> . But this method is not called at all when disconnecting the USB
>>>> cable on RPi4 in gadget mode.
>>>>
>>>
>>> To add, the method dwc2_hsotg_disconnect is called, but after
>>> reconnecting the cable, as part of the gadget reset  when handling
>>> reset interrupts (gintsts & (GINTSTS_USBRST | GINTSTS_RESETDET)) here
>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/gadget.c*L3653__;Iw!!A4F2R9G_pg!MEHtWBYLNFmrcqrgWFVPEBTCgO8uc0-Csekg1qk6WkiSEqzoGkWH8OMo9aZtgRJGugg7wbmK$
>>>
>>
>>
>> Maybe the reason for the OTGInt not being thrown at cable disconnect is
>> the fact that RPi4 most likely does not handle USB_OTG_ID signal. I
>> asked about USB_OTG_ID wiring on RPi4 at their forum.
>>
>> Nevertheless it turns out that DWC2 throws Suspend interrupt
>> GINTSTS_USBSUSP (11) at cable disconnection on the RPi4, and the gadget
>> composite driver calls suspend hook of struct usb_function. I wonder if
>> implementing the suspend handler would be a solution for other dwc2
>> implementations, or if the audio function should implement also some
>> other handler in order to correctly serve the cable disconnection for
>> all dwc2 implementations.
>>
>> Thanks a lot,
>>
>> Pavel.
>>
>>
>>
> Disconnect event on different platform behave differently. It's depend
> on platform design, PHY, etc. Yes, GINTSTS_USBSUSP (11) at cable
> disconnection can be used to detect disconnect event.
> 

Minas, thanks for the confirmation, I will base my notification patch on 
GINTSTS_USBSUSP for the cable disconnect detection.

Best regards,

Pavel.
