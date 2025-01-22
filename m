Return-Path: <linux-usb+bounces-19634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A3A193B3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 15:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE15E16B4A3
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9A9213229;
	Wed, 22 Jan 2025 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HaULgxuI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00117C220
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737555514; cv=none; b=YcR4czgMJVOILF9KinScVUkA1O779mSBTNhH3C+i/syc+AJhpLaX2HhUtE5DhrjDn59vUVnWcZx+cighRziutNVcDVjFCN1IMsmWefSFruGm+aWibCZGbT9WhuV1sL9RZN4pqDaGGd/ZooTB6qCdhYx1nI7eeMEIM1UQkecCUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737555514; c=relaxed/simple;
	bh=DyGB2FTo+/QXKoSYTosuyCkVVB6mYCIZqQDRhFdFrQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIE51hDb9U8miP7/Ms0IhLdEgI0ulquxA2CkckxAv6gTNCYwTvSgm/61qnvpWweuKceps6Rh8KbVIidY+CV9auIjeZXVQmVhbAkhL7Z2M2E5sOenYnRt/j4uQDq5ctfLcjX9CF9RlDr4C62SVpTC6uuUaKcj+AtHk5+YqBaEFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HaULgxuI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so4000174f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737555509; x=1738160309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vzq9btCKQuUUnDexKgDAcFBahXlm/FN07++3ZQ2HG3w=;
        b=HaULgxuIDtXXO+vq4EkR8RxwO/N7fMgumLXCniBhW31oLBbgf+EaZr4M4QQvGs8knf
         WUj1A4xy+oEE7UfnxczLZhUnKusoW9yG14QyXg8mebJEtJJbLqci/ZYWQWVVEQ2hpcS0
         Yeu5iYVMvdaMHiE7WUU3yWu/CbQxN4vEiC5J+BpJTvQeM09IEyz8DPrFeVHTT7dchi2z
         FPGS4gi8aghOe9woCqtX7kBOq7RIiEH2mfoE8eGcjd6LmmofbYq2XWeCwyQP+H5Ja0P/
         soHHVPSAb8NN4ZJr8Tq08uPXsqoN3mfWl20PhawVD+4PfY9tDhSt+x+lJw1bnroRl9xN
         XkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737555509; x=1738160309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vzq9btCKQuUUnDexKgDAcFBahXlm/FN07++3ZQ2HG3w=;
        b=ozg7gb16AiXApysGd+3Xp5VsSvNhweuyHmBhWHnHm4hN5DrBt1m/7+nMqvxX8LFHS+
         t5c5Umi2/kVKiQPgwBWNI3IPT16yKr2ftD/CWjqQsuHwT2CnZnH9Snh3TCJIwpBOxTPk
         yWCq8ZBZhf4bNqvuCU0ap9NUa/+a4MpoivfyDA+85YvxHw1DT7Zj3GAW84C6eIpu4a+7
         ubfoYp0l0cAmvyRVRXKVNaG9aBlHrdgu1iKpGhD8BNVz+rzY34Aa09H55QYpC/VHbovY
         IgLYQb3yKxQVSSuLak4k8NizsoyZqYJ91O+DwDR30NLyz8ZPwKEPm2RGJJ8o1Kdffd3N
         D7aA==
X-Forwarded-Encrypted: i=1; AJvYcCWfJqzA5gJ03jovXD/DoJYW3KUR9raeb/yHLSU7ySBRLrPJlOfuzZjhdOtJ/l7bn1lR0l8njo9ApA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzye6MiiPerwfn5MuJaoZEkaW1sM3M9YOmEAoEZebR6Ed5gXSTy
	H9rWHuSF8/faa+MwEEFKQpY61YcYncdfId4VocLxr6MRuZcm9AVtM1tRvWJZcsY=
X-Gm-Gg: ASbGnctFyZlwqk+Af6gqRmHBCDX4akJm00xN3yQQIPuN50U41HqkUEi3L4CcTR7woW5
	JsRRj4pm7C6qArBYXnllTyX7Gp8jmbSVBF0HTXwgMw0+JLjdt58OCsYcX22gnR9/4pUVNBhu1sc
	xbOEzwxjWLeqm7lbKZ7zSNCSH1wsqKmaGRMUj2Rjb4Z4ZTcsGkGKe9nzKftumAcaBuz1e99L3UJ
	cgKRDRO9EkmJ/G8t6fPRkwp8wNOCE2ZKDEEKwEejYFQJdVKyfpNQuZb1lnZnpbY6iCjroSBVAdj
	RsM7uq1ODX1+3gfYx9dMXUFmDWciMUjOGEJlKw==
X-Google-Smtp-Source: AGHT+IHFrsYR7uZZQF/wswTc5p2RYKpaOKvIqxGiA3gycD8kc241E+9uhC4GqTN7xJ9FtezWW7u7XQ==
X-Received: by 2002:a05:6000:2a9:b0:385:dea3:6059 with SMTP id ffacd0b85a97d-38bf57b64d5mr20196320f8f.49.1737555509345;
        Wed, 22 Jan 2025 06:18:29 -0800 (PST)
Received: from ?IPV6:2001:a61:1385:4701:9b57:b1ba:9d42:46d0? ([2001:a61:1385:4701:9b57:b1ba:9d42:46d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214fbdsm16770890f8f.19.2025.01.22.06.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 06:18:29 -0800 (PST)
Message-ID: <2fa78a3f-ac17-4b52-9ec2-ed268361d2d5@suse.com>
Date: Wed, 22 Jan 2025 15:18:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Your fix for most_usb.c::hdm_disconnect
To: Camila Alvarez Inostroza <cam.alvarez.i@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>, USB list <linux-usb@vger.kernel.org>
References: <e8310fd2-caa7-4a78-8ff1-2bc2d07d74c1@suse.com>
 <2025012247-scrunch-nuptials-cf11@gregkh>
 <8fb2f3dd-99ef-b000-c5f5-44da149786a8@macbook-pro-de-camila.local>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <8fb2f3dd-99ef-b000-c5f5-44da149786a8@macbook-pro-de-camila.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.01.25 14:59, Camila Alvarez Inostroza wrote:
> 
> 
> On Wed, 22 Jan 2025, Greg Kroah-Hartman wrote:
> 
>> On Wed, Jan 22, 2025 at 02:44:59PM +0100, Oliver Neukum wrote:
>>> Hi,
>>>
>>> I am going through syzbot's list of open issues.
>>> It look like like the issue you posted a patch for
>>>
>>> https://lore.kernel.org/all/20240730035745.110637-1-cam.alvarez.i@gmail.com/T/
>>>
>>> is still open. Can something be done? Has the patch been lost?
>>> Is there a remaining issue?
>>
>> The subject line was totally wrong which is why it was probably ignored.
>>
>> Also, are you sure it is right?  Grabbing a reference in a disconnect
>> function feels very wrong...
>>
> Yes, I think so as well. I don't think my patch solves the issue at all.

Hi Camila,

thank you for the clarification. Frankly I don't understand the refcounting
logic in this drive. Let's add the author.

Hi Christian,

there is an open issue with the musb driver. May I ask with respect to disconect
handling where the get_device calls, which musb_disconnect() balances with put_device()
are?

	Regards
		Oliver


