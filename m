Return-Path: <linux-usb+bounces-7615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5F873D67
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 18:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96094283F0B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 17:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF9713BACA;
	Wed,  6 Mar 2024 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fRm7+o8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD1F13666B
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745715; cv=none; b=RlJYtnUtlKvy9vqRZcnx45qsjSXj+kND2Zy5F/0V2FqlWAVJDT+H/62dLDGns+4WbsWdIyJoDMYef8knfyBkG1l/txXo/4Np/3MY7x9lrzNtf/hHyqk+isK3FhG5BZLPed//sYCOOcEq7rc8EC+wpfB/BF81tfqFILwQ6NtQyug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745715; c=relaxed/simple;
	bh=wJSO9638b0C0bTkeAKGbBDFerfuAF+ha8QNh1SaDGgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvIPKE9neR/tyJvd25TB3lDncGg90IIlDZTFpvDddbPbpVI7iDrtnzPXKyB90QsNo7nxP1/OITIOW7PFQXTgFk8kcRjvfncqJm7rPyZq19RLgvGDGp6JW1BJRd2f3pCzLAZaeM9tv9fa3snUTja34Oc6bNksxt2GZgIOv6imIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fRm7+o8X; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3f893ad5f4so879566b.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Mar 2024 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709745712; x=1710350512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZepAgoRBGZH9lV/EuYJdoD5pQyR7I1LHPo56Sgxp+s=;
        b=fRm7+o8X6luHbtIn0MekEH46F83uCtuC4tahRjMW97WTYDobyq0VtK4aZjq8I7yHyQ
         RY4NamcNIL/JQzT5MUreXbsXnmHxlRhYtpfyVpFuzeZSkCGW25/2BxNZ8aHDvy+mCcI4
         9sfJsde7Xkd0E/yyqgL9fe4NXLLXH8OyJRM6na/HtAFYOIhXXotyw1F2+wLN2udv/Zkw
         u1KwJpdBpLgqDVrPpJwKFh5RlguJsL5quhcuOFWwEVjeAeuZUiDqzkncunowgW2ZKCEm
         QJpugBmtKhmUwQvuvIsHs8yhXw9jKr3/G6ajey2h7HvC6mT3wZoc7C+ZTilEoqdWvRs+
         z3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745712; x=1710350512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZepAgoRBGZH9lV/EuYJdoD5pQyR7I1LHPo56Sgxp+s=;
        b=R/aypccfkfQr4PZjJbNheg+HZJDYksg/fetbPJOK/YNGkzCt+VXRqb6JwINcyklSH/
         zTk+kFf7ULPvHM4kmuBDu88yVBm2f0MSobUfZ5txJ6yGWFabX0uvccoNmIS1YF2QK7g0
         DU2hjSgNBPQTfiQaMBSqukr3jY61rQFKOA4mjmOZBo3ur+yYRfPaTcbbjW8j5BN4zsS1
         b69x4gDSpMT4oTySk9Iqa7KLr/BsEgOiW4waPcEOeHWDuyVy9tyqMkdOenTSI5c1luq3
         T7+b6y+cy53Y9WhPzNemRR2j8e20zn7iVya3LZvXEQ8GtUqLJCVzSw/3lanphasEZIIY
         M6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUKimMTr7JK3gJ5vHZ3WoYFZAqRI0a0Rg5amc8xZkVX+JbDZhlXxPWbmKAR6b5j0xgbw8DOVO4JYQGkInlvzpkmRWj/hLuKgn0b
X-Gm-Message-State: AOJu0YxN4SY+RLAuELjLG4H1i6KIvpi4C91taV70qSxU2ALl8+8v+veU
	4ZcjzHP3JZnf5ipy96NquwZ8r1/HbAnFmQJediv8Pbeih/xK4145SbbTAMQkglk=
X-Google-Smtp-Source: AGHT+IG5Ek2K8BgwD0/SVHizIWQQJr+PjUabNHq1xlLEvApHUtlN0BPvjHeIrpzAR3rfE2HBylF2Og==
X-Received: by 2002:a17:906:37d6:b0:a45:f05:7e10 with SMTP id o22-20020a17090637d600b00a450f057e10mr8072132ejc.24.1709745711674;
        Wed, 06 Mar 2024 09:21:51 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:b2db:904d:e0b0:46ec? ([2001:a61:1366:6801:b2db:904d:e0b0:46ec])
        by smtp.gmail.com with ESMTPSA id fw17-20020a170906c95100b00a4576dd5a8csm2978506ejb.201.2024.03.06.09.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:21:51 -0800 (PST)
Message-ID: <b836152b-72a6-4815-a4d0-ee4956331a8d@suse.com>
Date: Wed, 6 Mar 2024 18:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: usbnet: Remove generic .ndo_get_stats64
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>, Oliver Neukum <oneukum@suse.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 dsahern@kernel.org,
 "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>
References: <20240306142643.2429409-1-leitao@debian.org>
 <20240306142643.2429409-2-leitao@debian.org>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240306142643.2429409-2-leitao@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06.03.24 15:26, Breno Leitao wrote:
> Commit 3e2f544dd8a33 ("net: get stats64 if device if driver is
> configured") moved the callback to dev_get_tstats64() to net core, so,
> unless the driver is doing some custom stats collection, it does not
> need to set .ndo_get_stats64.
> 
> Since this driver is now relying in NETDEV_PCPU_STAT_TSTATS, then, it
> doesn't need to set the dev_get_tstats64() generic .ndo_get_stats64
> function pointer.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
Acked-by: Oliver Neukum <oneukum@suse.com>

