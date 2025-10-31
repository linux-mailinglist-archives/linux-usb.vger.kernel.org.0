Return-Path: <linux-usb+bounces-29965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE7C2653C
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 18:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6952A3BD1F8
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 17:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876A6308F1A;
	Fri, 31 Oct 2025 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IoRNMGQx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1933054D7
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761931297; cv=none; b=a4v6qadjaB7AazqutsYr/Z6gM7gUPSmdyTsTewHfNooyr+tCrB93R0J8tpcvPEJOwMqSgzZHMThquNMKt5y5uNeYOZJJQUbiVn+ZHKLqcx45bODyCMXOYjtS4HuvFpVJZV8827tkG128BT+xBaMlpbKnius7fDfxz6N+C9p7GyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761931297; c=relaxed/simple;
	bh=9dIYlCqSuay+P18dQ0M4/XCMXtFDI35HoGfcLtJV++I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrEaQDW2Ko4t8wrlzxnqIfUfcU4bVY/XSSBp1qUwrXYSjtR5RtRNfKguFGmTp6DUTNxWVG/tXTRCUs2YiEdlFEoGCkatkaGWyHMwRsAbxdiRPXbJ+M6Q02qNoxhPvm3BQC58fIFJTMdFt9UYlUk+vUaLb77xcIPj3W9mIo43xgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IoRNMGQx; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3d199f29161so1874466fac.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1761931294; x=1762536094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2arCVoySu4BoT6qvWYZ5TCMKdFyAl6i0QIhKt61vYqE=;
        b=IoRNMGQxaJE7gCHO6SpA5/PCegsQmApO7UECLD8M3+Y731+VqrxG4PVu5py4rj5chA
         KVigy7MOCQOGOf3W6bghZB0aYXfYrPwI8X/50Qqzh23070ycIm5D8wu/mtzr0+Wv27zm
         CeT3OdwVHFx3osRQKoMlIHHh6li3gscz/w344=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761931294; x=1762536094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2arCVoySu4BoT6qvWYZ5TCMKdFyAl6i0QIhKt61vYqE=;
        b=tZSOklWumg2UYa4ng8im5SFOgomZyeC6ZohVejio3JS12/i+MsZnC+pmNuuL4RamPS
         zim1Caa+TAbji35rT6F15d+0L3WvWYtb7jzVGB4dj6l3Jx3i49vJ2H4DNcBdCq19aM5O
         XOUDz9uoR8EOUjRuBCWbtsLh5O9dupTkjxY8scZ82IQOxgTqPSTU8qRebcPAI2m1ZXkS
         Pyz4SkP1DEB2TxOlCUz1NOqAAPDO6FixmsZThMO1pqtrtX4nxq8wQTnwS59cVG9yKnBf
         NGNmzsW0tMhhhstYFnnFPAUXJtiotrb3ECnaBn3q5g3Qq3KBBZgPn93MZD9LSnBT9Ufs
         E1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVJRP8DLp2+D2ttccetiI6mobZic4D8N8V5cUp/DF4YlGlyL+N0lL8YXegaiakMKs7VR+EEhWiqQ0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAq0AMJd5tLTDPOaFyKxdGzSNq2G8KLnwlIYrljz8GBbZVtOIi
	CWOructuJ1EpoVSLjhvPDxUe7nOXvo36TVCzUMuPAb1YwN3uAE7FjQUTlOiouqU5raA=
X-Gm-Gg: ASbGnctqbAeVvOn97P9PnjtOslgP1mP+L29D1sTFnyamsZXWa1kT7sIdxLAjLjaSTbU
	31M5id3/wJbUTSxsRTzK3+TxYDWydfhK+799YbpY3focFxLm3jEGXzEfPf3OUyrKJuQUa91Bryb
	UgIVIxA5tjH3nRvUDOhfmHcNO7n9gZYDS/TsNHBe+6RvRq/QLQMqxunN5Iew6mV5eDspz/b+sQy
	qsjadUdGSZHor91FHNh+K5hhoCwzlTsdEvzwTdFdhwyVK++OmYmpcSnzAkZK7URxwKS8nJtE445
	FtzA68K9XkxvQcX+PD/XoMEKLjRzx8of8Hfn+5iDDeHmk2Ng2ZR6izTxjZrBmisjJD00oM6VCwf
	b6up0udrYtXQ3m+DxRCEa51uXeKnPNaAyf0ZJQj9+aJI4bIrsBU4wzNT+SO9Di/w6HNk71JRsnM
	/4RYwCz/Myd0JSd9qLjrKDRwU=
X-Google-Smtp-Source: AGHT+IFHV5mqBxfVnLGrK24cHPx0N/RAB4xpvKPnhRbNDbS9+AwnDKl1gfiMXkoDBtzu6gX4xQcp0Q==
X-Received: by 2002:a05:6808:2184:b0:441:8f74:e95 with SMTP id 5614622812f47-44f9601fa1dmr1922372b6e.63.1761931294049;
        Fri, 31 Oct 2025 10:21:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-44f9d9a4cbfsm500332b6e.24.2025.10.31.10.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 10:21:33 -0700 (PDT)
Message-ID: <3a9185ef-c212-41bc-978b-0dea75a86e7b@linuxfoundation.org>
Date: Fri, 31 Oct 2025 11:21:31 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: prevent double URB enqueue causing list
 corruption
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: vsshingne <vaibhavshingne66@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20251031134739.222555-1-vaibhavshingne66@gmail.com>
 <2025103118-smugness-estimator-d5be@gregkh>
 <6c81d455-a4f2-4173-be72-9d77728378c1@rowland.harvard.edu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <6c81d455-a4f2-4173-be72-9d77728378c1@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 08:13, Alan Stern wrote:
> On Fri, Oct 31, 2025 at 02:59:07PM +0100, Greg KH wrote:
>> On Fri, Oct 31, 2025 at 07:17:39PM +0530, vsshingne wrote:
>>> Prevents the same URB from being enqueued twice on the same endpoint,
>>> which could lead to list corruption detected by list_debug.c.
>>>
>>> This was observed in syzbot reports where URBs were re-submitted
>>> before completion, triggering 'list_add double add' errors.
>>>
>>> Adding a check to return -EEXIST if the URB is already on a queue
>>> prevents this corruption.
>>
>> This text makes no sense at all, it does not describe what this patch
>> does in any way.  Please do not use AI to generate patches.
> 
> In fact, the patch doesn't do _anything_ (except maybe change some
> whitespace).  And it does not apply to any recent kernel source.
> 

Agree - this patch does nothing. Looks like the patch isn't sent
to right people either.

This person happens to be in the mentorship program - I will make
sure they won't send such patches in the future.

thanks,
-- Shuah

