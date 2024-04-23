Return-Path: <linux-usb+bounces-9670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 581AD8AF8C4
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 23:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D2A2901DF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 21:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FAC142E9D;
	Tue, 23 Apr 2024 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erw3gp3F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2A142E85
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713906618; cv=none; b=UjTwZi0iedKeEae+/SeaPcsg0C1czZkJOg5fuc0PF/1TP2N8LGPJ2R9Ykv3Ujn0qY3MVoHO8y6jivPjFQI2boM2FiZHism8HuR9gUrMdIcDbKR2+8gpGdU5hca+TfZw3ywA+XY4gQRcbaenoJcd7SvPYlhzPqiKZ52NqGWXfMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713906618; c=relaxed/simple;
	bh=uWhh1WoIOsreQGiN/Fe4ze4krZPfWIumhJliElzZKCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQSp4QKxGepfu6udF6XhdcNyqAghiE7YBHbCK/n5oPCICABVsWchwd7Wqa+4rjDrDROek5lKujiPhjdYjmdkX/LRFNlwR17qvLOa2opqYso6xYka/940JjTM4XYecXV5DBrUEHGxI4WZuma111bWCQ1LS1KwJWddLnarK0B0lF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erw3gp3F; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e455b630acso35493785ad.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713906616; x=1714511416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=249MlgqyuzBuGlmmyAn0wU6ZuUaezBL9K2jELzRaOig=;
        b=erw3gp3F3JQDxzA2Fj3LmZawNe8fIC3cOIVD43rTsyRPnYk9SwsaCT05Dt4+iLvEp8
         Cmg1ca6ElwOFZrTRcKr4pVTq+GZRMGqX0LfHM+oP1mR14qR9GOb6JIVPHvUBnwj7JNZo
         9K0bMxoX7E7kc2NNc20ei9ovMoaxcZE+1lfRhnB+8Rg20huIxuYor6Biu1FukXSK8wxT
         Nx6Xmie5Laz0aJlXynGYYXet2IpZFG+FoV8uiiyTnmLCi4cDhyP6z7MEuGYvh61hCiVz
         ae5sUupJ1amE3Zjg8QU+NzRy02eZLfCF7zO9iMbhCuAn1XPDJglv9wNs+ZhQ1kjYWCvs
         XQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713906616; x=1714511416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=249MlgqyuzBuGlmmyAn0wU6ZuUaezBL9K2jELzRaOig=;
        b=MpVQKlVs8QSRY8WG8IKbCYwn6nnz0MVjAbfzbDpaRXoyS3DvYUCnfrByS9xOXdxkar
         GoE/UXzZv5PBeRB2d5ReY1/CZWEvFhZ1fuefqK0tUDU9SZV/1PAEU8rEcqN+MyRmR7vF
         Maw4OVXkcVHdyD68BUALAsjwDrn7an7ID/8dSiHlvl+y7fu/MVdNQROoEIlN257+By31
         Uv5E3WD3xhaSzr1FfSy1/NswC73UkWP2oEv87TBzDwzbyl4cL1Tj2KF4eHKOFd+uQPun
         g53flX5m7TLQh+IRtY39BVORkhYRof5v5r7eJQj6tFxC0NRjELFEGseMdRurYPfNq1yW
         tKGg==
X-Forwarded-Encrypted: i=1; AJvYcCXotpcly/dXdmu/0hzuZduIP/SZI6uzSFRb11NCMfjMpe/n+fLklXLrBApHmbX9oHT6qcPXdg2ESbH0gvKfCMLsJTGyvew72fsd
X-Gm-Message-State: AOJu0YweihK/TD7NGEGVaDMq+2k4nAaS8wOT+cwioaCTdlOjBa4u6+AW
	p1N3AiruMdLHQekvKSmxw132OCiJJ39jsOVyCL1IcTbEHKQhLlII+a5sjA==
X-Google-Smtp-Source: AGHT+IG/iYwdzLDL/p3fmBHc/L6USifMS1C4Lqng8hREkLbdy93Dz3c9XRzbzT/Ol4IKv8vWXg/xxQ==
X-Received: by 2002:a17:902:c20d:b0:1e9:9fd4:e62d with SMTP id 13-20020a170902c20d00b001e99fd4e62dmr717357pll.11.1713906615990;
        Tue, 23 Apr 2024 14:10:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q4-20020a170902edc400b001e29c4b7bd2sm10506181plk.240.2024.04.23.14.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 14:10:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52bac533-6b22-49b0-8390-ded9c075e72b@roeck-us.net>
Date: Tue, 23 Apr 2024 14:10:13 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems (timeouts) when testing usb-ohci with qemu
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
References: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
 <10f44ba3-51a4-42a6-85c7-f8068b56fee1@rowland.harvard.edu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <10f44ba3-51a4-42a6-85c7-f8068b56fee1@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan,

On 4/23/24 10:30, Alan Stern wrote:
> On Tue, Apr 23, 2024 at 10:04:17AM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> when testing usb-ohci
> 
> What is usb-ohci?  Do you mean ohci-hcd?
> 
>>   with qemu's pci-ohci emulation, I keep getting
>> random usb interface timeouts. Sometimes the usb_hub_wq times out.
> ...
> 
>> Sometimes there is an i/o scheduling timeout such as
> ...
> 
>> This is not a new problem; I have seen it forever. Recently I spent some
>> time trying to understand the problem and found that the linux driver does
>> not always handle all ohci interupts.
> 
> Please be more specific: _Which_ interrupts aren't being handled?  That
> is, which flags remain set in the intrstatus register when the handler
> returns?
> 
Sorry, I didn't think it was relevant.

Here is the result of repeating the test with the linux patch several times
and passing the log output through "sort | uniq".

       1 pending 0x2 mask 0x8000005a
       9 pending 0x4 mask 0x8000001e
     208 pending 0x4 mask 0x8000005e

So it is almost always OHCI_INTR_SF and rarely OHCI_INTR_WDH.
For reference, this is repeatedly running

CMDLINE="panic=-1 kunit.stats_enabled=2 kunit.filter=speed>slow root=/dev/sda rootwait console=ttyS0,115200 earlycon=uart8250,mmio,0x10000000,115200"
qemu-system-riscv32 -M virt -m 512M \
      -no-reboot -bios default -kernel arch/riscv/boot/Image -snapshot \
      -device virtio-net-device,netdev=net0 -netdev user,id=net0 -usb \
      -device pci-ohci,id=ohci -device usb-storage,bus=ohci.0,drive=d0 \
      -drive file=rootfs.ext2,if=none,id=d0,format=raw \
      -append "${CMDLINE}" \
      -nographic -monitor none \
      --trace 'usb*' -D "/tmp/usb-ohci.$$.${sequence}.trace.log"

Tracing isn't really necessary but it changes timing enough that
the problem is more likely to be seen if it is active. The problem
is seen with various emulations; I just picked one of them.

>>   Since the interrupt is shared and
>> thus level triggered, that means that interrupts are still pending when
>> ohci_irq() exits. The interrupt core in Linux does not re-enter the
>> interrupt handler, presumably because it is marked as shared interrupt
>> and returns that the interrupt has been handled.
> 
> Isn't that behavior mistaken?  A level-triggered IRQ that remains set when
> it is re-enabled (when the various shared handlers return) should cause
> another interrupt to occur right away.
> 
> Edged-triggered interrupts would be a different story, of course.
> 

Maybe I got it wrong; I thought that shared interrupts would have to be
level triggered. But then you are correct: one would think that level
triggered interrupts would keep executing interrupt handlers until the
interrupt is completely handled. I guess that means that I don't really
understand what is happening. Sorry for jumping to conclusions.

>> I found two possible fixes for the problem. One essentially mirrors the
>> code from ehci_irq(), the other adds a (bad) kludge into qemu. Both "fix"
>> or work around the problem.
>>
>> Question is: What is actually wrong ? Something in the generic interrupt
>> handling code in Linux, something in the Linux usb-ohci driver, or
>> something in qemu ? Any idea how a proper fix might look like ?
> 
> To answer these questions we need more information.
> 
What else would you need ?

Thanks,
Guenter


