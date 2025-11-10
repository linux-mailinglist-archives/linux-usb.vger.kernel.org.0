Return-Path: <linux-usb+bounces-30252-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E346CC45A87
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 10:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68C884EAF5D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 09:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9213A28B415;
	Mon, 10 Nov 2025 09:29:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65C1CAA85
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766978; cv=none; b=u991D2becgtIOUASp/SdQBwKRFGbPyfcys0g0vGapxL9VFoPEnJ5W31dAr3GijKIhWIYXrJfZ1kDq8yvynhs0JjS9sOWKbgif4N/dHP8IKEe7QitkpWZee1mv6yzPZzhLnk313oOb1GcL0qicK8C8xMoHavCnXrs2h89lp+pH3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766978; c=relaxed/simple;
	bh=nJZPrXQKCl3bu6wUeQ/MI8ozYYEj+PYCSxFScA/Ei2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScsEtwpjdVgNH/NGpDInCNqmPy5FzK1ioQbUb8Ug/2PVXlT3H0pFCsODhZIrM7Vwpgj0QVfYEXuU0shjIXZcqSN/I8+/zbCSspIW6yP37nj4tBRpA7J/ZftrSb7wj5JUgTLD8flFioMul7lT9pBTR3IMRY1dMdRl08yL7GP2qD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5db2a0661e0so1664749137.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 01:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766975; x=1763371775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/UF8iu/Ap/e6A6upppHsnZ+gquCWuIoNYkej9XhChM=;
        b=RbbVvxZVKUwyUl5YD02v3kWl5VwPU87J48Plz+zWDu2spaYLk2iFKAGUBUmi38zm4U
         Z/PWoxNQ4Iqz+wItLMkwLOfCiLl1PCEUORTf0sJOw96bUVARgEB3mLLEeXucLiWsjd7D
         PwEorVSYYB2aVno7U4CXoZte6GXNV7OOsi0BYlIPMwNcNXoTZtkfBp2VVxo/wOO5El6i
         HItX7FEzjQ3LZNwA0d29yxFAt+s4+OTbbr9OpYZ/BUl8MYWID8VNPAEn9cFy2e0m8/gz
         RijLOmuCbLZ3w04IP3ngH9ZTrsvpfh4+DZoXRqg1qlH8RpBvVhag7vxqJiJnm1l2O72T
         UVyw==
X-Forwarded-Encrypted: i=1; AJvYcCX7go7b0mhb7NSDETOvkvtanX2dTFnCWPS/FSLA4tpyNP4Pr09TmfA4bQbyaTV4LRlRJXMKCg6rbkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQa3pGGEOuL86Aj37mky9lSRcmNWt84GI8CkaEoRPVwJukUJ6B
	JIvtJr2SBrXqLaOhXU6793KkIs/3C8NYwQi2O436Y9xmICo4qjJRHjZ5IrTuKYfn
X-Gm-Gg: ASbGncuA6M19z4YpfYX8IUb9+OLNbddyCaaN3Y9YDXd1keR0oHzpZUOMLHMIXUTNUCC
	rTgGsh39TWr6afVmdUiAwcTpFJ7U7GCB0lNH88/xDfKAdC7aRys+4zEBQnPL9ewoLh8pNusS5lC
	CLbCpaSrmxF31jjTXY4srl1RxK5XWMcfzVbUO3nB1WGVSVLrG9wHQ+pC/DSnPvDw/Ijww2Rfd/7
	3/eibGErrG1jNQwoXvoA6bOnY/hGgWiPeBOe5HAFj/1VjCl4FNZCh9E0/7pdtQnF9nS+qmj0T+w
	HEcaSgwkDP+G9YMkjzoxMQ4KR4MJ8CNgDcTVzEhO7lPwXibWjjtVmL9p5f/kjLkTtQMH//ZqMSc
	0bNwJV2fzyDFohyC20Vlw0P9ukl3FfwIqUbD2iAdVmeoZOK+WfmI4yYqiz2h6guwhsVU+bU1q/F
	O/9qx1ViU5mnq0BXWQfeHamY4unmp65FMss2Zqg54bRNuhXQTuOMan
X-Google-Smtp-Source: AGHT+IFPwtLi7Q36rP52kWn/od4PTTQUSO7X8nyNrQwpjt/2q/O5GWCS3z+uvBZuIbE9nWiOYdEDZg==
X-Received: by 2002:a05:6102:1459:10b0:5db:d60a:6b10 with SMTP id ada2fe7eead31-5ddd57eafddmr991425137.36.1762766975330;
        Mon, 10 Nov 2025 01:29:35 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9370898d9d1sm5632447241.12.2025.11.10.01.29.35
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:29:35 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93514afb23dso1644062241.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 01:29:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtwESgeUCOk11OcXgVZLE4OUYVLRjPhri6YWJSaGurXcFIC/RstwsGdlYjKDvwpSq4CHbQ/4QuV4k=@vger.kernel.org
X-Received: by 2002:a05:6102:94c:b0:5db:d07c:2199 with SMTP id
 ada2fe7eead31-5ddc4814cf6mr2252763137.45.1762766974788; Mon, 10 Nov 2025
 01:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
 <20251106143625.3050119-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWDGpqdhCsA0MJqoL1JAiyVR-TA2YqDe+-S9Xf6c5O-gA@mail.gmail.com>
 <64c74f86-7438-49da-b164-a8a113e47c32@tuxon.dev> <CAMuHMdXG8w9jR9gr4av15VT69XNouqys5z4Rxx-nidnvnbN3dA@mail.gmail.com>
 <5edec052-5e65-4d00-a182-6675ce579be1@tuxon.dev>
In-Reply-To: <5edec052-5e65-4d00-a182-6675ce579be1@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:29:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqaQ=E43Wrg7GtDD_MGS5ibF9o1DfpDCAq-=F=Exph_Q@mail.gmail.com>
X-Gm-Features: AWmQ_bl0zJyAvgz4Lr7-qJXghMxi7mBu6IDH_qPTBnyifvwjHPzf0BSzKBRfv30
Message-ID: <CAMuHMdVqaQ=E43Wrg7GtDD_MGS5ibF9o1DfpDCAq-=F=Exph_Q@mail.gmail.com>
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

On Fri, 7 Nov 2025 at 19:42, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 11/7/25 10:01, Geert Uytterhoeven wrote:
> > On Thu, 6 Nov 2025 at 19:56, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >> On 11/6/25 16:52, Geert Uytterhoeven wrote:
> >>> On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
> >>>> of the SoC components is turned off, including the USB blocks. On the
> >>>> resume path, the reset signal must be de-asserted before applying any
> >>>> settings to the USB registers. To handle this properly, call
> >>>> reset_control_assert() and reset_control_deassert() during suspend and
> >>>> resume, respectively.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>>> --- a/drivers/usb/host/ehci-platform.c
> >>>> +++ b/drivers/usb/host/ehci-platform.c
> >>>> @@ -454,6 +454,17 @@ static int __maybe_unused ehci_platform_suspend(struct device *dev)
> >>>>         if (pdata->power_suspend)
> >>>>                 pdata->power_suspend(pdev);
> >>>>
> >>>> +       ret = reset_control_assert(priv->rsts);
> >>>> +       if (ret) {
> >>>> +               if (pdata->power_on)
> >>>> +                       pdata->power_on(pdev);
> >>>> +
> >>>> +               ehci_resume(hcd, false);
> >>>> +
> >>>> +               if (priv->quirk_poll)
> >>>> +                       quirk_poll_init(priv);
> >>>
> >>> I have my doubts about the effectiveness of this "reverse error
> >>> handling".  If the reset_control_assert() failed, what are the chances
> >>> that the device will actually work after trying to bring it up again?
> >>>
> >>> Same comment for next patch.
> >>
> >> I wasn't sure if I should do this revert or not. In my mind, if the reset
> >> assert fails, the reset signal is still de-asserted.
> >
> > Possibly.  Most reset implementations either cannot fail, or can
> > fail due to a timeout.  What state the device is in in case of the latter is
> > hard to guess...
>
> In theory there are also failures returned by the subsystem code (e.g. if
> reset is shared and its reference counts don't have the proper values, if
> not shared and ops->assert is missing).
>
> In case of this particular driver and the ochi-platform one, as the resets
> request is done with devm_reset_control_array_get_optional_shared() the
> priv->resets is an array and the assert/de-assert is done through
> reset_control_array_assert()/reset_control_array_deassert() which, in case
> of failures, reverts the assert/de-assert operations. It is true that the
> effectiveness of the revert operation is unknown and depends on the HW, but
> the subsystem ensures it reverts the previous state in case of failure.
>
> For the case resets is not an array, it is true, it depends on the reset
> driver implementation and hardware.
>
> Could you please let me know how would you suggest going forward with the
> implementation for the patches in this series?

Up to the USB maintainer...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

