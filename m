Return-Path: <linux-usb+bounces-33014-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFONKnz7gGn9DQMAu9opvQ
	(envelope-from <linux-usb+bounces-33014-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 20:31:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 123E1D0892
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 20:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0F3305B08B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 19:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AEA3043A4;
	Mon,  2 Feb 2026 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGQxBlPA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E45302CD9
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060516; cv=none; b=OuO9nLQXi6h3nBv5x7XYLkJnDnKkcRVp44892/hiurn5YqH4OSRylXz8jgoAlAniYsLP68mIVg1B3e/ZVMDLyVKsYCRvcGgE5Qhe0HI0U9lXCM5LfpanDnKPfUrvl6TZa5TDn9iGmmG8zInmBt0X+BipB930yD6oPrgOlonIhSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060516; c=relaxed/simple;
	bh=9R4umd06t5E/qKjLk5WzZjI2I/NhDeB3w5NjHxxqiwg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OtXGGT3ES6WIGLSJ9ASeM7I0lmG6XCnw+DezhJe/yulOTLHutFwsiXLrFpvlesi/aIETEUDe70VD9zwkonJ9+KaDO4CY057nk4DpkUWwZE+4kfWyJD4x9OO18Hny2ln5h2sJ1MkQSA6i7sRZw++3d8oOulizX2wPxZVoWwKYEY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGQxBlPA; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-59de2d1fc2cso7337718e87.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 11:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060512; x=1770665312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OeH4xFhVd84MvPT654VB38zYOhOQMi7sJ1xCCDkznfU=;
        b=UGQxBlPALiZ+I67cxSRBkM0lxAmDlzm9IxBVQhYZ2Q4caB1d+s1RQiuwAt8KL6e2oH
         Yi0jufFiDY8LyhVde6AXjfx/mNcoN+iyRVfK9G1s/+xK5qSHhhT47jvw0ainsXGbz4pe
         /JnFGEklCiSOxbHubUZhT3nP3LsGLX6CndRa/CoTAGdTwZmj0hiAmgyNSnf+fcVh57W1
         lt9qvMabwYDCRBYVZULi57hWTReLWPvnwYk8tqMudTHm2g+wOhMdtZjMuLyBsvcqJ610
         faBcZAwNHXlXc3yusGZ0Y8EhUxxls/LzeBxi1/8NuKzcnidfX+OGiKqsUQhQytS87t2t
         q+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060512; x=1770665312;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeH4xFhVd84MvPT654VB38zYOhOQMi7sJ1xCCDkznfU=;
        b=nUP5rK27UbS73WcuUDmOR5qzWuuJc2M1vfBWZy08HkBNRaddG/bpJJM6qBYREVuYZ/
         8j1on+XMr9rprSCpZ7O9nlu7ROXaLWqtpWpw3fFVQFewEGrAUUxHuhmSqPOP3ceIbgI4
         GjjdHCXeDjMB8BSpq1VYSGcUBxqSJnURoRYOT4RoBlW7nTw59MemfvNGpu2FOPp1v7bv
         stig2SF4u9XwmsiHo6uVKrQdPdbqgxDNDNAafrFJVwARbNgudBCUPbzO7y1kJ80TYm1d
         Tu5mVIfnZtfChDh6YnzTXRkUbY2UqOP8E73RQV14uSWPhGTmSKqOoPz70Ih/GsOoGyeG
         iQQA==
X-Forwarded-Encrypted: i=1; AJvYcCVfaJHTQTXtalH/NNJGgy2sptGnsGBQC4PyM4Xbkdf55iJ3vtPimNZCLm/9CCVu8i4IRG0XLW7IZOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHEFdrv2MeT0T/RUwrLOSIqFkY9L07Hwa3d4j5CsAXh61bvkE
	b0yEOBdYBE1tU2z4vOU9ECMrzjFPTM5AhPQIib2T/6E+jgBW62qgSZpL
X-Gm-Gg: AZuq6aLJE0ntuNKahv9aV5OLNVfvj9ZQZ2cpSH/27Iw9kh7aE4dEsfVD3/cxyXew/LA
	0h2aysmxw/CbLQe3HopKjwgFGYso333p19ZjQ+2pQxAyvGEE/yScr7d7hu8HrkoR1A+Q5l60xAP
	bZYyIbhI30B2mlo/C00R7qe2kgI7PQzo8TgYiXspOUrh3PW+UcVGGH+er308wsWxS5Blo6vQuPB
	Y0JaWfKqed7+DpMqAGXej4GDeEv+jcXoqsCb5QSv3xbq80Lal8AwU2tVQkTkVc3/xQ+JvDV68Tm
	wXG7YHXe1bp2KcRuKCwttxcA+FJbNaBAWzQV5jgmdRdSyyoM/pJYy0zTJUC0+KO8tOPnU3RGfLt
	1TfPBMeCsehRkDqdqCDRv552L6i7xO14V4AslybmXNR6xi1TB3omlsmxSfFAJngayMPXndH34Pg
	c7wzxPR75hj1lWPoCv7n0e+tTn+8Pkgw4Agaa28bK763mmlf8MY9l9eVei4gVPIr3UoiBgtg==
X-Received: by 2002:a05:6512:3c96:b0:59e:479:17d9 with SMTP id 2adb3069b0e04-59e16424c41mr3974297e87.38.1770060511723;
        Mon, 02 Feb 2026 11:28:31 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe? ([2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c44c32sm31745961fa.1.2026.02.02.11.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:28:31 -0800 (PST)
Message-ID: <d63a6d27-14a1-4064-b5b2-e144beeb0827@gmail.com>
Date: Mon, 2 Feb 2026 22:28:29 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from
 utmi_wait_register
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202080526.23487-1-clamor95@gmail.com>
 <20260202080526.23487-3-clamor95@gmail.com>
 <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
 <CAPVz0n0giLnk6caoZFHZS52XCfA_CN1BqKjSQQGnbHBdHGikiw@mail.gmail.com>
 <aabfe8bb-cd04-43f4-b0e5-07aca86c3ae0@gmail.com>
Content-Language: en-US
In-Reply-To: <aabfe8bb-cd04-43f4-b0e5-07aca86c3ae0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33014-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,nvidia.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 123E1D0892
X-Rspamd-Action: no action

On 2/2/26 9:01 PM, Sergey Shtylyov wrote:
[...]

>>>> Return exact error value from utmi_wait_register during HSIC power on.
>>>>
>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>> ---
>>>>  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>>>> index 3a7a74f01d1c..6173b240c3ea 100644
>>>> --- a/drivers/usb/phy/phy-tegra-usb.c
>>>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>>>> @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>>>>       struct tegra_utmip_config *config = phy->config;
>>>>       void __iomem *base = phy->regs;
>>>>       u32 val;
>>>> +     int err = 0;
>>>
>>>    This initialization seems pointless -- the newly added variable gets overwritten
>>> by you later...
>>>

[...]

>    I'm pretty sure gcc will drop this initialization when generating the object
> code and (what's worse)

   Well, that's actually the good news. I've tried to feed an analogous code to
gcc and clang -- and both seemed to drop the initialization.  I was not able to
make them complain using C=1 and C=2 with make...

> the static analyzers will trip on this code telling you
> that the value 0 is unused...

   Svace (that we have to use here) surely bitches about that. :-)

[...]

MBR, Sergey


