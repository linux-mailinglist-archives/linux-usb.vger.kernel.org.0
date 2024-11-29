Return-Path: <linux-usb+bounces-17960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C6D9DC137
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 10:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DF5281DF4
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BCA17BEB8;
	Fri, 29 Nov 2024 09:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fFkN5daD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E1178388
	for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2024 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732871574; cv=none; b=mtx2AobJK3HLehEfGeKW08uFZlN65njmYzif1GuJCogpCMI8F0mtMVyWZhV3QB8RzWY2w6D5NlhEI4G3j8PLXWJBwywjPwLgX48QLtQ5mjd4OnnFb11JSsN7CaVJzTImwMkEldTyMy5dIvQE89fobqOMGONGMILkh4p2pwOShwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732871574; c=relaxed/simple;
	bh=1bnVnZ6g/RMKpFN6pROmGByLVFcvNA8/ZgUKEpHMa2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faZl/ZJ1oxHaD0306aU0GtHedgs6GM3BepPmvH0jId3cdbp400L6A138UDyTO6VRktPiz3SdIYP+xzglAHBVIkWb7GJ6mtCxMVi4No3w+5/9MWZnAbxrQzMHIWNtzHRS4n5adGBvqhyh3MjCDOIl1iGyjqEm8jWSpkOSu/Zd2Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fFkN5daD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434aabd688fso9950535e9.3
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2024 01:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732871571; x=1733476371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sb8gO4uA+vo8kcJyPPhqX5i7haSv+q2JYHt3gAOv4Y0=;
        b=fFkN5daDx5C4IP+M2K9BheZExYOitRDImSD4IClty7KWVw6kGsNlBLBHmbFgRxZiuq
         lweIquyLSvl5YEt0Yn6J3MzsPMlYzothNseGTvwsxjS047fQ509z2gjZt71+/KA+c0hq
         UWkI5C98RxUSzkZTTEkLft223TIdESlYec/5KumR+fEKSo5zSnMsdpCvHihgmzLh+Eds
         em1M+nHzBCS1fWst4ueC7R4gX/BdxlWRHANeGgBKUj3HAxc6XdhiFi2BqxtRcOTbrQXv
         MgSjx3zFg1W5Hpby6+XL0KpqtZt7LMG+9djo6OukFi3NqaXL5hgcgD9ktYQQSQDKhVaD
         b0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871571; x=1733476371;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sb8gO4uA+vo8kcJyPPhqX5i7haSv+q2JYHt3gAOv4Y0=;
        b=GP/qw9VaacK3HPVZqs3Db/QfG+pVO4LC4sxA7Pn5zRj3QvzpU9/epw56Jks66Bj7d0
         Z5sy+k2ShfAkiDRtvfoJBOWe3Qk2kDydEApKQRqqxpDqt/VRORn+4QX2ggRxeay5xs37
         C0+8l5VQgJNXgZpbFvtg3OFlDYpy7ZLvptvx7tOdFtPO9zt4VRbNW2LtwT1TvAUeQblo
         dtZ//4bH8uut9z8R+5oXBU7ZhurbwFuu8NTPqN+ltihuamQP5TBSJhZfFNgNL7d1n5Y6
         /eIQAInTLWSWhekCyXRgcHDK3vrnj4rz8kQSgvJZFQc9qnghPAJmMmEQdfCzOZeHSAs+
         Nnig==
X-Forwarded-Encrypted: i=1; AJvYcCV8b9WYl1NC+OYJhHSa1TUzBmt2ExsNMcptgXaJP1p3DJep/4kx2zOnaO4vm+ItididFruQNo4xt4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KilZ52jYJOXxBOA35olf4aQPvM3H/9UfYhpe+jPcdq8U3s5N
	InjtCq8FfJUc6dFvWNhnZ1z6XJBgDYL7R4ztQYVOMBWxtd4pvFV9cPMwjG0TqaE=
X-Gm-Gg: ASbGncs/iAqlFPKyjErSdoHnkYjnGqYQXMoE7U0a6Rq7Sio7k5W8JUvBgvE+5+rBVUv
	6pMcwQKsurgm20EZMMJxoGHHnpNu4TUD0d7+ArIJ7lrNqJ5a6tAg4prEOSrLRD4o2gF3quKNquF
	GhBNywEASdjbCjGm8e1Q6/s/FWciZ8dJ52JpRczS9p1PzhISowoWfhlS0O6KKoAEvt7HmkZiiwS
	oLr86BXQzYiN3/9yCTHYROf6Obb3r23bjxVEJXijWM6ar9KEc++szT+8g==
X-Google-Smtp-Source: AGHT+IHmwDZAWFKDepsiDLw8yd17aIS/lp5WnEmXUs3bmN9CBmiHsuGbPOMSIZoIaRXxGX02f7LuEg==
X-Received: by 2002:a05:600c:3b1a:b0:434:a968:89b5 with SMTP id 5b1f17b1804b1-434a9dc35f7mr102361905e9.9.1732871571093;
        Fri, 29 Nov 2024 01:12:51 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36a02sm3890362f8f.37.2024.11.29.01.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 01:12:50 -0800 (PST)
Message-ID: <4d2a4d8b-9951-4454-b662-0a14d73e61a0@tuxon.dev>
Date: Fri, 29 Nov 2024 11:12:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ
 family
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com,
 gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com,
 christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUvmTQeQXxhsXtj23-OS=aL3UgsyOtnawdmnusrEJ2JQw@mail.gmail.com>
 <32fa7eb8-2139-454c-8866-cb264d060616@tuxon.dev>
 <CAMuHMdXPQnCPjKRxoSceYabWPHF9Z_A7qVN85yaUZjPG7-o7tg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXPQnCPjKRxoSceYabWPHF9Z_A7qVN85yaUZjPG7-o7tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 29.11.2024 10:54, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Nov 29, 2024 at 9:48 AM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 28.11.2024 17:24, Geert Uytterhoeven wrote:
>>> On Tue, Nov 26, 2024 at 10:21 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The RZ/G3S system controller (SYSC) has various registers that control
>>>> signals specific to individual IPs. IP drivers must control these signals
>>>> at different configuration phases.
>>>>
>>>> Add SYSC driver that allows individual SYSC consumers to control these
>>>> signals. The SYSC driver exports a syscon regmap enabling IP drivers to
>>>> use a specific SYSC offset and mask from the device tree, which can then be
>>>> accessed through regmap_update_bits().
>>>>
>>>> Currently, the SYSC driver provides control to the USB PWRRDY signal, which
>>>> is routed to the USB PHY. This signal needs to be managed before or after
>>>> powering the USB PHY off or on.
>>>>
>>>> Other SYSC signals candidates (as exposed in the the hardware manual of the
>>>>
>>>> * PCIe:
>>>> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
>>>> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>>>>   register
>>>> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>>>>
>>>> * SPI:
>>>> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>>>>   register
>>>>
>>>> * I2C/I3C:
>>>> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>>>>   (x=0..3)
>>>> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>>>>
>>>> * Ethernet:
>>>> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>>>>   registers (x=0..1)
>>>>
>>>> As different Renesas RZ SoC shares most of the SYSC functionalities
>>>> available on the RZ/G3S SoC, the driver if formed of a SYSC core
>>>> part and a SoC specific part allowing individual SYSC SoC to provide
>>>> functionalities to the SYSC core.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>>> --- /dev/null
>>>> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
>>>> @@ -0,0 +1,31 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * RZ/G3S System controller driver
>>>> + *
>>>> + * Copyright (C) 2024 Renesas Electronics Corp.
>>>> + */
>>>> +
>>>> +#include <linux/array_size.h>
>>>> +#include <linux/bits.h>
>>>> +#include <linux/init.h>
>>>> +
>>>> +#include "rz-sysc.h"
>>>> +
>>>> +#define SYS_USB_PWRRDY         0xd70
>>>> +#define SYS_USB_PWRRDY_PWRRDY_N        BIT(0)
>>>> +#define SYS_MAX_REG            0xe20
>>>> +
>>>> +static const struct rz_sysc_signal_init_data rzg3s_sysc_signals_init_data[] __initconst = {
>>>
>>> This is marked __initconst...
>>>
>>>> +       {
>>>> +               .name = "usb-pwrrdy",
>>>> +               .offset = SYS_USB_PWRRDY,
>>>> +               .mask = SYS_USB_PWRRDY_PWRRDY_N,
>>>> +               .refcnt_incr_val = 0
>>>> +       }
>>>> +};
>>>> +
>>>> +const struct rz_sysc_init_data rzg3s_sysc_init_data = {
>>>
>>> ... but this is not __init, causing a section mismatch.
>>
>> Do you know if there is a way to detect this?
> 
> The kernel should tell you during the build...

I'll look carefully, I haven't noticed it. Thank you!

> 
>>
>>>
>>>> +       .signals_init_data = rzg3s_sysc_signals_init_data,
>>>> +       .num_signals = ARRAY_SIZE(rzg3s_sysc_signals_init_data),
>>>> +       .max_register_offset = SYS_MAX_REG,
>>>> +};
>>>
>>>> --- /dev/null
>>>> +++ b/drivers/soc/renesas/rz-sysc.c
>>>
>>>> +/**
>>>> + * struct rz_sysc - RZ SYSC private data structure
>>>> + * @base: SYSC base address
>>>> + * @dev: SYSC device pointer
>>>> + * @signals: SYSC signals
>>>> + * @num_signals: number of SYSC signals
>>>> + */
>>>> +struct rz_sysc {
>>>> +       void __iomem *base;
>>>> +       struct device *dev;
>>>> +       struct rz_sysc_signal *signals;
>>>> +       u8 num_signals;
>>>
>>> You could change signals to a flexible array at the end, tag it with
>>> __counted_by(num_signals), and allocate space for both struct rz_sysc
>>> and the signals array using struct_size(), reducing the number of
>>> allocations.
>>
>> I'll look into this.
> 
>>>> --- /dev/null
>>>> +++ b/drivers/soc/renesas/rz-sysc.h
>>>> @@ -0,0 +1,52 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Renesas RZ System Controller
>>>> + *
>>>> + * Copyright (C) 2024 Renesas Electronics Corp.
>>>> + */
>>>> +
>>>> +#ifndef __SOC_RENESAS_RZ_SYSC_H__
>>>> +#define __SOC_RENESAS_RZ_SYSC_H__
>>>> +
>>>> +#include <linux/refcount.h>
>>>> +#include <linux/types.h>
>>>> +
>>>> +/**
>>>> + * struct rz_sysc_signal_init_data - RZ SYSC signals init data
>>>> + * @name: signal name
>>>> + * @offset: register offset controling this signal
>>>> + * @mask: bitmask in register specific to this signal
>>>> + * @refcnt_incr_val: increment refcnt when setting this value
>>>> + */
>>>> +struct rz_sysc_signal_init_data {
>>>> +       const char *name;
>>>> +       u32 offset;
>>>> +       u32 mask;
>>>> +       u32 refcnt_incr_val;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct rz_sysc_signal - RZ SYSC signals
>>>> + * @init_data: signals initialization data
>>>> + * @refcnt: reference counter
>>>> + */
>>>> +struct rz_sysc_signal {
>>>> +       const struct rz_sysc_signal_init_data *init_data;
>>>
>>> Can't you just embed struct rz_sysc_signal_init_data?
>>
>> Meaning to have directly the members of struct rz_sysc_signal_init_data
>> here or to drop the const qualifier along with __initconst on
>> rzg3s_sysc_signals_init_data[]  and re-use the platfom data w/o allocate
>> new memory?
> 
> I mean
> 
>     struct rz_sysc_signal {
>           struct rz_sysc_signal_init_data init_data;
>           ...
>     };
> 
> Currently you allocate rz_sysc_signal_init_data separately.
> When embedded, it will be part of rz_sysc, cfr. above.

Ah, your right. I initially had this as a pointer and re-used the init data
(rzg3s_sysc_signals_init_data[], w/o having __initconst qualifier for it).
I dropped that approach but missed to drop the pointer here.

Thank you,
Claudiu

> 
>>> That way you could allocate the rz_sysc_signal and
>>> rz_sysc_signal_init_data structures in a single allocation.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

