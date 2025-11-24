Return-Path: <linux-usb+bounces-30865-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAFFC80B2A
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 14:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B5A693459C1
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B367B17BEBF;
	Mon, 24 Nov 2025 13:15:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6707F8405C
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763990130; cv=none; b=mJ5n7WhFec2eyvXqKW3BiQcJXMyZ7DrHPIen+fY8La7ejyr5UBSXZNbphAE0+QgyFD1c+eKOo72UEWTxdVPkvBWget/A7PEPpJjz9MkzWU7sEA6t97lYLL9BonKLo3cVnhzpwtQSAJuChCym6N6E+pJBIg15zgr8bcDzTiTnTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763990130; c=relaxed/simple;
	bh=MQGhd/wYEtvBqgNHeSYomI/dq1FlZj0IQ+KSiyBBbYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbdNsrPhjyogzuVfwG9JJLnEnLMO4HCdqGN5ZAnMMEuuCoDabiARnyvSAId2PvLWlY0CDGiKTkdIiJOkWBzh6df0gxetz7SsKH+Bb0KDj6IU7FXw741yY5z6Uf/1p18sYEEx5uuAYvBcPzkLQZVpncFuI8BFqpPyaNIs1ISySwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-559966a86caso1039431e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 05:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763990127; x=1764594927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soCuFW1lK02VvdSOiFkFf8JUU0Wwfd7dxHdww8TkIzg=;
        b=r7pvdiLXr1Te6vmdkBx8tVikc4Ahp7vY1IpIdXoV2lUL31QHGe2yNEJa+oRXcgleTG
         wpuvC8DT37AxUPHtQikCPdhXkwwx5+qNxpbb4vr4pZUC4bb6J4Vb3/1mj3k+GN3Hs+l4
         rXjFRbusq9ovEdPwtpqLRI5yE08RgCta2BkHJqkAkpg4k1ANIEzA9FRTIbNA/1vv2IOO
         wEfvMmkq/uiNbwxLwdd/nTRAQiDTolpUcOXlJ8V9eXsfLSq3XMSj9qJZQfheN4UKAQxo
         wPOrSlfDSGYRQqcAIyJNBk9fK7M/XYjtE310T4tT3jFha0QdZ7Nk3TSKKT9vzzQ/Umfh
         FRfA==
X-Forwarded-Encrypted: i=1; AJvYcCWZIWDnKdqSKQF1h9GcPsPLIUWWqDPBQFlF/sH2TsYVGAv4e9hhkyXukpO7pCe/awo2Fv9Z2abRLww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqmLFPi/TYOkW6J8KY4+cALPOcFSAWpTruGWyZ5289gB6IfGR
	tQwUBrtLdLMgjY0DIGGsYY8nShtOzfJO0xBV2BKdFpud+WQGCMQ5cy0F7ghDEVcI
X-Gm-Gg: ASbGncv5fm+2Ypg85Y2HCfnkt8xsaFKS6dMz+eqJXrr9UjU8oxlAqM2hrOEA51uYR0h
	P/VtzCaqmkxAi2s6BqHeXp+uUGHEQk+76ZH2h05yAWjVUkR39HgZjE1XgHUiBT7JNKQwN2IFqDj
	XnMoTNF1oTXDniUviJq0+HrOV2+knNpoEzPWdMt//EhS/6GToCqnso+169avy4H7S1F23e46Wi/
	N0bXyHWfE2vOHA8hwHsCW0L00Kid8+AiTZf+/jOZ7pdAs5IELOh3hVDuuSqryyPgR30iXrCkwQg
	14hYPKPVBSpd9opfm2hciqWqVVpglcl1qp31exOWjG9Mhe3gYCJ4lFQ2VYwKYR35zyTNAUXr0e0
	nwawdjQy2k2jF4khUzGKUfvYvozzV4YOS+K6WVpJIurtZSaG7/PHeJ2WrFJB6Uj9AF5tbSZObbn
	N5iaMR1JKooJRE72smvRcD53KCYky0s3wjGHeuSPDQWUX0HUes
X-Google-Smtp-Source: AGHT+IFHTu4PpCikDv5g3fqkbvS//nmuX1iz+zH7WobVYa8gz9YRFuJHcDhCQZYmwxy3+Y8MDCEZAg==
X-Received: by 2002:a05:6122:659d:b0:557:d6d4:2f51 with SMTP id 71dfb90a1353d-55b8d6dd2d6mr2818651e0c.8.1763990127100;
        Mon, 24 Nov 2025 05:15:27 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7749fesm5416693e0c.12.2025.11.24.05.15.26
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:15:26 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9352cbe2e14so1006974241.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 05:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnU8f8zhrjnIZi1X/PTUgHViPQ8dzc70L9BFGzUfBzAZkgK+OSzaryUl9XAkc48+yi5wezBBRiUHA=@vger.kernel.org
X-Received: by 2002:a05:6102:5a97:b0:5df:b3ed:2c8b with SMTP id
 ada2fe7eead31-5e1de33a139mr2634114137.38.1763990125677; Mon, 24 Nov 2025
 05:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124022215.1619-1-vulab@iscas.ac.cn>
In-Reply-To: <20251124022215.1619-1-vulab@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:15:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSPSjh4nQ1B6NJdYZw3qW30Tx5zci6vy_9Hy6BS64FWQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkWnGddT5IPWJ7j2KDmRRv2OOSJWDBHGySpxG2emYd2sxgjdMXeB8UqIMw
Message-ID: <CAMuHMdUSPSjh4nQ1B6NJdYZw3qW30Tx5zci6vy_9Hy6BS64FWQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable()
 errors
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: herve.codina@bootlin.com, gregkh@linuxfoundation.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Haotian,

On Mon, 24 Nov 2025 at 03:24, Haotian Zhang <vulab@iscas.ac.cn> wrote:
> devm_pm_runtime_enable() can fail due to memory allocation.
> The current code ignores its return value, potentially causing
> pm_runtime_resume_and_get() to operate on uninitialized runtime
> PM state.
>
> Check the return value of devm_pm_runtime_enable() and return on failure.
>
> Fixes: 3e6e14ffdea4 ("usb: gadget: udc: add Renesas RZ/N1 USBF controller support")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Thanks for your patch!

> --- a/drivers/usb/gadget/udc/renesas_usbf.c
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c
> @@ -3262,7 +3262,9 @@ static int usbf_probe(struct platform_device *pdev)
>         if (IS_ERR(udc->regs))
>                 return PTR_ERR(udc->regs);
>
> -       devm_pm_runtime_enable(&pdev->dev);
> +       ret = devm_pm_runtime_enable(&pdev->dev);
> +       if (ret)
> +               return ret;

Perhaps insert a blank line here?

>         ret = pm_runtime_resume_and_get(&pdev->dev);
>         if (ret < 0)
>                 return ret;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

