Return-Path: <linux-usb+bounces-30158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE1C3BE9E
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 15:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EA284FDEE8
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA863431EC;
	Thu,  6 Nov 2025 14:54:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6133C52A
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440858; cv=none; b=pc75q7rLCXdPKyRVEmD23rM74m6B/Ugd3hHyjOWWibP7fetkzPkTpvvoOfyh3N+i8spaFbltZvKD8xEaud7GtiavQ6oOXKqCJol1opJ86ylbh5VHLeI34wWZMS/RdcBzvLiEJYEFJhodS9Wcpzq4N/BmyKGKnJWI2adm6Iq+5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440858; c=relaxed/simple;
	bh=r79Q+HCPKXd52mcnj87kTRiQrunxhy1UKBzOf00q5GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8gWBeNFiA7JK4g8P6VcjJQufLg5T2Wn0XoRjXSVZ79bg2sVgWiIu6rHX+77bURIKRxmtvYFjIBPY2c2Me8yM1ybpn4fOyoO16j6kvbXBeWMnHwY15m80UvvtGqnDav64khe2C6uUUAbzXsp77WcWPA785QDN78wqaMlm/8lhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d758dba570so473236137.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440855; x=1763045655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFPkOy62CsvEABPT5ZNROGLn2vMQp9hQ8wMPm7mPqLo=;
        b=Gi8uZubE93+up4sJ6VDSMCW4GmDylUSsFZ/8K5OS5mHaaFbCTcA7NwFXYmnMkpgRTC
         wb/biOvpt2iSSs8Rxrx0hfyl0ZroHb8RkpkOlfR6qXaafc6hOxjJIe8BKrEY5ifDSHLm
         YfezaniDyGekh8q3+gtdMiPNjysIdz/qTCmHcw1vPTTMt/24IOB0+/6I8/ReQAiwbZUw
         2lv7Vh5Hus5lgizG/7EKY3S5IPnJ4CCH6w7HlUilGdyCMQGEAXbQUxA4xPZmxefZ9uou
         gIJa18tXEVGbOxjLcPNlkZmRyKUEH7ub5YZ6Ox7RVNJ1jKpnOUHKRI7QXwboAfcze4qy
         hiyw==
X-Forwarded-Encrypted: i=1; AJvYcCXhe0cdtdAFYLuPaR0a+HekHEcCQbg2/0JduU3bVxSiA7Rc0ai1exsEVwiLjxOMeA1AhbHOLc1x84I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7PrTuYzueMqPvsNVyz3j19y80ErZyTiWQi0S4lQVT6TEjr8/2
	F8rJFeOkK/ZPFlSVpim166/zgaTTN22LWA6nhuVum0k7b1TvBcSqLPI+Zj4NuLR5TCY=
X-Gm-Gg: ASbGncsbpsepOWUl9SHgho3h3dgZTtF9PEbmYxi4gPELmJ8oyAwybVWtGGAJx0LiWFS
	mk3q+g1mXoK/fSdalF5ffwHnacLiyuX1TSC1FLuAmjeclMGO2anMYo5LGWRAlYPgPmNXhR7Q8SW
	HCx0CoSEZHLnbFhKo10wAKGjoL4ttVbA1MY+Id2OUTk5/XhoaG+RJAa2piGj5bfukWH53Jt65UH
	+qamSHS5A9myAlRIWZmb6MoitqhGHeD14nchuR2E5hbPl8v3E1u+4Jq1EiFNsK5vE3iW95zam9h
	X81iEKJH3QhyqCcr3cKyjTr47qpv9HtUGtGQtaBodwUF7r5g5S/Hex81xcVV7GWi+cNkqDO7AzJ
	hkWz6u5iOUBj5qntoa+Tr3qvQF67TR0hyXs18/HumCiFnkRq971QkAD7CidHjSdw4r8kyVNZ+a5
	21f7coDOMK65w/r2yr+tUyzp0LULxm1YeBuF4sDjDBdagI2+MN
X-Google-Smtp-Source: AGHT+IGUsunkvl4yh4r1zhiTqPz+zl/dyJPXFeI69Ham2ji+S08BivREn9N8CCuCBikMJ4rchZJnRQ==
X-Received: by 2002:a05:6102:3911:b0:5db:e3ae:3e57 with SMTP id ada2fe7eead31-5dd892b99b7mr2229580137.45.1762440855166;
        Thu, 06 Nov 2025 06:54:15 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937087f5716sm1149605241.3.2025.11.06.06.54.13
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:54:14 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89019079fbeso320037241.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:54:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/KQR8NMti91xmo6LQszMhFz4FrF/xtPA9X03ehXvidjMYPfjRF3wen1qxDgkLPMn5t4ODdqmh6B0=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:535:2f14:ea5e with SMTP id
 ada2fe7eead31-5dd88ef0717mr2314262137.8.1762440853361; Thu, 06 Nov 2025
 06:54:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com> <20251106143625.3050119-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251106143625.3050119-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:54:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrYRqLf20z7wR7KfL870j4HigCU6BQ5_Of7-sEszfrMQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnu0EVBs5ig8TaeiRn2O9F3MIOheFSe3K7OvivAK8VjmRCtCrf57Jo2kRQ
Message-ID: <CAMuHMdWrYRqLf20z7wR7KfL870j4HigCU6BQ5_Of7-sEszfrMQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: host: ohci-platform: Call reset assert/deassert
 on suspend/resume
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, 
	p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, kuninori.morimoto.gx@renesas.com, 
	geert+renesas@glider.be, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
> of the SoC components is turned off, including the USB blocks. On the
> resume path, the reset signal must be de-asserted before applying any
> settings to the USB registers. To handle this properly, call
> reset_control_assert() and reset_control_deassert() during suspend and
> resume, respectively.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/usb/host/ohci-platform.c
> +++ b/drivers/usb/host/ohci-platform.c
> @@ -280,6 +281,14 @@ static int ohci_platform_suspend(struct device *dev)
>         if (pdata->power_suspend)
>                 pdata->power_suspend(pdev);
>
> +       ret = reset_control_assert(priv->resets);
> +       if (ret) {
> +               if (pdata->power_on)
> +                       pdata->power_on(pdev);
> +
> +               ohci_resume(hcd, false);

Same comment as previous patch: if the reset_control_assert() failed,
what are the chances that the device will actually work after trying
to bring it up again?

> +       }
> +
>         return ret;
>  }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

