Return-Path: <linux-usb+bounces-29562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7FBFFCBC
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 10:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A42731A063C0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 08:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709E02EB863;
	Thu, 23 Oct 2025 08:08:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773FC2EC097
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761206892; cv=none; b=J66OQzJfHD0cFIIkp4NPCazwwCe3n3Fgr9xccBIpYMcrrXZPzk/bsnmN0NrttwGEzXU9bZSIxiOWu71bK+SArIarjSpJdnj8W5OifE/XHmOMb6lcaVR5ZLm42txydamyddeWsJ4/30x0c2Cxm36Gf6cRS6q7ZFDiAyCvkKqFKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761206892; c=relaxed/simple;
	bh=YSlV3Ui/R8OX+GLrbep0IihwU6AoVM62SupLufD3Caw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PltyqZKAsLGPa4fsDo3kWdxXC4IpeeuOerJbTKTOfpDAIL8Bg6L+D1VaDw/onYxhxV1H7Le7wVLYQzkjWpDifkyx4iXY0whrnzvKS6XlXVJbvbi8wQSRidomFIxCs/MSz//ylSYCdv0Hbq9atHmgCaKH5rQiPg5sTFzbwwD2zL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-932c2071cf5so1281044241.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 01:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761206888; x=1761811688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nolr+eNt6aVR4bnXOrSXLAjzFqxSLYKSdI0s7QV7cbw=;
        b=ZJ5aKmD0Md5lxMruLvp9l8/zNkC237NLmoTj8ZEUhYqWHXT1oi0DqtY79R05Rtqn6D
         TgFgGOi4GmeeVOWocRK5g2QMpJujT1JmBa0myIMlU2kG3fhrLZ204+TDHvl5jcFol9H0
         zXFxYvkC+KflNhqwPnlpC23GgkIRQXuuPuFPrd0EW0rslo1OqO5GrFvNFBwqdniSpn7w
         ZsSDBXX6JeqwDPuOrxwTaGZQHVXRBR3e0nS/qAbmt3iXa2GiLOFJ/uXMrlpq99cb2oNq
         8zpnyLTeEH3sgKX/Of9vN7UjO7aq4KN41cjtymvNpJPzzorSlFS6ku/m1o8eDZCZNiRw
         rCog==
X-Forwarded-Encrypted: i=1; AJvYcCW31aQudbby3R6KuMAvGJ+/M4S+yV4nPB5Ei1DTTKlgKx8UE6An88rhm5Fkw7nhYg+UCSuX1bfbs2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj66UUceyqiX5JYDEk94rlCBPIAIlZbribkusrcbp3z/vDWu2P
	xM6jD5uv9S0ifBPyPv7WcL8JXWoPjnG+91wzKfATdYzyNB+0yUigYp4OhsxPALDr
X-Gm-Gg: ASbGncs+YIXfdcqmlc55YUY01+XLZ7D5LNGZZCFz+rslBvdwSyuSGDIsgM6oP4AspXb
	38aQLyemxQXn7Ixzht+Ctnj8ntzg1LS2+eonQRa/VbQJP6hzT+PGgnqrHxlbvpsvHw5k9wtAfZs
	Z2ta+m+YOJ0S1BKnxcgfsb1nHnLJ7nYLyCnPnFWHBEq3WTRTs/7SVTy4lFzB7Zw+INKsns+G3WB
	0RYbGTJYyyqothTMHNa0dIDl6EfIghmfU6lskRoW4+PYN5Ufr4bG80BuoEmRVO1UdfnK+sN99FJ
	fXgeyspkBNbx62howTXwpqgZwZl0ITDYSjCwec6KYNfZepAtXbwbYeRwWwCQ+K3A5synTuerxT7
	bjtv1M3Tf4hGNl7TzYo01d3W3f9h8UiVVEI9AQQhxa4koyYTzVZ3LUILbpT4igLFGTzUhq7HFtG
	C2WMN7t7msqmxZDTgcV1rolJp0OgOYq+y/8IN8Wg==
X-Google-Smtp-Source: AGHT+IFBMqSLdMPIZiV+lTX1yvfIf7gS2MSof5aZDLfk7hzLbsJ4ci0sJNGLgJ2CcIrddg8RosoP2w==
X-Received: by 2002:ac5:cb65:0:b0:556:a243:8a72 with SMTP id 71dfb90a1353d-556a2439102mr1302270e0c.5.1761206887969;
        Thu, 23 Oct 2025 01:08:07 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8bd3f7sm533608e0c.6.2025.10.23.01.08.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:08:07 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5db2dc4e42dso506159137.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 01:08:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMUeCU9nkzjikDGIX8FtFbFxeDbUZBamRxr58vkykboD9RNGsp3N4w3kpSbOon+wPA90TiMlYPTqE=@vger.kernel.org
X-Received: by 2002:a05:6102:81c6:b0:5d5:f6ae:3902 with SMTP id
 ada2fe7eead31-5db23866f45mr1605522137.19.1761206887227; Thu, 23 Oct 2025
 01:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022124350.4115552-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251022124350.4115552-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 10:07:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTe8t8O2H+hPU6=WC6V_YGHwTd7sF1htuhX8mVC_fUqA@mail.gmail.com>
X-Gm-Features: AS18NWCVYlN6uQfMDhc6d_B3LlrJdzYInr_Xaym6zmDpvYwmst5OSgE2t6h-cSM
Message-ID: <CAMuHMdWTe8t8O2H+hPU6=WC6V_YGHwTd7sF1htuhX8mVC_fUqA@mail.gmail.com>
Subject: Re: [PATCH] usb: renesas_usbhs: Fix synchronous external abort on unbind
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, kuninori.morimoto.gx@renesas.com, 
	geert+renesas@glider.be, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 22 Oct 2025 at 15:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> A synchronous external abort occurs on the Renesas RZ/G3S SoC if unbind is
> executed after the configuration sequence described above:

[...]

> The issue occurs because usbhs_sys_function_pullup(), which accesses the IP
> registers, is executed after the USBHS clocks have been disabled. The
> problem is reproducible on the Renesas RZ/G3S SoC starting with the
> addition of module stop in the clock enable/disable APIs. With module stop
> functionality enabled, a bus error is expected if a master accesses a
> module whose clock has been stopped and module stop activated.
>
> Disable the IP clocks at the end of remove.
>
> Cc: stable@vger.kernel.org
> Fixes: f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -813,18 +813,18 @@ static void usbhs_remove(struct platform_device *pdev)
>
>         flush_delayed_work(&priv->notify_hotplug_work);
>
> -       /* power off */
> -       if (!usbhs_get_dparam(priv, runtime_pwctrl))
> -               usbhsc_power_ctrl(priv, 0);
> -
> -       pm_runtime_disable(&pdev->dev);
> -
>         usbhs_platform_call(priv, hardware_exit, pdev);
>         usbhsc_clk_put(priv);

Shouldn't the usbhsc_clk_put() call be moved just before the
pm_runtime_disable() call, too, cfr. the error path in usbhs_probe()?

>         reset_control_assert(priv->rsts);
>         usbhs_mod_remove(priv);
>         usbhs_fifo_remove(priv);
>         usbhs_pipe_remove(priv);
> +
> +       /* power off */
> +       if (!usbhs_get_dparam(priv, runtime_pwctrl))
> +               usbhsc_power_ctrl(priv, 0);
> +
> +       pm_runtime_disable(&pdev->dev);
>  }
>
>  static int usbhsc_suspend(struct device *dev)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

