Return-Path: <linux-usb+bounces-28230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E6B8108D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC4654E2A4D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 16:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DD019F13F;
	Wed, 17 Sep 2025 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lh6fc1ZB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D172F9C3C
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758126907; cv=none; b=T6w3v8RORGnLCG2AD/LfBR86dVzLhPUiQgEdCkj2GiIrN0MhAQFGVBhPEpOuqTnPxASqEljoF+0UdM6iRRW8KlvQVksucmuN7OHuriRgBH31Sqqi4YEHpyoTDSucR+RTQn7qaulCFBJkNEeAFM8kLahvY8eqC8XLdCCxHs6CLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758126907; c=relaxed/simple;
	bh=yAMcgMd4qaGJtg5+GEhkvXxXyrkYfeYYRP36/byTe7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS08KAi+oLTtlnOcPWvDAnCw+tsg5PrZB81xlASTSiOH5SMd5d0ohmVAKTXh1X/FuV7JDmjpfASXB4tZfJ3N/Q5+b4dSWVaV3MujsDv//MVePMomx/hofA2tG+ZABPQkyYnTkJG2wc6krZXxNLihoOn+NR2JRXixBOJE8EP52PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lh6fc1ZB; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-81999b1e9ccso1314185a.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758126904; x=1758731704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpfnBA2vdQ8tnFFrfpgXrqna4jBRok3uohcZGJE8WCw=;
        b=Lh6fc1ZBSTtHDoUwgaHlambgQiskAd8NEqiV9/gWAY295RzhZqwsjshjzPBSxOmtIi
         yz6XRbktiOjGIsBvuawhyYAMydZLLkltU5tJEhJutoTbfUvjTmq4UrPnoRJbi3XDqOrq
         TXPX8g3F5UXH8Lzojr8jQjwuSSuJNxjv0uj/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126904; x=1758731704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpfnBA2vdQ8tnFFrfpgXrqna4jBRok3uohcZGJE8WCw=;
        b=Gu+cBXYakIvTfC86snpvGaxt12ggw4znkWEzPjEKef/d1s1xlw+w/8ohfYixDug9jK
         CJ8crxFcTjfw2qhhC0y01ICv9a285znbPlWuTqOvbMm+TzYbT+CEU7j27lo+SA6Ry1Xv
         GwnNTejiJCUDvB4WAi+HhYoqqejzcPIe8Syfztm5YpFkxg+Uh0C4sY7HFXDJzHgEG3dJ
         KvGekYuF1zFacIhbVJCx1qT+27w1+q1djQlbadN/nnNsV2yBF88J0WQ6w0eP8dImWZuH
         SaWXDzlQOtFC7VwcKF9e4pUsm7JwIZucJUOIrqKLf/7GbzPvaTk0icefQ35/mvaKU3m5
         wZIg==
X-Forwarded-Encrypted: i=1; AJvYcCV4vONLRbohYGwf5U0OVKX3lowGvoMNig6tWk/dU0Fw1QNF8mFfEFuYqv7V0Zm8HmhsZA2uJ6gPGmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxXHbMpeQFP3fzsQr1k418pWrJq5xxQ3J27iME0G7cpOlkZF+
	IyJ7xn+Vwd9Si0uJp65hMXW0qC9jF9U+p2NeHusdQZRcEACvgVGlO7NDSoJeAuCj3O4=
X-Gm-Gg: ASbGncvsN9vV0NFb+i8lLiWOMXe1PBnPPSwPyhSLGUl+ha/gxYgG8YHSouPEyV0olSq
	8/RnzKvaG6FcqcVBGo7nBL+7G+gXbDeZcm32syu01WvwuLhKnSmlP+xG78m1+BZdW1r9xtguuDB
	3M8UiDBq7f9zRHhMhjnT2hc/AEUGnNAPw/NFprTv3sBJ8ZigthYoNpWgq8cRYs+8HyyB0eIul4J
	LEaGkwzp2ot22DbNvU2ISixkX0+hcyF8z38XO2URhx2mnSmjr8VUuc286b3cWvSHhDlBcmUinvf
	2jiqPxxIUqzCkcP+vTG+0wPpcjWnoRxZmXdKoYwMqwJ+fPWzUjdDVJvEHcIgb9x9htjrKovGVOu
	o1WDf5Xh2O5+k4HoxJjkA+MpO7e4SWxjNndBpbWvzurcwiV4l7aZhgjffWYnED3OVztW8bY3LFx
	kKm70NepaFqgp3b3GlpbcnqTs65MdyAkZ3hxeG4Zcfow==
X-Google-Smtp-Source: AGHT+IHSRgPyPHKs+hw4nMZ78oXBwO909FIf23ydsPc4Cf5pdlFtmiIRgZwz36e6SwRIpOyiGQtq+A==
X-Received: by 2002:a05:620a:aa08:b0:835:b3d:5ee8 with SMTP id af79cd13be357-8350b3d5f52mr127780385a.86.1758126903785;
        Wed, 17 Sep 2025 09:35:03 -0700 (PDT)
Received: from [192.168.1.239] (207-181-222-53.s5939.c3-0.hnc-cbr1.chi-hnc.il.cable.rcncustomer.com. [207.181.222.53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83631a7fc2fsm9166685a.54.2025.09.17.09.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:35:03 -0700 (PDT)
Message-ID: <9cacdd47-54ed-42cf-849f-14ed23156d0e@linuxfoundation.org>
Date: Wed, 17 Sep 2025 10:35:02 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] usbip: Fix locking bug in RT-enabled kernels
To: Lizhi Xu <lizhi.xu@windriver.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 shuah@kernel.org, stern@rowland.harvard.edu,
 syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <c32f5c8b-0c62-4567-9d82-081ecb0889b1@linuxfoundation.org>
 <20250917005136.1801295-1-lizhi.xu@windriver.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250917005136.1801295-1-lizhi.xu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 18:51, Lizhi Xu wrote:
> On Tue, 16 Sep 2025 17:33:44 -0600, Shuah Khan wrote:
>> On 9/16/25 09:47, Alan Stern wrote:
>>> On Tue, Sep 16, 2025 at 09:41:43AM +0800, Lizhi Xu wrote:
>>>> Interrupts are disabled before entering usb_hcd_giveback_urb().
>>>> A spinlock_t becomes a sleeping lock on PREEMPT_RT, so it cannot be
>>>> acquired with disabled interrupts.
>>>>
>>>> Save the interrupt status and restore it after usb_hcd_giveback_urb().
>>>>
>>>> syz reported:
>>>> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>>>> Call Trace:
>>>>    dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>>>>    rt_spin_lock+0xc7/0x2c0 kernel/locking/spinlock_rt.c:57
>>>>    spin_lock include/linux/spinlock_rt.h:44 [inline]
>>>>    mon_bus_complete drivers/usb/mon/mon_main.c:134 [inline]
>>>>    mon_complete+0x5c/0x200 drivers/usb/mon/mon_main.c:147
>>>>    usbmon_urb_complete include/linux/usb/hcd.h:738 [inline]
>>>>    __usb_hcd_giveback_urb+0x254/0x5e0 drivers/usb/core/hcd.c:1647
>>>>    vhci_urb_enqueue+0xb4f/0xe70 drivers/usb/usbip/vhci_hcd.c:818
>>>>
>>>> Reported-by: syzbot+205ef33a3b636b4181fb@syzkaller.appspotmail.com
>>>> Closes: https://syzkaller.appspot.com/bug?extid=205ef33a3b636b4181fb
>>>> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
>>>> ---
>>>> V1 -> V2: fix it in usbip
>>>>
>>>>    drivers/usb/usbip/vhci_hcd.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>>>> index e70fba9f55d6..eb6de7e8ea7b 100644
>>>> --- a/drivers/usb/usbip/vhci_hcd.c
>>>> +++ b/drivers/usb/usbip/vhci_hcd.c
>>>> @@ -809,15 +809,15 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>>>>    no_need_xmit:
>>>>    	usb_hcd_unlink_urb_from_ep(hcd, urb);
>>>>    no_need_unlink:
>>>> -	spin_unlock_irqrestore(&vhci->lock, flags);
>>>>    	if (!ret) {
>>>>    		/* usb_hcd_giveback_urb() should be called with
>>>>    		 * irqs disabled
>>>>    		 */
>>>> -		local_irq_disable();
>>>> +		spin_unlock(&vhci->lock);
>>>>    		usb_hcd_giveback_urb(hcd, urb, urb->status);
>>>> -		local_irq_enable();
>>>> +		spin_lock(&vhci->lock);
>>>>    	}
>>>> +	spin_unlock_irqrestore(&vhci->lock, flags);
>>>>    	return ret;
>>>>    }
>>>
>>> This looks right to me; it's the same pattern that the other host
>>> controller drivers use.  However, the final decision is up to the usbip
>>> maintainers.
>>>
>>> Also, there are several other places in the usbip drivers where
>>> usb_hcd_giveback_urb() gets called; shouldn't they all be changed to
>>> follow this pattern?
>>>
>>
>> Looks good to me.
>> +1 on changing all other instances - can we do that?
> I'm replying to both of you. Personally, I suggest this isn't necessary
> right now; it's safer to wait until a problem is reported before fixing it.
> 
> Also, the context of several other calls to usb_hcd_giveback_urb() in usbip
> differs from the current issue. Enabling RT_PREEMPT shouldn't cause similar
> issues.

Fair enough reasoning to wait. Here is my Acked by.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah


