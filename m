Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA391B0D2A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 15:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgDTNq4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 09:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726307AbgDTNqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Apr 2020 09:46:55 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F58DC061A0C
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2020 06:46:55 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 495Sfj1f8Mz1rtN8;
        Mon, 20 Apr 2020 15:46:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 495Sfj0rjvz1qtwQ;
        Mon, 20 Apr 2020 15:46:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id yyA4CiQYevTq; Mon, 20 Apr 2020 15:46:51 +0200 (CEST)
X-Auth-Info: FT0c0yv0XonbfaBBcT4qWvm3vmiLRqm9Xq6sw5ABYF8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 20 Apr 2020 15:46:51 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
 <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
Date:   Mon, 20 Apr 2020 14:09:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/17/20 11:00 AM, Minas Harutyunyan wrote:
> Hi,

Hi,

> On 4/16/2020 6:31 PM, Marek Vasut wrote:
>> On 4/16/20 3:37 PM, Minas Harutyunyan wrote:
> 
>>> Or instead of patch, if you have any utility in system which will allow
>>> from command line clear soft disconnect bit from DCTL register? Offset
>>> of DCTL register is 0x804. SoftDiscon bit number is 1. Clear this bit
>>> and then plug cable.
>>
>> Clearing that bit with devmem allows the host PC to detect some
>> high-speed device got connected, but that's it, it does not detect it as
>> a gadget and no communication really happens.
>>
> 
> Please provide part of debug log on above mentioned scenario.

~ # devmem 0x49000804
0x00000002

~ # devmem 0x49000804 w 0
[   38.420954] dwc2 49000000.usb-otg: gintsts=04008c20  gintmsk=d8000806
[   38.425950] dwc2 49000000.usb-otg: USB SUSPEND
[   38.430395] dwc2 49000000.usb-otg: dwc2_handle_usb_suspend_intr:
DSTS=0x400003
[   38.437630] dwc2 49000000.usb-otg: DSTS.Suspend Status=1 HWCFG4.Power
Optimize=1 HWCFG4.Hibernation=0
[   38.446866] dwc2 49000000.usb-otg: ignore suspend request before
enumeration
[   38.453934] dwc2 49000000.usb-otg: dwc2_hsotg_irq: 04008420 00000000
(d8000806) retry 8

~ # devmem 0x49000804
0x00000000

cable is plugged in below

[   50.224271] dwc2 49000000.usb-otg: gintsts=44008420  gintmsk=d8000806
[   50.229268] dwc2 49000000.usb-otg: Session request interrupt - lx_state=0
[   50.236072] dwc2 49000000.usb-otg: dwc2_hsotg_irq: 04008420 00000000
(d8000806) retry 8
[   50.292232] dwc2 49000000.usb-otg: gintsts=04008c20  gintmsk=d8000806
[   50.297219] dwc2 49000000.usb-otg: USB SUSPEND
[   50.301666] dwc2 49000000.usb-otg: dwc2_handle_usb_suspend_intr:
DSTS=0x400003
[   50.308902] dwc2 49000000.usb-otg: DSTS.Suspend Status=1 HWCFG4.Power
Optimize=1 HWCFG4.Hibernation=0
[   50.318141] dwc2 49000000.usb-otg: ignore suspend request before
enumeration
[   50.325209] dwc2 49000000.usb-otg: dwc2_hsotg_irq: 04008420 00000000
(d8000806) retry 8


>>> Unfortunately, currently I'm working from home and can't remotely
>>> connect/disconnect cable in lab to try to reproduce observed by you issue.
>>
>> Maybe you should consider using something like this in the lab:
>> https://urldefense.com/v3/__https://www.ti.com/product/TS3USB30__;!!A4F2R9G_pg!O9sBVS3qah9rW57ccw0cT_8vz5fw0Ku3K_ZtNLuL2LNez4_AGF6wP2ZoKY2NF7yZ2vEfjmdg$
>>
> Thanks for advise. I'll buy and setup multiplexer later, because 
> currently I'm on quarantine and can't visit office.

Sure, hope it helps.

>> [...]
>>
>>   dwc2 49000000.usb-otg: mapped PA 49000000 to VA 473352f1
>>   dwc2 49000000.usb-otg: mapped PA 49000000 to VA 923761cb
>>   dwc2 49000000.usb-otg: supply vusb_d not found, using dummy regulator
>>   dwc2 49000000.usb-otg: supply vusb_a not found, using dummy regulator
>>   dwc2 49000000.usb-otg: registering common handler for irq48
>>   dwc2 49000000.usb-otg: dwc2_core_reset()
>>   dwc2 49000000.usb-otg: Core Release: 3.30a (snpsid=4f54330a)
>>   dwc2 49000000.usb-otg: Forcing mode to host
>>   dwc2 49000000.usb-otg: Waiting for host mode
>>   dwc2 49000000.usb-otg: Host mode set
>>   dwc2 49000000.usb-otg: Forcing mode to device
>>   dwc2 49000000.usb-otg: Waiting for device mode
>>   dwc2 49000000.usb-otg: Device mode set
>>   dwc2 49000000.usb-otg: Clearing force mode bits
>>   dwc2 49000000.usb-otg: NonPeriodic TXFIFO size: 32
>>   dwc2 49000000.usb-otg: RXFIFO size: 256
>>   dwc2 49000000.usb-otg: EPs: 9, dedicated fifos, 952 entries in SPRAM
> 
>>   dwc2 49000000.usb-otg: bound driver zero
>>   dwc2 49000000.usb-otg: dwc2_hsotg_pullup: is_on: 1 op_state: 0
> 
>>   dwc2 49000000.usb-otg: DCFG=0x08100000, DCTL=0x00000002, DIEPMSK=00000000
>>   dwc2 49000000.usb-otg: GAHBCFG=0x00000000, GHWCFG1=0x00000000
>>   dwc2 49000000.usb-otg: GRXFSIZ=0x00000400, GNPTXFSIZ=0x04000400
>>   dwc2 49000000.usb-otg: DPTx[1] FSize=1024, StAddr=0x00000800
>>   dwc2 49000000.usb-otg: DPTx[2] FSize=1024, StAddr=0x00000c00
> 
> Do you use zero gadget?

Yes

> Pay attention that bounding function driver and 
> pullup set to 1 much earlier than core/dwc2 finished initialization.
> Can you modprobe zero gadget after dwc2 fully initialized?

I have the zero gadget compiled into the kernel, I would expect that
should work too, right ?
