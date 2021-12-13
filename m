Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EE447362B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 21:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243011AbhLMUkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 15:40:46 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48078 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242303AbhLMUkp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 15:40:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 47E8CB80499
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 20:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA75C34600;
        Mon, 13 Dec 2021 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639428043;
        bh=WVbHqBVKJ9ZaqODs/1bh8apvwUxkqY/kAN6Uj9lUQLo=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=GbctwtdF6qBPKie8Wt4BUGensuZWGAZqxbx37yhWKFxDByZHM5WV/sOD7CDTPfccJ
         vP2x+ekVI8sJc6DUmcXU5TXMHcbHG3xvA+VArrEvs8UxuFFfHghv+DqW5xeIAh9V5A
         pqBYs/lEVJrcg5Zn60qd6NwCrBwKas1NwLOyIFsGKxHk5fSQvEMpClalo1psQpcCDw
         cqHuReJ39zeQUhivytRJ8BEejQf7x92MStDdV8T3JjNx0gUW5ry34M6iCmU83hNRv4
         1ZfDN9fWs7ugX+rUQCLEegbb/ef1u6k7+Bb7vjhNQIslyWqJVhaLUR1KXp/EbGsGhM
         KUC+i/c3ahIpA==
Subject: Re: usb: dwc2: USB on Agilex platform broken after commit
 50fb0c128b6e
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dinh.linux@gmail.com
References: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
 <5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com>
 <0fe0ad93-1f17-5e88-e381-94544ac75185@kernel.org>
Message-ID: <7ffb5888-2001-8de9-7104-db66797b2112@kernel.org>
Date:   Mon, 13 Dec 2021 14:40:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0fe0ad93-1f17-5e88-e381-94544ac75185@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12/13/21 10:13 AM, Dinh Nguyen wrote:
> Hi Minas,
> 
> Thanks for replying!
> 
> On 12/13/21 3:47 AM, Minas Harutyunyan wrote:
>> Hi Dinh,
>>
>> On 12/9/2021 1:44 AM, Dinh Nguyen wrote:
>>> Hi Arthur,
>>>
>>> The usb driver is getting this error:
>>>
>>> [    1.539856] Hardware name: SoCFPGA Agilex SoCDK (DT)
>>> [    1.544799] Call trace:
>>> [    1.547233]  dump_backtrace+0x0/0x1c0
>>> [    1.550897]  show_stack+0x18/0x68
>>> [    1.554202]  dump_stack+0xd8/0x134
>>> [    1.557597]  __report_bad_irq+0x38/0xf0
>>> [    1.561423]  note_interrupt+0x31c/0x3e8
>>> [    1.565244]  handle_irq_event_percpu+0x60/0x90
>>> [    1.569671]  handle_irq_event+0x48/0xe0
>>> [    1.573491]  handle_fasteoi_irq+0xb0/0x138
>>> [    1.577574]  generic_handle_irq+0x30/0x48
>>> [    1.581567]  __handle_domain_irq+0x60/0xb8
>>> [    1.585646]  gic_handle_irq+0xb4/0xd0
>>> [    1.589300]  el1_irq+0xb8/0x150
>>> [    1.592428]  arch_cpu_idle+0x18/0x28
>>> [    1.595992]  default_idle_call+0x24/0x5c
>>> [    1.599899]  do_idle+0x1f4/0x290
>>> [    1.603118]  cpu_startup_entry+0x28/0x68
>>> [    1.607026]  rest_init+0xd8/0xe8
>>> [    1.610242]  arch_call_rest_init+0x10/0x1c
>>> [    1.614329]  start_kernel+0x50c/0x544
>>> [    1.617980] handlers:
>>> [    1.620241] [<00000000ae601aac>] dwc2_handle_common_intr
>>> [    1.625541] [<00000000255d793a>] dwc2_hsotg_irq
>>> [    1.630056] [<000000000bc68ab4>] usb_hcd_irq
>>> [    1.634312] Disabling IRQ #33
>>>
>>> After a git-bisect, the result is this commit:
>>>
>>>
>>> commit 50fb0c128b6e8df62200ba85c05ecd6b1396476d
>>> Author: Artur Petrosyan<Arthur.Petrosyan@synopsys.com>
>>> Date:   Tue Apr 13 11:37:15 2021 +0400
>>>
>>>       usb: dwc2: Add clock gating entering flow by system suspend
>>>       If not hibernation nor partial power down are supported,
>>>       clock gating is used to save power.
>>>       Adds a new flow of entering clock gating when PC is
>>>       suspended.
>>>       Signed-off-by: Artur Petrosyan<Arthur.Petrosyan@synopsys.com>
>>>       
>>> Link:https://lore.kernel.org/r/20210413073716.30C13A0094@mailhost.synopsys.com 
>>>
>>>       Signed-off-by: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
>>>
>>> The DWC2 USB version on the Agilex platform is
>>> 0x4F54330A
>>>
>> Could you please provide HW configuration registers values (GHWCFG1-4).
>>
> 
> [    0.987779] dwc2 ffb00000.usb: GHWCFG1    @0xFFFF800012940044 : 
> 0x00000000
> [    0.994644] dwc2 ffb00000.usb: GHWCFG2    @0xFFFF800012940048 : 
> 0x238FFC90
> [    1.001498] dwc2 ffb00000.usb: GHWCFG3    @0xFFFF80001294004C : 
> 0x1F8002E8
> [    1.008350] dwc2 ffb00000.usb: GHWCFG4    @0xFFFF800012940050 : 
> 0xFE0F0020
> 
> 
> I did a little debugging, and noticed that the GINTSTS_PRTINT is firing, 
> so the dwc2_handle_common_intr() is getting called continuously. There's 
> doesn't seem to be way to handle the GINTSTS_PRTINT bit, because there's 
> a check for device_mode().
> 

It looks like the LPMMode bit is disabled in the GHWCFG3. Could that be 
the reason why?

Dinh
