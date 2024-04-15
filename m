Return-Path: <linux-usb+bounces-9358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4CC8A4D56
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 13:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE994281CC9
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 11:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DD25D49A;
	Mon, 15 Apr 2024 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zkdpv/6k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694EB5D477
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713179342; cv=none; b=mXP33icoW9k/aseybVDp8DeOONsb0dXubk3pdlUsYlB0kUSNQpk9LJEg36q0Paa2k2/kHa7nz5j1mpeiTaDrHzWPBZo1VKHWHOsHud8EDd6AUrv38g96YeD+I3PGv+DxYHUTyDWKVznczxuglCasGcnEpk1pxwOWrQWjO/VU208=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713179342; c=relaxed/simple;
	bh=b7uI2YDYyfDJc/waqMd1ndg8iT6Q8Xh6MSwt1IjGMhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWydtIdMe03NkrBCxBYP97TZXcfVv0cS9KIuUZ3P4Tni3Q7+3vI5odaDZb8bWImg6e4XTk7QaJCsGmf30ghMo1aRa63xGcZWIZh+Xqa5Mv682tEb96OrIihN3JWDh2w6UwUN/W7XUd7QKUBczidX8fhNn6EK0Bnb20sD04V66H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zkdpv/6k; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so4187683a12.3
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 04:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713179339; x=1713784139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5M9yJhy99Eqb6GsotMlodvuJ+GqdhB7F9TG3M1YTZ7Y=;
        b=Zkdpv/6kyAOZJnuUNVOGYuMQU7XWoXTPJuI6EZoBHYHm3xrHbPzH1JZog4CN62cR2P
         2/BwVdARPyTbhUYysfV/8LBDtfNDoRneViCbtXeK949PhVwslYc1x4+3bQNAZi6e4iyZ
         PeyG+c/CzzOtDnEXtDU9Kg2CIaeaz+hwrvMws7NEIJl3K5z9t2+7QYNedHFB4PWkfk4+
         6XDGTi5NThcvWyBgdNZQa2ZdtP31pNxycerxUhRjkg89XJ0b3OBNUgMGUj02st+ivSE9
         LtLI1MBfrpZmJGYQtuoNxQU9VUrj2R/yKFMRYCzrp+P6UmOrfsYnXO8telV91+hfRxGK
         H2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713179339; x=1713784139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5M9yJhy99Eqb6GsotMlodvuJ+GqdhB7F9TG3M1YTZ7Y=;
        b=E+4vDQSvVJcdZzp/K9douSNLHAFkAWaF85OcTF73Rl8AxwKCd2GkCgPjModLOLymDO
         WWPg1EWydhNMU/pUqHsLMAYLuPjn4Ms8tEIp64+fBc6dsdSQRWSajNLp/Wjw6lAe7CpD
         FZMNaZ0bIxMbaGkK7r3PjL/gYffb2n4MxAtwcmWrkcsKacPnMOMJruoREh86B1S9JG/d
         zI4FdoZpZmKmBY7ZOyxih7++w5cNcYd2swiNa1iFOSFRfV0ruk3T6JOZtZfWfFGOxX+y
         4GlUC+4A8vCTFop93qx7k5kfKAYGa1/AZzx3Z3zRjol4iSSE7L+of8sA8UH7u38joD0P
         iD8g==
X-Forwarded-Encrypted: i=1; AJvYcCW4NUiQH8kmFppHHU+xja7KK+4ZRbRFulcVY0Luk/rO9rIFL+1ebb5oP/vAWo+B8UVyBjnuIkOZhMr/qBW3P7piRK3cVtmbF4nE
X-Gm-Message-State: AOJu0YxYhdbUjSwcDDVNb32N1IOrdEuSFl+EOTo9Qgs/Ofnh9A/47QnU
	3jiEZMR7XFYnmmvKO9FrTbQAHmpBeYS3F6zhpPTdBEj5rkc9eW8A9n74Rw8R8Rs=
X-Google-Smtp-Source: AGHT+IF1v1eBuey7AAdvSFGbgfsnJoWMwJh8bGGAiWv+m6z1Fsxmu2YOb4SmFhOpDhx8pKKYE8vruA==
X-Received: by 2002:a17:906:3b99:b0:a52:527c:ea86 with SMTP id u25-20020a1709063b9900b00a52527cea86mr3172063ejf.33.1713179338785;
        Mon, 15 Apr 2024 04:08:58 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170906e94900b00a52241b823esm5099658ejb.109.2024.04.15.04.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 04:08:58 -0700 (PDT)
Message-ID: <a0a220da-ebd4-4ce3-ae26-e1f26d374146@suse.com>
Date: Mon, 15 Apr 2024 13:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-wdm: close race between read and workqueue
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Oliver Neukum <oneukum@suse.com>
Cc: Aleksander Morgado <aleksandermj@chromium.org>,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net,
 linux-kernel@vger.kernel.org, ejcaruso@chromium.org
References: <385a3519-b45d-48c5-a6fd-a3fdb6bec92f@chromium.org>
 <87mspvi0lk.fsf@miraculix.mork.no>
 <a6ad34d3-9cce-4178-8271-0e09ced2b6f4@suse.com>
 <878r1fht93.fsf@miraculix.mork.no>
 <c35f98be-23a3-41c3-bee5-f394ce504545@suse.com>
 <8734rmj3ro.fsf@miraculix.mork.no>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8734rmj3ro.fsf@miraculix.mork.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.04.24 12:53, Bjørn Mork wrote:
> Oliver Neukum <oneukum@suse.com> writes:
>> On 15.04.24 11:26, Bjørn Mork wrote:
>>> Oliver Neukum <oneukum@suse.com> writes:
>>>> On 15.04.24 08:47, Bjørn Mork wrote:
>>>>
>>>>> urb from service_outstanding_interrupt(). That's why it was added. See
>>>>> the explanation Robert wrote when introducing it:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/class/cdc-wdm.c?id=c1da59dad0ebd3f9bd238f3fff82b1f7ffda7829
>>>>
>>>> Well, the explanation is correct in that we must read
>>>> data available. However, if the RESPONDING flag is set
>>>> and the URB submitted, we are already doing so.
>>> Sounds reasonable.  Except that the bug proves we didn't.
>>
>> Why? I am afraid I do not get that part.
> 
> I don't get how it happens either.  But that's the only thing changed by
> the patch.

Now you have lost me. I agree that this is the only thing that the patch
changes, but how do you derive the consequences from that?

>>   > If you are right that service_outstanding_interrupt can race
>>    againts
>>> itself (and I don't doubt that), then I guess this could also happen
>>> between failure to submit the URB and clearing the flag?
>>
>> Yes, it can. In fact in this case the behavior should not change.
>> I am afraid we have a misunderstanding. It seems to me that in the
>> unchanged driver the result of service_outstanding_interrupt()
>> is undefined.
>> Please explain.
> 
> Sorry, I am so lost here that I am probably only confusing things.  I doresp_count
> not understand why we unlock &desc->iuspin around the usb_submit_urb
> call.  And git tells me I wrote that.

Dropping iuspin there allowed you to call usb_submit_urb() with GFP_KERNEL.
clear_wdm_read_flag(), as it then existed, could not race with itself because
its only caller wdm_read() is holding a mutex.

That, however, is not very material to the question at hand. iuspin at that
time protected only resp_count. Even today the URB itself is protected by
WDM_RESPONDING. (Which is why I think that test_and_set_bit is required)

Now, if we say that service_outstanding_interrupt() is racing with itself,
we have to ask why this is helpful. Do we at least agree that the regression
Aleksander is seeing is due to the removal of a race or are we looking at a side effect?

	Regards
		Oliver





