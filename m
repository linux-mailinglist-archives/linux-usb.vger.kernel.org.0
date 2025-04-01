Return-Path: <linux-usb+bounces-22432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43EA77A63
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 14:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882FA188AC2E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 12:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9F9202C4A;
	Tue,  1 Apr 2025 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uo0PMitD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9EA200BB2
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509305; cv=none; b=pLsFep4nXM5q/Gbu2/zG2DH7FhismptxIokPN+iD8RRGcet0haG1IlDa/6AgCMxqSVOhuhxDRUGoTtqwwwqGciAv5FMSLlYs9nIMiYRsQxCT/vAsauJX2KwjeFIlZ62FPu96VQDS+f+D1uuchrlnbC4DcJk7WcZAzwvBJHh2o2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509305; c=relaxed/simple;
	bh=4Vv6laZev+3uckOJC8R85Cr5k4Jrd2urTTuF5Q/ymoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C432JCK9rfv3DvkZryaaK3IeJcEg/9QENthCkPtkjLq29+pV91ldg6MgxYFIIWdue0Y+uZMRaDJgjJezQu4l6VEswBlb/bebBjctkObJwwbXNecgRc96pk5rNS16sRSw54YxbxnNCLzoZ/4mnDlmCRClkffFg2O0hpxJ8tghW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uo0PMitD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe574976so38054195e9.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743509300; x=1744114100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rF05+ebNrUc51ARp3OPp7l0cwideFIblxLqwfQ/B7c=;
        b=uo0PMitDb6JlcedZr6SAha41TB8C+/hHY5h4B+Z8xv6RcThff/x5X1/MNvNVSfVpOB
         oojfuvT3/0jd3aEf3XWFKfaUd9u5621CaOtHmS9/IpplNUIExy1vZ7tP1hJ6dlBfFzwo
         yGTyDvBcuk6Ot3NKnwGI5q0h/08akOUUyc1E8T85uGD64vdb15cGnFMf7h4WTucfGkxc
         b8jZBDPqRBJdBcjjo23hutde9Tv7r/+V3AufUOuLQDikkUzz598TEDKYkrRSLRupgW2z
         E4HkgxsHRbJz4YtNohU+KZMApz3s3qpdeLMxybPHKUo44SWlLo14GLuAwOo0SZtPGQWe
         v7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743509300; x=1744114100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rF05+ebNrUc51ARp3OPp7l0cwideFIblxLqwfQ/B7c=;
        b=s65A5NwFFktLMGsCyjk3ygCfrlLkyzzQel1CYJ9ii4hNxq39ewyfi8fPD7oE8IVer5
         hejT5JkVg6oP9e5CTITz8bYkoKRTV0KttfcyXE2EOoIVeGUdLvsITXjXOT0GxKZR8Lrf
         udcKaYnTv180F7c7WPp9EEGHcqUHT2/wO/qxoFjrNBrwDyIz2BZaDmGU6Y9NW0Ey3gjj
         lnvmE8ZOgon0I05zGpsoziTYJRYmNBnkmsINZtwe8CH6DKIWzK331w5Ntjvr9KTM76RZ
         P/oqLNl4j6rXgBcbgN0G2Gj1sK320V6YxTXazaYAnzxUQlMblWL5kMYpGBKeBWRNM8RP
         C28Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEpWuD6IE0bA44HJEJYD1+JnIMdw9pTBYdcq9AWNe5c/cQ1UbMTXtspUYkzhEJvXBbtnY3caKKK+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz20prlktD8HTEmuveDECz+SbKCEzfHHrWfsBuPNFdTGVZPamk
	B8jlsW+dKkF3KwTQoz34Mjld1hcRRIwuRrt/jAQfOfkZvyeTxOUN2Bw3k9b+vPpkJGRlsxzCABM
	EMPQ=
X-Gm-Gg: ASbGncthopSlyxIUqm6T3OTQjVRvTW0EQVQZFttKN8tLW9o7zAorYF9MPvECCnA6lwS
	pHSOAWv13c6qkPJ9eq/TzJ7FePFX+DRNlsY80KV67YkQSErv8zmb3iP1AUYoEbSM31Llk54FDIG
	7PYkyHRRzqECL0sGqeCE45gxwunh4sxUJ/ZALkQLItQi2XXRDskU73f5ynP4bS9XZ35AcGFgu5G
	zlQaScW9aAQ1UXKHHCtMgcA1f9dMVnR7pCoR1191V+yrdOApdBJmxaccNNGGmNDMA+CgqyqEWVP
	bfzkmjFIlk1JvaPjirX6bi5tTKPzXDVVWWbwXkNh3eQ993etbDQBoMSf5ZmScx11D5bkFWKuPtl
	MFW/kFFZvLXYvowRB
X-Google-Smtp-Source: AGHT+IHd8uMhZptFl8bv8YVFrthS9yQYfUTh7Hnl5uqVZj2ELTeRPc2qrCjI3tMlk0oo9THuz9yfgg==
X-Received: by 2002:a05:600c:8705:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ea7c4e749mr29887215e9.5.1743509299543;
        Tue, 01 Apr 2025 05:08:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d900013afsm154577795e9.36.2025.04.01.05.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:08:18 -0700 (PDT)
Message-ID: <d21c87f4-0e26-41e1-a114-7fb982d0fd34@baylibre.com>
Date: Tue, 1 Apr 2025 14:08:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: gadget: check that event count does not
 exceed event buffer length
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Frode Isaksen <frode@meta.com>, stable@vger.kernel.org
References: <20250328104930.2179123-1-fisaksen@baylibre.com>
 <0767d38d-179a-4c5e-9dfe-fef847d1354d@oss.qualcomm.com>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <0767d38d-179a-4c5e-9dfe-fef847d1354d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/25 7:43 AM, Krishna Kurapati wrote:
>
>
> On 3/28/2025 4:14 PM, Frode Isaksen wrote:
>> From: Frode Isaksen <frode@meta.com>
>>
>> The event count is read from register DWC3_GEVNTCOUNT.
>> There is a check for the count being zero, but not for exceeding the
>> event buffer length.
>> Check that event count does not exceed event buffer length,
>> avoiding an out-of-bounds access when memcpy'ing the event.
>> Crash log:
>> Unable to handle kernel paging request at virtual address 
>> ffffffc0129be000
>> pc : __memcpy+0x114/0x180
>> lr : dwc3_check_event_buf+0xec/0x348
>> x3 : 0000000000000030 x2 : 000000000000dfc4
>> x1 : ffffffc0129be000 x0 : ffffff87aad60080
>> Call trace:
>> __memcpy+0x114/0x180
>> dwc3_interrupt+0x24/0x34
>>
>> Signed-off-by: Frode Isaksen <frode@meta.com>
>> Fixes: ebbb2d59398f ("usb: dwc3: gadget: use evt->cache for 
>> processing events")
>> Cc: stable@vger.kernel.org
>> ---
>> v1 -> v2: Added Fixes and Cc tag.
>>
>> This bug was discovered, tested and fixed (no more crashes seen) on 
>> Meta Quest 3 device.
>> Also tested on T.I. AM62x board.
>>
>>   drivers/usb/dwc3/gadget.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 63fef4a1a498..548e112167f3 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -4564,7 +4564,7 @@ static irqreturn_t dwc3_check_event_buf(struct 
>> dwc3_event_buffer *evt)
>>         count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
>>       count &= DWC3_GEVNTCOUNT_MASK;
>> -    if (!count)
>> +    if (!count || count > evt->length)
>>           return IRQ_NONE;
>>         evt->count = count;
>
>
> I did see this issue previously ([1] on 5.10) on SAR2130 (upstreamed 
> recently). Can you help check if the issue is same on your end if you 
> can reproduce it easily. Thinh also provided some debug pointers to 
> check suspecting it to be a HW issue.

Seems to be exactly the same issue, and your fix looks OK as well. I'm 
happy to abandon my patch and let yo provide the fix.

Note that I am not able to reproduce this locally and it happens very 
seldom.

Where can I find the upstream'ed version ?

Thanks,

Frode

>
> As per the comments from Thinh, he suggested to add a error log as 
> well when this happens [2].
>
> [1]: 
> https://lore.kernel.org/all/20230521100330.22478-1-quic_kriskura@quicinc.com/
>
> [2]: 
> https://lore.kernel.org/all/20230525001822.ane3zcyyifj2kuwx@synopsys.com/
>
> Regards,
> Krishna,



