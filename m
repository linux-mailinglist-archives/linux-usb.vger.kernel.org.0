Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AB9471A74
	for <lists+linux-usb@lfdr.de>; Sun, 12 Dec 2021 14:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhLLNrf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Dec 2021 08:47:35 -0500
Received: from cable.insite.cz ([84.242.75.189]:35254 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231218AbhLLNrd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 12 Dec 2021 08:47:33 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 7F7DDA1A3D405;
        Sun, 12 Dec 2021 14:47:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639316851; bh=PtiuHvMgg1v8ovCPLzsPFekDFQtCec7HEe/Qq468zAw=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=SfPfwIhYQZEQQlAi8lLuUjWE7mGmYbLh34ZiMRq7BwYcfI4aH4KRR04hWWZmungz8
         JTt1CdRDCdXRNZKSnw7Gg1RtR9ifYBfSEjUtBnYKNmfQQ0zMXTQLuSaV4cx6ujaked
         B9/fKACFa+dGguYudRZ+wPwKUNXvQKVgWX6gHlJY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xlEt1cSF61tE; Sun, 12 Dec 2021 14:47:25 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 4E112A1A3D404;
        Sun, 12 Dec 2021 14:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639316845; bh=PtiuHvMgg1v8ovCPLzsPFekDFQtCec7HEe/Qq468zAw=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=IcLkuCWgqw3dt/JGpVjFp3mpzq7UN1pnlU5K9g9zm3S9k6sVRYO2SW4WHxJ/9U2lG
         n4CehG3/PjWgZrEuwbq3LjpwmuSq6kd0zHeiLCnh2A/7quBzwxNUrCeq2aloC2GLvl
         RM0APhtbTl3hz/UEVPVTeQw8h+DgbDNJ26pd4/vU=
Subject: Re: usb: dwc2: Detecting cable disconnection in OTG mode?
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <7cce9f05-d659-1fe8-2862-aeca75693808@ivitera.com>
 <ace0e7e0-bf55-e2e4-a17f-c411de8a5266@ivitera.com>
Message-ID: <897c79d2-eb88-01f5-95b6-67d5ab12954d@ivitera.com>
Date:   Sun, 12 Dec 2021 14:47:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ace0e7e0-bf55-e2e4-a17f-c411de8a5266@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 11. 12. 21 v 10:59 Pavel Hofman napsal(a):
> Dne 11. 12. 21 v 10:55 Pavel Hofman napsal(a):
>> Hi Minas,
>>
>> I am trying to find if dwc2 in OTG mode can pass information to gadget 
>> functions that the host has been disconnected. I am testing on RPi4. 
>> In a datasheet for a different dwc2 implementation 
>> https://www.mouser.cn/datasheet/2/196/Infineon-xmc4500_rm_v1.6_2016-UM-v01_06-EN-598157.pdf 
>> - chapter "16.8.3 Device Disconnection" I found:
>>
>>
>> ===========
>> The device session ends when the USB cable is disconnected or if the 
>> VBUS is switched off by the host.
>> The device disconnect flow is as follows:
>>
>> 1. When the USB cable is unplugged or when the VBUS is switched off by 
>> the host, the device core triggers GINTSTS.OTGInt [bit 2] interrupt bit
>> ============
>>
>> I put a printk to core_intr.c:dwc2_handle_otg_intr() which is called 
>> only from handling the OTGInt interrupt 
>> https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/core_intr.c#L803 
>> . But this method is not called at all when disconnecting the USB 
>> cable on RPi4 in gadget mode.
>>
> 
> To add, the method dwc2_hsotg_disconnect is called, but after 
> reconnecting the cable, as part of the gadget reset  when handling reset 
> interrupts (gintsts & (GINTSTS_USBRST | GINTSTS_RESETDET)) here 
> https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/gadget.c#L3653 
> 


Maybe the reason for the OTGInt not being thrown at cable disconnect is 
the fact that RPi4 most likely does not handle USB_OTG_ID signal. I 
asked about USB_OTG_ID wiring on RPi4 at their forum.

Nevertheless it turns out that DWC2 throws Suspend interrupt 
GINTSTS_USBSUSP (11) at cable disconnection on the RPi4, and the gadget 
composite driver calls suspend hook of struct usb_function. I wonder if 
implementing the suspend handler would be a solution for other dwc2 
implementations, or if the audio function should implement also some 
other handler in order to correctly serve the cable disconnection for 
all dwc2 implementations.

Thanks a lot,

Pavel.



