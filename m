Return-Path: <linux-usb+bounces-14483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D512F968501
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 12:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606151F207C6
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 10:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C886183CA4;
	Mon,  2 Sep 2024 10:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="S8TbJHrg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3E1E51D
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273648; cv=none; b=QFZ/6ZyEfi4SRnFX6ZBd4kjDVpAfxwi+SPm9h7Koxv/p37slPA7jNte5rtNYEKM4+l97sYsWT/+Exb65m3nDJX5fF+itsBV5qw4OSBuuDoLEPpSVvd6A7l7f6XYeAWx6jdoymoYooSoPNW1muOXWreYV6JMYwGw0aRzr7ReW9YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273648; c=relaxed/simple;
	bh=47vSY6vmvmkSDuROpFda+zITfrN4O5qGLeQeAbPCJDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxswLb8iUUrNmyx/NevZjYebO02Br77MyTfzIE+BF0M4VhFgax5qfi/CaXfa22Aynazj0+EbzaYDDrRNbRVvQAfyAX6V2hq2fA4bSUPPsRV6iWvKdACVGL9cTt/C7TZkHW342dK7frd4JSRy0tzcQGR7rW/jgUqLLlq9Ds3o6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=S8TbJHrg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso19413915e9.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Sep 2024 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725273645; x=1725878445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWWCgOPtFspoggG7+OMLKZKpBUJ4rokojwECnjcrCcM=;
        b=S8TbJHrgVB1hgt7sk5T7DX6S2wKJCMGSRH4A6SH9BKi/VWQG10s4AWxAGU1qCcb8P/
         UyJkPifkhXpmAELkPch5YHq7z5vME4TTtJYwYfE7jNpVb3UDJpIi70/PxuyYc/OiuOzj
         VoxoKpsIOSIPIUCXJqw/vf+ZGpceT0XMjjvISKGmMoYpm9dc2hqVchPLoHM4vqre5D4t
         uS3htSn3ahEgwAJuBRWKvIyk58MSSnrxC3tL11Yqh7Q0UuQr2Gey4pcbOXc7hM48SEct
         IghOl6iWtNnujWB7kr8S1KHaeUXzNWZh3Z3ZFXP/LQqAA0b48ungsbR7z5+ytn/waima
         PgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273645; x=1725878445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWWCgOPtFspoggG7+OMLKZKpBUJ4rokojwECnjcrCcM=;
        b=D2/mTik0stcfuqA0DXmxHmc5b2tfmSOxPHRRu56Lj6EeeRUd+fTWiylvGIzPCV0I65
         WCxQCuChpjZsHvvM0bTMiqTlHOj0JBeHCcuR+DNfhoxhnqh/ZoQ0lnsLsx9IoCHneOJM
         MNC03vrCyvk/rV7Jq1wt7WIGGNSXwDUM3+jbtxI/htA/fjdDSDas9ubLGeiJ1AIz2WRg
         JU05wEbzliQg37JdmrZNp3oF10laRRyWlWNkK563tCjVZ0sMi6H/WiLosM2ggU4SRFxd
         iUPGklPrACBovShH7GGiLEpTrtyy0iF2AMBLA1QLMF+e2IM2Lf7d4salmiKIjrujB414
         1JCw==
X-Forwarded-Encrypted: i=1; AJvYcCWsA1F+5iwZZAPnOYwcJoXKmz/DXfCP4MCsMgC9v54yLCNoFJLJh8X0YCwfWx3zjWH7hN60lwQgEXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcR4OacQZFjyfn0ZoFjQ0It3r+gpBZErUJq7JGu3gIQ5Ce53v
	cZND70IZhwg+jgkB/WijAWrNwI8lc0U1DExuHkck5hIn26XC/Acf/4VukelYMJg=
X-Google-Smtp-Source: AGHT+IEniJ2zOfbNHplbZjwpzuwiNjNlpRHzMFPmgRBRzmpJXPHJZQY3Y0Tn4zQKdT5Es5pJWppmSw==
X-Received: by 2002:a05:600c:1c18:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-42bb4e9f61bmr76021345e9.17.1725273644573;
        Mon, 02 Sep 2024 03:40:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc127ec5sm105407055e9.19.2024.09.02.03.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:40:44 -0700 (PDT)
Message-ID: <35dc7414-f5bd-4ed4-bfa1-f723f4f0078c@tuxon.dev>
Date: Mon, 2 Sep 2024 13:40:41 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>,
 "kishon@kernel.org" <kishon@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev>
 <TY3PR01MB1134652F9587CFA0ADE851CA486902@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113467275C519B729FCAB1ACB86922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5556d176-cca7-492c-ba21-48256d5d6338@tuxon.dev>
 <TY3PR01MB113464D53083F4C8A5DBBA36586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <590a4fb2-24b2-432b-92db-534c5a52ed0b@tuxon.dev>
 <TY3PR01MB11346505565B81AD2894E035586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346505565B81AD2894E035586922@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02.09.2024 12:18, Biju Das wrote:
>>>>> Do you have any plan to control this power transitions(ALL_ON to AWO and vice versa) in linux?
>>>> As you know, the RZ/G3S USB PM code is already prepared. This is also
>>>> configuring these signals when going to suspend/exiting from resume.
>>>> W/o configuring properly these signals the USB is not working after a suspend/resume cycle.
>>> One option is to handle SYSC USB PWRRDY signal in TF-A, if you plan to handle system transitions
>> there??
>>
>> As I mentioned, the settings in these registers may be changed by intermediary booting applications.
>> Depending on that, Linux need to control it also on probe for USB to work (it should be the same with
>> PCIe, these signals seems similar from HW manual description).
> You mean system transition settings will be override by U-boot, so Linux needs to restore it back??

It was talking about booting...

You proposed to handle SYSC signals from TF-A in a discussion about system
power transitions:

"One option is to handle SYSC USB PWRRDY signal in TF-A,  if you plan to
handle system transitions"

(I was guessing the "system transition" statement there refers to power
states transitions, ALL_ON <-> AWO/VBAT)

and I gave the booting process as a counter example: if we handle it in
TF-A it may not be enough as these signals might be changed by intermediary
booting applications (e.g., U-Boot).

To conclude, there are 3 scenarios I see where these signals need to be
handled:
1/ booting
2/ suspend to RAM
3/ driver unbind/bind

In case of booting: if we have TF-A to set signals there might be
intermediary booting applications (e.g. U-Boot) that set these signals
also. If it leaves it in improper state and Linux wants to use USB then the
USB will not work (if Linux doesn't handle it).

In case of suspend to RAM: as TF-A is the only application in the suspend
to RAM chain, it should work handling it in TF-A.

In case of unbind/bind: currently we don't know if these signals introduces
any kind of power saving so asserting/de-asserting them in Linux may be
useful from this perspective, if any.

Either way, I think Linux should handle all that it can to make the devices
work and not rely on third party applications.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju

