Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F161C19FD
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2020 17:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgEAPrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 May 2020 11:47:24 -0400
Received: from foss.arm.com ([217.140.110.172]:43018 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728812AbgEAPrX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 1 May 2020 11:47:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1602630E;
        Fri,  1 May 2020 08:47:23 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2FB53F68F;
        Fri,  1 May 2020 08:47:22 -0700 (PDT)
Subject: Re: [PATCH] usb: usbfs: correct kernel->user page attribute mismatch
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        git@thegavinli.com, jarkko.sakkinen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200430211922.929165-1-jeremy.linton@arm.com>
 <20200501070500.GA887524@kroah.com>
From:   Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <d2d4f50e-a0bf-77c8-399b-86c2137bfa84@arm.com>
Date:   Fri, 1 May 2020 10:47:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501070500.GA887524@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Thanks for taking a look at this.

On 5/1/20 2:05 AM, Greg KH wrote:
> On Thu, Apr 30, 2020 at 04:19:22PM -0500, Jeremy Linton wrote:
>> On arm64, and possibly other architectures, requesting
>> IO coherent memory may return Normal-NC if the underlying
>> hardware isn't coherent. If these pages are then
>> remapped into userspace as Normal, that defeats the
>> purpose of getting Normal-NC, as well as resulting in
>> mappings with differing cache attributes.
> 
> What is "Normal-NC"?

A non-cacheable attribute on arm64 pages. I think Mark R & Marc Z 
elaborated while I was asleep (thanks!).
   .


> 
>> In particular this happens with libusb, when it attempts
>> to create zero-copy buffers as is used by rtl-sdr, and
> 
> What is "rtl-sdr"

Its the realtek software defined radio (SDR), a really inexpensive TV 
dongle that was discovered could be used as a general purpose SDR a 
decade or so ago. In particular, this project
https://github.com/osmocom/rtl-sdr/
which is packaged by fedora/etc.

> 
>> maybe other applications. The result is usually
>> application death.
> 
> So is this a new problem?  Old problem?  Old problem only showing up on
> future devices?  On current devices?  I need a hint here as to know if
> this is a bugfix or just work to make future devices work properly.

This has been a problem on arm devices without IO coherent USB 
apparently for years. The rtl-sdr project itself has a disable zero-copy 
mode that people have been using on rpi/etc specific builds. Fedora 
OTOH, is building it with the same flags on x86 & arm64 which means that 
people report problems. This happened a few days ago (on a pinebook), 
and I duplicated it on an NXP platform just running the `rtl_test` 
artifact with a nooelec from my junk box. Guessing that it was a page 
mismatch I went looking for that, rather than disabling the zero copy 
since punishing arm machine that have IO coherent USB adapters for the 
sins of these low end devices isn't ideal. I found this, and this patch 
allows the rtl_test app to run without issues on my NXP/solidrun.

Plus, given that its actually a kernel/libusb problem its likely there 
are other applications having similar problems.

> 
>>
>> If dma_mmap_attr() is used instead of remap_pfn_range,
>> the page cache/etc attributes can be matched between the
>> kernel and userspace.
>>
>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>> ---
>>   drivers/usb/core/devio.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
>> index 6833c918abce..1e7458dd6e5d 100644
>> --- a/drivers/usb/core/devio.c
>> +++ b/drivers/usb/core/devio.c
>> @@ -217,6 +217,7 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>>   {
>>   	struct usb_memory *usbm = NULL;
>>   	struct usb_dev_state *ps = file->private_data;
>> +	struct usb_hcd *hcd = bus_to_hcd(ps->dev->bus);
>>   	size_t size = vma->vm_end - vma->vm_start;
>>   	void *mem;
>>   	unsigned long flags;
>> @@ -250,9 +251,7 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>>   	usbm->vma_use_count = 1;
>>   	INIT_LIST_HEAD(&usbm->memlist);
>>   
>> -	if (remap_pfn_range(vma, vma->vm_start,
>> -			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>> -			size, vma->vm_page_prot) < 0) {
>> +	if (dma_mmap_attrs(hcd->self.sysdev, vma, mem, dma_handle, size, 0)) {
> 
> Given that this code has not changed since 2016, how has no one noticed
> this issue before?
They have there are a lot of reports of sdr failures, but the general 
use case is rare?

> 
> And have you tested this change out on other systems (i.e. x86) to
> ensure that this still works properly?

Yes and no, I did some basic libusb tests on an x86 machine, but its a 
bit tricky at the moment for me to get the rtl plugged into a x86 test 
machine. (its a work in progress).


> 
> And why isn't this call used more by drivers if this is a real issue?
The particulars of asking for iocoherent memory and then mapping it to 
userspace is rarer than just asking for kmalloc()/remap() and then 
performing the dma ops?

Then there are all the softer issues around arm64 testing/availability 
and vendors carrying "fixes" for particular issues (like rtl-sdr 
disabling zero copy).

> And will this cause issues with how the userspace mapping is handled as
> now we rely on userspace to do things differently?  Or am I reading the
> dma_mmap_attrs() documentation wrong?
I don't think userspace is doing anything differently here, and AFAIK, 
on systems with IO coherent adapters this ends up with the same page 
mapping as just doing the remap_pfn_rage() with the same attributes as 
before. I've looked at dma_map_attrs() a bit, but i'm also trusting it 
does what it says on the tin.


Thanks again for looking at this.

> 
> thanks,
> 
> greg k-h
> 

