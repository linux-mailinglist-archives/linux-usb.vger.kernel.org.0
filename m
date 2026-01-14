Return-Path: <linux-usb+bounces-32347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 183DAD21247
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 21:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EC8B30486B1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 20:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96123093BF;
	Wed, 14 Jan 2026 20:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S949Gp00"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5173C354AFC
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768421682; cv=none; b=NqZd8kAyqAhlRXkG9jqIGUsZ2owzhfKYCT9q4fdMTY4wwkE9mnd/CGnQHl2H58HPlBADNmnpKWzlAveE3x3Y6nQ5faI2dqrpYdOy7beiQweKrONbSK0PPir3QbeZ+LDiqqkLE12CBaR28gAxDgkUhjptV8+LN5zF7gCsk/7zCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768421682; c=relaxed/simple;
	bh=7e8ug4MyTPxAzZNPSdq0A9RvZYJQujn0uRsMiUGqK0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGzMPf2kF0becsDFoyjSYOg2L6oI9C8GgYXduofHhTMSg02m9oPAtAcQ2iQudxg4jfU0/pvgNvwryqnWu9+BXGidgDd7HqQnTyuZd4c6QDKV8bdRLDZc7C/BJecd7fJc87l0MwgBWJv7+MAcdICne56XujeTlfMaIDUX1GsgrbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S949Gp00; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d256c2a9so209246f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 12:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768421678; x=1769026478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JMBFhEFI8VZYNu9bhqOFrerfTqDOnbdPSOvgMdc/Dc=;
        b=S949Gp00x/84DSgShgimU4sQfPMjLc7+tl6c7nkPW2bs+18PXEc2MQ9mQiyWjl/fqB
         Tl9+LPKpVqKHugEGXwGZHC8j3HlPrePoDn1gJLyIexKH+rw1begx92zdQ873dqYGB8aV
         duEBDY86WdKe1WGQiUDTnyQ4bLaqp1QnBT8OfqGZZQ6L4Q/4JBM9UBuc0Mme7yMh5hls
         4/JkgDRH4PyVkQa//X95dgzLIkScKS4SwU98sRdf64W9+nFL2fWJiJ6RZvBnPY9TFiTw
         oya+QA7v8ZgoHCs5RQm3Up6owfTOAF6dMDyHJaYEjSZJPhsdASd9b52eZw8Ie5Btgimz
         6Gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768421678; x=1769026478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JMBFhEFI8VZYNu9bhqOFrerfTqDOnbdPSOvgMdc/Dc=;
        b=uwcaWQF7PWoctQCpSL3h9aJg4RyODTCPyWHnI4gj8Fa7Q0bLFfb5fT0N14NFLX0Ebo
         RuuochF9jLb1NQu8p/JjMBawby0y5xgCGn3Ty8PBUMfQEU0tVPzJ1aqWvW9tmExRdyyY
         vfIsjjdByYNsu2iSQ3NhE++88zaGAJNxQGZfYtdxyNS3czu1E3woxRUhXGsJqaGSuXFm
         7FCnZySEg/g02js86+UwTkpO86xiCTp8JdBWaPA1kSyikD3xJdgzCkJyRXBoFxlTvyfd
         QoSAVOTUQkTyCH9HIEmaP23RxJD2Wm+1zqFRYJvU4C2Hp+5ao2EdMk8CycqnqAT7464D
         2jPA==
X-Forwarded-Encrypted: i=1; AJvYcCUC0UvxoDT2qJS2ioauGjn+SCxByfDeXnF/AZevlxkadAubUuolER7Pc02dM+c0vbvfgD8Nr830Oow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUU7h+y8rGFcACWCPmgX2p8hNrlLvHJwYdy3+aXQOH2FsSVZeE
	fq2BLBrUhrMeCUtuueNNdBN5sCi1zlb6AbLf7/o9Y43b6sNClq7iqRlBPSYIM0RZMgg=
X-Gm-Gg: AY/fxX6eHpIVmGmxCmnplnsjBVF2DUcYB9KvPioSc8YUIhG5jgHHlqffkyUomX08U52
	9UqtG7jRHBiBoPLnnOWzXpOfTpdvCsjkf4W3nhnsjuftgWM5A3ZVn6yUD6ScjJVRR6L/9rduxuh
	zxSrTf8ekOEmiwpNGw1eG12Do0GajWChJCvknbEeROsl7phahxU+r1E3BLaotdbAbrc0YUh5w7a
	r/h/Y1T7BczAsJz8lTFHfd/8jl2M6R8hSA/pHOvJUma9pT/YQVNbV1vCZDEduySsEiJ+DXtocfV
	wci5UO+UHxYoWUTrwrR3kiHB2BWHYAFDki7br0JZhM2T3s61fuZaORTrrF/Cc7Kwxc99hhTP7ag
	HTewmmkcIKS3oBFL5oNVEwCodL8yDQLbCDvtsy/545W7HPKDC0ILVTSB4am9KVpySBEbyXcpu1y
	s6awBgUOcmknB/KZTJwIghsgSaia38mZvRdZPPqhOsfxNJwM3ZHwbzjI4=
X-Received: by 2002:a5d:5f95:0:b0:42b:4267:83e3 with SMTP id ffacd0b85a97d-4342c3f13ebmr5608098f8f.5.1768421678292;
        Wed, 14 Jan 2026 12:14:38 -0800 (PST)
Received: from ?IPV6:2001:a61:1396:d201:b8d6:862a:5ddc:ffc7? ([2001:a61:1396:d201:b8d6:862a:5ddc:ffc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a65bsm1178355f8f.7.2026.01.14.12.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 12:14:37 -0800 (PST)
Message-ID: <2ea634c6-26a4-48a7-8fcc-ad0ce06af890@suse.com>
Date: Wed, 14 Jan 2026 21:14:37 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
To: Alan Stern <stern@rowland.harvard.edu>,
 Ben Greear <greearb@candelatech.com>
Cc: Hillf Danton <hdanton@sina.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org
References: <20260114024506.2210-1-hdanton@sina.com>
 <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
 <c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
 <a721a966-0a4b-cbc4-71ac-a482156ffa48@candelatech.com>
 <2b4c47a5-1a5a-4e94-87d6-152da16a3b9c@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2b4c47a5-1a5a-4e94-87d6-152da16a3b9c@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.01.26 20:26, Alan Stern wrote:
> On Wed, Jan 14, 2026 at 09:51:48AM -0800, Ben Greear wrote:
>> On 1/14/26 07:13, Alan Stern wrote:
> ...
>>>>>> task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
>>>>>> Workqueue: events __usb_queue_reset_device
>>>>>> Call Trace:
>>>>>>      <TASK>
>>>>>>      __schedule+0x46b/0x1140
>>>>>>      ? schedule_timeout+0x79/0xf0
>>>>>>      schedule+0x23/0xc0
>>>>>>      usb_kill_urb+0x7b/0xc0
>>>>>>      ? housekeeping_affine+0x30/0x30
>>>>>>      usb_start_wait_urb+0xd6/0x160
>>>>>>      usb_control_msg+0xe2/0x140
>>>>>>      hub_port_init+0x647/0xf70
>>>>>>      usb_reset_and_verify_device+0x191/0x4a0
>>>>>>      ? device_release_driver_internal+0x4a/0x200
>>>>>>      usb_reset_device+0x138/0x280
>>>>>>      __usb_queue_reset_device+0x35/0x50
>>>>>>      process_one_work+0x17e/0x390
>>>>>>      worker_thread+0x2c8/0x3e0
>>>>>>      ? process_one_work+0x390/0x390
>>>>>>      kthread+0xf7/0x1f0
> 
>>> Unfortunately, we have no to tell from the log you collected which host
>>> controller driver encountered this problem.  Nor, unless you can
>>> replicate the problem, any way to track down exactly where in that
>>> driver the bug is -- or even any way to tell whether a proposed fix
>>> actually solves the problem.
>>>
>>> Alan Stern
>>
>> The system was in the final stage of shutdown, so all we have in this case is serial
>> console output.  If we set console to more verbose mode, would that provide what
>> you need?
> 
> Maybe; it's hard to tell.  You'd have to enable dynamic debugging for
> the usbcore module and set the console to show debug-level messages.
> 
>> Or maybe 'dmesg' from when system boots?
> 
> I suspect that nothing from before the start of the shutdown would be
> useful.
> 
>> We can try to reproduce, but need some clues about what to provide to make progress.
> 
> The stack dump above shows that a kernel thread get stuck inside of
> usb_reset_device().  The first thing we would need to know is which
> device the thread is trying to reset.  Adding a dev_info() line near the
> start of usb_reset_device() would get us that information and you could
> capture it in the log.  (Along with that, we'd need to see the output
> from "lsusb -t".)
> 
> Knowing the device, we would know what host controller the device is
> attached to.  The trick will then be to figure what's going wrong with
> that host controller's driver.  It won't be easy, especially if the
> problem only occurs while the system is shutting down.

Something called usb_queue_reset_device()

Workqueue: events __usb_queue_reset_device
Call Trace:
    <TASK>
    __schedule+0x46b/0x1140
    ? schedule_timeout+0x79/0xf0
    schedule+0x23/0xc0
    usb_kill_urb+0x7b/0xc0
    ? housekeeping_affine+0x30/0x30
    usb_start_wait_urb+0xd6/0x160
    usb_control_msg+0xe2/0x140
    hub_port_init+0x647/0xf70
    usb_reset_and_verify_device+0x191/0x4a0
    ? device_release_driver_internal+0x4a/0x200
    usb_reset_device+0x138/0x280
    __usb_queue_reset_device+0x35/0x50
    process_one_work+0x17e/0x390

That is a fairly rare method.
We also know that
"the system was un-plugged from a KVM (usb mouse & keyboard)"
One of the few places usb_queue_reset_device() is used
is hid_io_error()

Do you still know which port that KVM had been plugged
into? I usually would not run a chain of logic with so
many assumptions, but if you cannot reproduce I see
no alternative.

	Regards
		Oliver


  


