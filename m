Return-Path: <linux-usb+bounces-20832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4CA3C4BB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 17:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E026C1882E4D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 16:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBD21FE443;
	Wed, 19 Feb 2025 16:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BH/R74WP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2851F584D
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 16:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981858; cv=none; b=BLXxOYL4iqNVU+fabQ2EPxVBkokeNWaV+Pg4qLNyeM27CaIkwvRedH/xgmKR1t/rGJStdzE0sKCuRugtjdxNL2c6kNeg82c6zOXEhido0ai1IdV8w0En/5f63heaqBFV5LNV0SoulMrMnM0WyOsEbv9Caq8d+XZyj31ZgRC/O2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981858; c=relaxed/simple;
	bh=ceLVZIQiEmcQitphSISYjez4ESWwsr0B6WSI8k4wTLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVX7rIKE7ZARBJ9GFb/NBrKuejLwK+5q12AeJp/zjWr02Up6+mOoCZ798scq9g4CNjtWFtMj8l2olvqBOBbWsLLT7MtHrrTviNA5PuW4XFSLRJP6+5AtwoLKBiyc6rnDSL5vkKpv6nNHIEaU81fre7K1KwQXST74hvW7KmdSu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BH/R74WP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb999658fbso429846666b.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981855; x=1740586655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HejSJgJQcfFFAzTEJQMkHvtlK7Scumc9KiDgQ1jWL0c=;
        b=BH/R74WPzt/8LYuGelhyLub63/d3Ert9KHNdGwjutcpyNYwDxKjr531dgFjymRhN64
         GHX9koymmfOEvIE7sS709/rhGRrd/WnHqtr3ZagPXwLzwndxVmU4OufskSAw6orkoOLU
         UgFjeoMenY0WKYvytrefwNIRSFnQ9IBz7DUT7xb3z0mjocPCIdld0lMRKzYJB6kJoDLW
         mDnburCLMy9F4jDBbFVgJQDaYsVUH0n0uVJSlvERHsi3zMURpv6l4as+B7jljDhOPq9h
         L9+VbWe+OVOWAKEx0yx9SS+WJg4CevhftOXS/nSF5uaDmS2o4X4H6io9g0inYa/fe7wY
         twLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981855; x=1740586655;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HejSJgJQcfFFAzTEJQMkHvtlK7Scumc9KiDgQ1jWL0c=;
        b=O0s9xvKKT80uAA605QcUVYGS12Ohzk0gH0XwYS2MdsHlr7owm1GGCQ3BlzLKuPPUT3
         v/etTukUz/Qdck2h/brZxi67AXHdcM2Ccy7yebiELZR/A6fBjL5SiE2AMZ307npzf1jS
         hXR2zV6Wh1/yErFP1DMx6j7AgYr1r+RwLAJv+yZU7Jlj7D1CItGlQU02gTos3z5PSuma
         3Ai5PBI/RetrRS+1ltoQGkYFV30dzvmBu8nySbcjqDEQ7nN/I12DPHuvmJEg72D3KC2X
         DTEkUfWLfL/ePgUHO4RmmlwGjNp6WiOMUHIdIPI5SnOwVDbD9/AZLGv4ZwkG0ZrCQMwj
         32sg==
X-Gm-Message-State: AOJu0Yzw4TxYBXkiI+32DYC1xLeMXtCSntPJIGzg00cISOD1hlId6iHd
	vD1kjtBRcopr9qjyT8RTjntvYKDx251m0qhHVht606QKWzuk4YENy+h9ROQDjNs=
X-Gm-Gg: ASbGnctryGhSwJytdljOptVvm/TUP3K5JzpSZAFrXNn7Z3dUJkNAS7m5JnpzsQuFgVb
	8llAx/iACGHVySfIy7LQbRcyxekSDm8ciGhd3OO8zFQlmu2ctI4hY4JlXX8fDywsgpt0f5W5Tkx
	7PSOrtr29Z3aHJ50M6sYgh2m1mrUbLORTnCYlg08K2WuKI9u8U40JjjwXdvbbddnPR8cnxvstmi
	l5OWM+T9geXRZHc/397xFq/y2yYuTLEoXS7a5v8JAI+/GBPevIUaAxx+D3ROznjybqwWe4JAubA
	kVPrldzqeYg2TqBIcIG7Sb0=
X-Google-Smtp-Source: AGHT+IGfUVTc8q0ff+aqRcU4u7qX8iIkWfV/1/hphxf4aJV7O0tPiAEGukjDGHF4YsVK3fbVAZBivA==
X-Received: by 2002:a05:6402:2347:b0:5e0:8c55:50d with SMTP id 4fb4d7f45d1cf-5e08c5514bbmr7648059a12.14.1739981854600;
        Wed, 19 Feb 2025 08:17:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb96fa4d79sm652128066b.126.2025.02.19.08.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 08:17:34 -0800 (PST)
Message-ID: <4a7c7a87-b293-4522-961b-d6a45f12542b@tuxon.dev>
Date: Wed, 19 Feb 2025 18:17:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/3] usb: renesas_usbhs: Fixes for renesas_usbhs
To: gregkh@linuxfoundation.org, biju.das.jz@bp.renesas.com,
 geert+renesas@glider.be, yoshihiro.shimoda.uh@renesas.com,
 laurent.pinchart@ideasonboard.com, phil.edworthy@renesas.com, balbi@ti.com,
 kuninori.morimoto.gx@renesas.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Adding reference to the missing series (see below).


On 19.02.2025 18:12, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series add fixes for the Renesas USBHS driver identified while
> working on the Renesas USB PHY driver (series at [1]).
> 
> Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
> unbind/bind and data transfer tests before/after the unbind/bind.
> 
> The unbind/bind was also tested on the devices with the following
> device trees but w/o checking the data transfer (as I only had
> remote access w/o USB devices connected):
> - r8a7742-iwg21d-q7.dts
> - r8a7743-iwg20d-q7.dts
> - r8a7744-iwg20d-q7.dts
> - r8a7745-iwg22d-sodimm.dts
> - r8a77470-iwg23s-sbc.dts
> - r8a774a1-hihope-rzg2m-ex.dts
> - r8a774b1-hihope-rzg2n-ex.dts
> - r8a774e1-hihope-rzg2h-ex.dts
> - r9a07g043u11-smarc.dts
> - r9a07g044c2-smarc.dts
> - r9a07g044l2-smarc.dts
> - r9a07g054l2-smarc.dts
> - r9a07g043f01-smarc.dts
> 
> Please give it a try also on your devices with [1] on top as well.

[1]
https://lore.kernel.org/all/20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com

> 
> Thank you,
> Claudiu Beznea
> 
> Claudiu Beznea (3):
>   usb: renesas_usbhs: Call clk_put()
>   usb: renesas_usbhs: Use devm_usb_get_phy()
>   usb: renesas_usbhs: Flush the notify_hotplug_work
> 
>  drivers/usb/renesas_usbhs/common.c     | 6 +++++-
>  drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 


