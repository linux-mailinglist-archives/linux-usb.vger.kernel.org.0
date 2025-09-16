Return-Path: <linux-usb+bounces-28172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B146B7D88E
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 14:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 286E63AB2FD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 23:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89CC22D3739;
	Tue, 16 Sep 2025 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SKdSFMo4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22E1B394F
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 23:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758065630; cv=none; b=OlmOp3qPN5yDZ4rs09+B8l6JQxHWzvrH7fReIsdA68TN0d0QWOlyNR033+XrhMVBUZ5vd7nLAlQ+pXew1B86UpjH7SZg1HkxkPZxWVzbhx7U11ghWKDvS6/DJCWHaiJg9vBIXlPvIbOu1XwTV03Bx5suJZ6Hb0HUGy92/sRLNbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758065630; c=relaxed/simple;
	bh=+BBQUal0gcLkU4J+/wGKUcLf+qGcByY5UaOyrYgF5Lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q1hqgckuPeDvtQw5nheTasJ1qolwnzXdapGZME/Rvg/RqUatDxL70V6w9kx4/So+eEc1kBV6o1JAK6X3pAzvMY2wE3g5T1PvnvwK/vAb60wy1Y/XcxABM3FO2nAk9kiAZYgkzezVREKY9txYwS+V+IKa3PjTQLPCJ2BmPxPw4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SKdSFMo4; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b61161c35cso68779781cf.3
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 16:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758065626; x=1758670426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K1wN9hF9riUo1dM90iinoi52Pit9VGaxH3PleUBd1GE=;
        b=SKdSFMo4fmuUASOw4OJxPPvhR9QnS0miCepjUlsWYnN1HC6Ti1yPugBo4t45SV6cFg
         jChT314A+vNmjpBreZbG1y6cjw3vrKhulF8pdb0nMMe2sDK3msPgkNz0Lacbs0bxhwVJ
         /4PtiTd6A6oYje2KhGvESgyaBR1zvBv7ytKyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758065626; x=1758670426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K1wN9hF9riUo1dM90iinoi52Pit9VGaxH3PleUBd1GE=;
        b=lAs6e62Ee9x3xDJMT2emIuJHDeovR62H5AlngCmULF56KjE0rstt3WbFAFBZae/aJo
         3/1TA4H3fmncMu7satBhzTrXgq+9aNu8oXCz8A7RiEEJaYfC/df/J4g5Hf3R5BOBkJ2p
         CZ6DA3Tbz1NMMmOhBuU9Nih7ks8LeUaN08mHlsDnGwZmrrZr9K7c419ltleK4zbCv9n8
         ZT5ebYKIfhH1okf4JI5qA7iOUWDVAznUEbzod41iJYS7o6nbEqOGYNGiT0wmyHfM547n
         aI2PTjE9DxcnKug0M0RXDXnEsatnwzsE4VGWcuNu5Tm+RftqlyP71Ia4C+82YMzh1M5E
         8Q3g==
X-Forwarded-Encrypted: i=1; AJvYcCUANy6HuzuZyFIAaZ2TT9afqyleyQ/1QG9JO45BfchEw4NYjPIrKKuO42nWJ5jA4XWfBZlATm2SpEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiHOCifN06AziVfCrMySCIBix7j+mZ38BjTxpPp2jdRy0DMMo8
	aYAdU+galhwJboub8hk7i0TKa23a4xN2s+ad0RkTGrvJDJNLwGsgh37Y2TrGQQHz/mc=
X-Gm-Gg: ASbGncvSlz1GN9ay47qEgYesGSeN7gPwyb9clEewv+kSP1twJzwCVkALCSbhEPlp5l9
	qjMQC5CkSZDq6pqVlXj0hTEVMB4QGmoKMbaQoyhc4tFPtLqmNZ8n4n5hcqwaj9XcrHI0Voyt3Yl
	MPAkiGeebqiVr5OaMrsuT0rjYaBIHTaVtAP5ohqFq5UakpoCaZlm0ozoVZOmcUYL/8eAhrIcQT/
	T0SymFXCnSa15jGHSUbpvezgur98eCdQp+neLUPo0xEqIdbd6/SVFq+rFZiAg6Mmgq3czWUUQ2x
	Iu979JY0SOOEaRhQE/Iv1akiBRf6tPPLFeNuKfifar1cCIP5CFrheL2HT9PlO5VOXlpmRJyej0C
	BkCSHMe7xN3MWdHbbgi/dVPnYvHsrz5kyPBheQ2m8vvT8zhcE/ZTcT79rV34QVH7Q8l9c/Dcg7e
	+Z+6R/64PR3e//griMCQ/nB8TLUxPYP5QOV+cAeFHt6Cc=
X-Google-Smtp-Source: AGHT+IFRoshFhSAZ+T4lV66dmVbNfAnq3iuZJVF6Kg/ulCHno1XN9HC4PMC+28LuE6bhaFncVLfjmQ==
X-Received: by 2002:ac8:58c1:0:b0:4b3:122f:89d6 with SMTP id d75a77b69052e-4ba69d351d6mr3407291cf.45.1758065625673;
        Tue, 16 Sep 2025 16:33:45 -0700 (PDT)
Received: from [192.168.226.35] (207-181-222-53.s5939.c3-0.hnc-cbr1.chi-hnc.il.cable.rcncustomer.com. [207.181.222.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639cb1b33sm89168221cf.14.2025.09.16.16.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 16:33:45 -0700 (PDT)
Message-ID: <c32f5c8b-0c62-4567-9d82-081ecb0889b1@linuxfoundation.org>
Date: Tue, 16 Sep 2025 17:33:44 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] usbip: Fix locking bug in RT-enabled kernels
To: Alan Stern <stern@rowland.harvard.edu>, Lizhi Xu
 <lizhi.xu@windriver.com>, Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org,
 syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, Shuah Khan <skhan@linuxfoundation.org>
References: <4f7805f7-805a-4678-8844-c38a97650dda@rowland.harvard.edu>
 <20250916014143.1439759-1-lizhi.xu@windriver.com>
 <61e796d2-0139-4459-a4e3-f27892384de2@rowland.harvard.edu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <61e796d2-0139-4459-a4e3-f27892384de2@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 09:47, Alan Stern wrote:
> On Tue, Sep 16, 2025 at 09:41:43AM +0800, Lizhi Xu wrote:
>> Interrupts are disabled before entering usb_hcd_giveback_urb().
>> A spinlock_t becomes a sleeping lock on PREEMPT_RT, so it cannot be
>> acquired with disabled interrupts.
>>
>> Save the interrupt status and restore it after usb_hcd_giveback_urb().
>>
>> syz reported:
>> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> Call Trace:
>>   dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>>   rt_spin_lock+0xc7/0x2c0 kernel/locking/spinlock_rt.c:57
>>   spin_lock include/linux/spinlock_rt.h:44 [inline]
>>   mon_bus_complete drivers/usb/mon/mon_main.c:134 [inline]
>>   mon_complete+0x5c/0x200 drivers/usb/mon/mon_main.c:147
>>   usbmon_urb_complete include/linux/usb/hcd.h:738 [inline]
>>   __usb_hcd_giveback_urb+0x254/0x5e0 drivers/usb/core/hcd.c:1647
>>   vhci_urb_enqueue+0xb4f/0xe70 drivers/usb/usbip/vhci_hcd.c:818
>>
>> Reported-by: syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=205ef33a3b636b4181fb
>> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
>> ---
>> V1 -> V2: fix it in usbip
>>
>>   drivers/usb/usbip/vhci_hcd.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>> index e70fba9f55d6..eb6de7e8ea7b 100644
>> --- a/drivers/usb/usbip/vhci_hcd.c
>> +++ b/drivers/usb/usbip/vhci_hcd.c
>> @@ -809,15 +809,15 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>>   no_need_xmit:
>>   	usb_hcd_unlink_urb_from_ep(hcd, urb);
>>   no_need_unlink:
>> -	spin_unlock_irqrestore(&vhci->lock, flags);
>>   	if (!ret) {
>>   		/* usb_hcd_giveback_urb() should be called with
>>   		 * irqs disabled
>>   		 */
>> -		local_irq_disable();
>> +		spin_unlock(&vhci->lock);
>>   		usb_hcd_giveback_urb(hcd, urb, urb->status);
>> -		local_irq_enable();
>> +		spin_lock(&vhci->lock);
>>   	}
>> +	spin_unlock_irqrestore(&vhci->lock, flags);
>>   	return ret;
>>   }
> 
> This looks right to me; it's the same pattern that the other host
> controller drivers use.  However, the final decision is up to the usbip
> maintainers.
> 
> Also, there are several other places in the usbip drivers where
> usb_hcd_giveback_urb() gets called; shouldn't they all be changed to
> follow this pattern?
> 

Looks good to me.
+1 on changing all other instances - can we do that?

thanks,
-- Shuah

