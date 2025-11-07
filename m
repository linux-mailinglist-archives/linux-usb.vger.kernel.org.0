Return-Path: <linux-usb+bounces-30185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51392C3EDBB
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 09:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEC0B1881DB2
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 08:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A63C30F81F;
	Fri,  7 Nov 2025 08:01:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C7F2FB602
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 08:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502484; cv=none; b=UKKinvgsxkGKUGvRPP8DPF0pkbLmFMm840bpIBLJadMhJbZHBKwIWvpwieaDHqQE2SoILMQgH7zmqXW30aJBryUqEOtw0NPB3HCeGUGn11HO2WpTMDld+eH8ypB1zx3/8BOhzXrMMT8SWyMwJGAZDXj5o2KoR8gyo/fGgIWwRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502484; c=relaxed/simple;
	bh=mVmxhRVa3QLX+9Tw5ztS33zfhofD3+aNGlWySPb0alc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdG0W647itNJVj85372/lBBjXbxaO863hCackVvw6I9VvO40ey5BC6cF7QAhXBOxjk80Fzn5fmNMvJZKFWyF0NcfoXBGNpH8W77JD+yFav1Wn+JthZSbzWLazFTt9/R9Y5mWz6VkK/PAxPyF894n9+YDPizusN4Yw4GCC6LDuUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5595c4a7816so347964e0c.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 00:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502480; x=1763107280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uh6Brj9oYK8r8+vmC0dHdhpZdYfAyUsVdZvtypnYmmE=;
        b=lQ2Xzilo0lftKqX3VgTO/jqi9566F48SW0DAKOCxlGeh2ucou7P501f3EkEnkBK4c8
         JGztRJFpW+2HHsmTRnFpSbDMd09fDVAvJCn/5k4W0B1hBJ5TfBQ4/9nKs6aMTg2kJh7E
         AQ5TcZOeJ8P/UzCS/ukYIoIxhCaOMBBsrTj4/f7BO8TNgaFy+4t3WXRqi5+ixTbChF+U
         xQsE1W3+vSNi4UoPesgg9zlufnSiD2d1ZRxrBpM95fuH6ISt+Rr0dz5jnRLSMOpIZNgl
         amXED3t3s7QR+fL9IOwzxHbbCgK5OVPHWsu1QaP9z5kCzWKXRzanHqbfMlY+8pdUae8C
         lJPA==
X-Forwarded-Encrypted: i=1; AJvYcCV0XtsgH0FekUX/pNtSfd6+u5wUvMezfGe4sR67ow9xA4stfY7gWaTU45xzr8/JCVBm8e+11JqO18M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFb1jv8q1QEwk05icaHha5o/wVR85gk/2Op14UA7hUG7LaNrKH
	j7FTOWVFdrStbVcqRjRHZTVw2ais4fdF/xSHMo9LfH5oqshxHuW0WZEq1zNq5U6guak=
X-Gm-Gg: ASbGncuraYmE8/4PhjbUTLNYntevhVCsXYwe6C5kqxbZVuqwZreS3edaQJGrUkIpwvt
	Et3IdxlgabHKoQzrIMlJk8mgK6WJpal10wz6FYrVrRMgMBLokrK71ipQRTi50YyBhrfLTEDzrU3
	dGs8MUApyzqxHoGdCnIrXiZQm9hWvyXPWMUEc60zQFW362OSjWvhpQtmf0VC9RA8HkaTLZhswt2
	IQOx1QPUdf2myGUKRGvwIaTQGhqRVEGrTa6q2pGZNr9GCf4/Xga2oSNEpWQaKzMzJX9MxvRg8ub
	bzG/z79zGUAO+Wn/eTEDLHdF4bHo6mwxq7f/hjRDoX+S6KrVl4Tc9vrB7S+/zHzxYhiwv1W7a7r
	f8tOlmu7ykeKLi9iHcd5njoEMAgy11hajdVsHIwGnV8wzE7MejTScadfXurpXoPrdXdvnnGZwXw
	2jgs2hkiogqJTBw3vzI0jZq5mV3XTLNjkvgzqLbQ==
X-Google-Smtp-Source: AGHT+IFLkBSK25QXtzyyKqUl1PVLswiygtjrkpP5r4QCxyhhhXwIJ5oAgamEuaUhFd1sE1gv1f/LdA==
X-Received: by 2002:a05:6122:30a6:b0:544:c8bf:6509 with SMTP id 71dfb90a1353d-559a3a3ff86mr898594e0c.4.1762502480037;
        Fri, 07 Nov 2025 00:01:20 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55996e27abdsm2377819e0c.4.2025.11.07.00.01.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:01:19 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-935241a7a0eso277928241.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Nov 2025 00:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUtVmqnhzW0mJq2gTHj01ilG9m91s+MXG3ezqiXU2yqwLFLolYjZda5eZ8rWeC+lF54o8vCvsk4Og=@vger.kernel.org
X-Received: by 2002:a67:eacf:0:b0:5dd:b2a0:ac6a with SMTP id
 ada2fe7eead31-5ddb2a0af71mr544559137.9.1762502479423; Fri, 07 Nov 2025
 00:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
 <20251106143625.3050119-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWDGpqdhCsA0MJqoL1JAiyVR-TA2YqDe+-S9Xf6c5O-gA@mail.gmail.com> <64c74f86-7438-49da-b164-a8a113e47c32@tuxon.dev>
In-Reply-To: <64c74f86-7438-49da-b164-a8a113e47c32@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:01:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXG8w9jR9gr4av15VT69XNouqys5z4Rxx-nidnvnbN3dA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEZ6hIZCEeCwpb7yJfB13pZwILannIATGSzms1g-ARrV5rVjhvQqGb8yk
Message-ID: <CAMuHMdXG8w9jR9gr4av15VT69XNouqys5z4Rxx-nidnvnbN3dA@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: host: ehci-platform: Call reset assert/deassert
 on suspend/resume
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, 
	p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, kuninori.morimoto.gx@renesas.com, 
	geert+renesas@glider.be, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 6 Nov 2025 at 19:56, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 11/6/25 16:52, Geert Uytterhoeven wrote:
> > On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
> >> of the SoC components is turned off, including the USB blocks. On the
> >> resume path, the reset signal must be de-asserted before applying any
> >> settings to the USB registers. To handle this properly, call
> >> reset_control_assert() and reset_control_deassert() during suspend and
> >> resume, respectively.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >> --- a/drivers/usb/host/ehci-platform.c
> >> +++ b/drivers/usb/host/ehci-platform.c
> >> @@ -454,6 +454,17 @@ static int __maybe_unused ehci_platform_suspend(struct device *dev)
> >>         if (pdata->power_suspend)
> >>                 pdata->power_suspend(pdev);
> >>
> >> +       ret = reset_control_assert(priv->rsts);
> >> +       if (ret) {
> >> +               if (pdata->power_on)
> >> +                       pdata->power_on(pdev);
> >> +
> >> +               ehci_resume(hcd, false);
> >> +
> >> +               if (priv->quirk_poll)
> >> +                       quirk_poll_init(priv);
> >
> > I have my doubts about the effectiveness of this "reverse error
> > handling".  If the reset_control_assert() failed, what are the chances
> > that the device will actually work after trying to bring it up again?
> >
> > Same comment for next patch.
>
> I wasn't sure if I should do this revert or not. In my mind, if the reset
> assert fails, the reset signal is still de-asserted.

Possibly.  Most reset implementations either cannot fail, or can
fail due to a timeout.  What state the device is in in case of the latter is
hard to guess...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

