Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630A2E8842
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 13:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfJ2MeD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 08:34:03 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36556 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJ2MeD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Oct 2019 08:34:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TCY1uu077960;
        Tue, 29 Oct 2019 07:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572352441;
        bh=yVCk3DHcSBhwcVFI6tN1Fz3hS6xZKQUUY3VLO+a6ax4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xv5B8r2FC213Tq6h07ZMrXsQ5oWRCVjsooY2KYCmGGY4xWTEo/UB0rT2DDuDxvXWm
         nJCG/V+OPlS3bQpAiyROecT9p0iOIi2HoX4lggTUvqTYQwQ5t+g/UzxIVHV4Y2gxHH
         18SjzmD7Ue85ITekuh9pu1HAGCzrAYfsIyH0ssMw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TCY1qn098503
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Oct 2019 07:34:01 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 29
 Oct 2019 07:33:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 29 Oct 2019 07:33:49 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TCXxie091974;
        Tue, 29 Oct 2019 07:34:00 -0500
Subject: Re: g_audio breaks with dwc3
To:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "Bin Liu [EP]" <b-liu@ti.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
 <87r22vhh79.fsf@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <e9f45017-eb2b-f6e1-0e15-814876bea4db@ti.com>
Date:   Tue, 29 Oct 2019 14:33:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87r22vhh79.fsf@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 29/10/2019 14:25, Felipe Balbi wrote:
> 
> Hi,
> 
> Roger Quadros <rogerq@ti.com> writes:
>> I'm on v5.4-rc5 on TI's dra7 platform
>>
>> root@dra7xx-evm:~# modprobe g_audio
>> [   79.951077] g_audio gadget: Linux USB Audio Gadget, version: Feb 2, 2012
>> [   79.957849] g_audio gadget: g_audio ready
>>
>> Now I plug the EVM's USB to PC host.
>>
>> root@dra7xx-evm:~# [   85.359410] g_audio gadget: high-speed config #1: Linux USB Audio Gadget
>> [   85.450574] 8<--- cut here ---
>> [   85.453645] Unable to handle kernel paging request at virtual address ecb769dc
>> [   85.460900] pgd = 08bb55ef
>> [   85.463618] [ecb769dc] *pgd=aca1141e(bad)
>> [   85.467651] Internal error: Oops: 8000000d [#1] SMP ARM
>> [   85.472897] Modules linked in: usb_f_uac2 u_audio g_audio libcomposite xhci_plat_hcd xhci_hcd usbcore dwc3 evdev udc_core usb_common spi_nor snd_soc_simple_card snd_soc_simple_card_utils leds_gpio led_class 4
>> [   85.523128] CPU: 0 PID: 1240 Comm: irq/170-dwc3 Not tainted 5.4.0-rc5 #50
>> [   85.529945] Hardware name: Generic DRA74X (Flattened Device Tree)
>> [   85.536066] PC is at 0xecb769dc
>> [   85.539240] LR is at dwc3_gadget_giveback+0x44/0x50 [dwc3]
> 
> what's in dwc3_gadget_giveback + 0x44? GDB can tell you that.

(gdb) list *(dwc3_gadget_giveback+0x44)
0x80b8 is in dwc3_gadget_giveback (./include/linux/spinlock.h:338).
333		raw_spin_lock_init(&(_lock)->rlock);		\
334	} while (0)
335	
336	static __always_inline void spin_lock(spinlock_t *lock)
337	{
338		raw_spin_lock(&lock->rlock);
339	}
340	
341	static __always_inline void spin_lock_bh(spinlock_t *lock)
342	{

> 
>> dwc3 trace dump is below
>>
> 
> [...]
> 
>> irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0
> 
> What the hell??? Where's the endpoint name?
> 

-- 

cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
