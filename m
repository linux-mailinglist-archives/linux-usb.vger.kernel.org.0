Return-Path: <linux-usb+bounces-30284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E3C47537
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 15:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B430E3A1B56
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 14:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA51313E0D;
	Mon, 10 Nov 2025 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="E29/fQu+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0702431329C
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786019; cv=none; b=J1SsMQ/uNpXFLAVO9XklGDZdYUDCThu5LMJoL8WFu2SiK0h6wdCPxMkKjsa8YHROzJPODk3bvbMzw77UMfcdqC+1IPoH0j265cUmPAUS/XObFXd2xEfHKbrPaDIcPfE4nsNvJDpqcJ+B78ApEAguYLGpneYHRjrk82bD5xNQF+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786019; c=relaxed/simple;
	bh=Zgbgz6Xx/nSV21RSqp5s3ioY3dD/63laARY8w4Ccz+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwF1PL3sko3YqquGkRSrFEajZANE+mxYkRQlmAqsDP6oOXW2dP5WhodUsD4hJkzN3KVseqORTGmAXnR8lqcJ82+olCA/JfJD50Sg4c6/g5TJu1y2+6f3jAe72xZwlhTjnql4InqUe2wc9pHyjLMWxvwyJFpQVfkcHq8PDSLiiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=E29/fQu+; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ed66b5abf7so34789181cf.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762786017; x=1763390817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZfgovMoQxmHp2PRQokeGmF8rpreis0QhadSzO4SeuQ=;
        b=E29/fQu+OECf16//0Gw2F96hzOEzofYIE+WA973ykgeZPYGpaRQtyw817e+mnvW+va
         2u/358IbW0Y0CAeiq+B0fAuPI4OMsatH0/64lwjunbpt++0YtQAAH2zm+VxwBf84kUOG
         ShoSikFHE0X5ujvmFqOcdW1rOvvuHctm5hEqsxp0OZXLeqj2yNr3vrchgwJFrke1wDJi
         Hg4t+NUP82YASWCyzzyf6+cVG5qMFh/kOY0zerHYwJyEi2/i3jNtU/tii2r3P5g80WV2
         74K7zyS3+N6cqgI8VeF3AL84MAQlDGeLCngoxVA04DtdejWGnOcMfeaFRe7E3zSwM1//
         SJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786017; x=1763390817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZfgovMoQxmHp2PRQokeGmF8rpreis0QhadSzO4SeuQ=;
        b=qB6eciaYzl3ZW7zAPz28dMTAsqse/mLCmDZFSM7xuXpLlGUw/qPbELrxQfZi4bn3xW
         xu0m5RO7iXbEV5MmTOV3Em3ZCeGhqSbO0urvG2Ylc5xG3KFhVAcTdVAgDpj3RbEIJVlt
         WjkpEDMTfFIAbgriiSMZ1PS39W/v5yrWKgWV6NuUoeFVXXBs4vt3kImtUZcAVGmWNS+x
         xgYpvjRkCbtNthgZGzYJfUccZTdMt6wWff6SUUyIKvwu5xOtwTzASnTU270YX4gqg06I
         G4FHmkHPsRza0mpYtuegd+fPpAiYAq5c3kPcoAuSUYEXp88qsMFJ/XiAn+rruQg7SQ4c
         PwKA==
X-Forwarded-Encrypted: i=1; AJvYcCWtzNtissXk8182WIUgr4hoDf/HRp7flsPmdJkryjBxjIS2VXQRHsFuryqaStoxyj/ZxTTLiy6clgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEEOVrP9v/RH+hrw69VX0ysgRZYHRyw9v5CDaAb/CjYuYmGjW
	pjrvobjv+/fOLEqJ0SmP9aaYheNGRe5zVQX8P00y0XSCnkpIh36pbD4Ko8lJNpXiDQ==
X-Gm-Gg: ASbGncvhz/XFgBC5+JHX5OpUAIf2d1jA5Pv5O3MVGy6l7kg8MjhfEYFsDzuWyUTc0ss
	za7CQdG+1OYXHr6+hZw3v+gPaai+N8JK73P3HlyFNESM6dWS9ohe3yRDUmTd8hN18rsFeWcjLk3
	lhmEraVKBqTTF+iCHCA3CeHpuA0QsnvkS4tnSAGoYIf0opjCLfnlwEjVnnPQAeA8mjE7XdDa22S
	nycfAtZ44OgXdyfDZ7wcJvVSyAV8B8xiKbxLXZ4FwwaECOuET+/2Vc2k32VMzeBf6zY4/Xn7OIR
	5BGksbPSbxfoC7votSe/QjFyMBK3PB3b0fyfbJsVbewdh/gpTXGLMS8p2QT5YGFF4Y1pLhbwMki
	KiAPGFuzpQuxA6QoTRguhJGB5GnE+8foqhzS67vAULsZsPDrAB+w9IMHuNpX8MJsTugBqVdfpBM
	MI1bUdJnn6751l4maQpBE=
X-Google-Smtp-Source: AGHT+IHrvbbLLIzADaEDwAYPzqYzdSj271EqD3XikN5r8c8oqm2X595zkIdy1ah5lygJoU9kCZZiNg==
X-Received: by 2002:a05:622a:1cc3:b0:4ed:b134:58e5 with SMTP id d75a77b69052e-4edb1345e86mr63104731cf.12.1762786016296;
        Mon, 10 Nov 2025 06:46:56 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda56132c0sm48284811cf.7.2025.11.10.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:46:55 -0800 (PST)
Date: Mon, 10 Nov 2025 09:46:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, gregkh@linuxfoundation.org,
	p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com, geert+renesas@glider.be,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 2/4] usb: host: ehci-platform: Call reset assert/deassert
 on suspend/resume
Message-ID: <74790e58-f1d1-4d7c-9b75-4176af44e1ff@rowland.harvard.edu>
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com>
 <20251106143625.3050119-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWDGpqdhCsA0MJqoL1JAiyVR-TA2YqDe+-S9Xf6c5O-gA@mail.gmail.com>
 <64c74f86-7438-49da-b164-a8a113e47c32@tuxon.dev>
 <CAMuHMdXG8w9jR9gr4av15VT69XNouqys5z4Rxx-nidnvnbN3dA@mail.gmail.com>
 <5edec052-5e65-4d00-a182-6675ce579be1@tuxon.dev>
 <CAMuHMdVqaQ=E43Wrg7GtDD_MGS5ibF9o1DfpDCAq-=F=Exph_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVqaQ=E43Wrg7GtDD_MGS5ibF9o1DfpDCAq-=F=Exph_Q@mail.gmail.com>

On Mon, Nov 10, 2025 at 10:29:22AM +0100, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 7 Nov 2025 at 19:42, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > On 11/7/25 10:01, Geert Uytterhoeven wrote:
> > > On Thu, 6 Nov 2025 at 19:56, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > >> On 11/6/25 16:52, Geert Uytterhoeven wrote:
> > >>> On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> > >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>>>
> > >>>> The Renesas RZ/G3S SoC supports a power-saving mode in which power to most
> > >>>> of the SoC components is turned off, including the USB blocks. On the
> > >>>> resume path, the reset signal must be de-asserted before applying any
> > >>>> settings to the USB registers. To handle this properly, call
> > >>>> reset_control_assert() and reset_control_deassert() during suspend and
> > >>>> resume, respectively.
> > >>>>
> > >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>>
> > >>>> --- a/drivers/usb/host/ehci-platform.c
> > >>>> +++ b/drivers/usb/host/ehci-platform.c
> > >>>> @@ -454,6 +454,17 @@ static int __maybe_unused ehci_platform_suspend(struct device *dev)
> > >>>>         if (pdata->power_suspend)
> > >>>>                 pdata->power_suspend(pdev);
> > >>>>
> > >>>> +       ret = reset_control_assert(priv->rsts);
> > >>>> +       if (ret) {
> > >>>> +               if (pdata->power_on)
> > >>>> +                       pdata->power_on(pdev);
> > >>>> +
> > >>>> +               ehci_resume(hcd, false);
> > >>>> +
> > >>>> +               if (priv->quirk_poll)
> > >>>> +                       quirk_poll_init(priv);
> > >>>
> > >>> I have my doubts about the effectiveness of this "reverse error
> > >>> handling".  If the reset_control_assert() failed, what are the chances
> > >>> that the device will actually work after trying to bring it up again?
> > >>>
> > >>> Same comment for next patch.
> > >>
> > >> I wasn't sure if I should do this revert or not. In my mind, if the reset
> > >> assert fails, the reset signal is still de-asserted.
> > >
> > > Possibly.  Most reset implementations either cannot fail, or can
> > > fail due to a timeout.  What state the device is in in case of the latter is
> > > hard to guess...
> >
> > In theory there are also failures returned by the subsystem code (e.g. if
> > reset is shared and its reference counts don't have the proper values, if
> > not shared and ops->assert is missing).
> >
> > In case of this particular driver and the ochi-platform one, as the resets
> > request is done with devm_reset_control_array_get_optional_shared() the
> > priv->resets is an array and the assert/de-assert is done through
> > reset_control_array_assert()/reset_control_array_deassert() which, in case
> > of failures, reverts the assert/de-assert operations. It is true that the
> > effectiveness of the revert operation is unknown and depends on the HW, but
> > the subsystem ensures it reverts the previous state in case of failure.
> >
> > For the case resets is not an array, it is true, it depends on the reset
> > driver implementation and hardware.
> >
> > Could you please let me know how would you suggest going forward with the
> > implementation for the patches in this series?
> 
> Up to the USB maintainer...

If you don't have any objections, the patches to ehci-platform.c and 
ohci-platform.c are okay with me.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

