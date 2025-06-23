Return-Path: <linux-usb+bounces-24998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DBAAE3922
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 10:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9BB3A299D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 08:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85BC23026B;
	Mon, 23 Jun 2025 08:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Cmn7MFzb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0395A1DF75A
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668979; cv=none; b=aGKcraiyf51dHBIIJ99hSaOSXVuv7jX6olS8zIz13ex6FCJJTPwvdrnwyFoDrj8c9g5nEfcdYTbD1PFV9LT+Zn87rjjgnLZIHof1Dv9+cKEVLyDxGeyVUeswECX1B/Ku2Ud17MDPOGEGuywniDUm2d51WZ8Z9N9JI/4EFAzzsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668979; c=relaxed/simple;
	bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DD9ofk7xfHkP39B6jLvwtFp8HQ419o3lTXu5qkvD3Md8jvOQiGPnpZ7MM2eQXmCPYPRL8+JdTXXNkazesnKzwlRptAF7YRy2zk1z48EyabQG7pjnUCNFoT5NrYCCfi4DDFR82XhJyRS6EjRa9GHjlmkb9iWdHWr9FQEfh1x/CDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Cmn7MFzb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45348bff79fso43549135e9.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750668974; x=1751273774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
        b=Cmn7MFzbwJNMdkIe955KZB2BTmHIMg20MH/BA+NaTGT7fogT0CUMeHoO1um/yM47FT
         9Aa+pBtMLF7LsJUczdvKfjF+UZFl9Tq1ynxqDy4a3eGbuBGXpbkJ2jEPacAl4XJheSIX
         xgs1XfsakxD0DD/hfGQKcVrJgsXy5gYyUcTjg8NfUNJevJWTtEs3mMSUxrRNd5IbB+Kz
         clHIFcLDT0Ep2mqYpQYAFlBl1VevBB4GWxYNvNEgo1OgZ1qytDvUnL+ia2zSJM4DPeEa
         BMe0w3YpHVwdKQaDnt4VgBEUolXvNQJlOe3CZ1AQLaB2YsYHRVmyCMyvCMVpjAeJhtNe
         auQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668974; x=1751273774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3+W5D8CnGWfTlHowjBSq2SphepD7q7N6mU4Inz8Lzw=;
        b=dAHkBUiPAyiVt1IbDD4L/T9aKMRbc152lcaiEE+jCVcOub6NyC1nk66LpUJfiURckA
         H/4DRfsqEWweXQiQSd03NGtQtNDwiI6lKzjZtCs8drxUKWq/FJtUmGiRHDKAinCrTvvi
         fSk7YxKGiOSAB3bWidlZUn7C5Qg4+qDwVzbso1qSmRwmHOppjlXAIINS6PXAZU638sA2
         ihtko0W1ZJe2uRCqioNtjM0DnAdZgEPt58r+8hSEwvo2ciBiB70aDyorWmwOPCikE3W8
         hArnz6KsQ6YjQApfiFtfELXZmHUpsU7hs6OOEb+MFscyEWJyDy4lCZ6AGtCHO+c4p+LM
         KMeA==
X-Forwarded-Encrypted: i=1; AJvYcCX7KpQ7mUQaTVbdk2Sn9qIZldaDvHaMSnmsF+QOms4fSXWVS0CLwVfPQwAvfnZCO2TCDQYrTsBlkxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/VVtPBAwZG3vu0Kt7w7Aj3ob1odvrHvd3nQLp3qQMJ3QQyqV
	MfapFMWaFjCPL+NS27ckg3GztKMONy++0OdU/Kc7rxxqlwJBKxbGUmA5yGkprsUW184=
X-Gm-Gg: ASbGncsK7INc+SpR0QwUAvXPs4fHDKMaMvL89AEX7qTpjrAXoFgCueD8I4BBbrilCej
	o/Qk8LvYS05Qu4qzjNgbkoG7pmKw4ykPS17tRqOfQcN6PuP9Hb+DQDagDAGotqFko50kcnUcRdy
	8VhpeTHDExM+p84ecNPwOMaWk2340uUIPK1TNx6jXzZMetGgBgkg0G8/ntxEnSqe2STgVRL/CaN
	056RpigCikyVM8hBlfYQSp8aC6kQB2QzV2dbvXN87/msoH+zUWIYfbUl3NeJ6mpO09R+HpMeqKU
	ryQWDgmWG+G/wYItCMuVOrGSUX8yrvz5A2SEEmhf3ZrfkMb4xbGqTOtm1m7nHaZAzWHY2XUTn/m
	zAHLnEiHRs1XfS164b+m3w23/j/8MIy/ptYDXqN+EYy8hoa7IOReA
X-Google-Smtp-Source: AGHT+IERqVhXUuZaycJ9TXWhRB2gxybcEMP4NaEWUk1qVF4LE8ISnCBkZkByr7Mu7swhmGQOyICAkw==
X-Received: by 2002:a05:600c:4512:b0:453:5c30:a1d0 with SMTP id 5b1f17b1804b1-4536e0da765mr49058295e9.21.1750668973790;
        Mon, 23 Jun 2025 01:56:13 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:8778:2532:8a32:106a? ([2a02:1807:2a00:3400:8778:2532:8a32:106a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536466596asm107238875e9.0.2025.06.23.01.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:56:13 -0700 (PDT)
Message-ID: <643db411-d72c-4542-82a2-056d7d745967@hammernet.be>
Date: Mon, 23 Jun 2025 10:56:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
 <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 6/20/25 21:56, Christophe JAILLET wrote:
> Le 19/06/2025 à 14:07, Hendrik Hamerlinck a écrit :
>> Per Documentation/filesystems/sysfs.rst, show() methods should only
>> use sysfs_emit() or sysfs_emit_at() when formatting values to be
>> returned to userspace.
>>
>> Convert the uses of scnprintf() in sysfs show() methods to
>> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>>   drivers/usb/host/ehci-sysfs.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
>> index 8f75cb7b197c..3786e81b0ed9 100644
>> --- a/drivers/usb/host/ehci-sysfs.c
>> +++ b/drivers/usb/host/ehci-sysfs.c
>> @@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
>>                     char *buf)
>>   {
>>       struct ehci_hcd        *ehci;
>> -    int            nports, index, n;
>> -    int            count = PAGE_SIZE;
>> -    char            *ptr = buf;
>> +    int            nports, index;
>> +    int            len = 0;
>>         ehci = hcd_to_ehci(dev_get_drvdata(dev));
>>       nports = HCS_N_PORTS(ehci->hcs_params);
>>         for (index = 0; index < nports; ++index) {
>>           if (test_bit(index, &ehci->companion_ports)) {
>> -            n = scnprintf(ptr, count, "%d\n", index + 1);
>> -            ptr += n;
>> -            count -= n;
>> +            len += sysfs_emit_at(buf, len, "%d\n", index + 1);
>>           }
>
> Nitpick: extra { } looks useless now.

I'm fairly new to kernel development. I checked the coding style guide and
indeed saw that the curly braces should be avoided if they are unnecessary.

Thanks for pointing that out. I'll fix it in the next revision.


