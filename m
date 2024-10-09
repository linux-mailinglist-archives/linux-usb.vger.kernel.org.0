Return-Path: <linux-usb+bounces-15905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D4D9962F0
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492E3283502
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 08:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC8218B465;
	Wed,  9 Oct 2024 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="q7ymvLdY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B5918B471
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462682; cv=none; b=PQS/LDv5O32LycEtrJ0l3g03QNY+iSAJlEjwCbT2+ND3fD0PskEujfZ4NukmxsrVUDYAXxEsIDaUQUPX164LwEe7s4rz0nYDGxuPKhyFiBuZhzMotqmJkBQDV3uCkcF805Hr8+YuaDrQtXHu1lcCIrNFb5/cZtwbDkOQ4ar761A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462682; c=relaxed/simple;
	bh=tHh+8iRxabcjy7f2g9Qi9EomfTANr7JqKHvbEx5+UI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z97rQLxu7QrS9DI+hmt+MH3HO7Zk2YTmdJ+HDsKnlmWLvM82FuPUpm40tp9O2uBtXOTKexhZfhsR6CDiPFwtNP88vxChj0tLhw8xBlg5HhLGACiR+8e2u8DyXq1I00Qx3R+EjcEZUXA9ZZXfwIPfhwQKtmOk4yxkl3A8XMSuY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=q7ymvLdY; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so7463867e87.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728462678; x=1729067478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaO6OZB9LNJ3CfL5hJwIDOwEl1I05oLk0c+YGhPFN5E=;
        b=q7ymvLdYOiKOfW6utcEO5U4mvI9ozvNh29DIKVE8LFgQ9pfdX/EO3rf+Q3TQt2ZgXC
         mvBcjvZM+rAAykYj2oD9lDlHtmauvKFFOQZG1pL7RwppWlTH0Bzh1wI2020X2uy0vCc9
         jHVLjQYiJhgsiPjn/K39ChgGXud6nzzVWqRQ3mDMZpd290qoJ8cI2X6aM3/9gTnCzTaI
         fvLe0L+zykhT/rd1/kdM/0P2gGmf0p4wRvrp4ATP8VOhb4n9p1uqMcssDXGVjJGOmKHt
         u7S0tvAqk5UQQF4UQ9o6NspzYgi6Hf4hx6eTRlM0Y8mpULW2uUGqdoBPBGucwL/SLi5q
         hOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462678; x=1729067478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaO6OZB9LNJ3CfL5hJwIDOwEl1I05oLk0c+YGhPFN5E=;
        b=K384mMqUiFK0pk5t63DlBhj37EJj++reh3ru3e3OMO/Kktm2LQ2sc2K2/8ttl+hvOW
         fkAxo9dGm2MyjovH9SNzgDIPPoPSgS00SS++jmtrXuRPTncni/EK8upvwQtUj/nTJg3Z
         aUvSxrhaY17WLYiTKfFQYSQJtvLqDI9wL3dkN30ekmOcfyqpT2NzDtel3sFoxbTye69v
         g/hCVeY/opRMWHC/wv4ptrgVuite9qGw/zYyhYKAuWOEfSzdEcjZcnyEO8Pi1gK0a+ni
         de9lbhrZfPZiZtNAlV0RkcNxjWzYxBUlFrWuxpkBOLcXj++BWDOPeJtaOzGT4kD3OsJP
         dtkw==
X-Forwarded-Encrypted: i=1; AJvYcCXpP06aTlMSpevXG9QHdImD6aKWQVEGmDGhiaBjtYHVnl3A+Sg1IDMbkue5TBAE83xOodhnwQqyvOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8GSgqPoyxsIx6erT3AdJ9VTXslxcIMYMEO4NrfT1zzED9lCH
	6rwudlVRIbeWkLn0NtyWhRBGp+qNxOoOTWLZiZdJL6SDjO5p4pIvuFzs4uHFOyw=
X-Google-Smtp-Source: AGHT+IF3Q2wQGloa2V2XDPn7TmJqK0nuOUzhIW/QGvZ0irAUv57avGXp68LqGJgfaKW8c/fHZTF7TA==
X-Received: by 2002:a05:6512:68f:b0:539:9f52:9e6 with SMTP id 2adb3069b0e04-539c49728d1mr835853e87.54.1728462677850;
        Wed, 09 Oct 2024 01:31:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e664fb9sm627251866b.88.2024.10.09.01.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:31:17 -0700 (PDT)
Message-ID: <229582da-270d-4188-a202-50e41493c7cb@tuxon.dev>
Date: Wed, 9 Oct 2024 11:31:15 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] phy: renesas: rcar-gen3-usb2: Add support to
 initialize the bus
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, gregkh@linuxfoundation.org, mturquette@baylibre.com,
 sboyd@kernel.org, yoshihiro.shimoda.uh@renesas.com,
 biju.das.jz@bp.renesas.com, ulf.hansson@linaro.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <20240822152801.602318-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX1b5ZZaO+G1h=E8uv+WV7oS8xg8Hx=_+uORO7Qu33eNw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX1b5ZZaO+G1h=E8uv+WV7oS8xg8Hx=_+uORO7Qu33eNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 08.10.2024 17:57, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Aug 22, 2024 at 5:28 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S need to initialize the USB BUS before transferring data
>> due to hardware limitation. As the register that need to be touched for
>> this is in the address space of the USB PHY, and the UBS PHY need to be
>> initialized before any other USB drivers handling data transfer, add
>> support to initialize the USB BUS.
>>
>> As the USB PHY is probed before any other USB drivers that enables
>> clocks and de-assert the reset signals and the BUS initialization is done
>> in the probe phase, we need to add code to de-assert reset signal and
>> runtime resume the device (which enables its clocks) before accessing
>> the registers.
>>
>> As the reset signals are not required by the USB PHY driver for the other
>> USB PHY hardware variants, the reset signals and runtime PM was handled
>> only in the function that initialize the USB BUS.
>>
>> The PHY initialization was done right after runtime PM enable to have
>> all in place when the PHYs are registered.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch, which is now commit 4eae16375357a2a7 ("phy:
> renesas: rcar-gen3-usb2: Add support to initialize the bus") in
> v6.12-rc1.
> 
>> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> @@ -650,6 +658,35 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
>>         return candidate;
>>  }
>>
>> +static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
>> +{
>> +       struct device *dev = channel->dev;
>> +       int ret;
>> +       u32 val;
>> +
>> +       channel->rstc = devm_reset_control_array_get_shared(dev);
>> +       if (IS_ERR(channel->rstc))
>> +               return PTR_ERR(channel->rstc);
>> +
>> +       ret = pm_runtime_resume_and_get(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = reset_control_deassert(channel->rstc);
>> +       if (ret)
>> +               goto rpm_put;
>> +
>> +       val = readl(channel->base + USB2_AHB_BUS_CTR);
>> +       val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
>> +       val |= USB2_AHB_BUS_CTR_MBL_INCR4;
>> +       writel(val, channel->base + USB2_AHB_BUS_CTR);
>> +
>> +rpm_put:
>> +       pm_runtime_put(dev);
>> +
>> +       return ret;
>> +}
>> +
>>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>  {
>>         const struct rcar_gen3_phy_drv_data *phy_data;
>> @@ -703,6 +740,15 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>                 goto error;
>>         }
>>
>> +       platform_set_drvdata(pdev, channel);
>> +       channel->dev = dev;
> 
> Unrelated change?

That's a leftover from the removal of the suspend to RAM support from the
initial work (internal only) of this series. I'll keep it in mid to remove
it on the following patches, if needed.

> 
>> +
>> +       if (phy_data->init_bus) {
>> +               ret = rcar_gen3_phy_usb2_init_bus(channel);
>> +               if (ret)
>> +                       goto error;
>> +       }
>> +
>>         channel->soc_no_adp_ctrl = phy_data->no_adp_ctrl;
>>         if (phy_data->no_adp_ctrl)
>>                 channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
>> @@ -733,9 +779,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>>                 channel->vbus = NULL;
>>         }
>>
>> -       platform_set_drvdata(pdev, channel);
>> -       channel->dev = dev;
>> -
>>         provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
>>         if (IS_ERR(provider)) {
>>                 dev_err(dev, "Failed to register PHY provider\n");
> 
> The reset is not asserted in the error path, only in .remove().
> 
> Oh, Christophe already sent a fix for that...
> "[PATCH v3] phy: renesas: rcar-gen3-usb2: Fix an error handling path
> in rcar_gen3_phy_usb2_probe()"
> https://lore.kernel.org/all/290b25827e3f0742808940719455ff0c5cb9d01d.1726329925.git.christophe.jaillet@wanadoo.fr

Yes, I messed this when removing the suspend to RAM from my initial work on
this (internal only). Thanks Christophe for handling it.

Thank you,
Claudiu Beznea

> 
>> @@ -762,6 +805,7 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
>>         if (channel->is_otg_channel)
>>                 device_remove_file(&pdev->dev, &dev_attr_role);
>>
>> +       reset_control_assert(channel->rstc);
>>         pm_runtime_disable(&pdev->dev);
>>  };
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

