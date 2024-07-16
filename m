Return-Path: <linux-usb+bounces-12234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D793296B
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2024 16:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85591C208E6
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2024 14:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193D81A01C6;
	Tue, 16 Jul 2024 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HxdVyO/5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD9A19DF50
	for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721140424; cv=none; b=Fuo4sODnigvxdDqCR/A8Mscux0kyQK8Iary/me4OtIFF97Y1AEzEf/HET4AR4/1eKtqCguGaOeEs6FgSvm1EBlxhSUMTMWJ7rQsXQ0Q3ayOrRTlQ8cytyL4XF6S1tC+Hpd/T3J64ZORfCK+jHFvP/be/Gew06HT/Kj5DmCmfjVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721140424; c=relaxed/simple;
	bh=RQeQSD2wQctlzQqeddyaJO40BzkW4FuAIiCKk+yLxro=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VXiwk3MKn2bPaNMPrFYyB3nRmcEm7Qb+Jsr79D35gVdbGrkY25Eyl14ppwax+stZWag5B0ZLbwXA0GDIsNQiCTWNjhJJY7/UI+gujiYfWEbvOUMjJ2Dv5caAmr4QKmSsYPsvFovJAk/kcf1RiERYl4XphrZ9B87bUGIpAhJOBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HxdVyO/5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4266edee10cso35919775e9.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721140420; x=1721745220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SAoN+lGsoTU9UL3D4vZrsnnJ+oEcV+/X3gR00PYCnt0=;
        b=HxdVyO/5Tqw4qkz19WIRmlZJC/N5VhEXS2qZSsTm4U6HNEa58s7HrJLJw4/PSc+GNm
         sI2pflclxfBv2u3788l8TKOKS3F7A685+CH/YbK9zaxb69LZ/INJyP6fTsPalawJHw3C
         n7dCPWNZO4dsWaRFFQDxbOs16FJArOtSggCIWb/pgj7nOTt5rTAl+MDlSGx27jNnq+Oz
         PPXVK4VCR5x3er/SRjtGNfwnYh64wZVFTutZRbgOjDmNjEdnxNA36mdAnv+N1AifPn8Q
         faLQHnSv32LOoHS/SVUgJMgOJL36UR+/U2BMEveWeEHNO7AbrhhNxGjJ2qm3T+Snq7KN
         p6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721140420; x=1721745220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAoN+lGsoTU9UL3D4vZrsnnJ+oEcV+/X3gR00PYCnt0=;
        b=EvgDtXXXvO50K6iO5vtF8ful0lqWyonETTVV8rdVdJnqnQJK/06Fz8bDeMYv3ZyhJZ
         33lMXQ7F34MBmUnG3pL1m1ibA2TrCFJMd8rDgRaP/aOTH+ew0bYiiE8ECzPSuTEH9EDR
         /Tp912RFhwSVqeRfg7EaGr3K7xZI/nGU8poHJHH/FvWDNBEBN0XTp5rJ0cqBnunx6IOy
         ZcYuAIcFZcbrL6IE1Qrn9Rsy+HJmK+8al79/PFTmuztSnyF/zBLTj7swS6k2O6EAHOSa
         48YXLs7SxMOTkSI7qqS0iltJV6uoFRI+RSKIgpWQdDQhxf0E9OqYEWPK6gtF0dK/VfP0
         vpRw==
X-Forwarded-Encrypted: i=1; AJvYcCWUuN5aVU8xXm1XtXr0kJxwBpsioTlHtWxn2GdQQPgjWelR21eZyf8zV2lSoBByuCadswHEpPFmvKuyQ9WPRGGT6oFYaqfj8mk+
X-Gm-Message-State: AOJu0YyjsXghq/fgFkYwmJBc6T+44I3BHwXfl2GCzoz14W33V58HoGou
	TFVqdvo7Z9btZusVi5RcrlOzM/xoOTk2BJDQcIzs0rS2WYteD5smGaFuSfSWIVI=
X-Google-Smtp-Source: AGHT+IEzXfimsxjIWml18ttj8Fc+idKnUTz61gGP2qi/8EpAYJIDv+NB8IsKkCdwykWfnnmGp/TDEQ==
X-Received: by 2002:a05:600c:1383:b0:426:67ad:38e3 with SMTP id 5b1f17b1804b1-427ba654c0cmr18085675e9.3.1721140420220;
        Tue, 16 Jul 2024 07:33:40 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a574e1f3sm131136365e9.0.2024.07.16.07.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 07:33:40 -0700 (PDT)
Message-ID: <f8b192bd-55e3-4b00-92b3-67ba99b5b86e@suse.com>
Date: Tue, 16 Jul 2024 16:33:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: vhci-hcd: Do not drop references before new
 references are gained
To: Shuah Khan <skhan@linuxfoundation.org>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
References: <20240709113851.14691-1-oneukum@suse.com>
 <e1b713a6-de8d-4df9-979e-12cb9876bf33@linuxfoundation.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <e1b713a6-de8d-4df9-979e-12cb9876bf33@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09.07.24 21:38, Shuah Khan wrote:
> On 7/9/24 05:38, Oliver Neukum wrote:
>> At a few places the driver carries stale pointers
>> to references that can still be used. Make sure that does not happen.
>> This strictly speaking closes ZDI-CAN-22273, though there may be
>> similar races in the driver.
>>
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 
> Sorry I need a bit more explanation to follow the change you
> are making. Also how did you find the problem?

Hi,

I looked at the initial report you wrote and it seemed to me that the issue
was that vhci_device_reset() leaves a stale pointer around and vhci_urb_enqueue()
in the special cases drops the old reference before it gets a new reference,
which together causes the race condition you were hitting.

	Regards
		Oliver

