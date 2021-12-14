Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DCE4746D0
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 16:50:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhLNPuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 10:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbhLNPuH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 10:50:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA5AC061574
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 07:50:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7EB87B81B37
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 15:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F485C34604;
        Tue, 14 Dec 2021 15:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639497004;
        bh=vbvD2VbnSr6cuWmRNGl/5Rj3rvym+1KAnErjOLUDWB8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WVikHh+K0iGkpAEMT2tpfQCwc18BBEMtD7ZlqE6XfsPsb37cCQMqBVLaMuaDIwcVc
         JjnIUYgwSfmxO3WNIa1UkBYZWfxPFAJW3Y/F+qxUvgexTbyfHSs2MB3th4zOYIe0RU
         E6XPwP/+rK7LNdPeuECfoPA/fbPLf+XLOUEJsdN85wfTfWvTZB2PuY9JUhfixrBTnX
         mJQZq1pP5UBKYA8UD0ik4bYN8MT5h//LBtRAdseDxvRO5k/03JOuOJYHs/9Aw7a1qw
         KhHP94yheCJKYja5crfwxD/7+n3kiYmE83ErLvs+vh0uUh3r9xhNoJIs3ZIV/JtI0j
         Nt7faqFWFVSoA==
Subject: Re: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "dinh.linux@gmail.com" <dinh.linux@gmail.com>
References: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
 <5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com>
 <0fe0ad93-1f17-5e88-e381-94544ac75185@kernel.org>
 <7ffb5888-2001-8de9-7104-db66797b2112@kernel.org>
 <6551e530-90a4-7c68-d097-7ffbeafbb400@synopsys.com>
From:   Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <f73dc0d1-45ef-985a-a3d1-bfe740a734e0@kernel.org>
Date:   Tue, 14 Dec 2021 09:50:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6551e530-90a4-7c68-d097-7ffbeafbb400@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12/14/21 12:13 AM, Minas Harutyunyan wrote:
> Hi Dinh,
> 
> On 12/14/2021 12:40 AM, Dinh Nguyen wrote:
>>
>>
>> On 12/13/21 10:13 AM, Dinh Nguyen wrote:
>>> Hi Minas,
>>>
>>> Thanks for replying!
>>>
>>> On 12/13/21 3:47 AM, Minas Harutyunyan wrote:
>>>> Hi Dinh,
>>>>
>>>> On 12/9/2021 1:44 AM, Dinh Nguyen wrote:
>>>>> Hi Arthur,
>>>>>
>>>>> The usb driver is getting this error:
>>>>>
>>>>> [    1.539856] Hardware name: SoCFPGA Agilex SoCDK (DT)
>>>>> [    1.544799] Call trace:
>>>>> [    1.547233]  dump_backtrace+0x0/0x1c0
>>>>> [    1.550897]  show_stack+0x18/0x68
>>>>> [    1.554202]  dump_stack+0xd8/0x134
>>>>> [    1.557597]  __report_bad_irq+0x38/0xf0
>>>>> [    1.561423]  note_interrupt+0x31c/0x3e8
>>>>> [    1.565244]  handle_irq_event_percpu+0x60/0x90
>>>>> [    1.569671]  handle_irq_event+0x48/0xe0
>>>>> [    1.573491]  handle_fasteoi_irq+0xb0/0x138
>>>>> [    1.577574]  generic_handle_irq+0x30/0x48
>>>>> [    1.581567]  __handle_domain_irq+0x60/0xb8
>>>>> [    1.585646]  gic_handle_irq+0xb4/0xd0
>>>>> [    1.589300]  el1_irq+0xb8/0x150
>>>>> [    1.592428]  arch_cpu_idle+0x18/0x28
>>>>> [    1.595992]  default_idle_call+0x24/0x5c
>>>>> [    1.599899]  do_idle+0x1f4/0x290
>>>>> [    1.603118]  cpu_startup_entry+0x28/0x68
>>>>> [    1.607026]  rest_init+0xd8/0xe8
>>>>> [    1.610242]  arch_call_rest_init+0x10/0x1c
>>>>> [    1.614329]  start_kernel+0x50c/0x544
>>>>> [    1.617980] handlers:
>>>>> [    1.620241] [<00000000ae601aac>] dwc2_handle_common_intr
>>>>> [    1.625541] [<00000000255d793a>] dwc2_hsotg_irq
>>>>> [    1.630056] [<000000000bc68ab4>] usb_hcd_irq
>>>>> [    1.634312] Disabling IRQ #33
>>>>>
>>>>> After a git-bisect, the result is this commit:
>>>>>
>>>>>
>>>>> commit 50fb0c128b6e8df62200ba85c05ecd6b1396476d
>>>>> Author: Artur Petrosyan<Arthur.Petrosyan@synopsys.com>
>>>>> Date:   Tue Apr 13 11:37:15 2021 +0400
>>>>>
>>>>>        usb: dwc2: Add clock gating entering flow by system suspend
>>>>>        If not hibernation nor partial power down are supported,
>>>>>        clock gating is used to save power.
>>>>>        Adds a new flow of entering clock gating when PC is
>>>>>        suspended.
>>>>>        Signed-off-by: Artur Petrosyan<Arthur.Petrosyan@synopsys.com>
>>>>> Link:https://urldefense.com/v3/__https://lore.kernel.org/r/20210413073716.30C13A0094@mailhost.synopsys.com__;!!A4F2R9G_pg!IjGS70cMXB9miMnPdcoGriUpDvARm7ScwrlQXAiH9qN-ZnpcaiM_gD-KWp___MVyvEPm_djJ$
>>>>>
>>>>>        Signed-off-by: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
>>>>>
>>>>> The DWC2 USB version on the Agilex platform is
>>>>> 0x4F54330A
>>>>>
>>>> Could you please provide HW configuration registers values (GHWCFG1-4).
>>>>
>>>
>>> [    0.987779] dwc2 ffb00000.usb: GHWCFG1    @0xFFFF800012940044 :
>>> 0x00000000
>>> [    0.994644] dwc2 ffb00000.usb: GHWCFG2    @0xFFFF800012940048 :
>>> 0x238FFC90
>>> [    1.001498] dwc2 ffb00000.usb: GHWCFG3    @0xFFFF80001294004C :
>>> 0x1F8002E8
>>> [    1.008350] dwc2 ffb00000.usb: GHWCFG4    @0xFFFF800012940050 :
>>> 0xFE0F0020
>>>
>>>
>>> I did a little debugging, and noticed that the GINTSTS_PRTINT is
>>> firing, so the dwc2_handle_common_intr() is getting called
>>> continuously. There's doesn't seem to be way to handle the
>>> GINTSTS_PRTINT bit, because there's a check for device_mode().
>>>
>>
>> It looks like the LPMMode bit is disabled in the GHWCFG3. Could that be
>> the reason why?
>>
>> Dinh
> 
> Could you please disable clock gating by adding to
> dwc2_set_default_params() function follow line:
> p->no_clock_gating = true;
> like in dwc2_set_s3c6400_params() function.
> 

That did not fix the issue. However, if I remove the line:

+               /* After entering suspend, hardware is not accessible */
+               clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);

Then the issue gets fixed.

Dinh
