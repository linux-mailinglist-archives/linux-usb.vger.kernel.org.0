Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31F785EEF
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 11:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389783AbfHHJq0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 05:46:26 -0400
Received: from foss.arm.com ([217.140.110.172]:59052 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389774AbfHHJqZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 05:46:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D15D01596;
        Thu,  8 Aug 2019 02:46:24 -0700 (PDT)
Received: from [10.37.12.237] (unknown [10.37.12.237])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA9583F706;
        Thu,  8 Aug 2019 02:46:23 -0700 (PDT)
Subject: Re: usb zero copy dma handling
To:     Greg KH <gregkh@linuxfoundation.org>,
        yvahkhfo.1df7f8c2@hashmail.org
Cc:     security@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20190808084636.GB15080@priv-mua.localdomain>
 <20190808085811.GA1265@kroah.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <10bcb28b-e87b-7b16-97e3-88e727e76d25@arm.com>
Date:   Thu, 8 Aug 2019 10:46:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808085811.GA1265@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019-08-08 9:58 am, Greg KH wrote:
> On Thu, Aug 08, 2019 at 10:46:36AM +0200, yvahkhfo.1df7f8c2@hashmail.org wrote:
>> Hello linux-usb and linux-arm.
>>
>> Ccing security@ because "the kernel dma code is mapping randomish
>> kernel/user mem to a user process" seems to have security implications
>> even though i didnt research that aspect past "its a 100% reliable way
>> to crash a raspi from userspace".
>>
>> tried submitting this through linux-arm-kernel ~2 weeks ago but
>> the only "response" i got was phishing-spam.
>> tried to follow up through raspi-internals chat, they suggested
>> i try linux-usb instead, but otoh the original reporter was
>> deflected from -usb to "try some other mls, they might care".
>> https://www.spinics.net/lists/linux-usb/msg173277.html
>>
>> if i am not following some arcane ritual or indenting convention required
>> by regular users of these lists i apologize in advance, but i am not a
>> kernel developer, i am just here as a user with a bug and a patch.
>> (and the vger FAQ link 404s...)
> 
> The "arcane ritual" should be really well documented by now, it's in
> Documentation/SubmittingPatches in your kernel tree, and you can read it
> online at:
> 	https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
> 
>> i rediffed against HEAD even though the two weeks old patch still applied
>> cleanly with +2 offset.
>>
>> # stepping off soap box # actual technical content starts here #
>>
>> this is a followup to that thread from 2018-11:
>> https://www.spinics.net/lists/arm-kernel/msg685598.html
>>
>> the issue was discussed in more detail than i can claim
>> to fully understand back then, but no fix ever merged.
>> but i would really like to use rtl_433 on a raspi without
>> having to build a custom-patched kernel first.
>>
>> the attached patch is my stripdown/cleanup of a devel-diff
>> provided to me by the original reporter Steve Markgraf.
>> credits to him for the good parts, blame to me for the bad parts.
>>
>> this does not cover the additional case of "PIO-based usb controllers"
>> mainly because i dont understand what that means (or how to handle it)
>> and if its broken right now (as the thread indicates) it might
>> as well stay broken until someone who understands cares enough.
>>
>> could you please get this on track for merging?
> 
> 
>>
>> regards,
>>    x23
>>
>>
>>
> 
>> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
>> index b265ab5405f9..69594c2169ea 100644
>> --- a/drivers/usb/core/devio.c
>> +++ b/drivers/usb/core/devio.c
>> @@ -238,9 +238,14 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>>   	usbm->vma_use_count = 1;
>>   	INIT_LIST_HEAD(&usbm->memlist);
>>   
>> +#ifdef CONFIG_X86
>>   	if (remap_pfn_range(vma, vma->vm_start,
>>   			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>>   			size, vma->vm_page_prot) < 0) {
>> +#else /* !CONFIG_X86 */
>> +	if (dma_mmap_coherent(ps->dev->bus->sysdev,
>> +			vma, mem, dma_handle, size) < 0) {
>> +#endif /* !CONFIG_X86 */
>>   		dec_usb_memory_use_count(usbm, &usbm->vma_use_count);
>>   		return -EAGAIN;
>>   	}
> 
> First off, we need this in a format we could apply it in (hint, read the
> above links).
> 
> But the main issue here is what exactly is this "fixing"?  What is wrong
> with the existing code that non-x86 systems have such a problem with?
> Shouldn't all of these dma issues be handled by the platform with the
> remap_pfn_range() call itself?

If usbm->mem is (or ever can be) a CPU address returned by 
dma_alloc_coherent(), then doing virt_to_phys() on it is bogus and may 
yield a nonsense 'PFN' to begin with. However, it it can can ever come 
from a regular page allocation/kmalloc/vmalloc then unconditionally 
passing it to dma_mmap_coherent wouldn't be right either.

Robin.

> 
> What is the problem that you are having?
> 
> thanks,
> 
> greg k-h
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
