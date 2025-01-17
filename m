Return-Path: <linux-usb+bounces-19505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB9BA1594D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 23:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AD617A166A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 22:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346781DE2A6;
	Fri, 17 Jan 2025 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUCNC5ne"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02201AB51B;
	Fri, 17 Jan 2025 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737151238; cv=none; b=KLObIS9gDpKiLHGZ3XTnXlYguY9YKe4Tm6qGCcnInj7Ox60ZI0IfSV2Bb1v6ixLVuGQc/YB7kZ0HBoYExGt/WfyUB1LlvFlh2p0NigqVNrZMrgN0VPV4PuD1KmM1ABOSAk+p9rsiKGHXbSMVfXvvCrrLhDfAjE0RvW3vNBEP+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737151238; c=relaxed/simple;
	bh=OLpJw+nmoMHAjBQIB5gKtYutr4KSqMHspFULifMH8y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCTkgWuR/N0sBWBjZFNDgeFZTVI3kJNqblsLBM2w3y3k4NNHOV0+DovYPrlm2kEXUR5Y1f9JCRqEj66pPnss5QYCvafg1/sFxKmQBPweTbOSt+JWc3clspTFgmZHDl+1IzGAQRCKLJWCy3o5zidKd4YedC/tfmQ5Zson0zbF/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUCNC5ne; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso4602894a12.0;
        Fri, 17 Jan 2025 14:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737151235; x=1737756035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WhVZdRTDkwUE2D/s6RcQm6tX0DVpX9GXKevi9aNV+0=;
        b=VUCNC5ne5l8Go9N4sM1NKPIJaqbpfqys6mVJMySWoyd3ffueWUiQj6qTRYgiAvvUOc
         7gDjugnGesdwpykJLNpcfGhoZgdz3AijM7xWocperpZvlbqMS5py44OqTdHj0zqo0hPN
         bZJEnPUmYGNx//rSzAJxTTDCROn73sMIf/c80kGW32/XqxeR7WAu3cbyGstrGOY5rxBP
         V4pGYKzSqJHArnsq1tqRVHNxhd18v3Ll2ou88c7ULUKop55DmFXa366sWIwjAZ0u0qtn
         frsn3AiK2NhXGhgK6iHeh6HwT5mwaO22VYt9pPO+jF/SpO24b2LCO7i9NZTnWgXmB4f+
         pKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737151235; x=1737756035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WhVZdRTDkwUE2D/s6RcQm6tX0DVpX9GXKevi9aNV+0=;
        b=mcpz7YQFhoTE0/LeUrC6rs4HEu0dnUn6OgWgISvLZf+wuWmPbU5Ji69MlD3wD4fe24
         2G5uv0uBaZl9FGV54pRYIboy80/GH+s/6UObMW0Guvw6G31kt6mmgAR+MO26a+Knvxvp
         QxF5C/5V/yQ0a1Pfn28+HobC9+hvbWj/7NJWNg9KS1nicKacEQLPBEx/wsAPFEgyvbNB
         bnqdbajEbJ9BDZsWHyecVZjOPofoHVA4kqngLRjnsK4pnvFLot7h8RcfHhFAM7Ila7lC
         ihV1UXXXzb7cU7VVSwpD2N9PAlFqWtEXBaxDONh5EeRUPKuanGxrq5vRggkyuAJMa0hM
         kXfg==
X-Forwarded-Encrypted: i=1; AJvYcCUGrLW8R+Jt499Rs9LPAcy4PE76LuOBY6Te53MA8P0fNHDCAzep8vtBFsdfZAcP0/hFX4hUTchuKv067gXU@vger.kernel.org, AJvYcCVS9Dj71a5mK2a43+NuHGD2w/ZOS5PCilWwJ3G3qYVf2IcoCygduTRulGLZYCR/bGR7813roXqGawbz@vger.kernel.org, AJvYcCVlD9w390OAJ8mFWe0eLGLOBoyE8Ja4+9cLFg8tZSe1lUCrWNfN3irV3VFWSTZlGV1JjXtZ5T00U06K@vger.kernel.org
X-Gm-Message-State: AOJu0YzJr7+C7HXp9s5YI5PVegZhj6ILx8k179/kQFHbbIWS4O3+7bNc
	34LhnmftBfqiS2XQCbWWHRgRnWOldKi1ehz4Rnpfe0ijLe0vvAlR
X-Gm-Gg: ASbGncsxFJZh+ANEVUX2qtEc8djzysq1/ACUpZ/ecvrEugYhj6d3fpV17jJ9IEv2Oal
	zUH2iri7nZt9hredi1t8aaVEtPS3Vo+RUhRrqEd/ZJqj72x0NYMt68c+YvfKG4+AP1J7GPDAdaL
	HQbT1PD6U9gOn9HMZZA8073Nw070VquFB6dux4YFtcDUDAa+iwCRrE0r3JfMZWEqq5EzDNMjzp0
	ADKJkoX5aBFc7Exvm61IUKOeHUmp0ks6b4ZDLs/JG9TmV5vL0sMUiBds2u9zkFuvc6BGE3ksMxZ
	TVxWW/qJ64omtQzoNtsGLKcK4CssLeMhExHq0J8TRMLtd2TlzSoiFyToEoCZb9okvPIs3FfCfB1
	c6Cen6Sx85H+VmIY=
X-Google-Smtp-Source: AGHT+IH7JKZn55TFqBMDvufGKFkUhHeC0/7cJePf4smhMMsHf5hncKtii9E+hcMcYjsmqwYjVoBl1w==
X-Received: by 2002:a05:6402:2815:b0:5d2:7396:b0ca with SMTP id 4fb4d7f45d1cf-5db7d2f873cmr3905207a12.12.1737151234843;
        Fri, 17 Jan 2025 14:00:34 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:20ec:3e8b:2297:e41f? (2a02-a466-68ed-1-20ec-3e8b-2297-e41f.fixed6.kpn.net. [2a02:a466:68ed:1:20ec:3e8b:2297:e41f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db736717dbsm2113188a12.30.2025.01.17.14.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 14:00:33 -0800 (PST)
Message-ID: <06851646-7d0b-4b30-9794-5a70a1431cab@gmail.com>
Date: Fri, 17 Jan 2025 23:00:32 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 16-01-2025 om 16:40 schreef Andy Shevchenko:
> On some platforms (Intel-based and AFAIK ARM-based) the EPs in the gadget
> (USB Device Controller mode) may be reserved for some special means, such as
> tracing. This series extends DT schema and driver to avoid using those.
> Without this the USB gadget mode won't work properly (those devices that
> "luckily" allocated the reserved EPs).
> 
> Ferry already tested the privately sent PoC of this, but I ask him again to
> re-test this version which is slightly different.
> 
> Andy Shevchenko (3):
>    dt-bindings: usb: dwc3: Add a property to reserve endpoints
>    usb: dwc3: gadget: Add support for snps,reserved-endpoints property
>    usb: dwc3: gadget: Skip endpoints ep[18]{in,out} on Intel Merrifield
> 
>   .../devicetree/bindings/usb/snps,dwc3.yaml    | 10 +++++
>   drivers/usb/dwc3/dwc3-pci.c                   |  9 +++++
>   drivers/usb/dwc3/gadget.c                     | 38 ++++++++++++++++++-
>   3 files changed, 56 insertions(+), 1 deletion(-)
> 
Yes I retested this now on v6.13.0-rc7 Intel Merrifield and found no 
problems. Skipping the tracing end point has definitely always been 
needed on this platform. Thanks!

Tested-by: Ferry Toth <fntoth@gmail.com>

