Return-Path: <linux-usb+bounces-13393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE9950D8D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 22:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4DAD1F217B1
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 20:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3531A3BD4;
	Tue, 13 Aug 2024 20:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ix40BMqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A7A953
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723579522; cv=none; b=XZr/LkbBYHpV+ku2eHyn+gkSfM2YS9xyAXT5p73D/SwHTuISnUAsm2YngyuNiMU4wmqX+vOc5xIGnFCupkm5EqRC982uL5XnkCuIktU+7SDMAadfSX5XdOd09I3zlX03fH7tgH0W9vKhUgPzL2bO4gSP9VawX+g1hlC3VR08XmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723579522; c=relaxed/simple;
	bh=HY47OI6qgPGV0/QE09FI/k+0tj+UYHuJ+dL5B1JuDSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ub6NR1NBxoerLAlTDdmL5wkPo+lOqL/vpeWt3PYgYaXmnIQqeGudEnc5YvrDlmrdHcckgm3oWXjd2/ra+LrOqVp15X6VifHo6BBsiOKl7PK47Po043iPQ2vqvBEhNpgGK2lPPcVMyT1AOs1MwPjJb/5rEp14F/8O2ca6qNm0pjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ix40BMqF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so41869966b.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723579519; x=1724184319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY47OI6qgPGV0/QE09FI/k+0tj+UYHuJ+dL5B1JuDSE=;
        b=Ix40BMqFqpEMUx2L2H5loAtxXvkh0y2loERE2VomMIyMaSOi2KOC54X9+L8C0+jPsF
         S707dI+48cYLOmzKqMwKkDLs/xgQWRnmId8erbxj+QI8Z1qD6sjnpgYGbL0mkOpG0pMk
         uTCh+IzbeaNTFXSYqf+rv4QnpU/rVheMjXHhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723579519; x=1724184319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY47OI6qgPGV0/QE09FI/k+0tj+UYHuJ+dL5B1JuDSE=;
        b=WPlwUNFYDwofe4J4Xq1lo9QV139deuXjS21rDVcRyhCweZCO4oWfcuyrieW/RkGXwk
         6SwPN1Hvi59SDer4MnRgJbgnODprO9tEYvrpOqQ9433XhBcBQ7lvSO8c/dojsfGvPIeJ
         xfa/y8sFiM2DyJsgtEcZxAsfgP3EpDFQZwpHOCsVSyIU+zhSOLScQOo2Sklgapo+hvEa
         0Lm9rHzt0ziIthic9HxA3u/6if0a1mOGIoCae0dI+Cz0tWPjShXrWADtLBjXRoOx6cLk
         iYiWpKrCmAvxNlthLSxb/F4sRfb5iA/SyJy5XIG84WgopR8MLg4wQzBUfcg3gUEw58S+
         X/ww==
X-Forwarded-Encrypted: i=1; AJvYcCWlEzhi/JgZ1VjJPsi9E7sZszUGidBS9DqQfAUOYt9IJA9fIP8zmExJkRoaH86yJNKRUsJtp67BqS6f5jH9O1rtEXEV72LqQdZP
X-Gm-Message-State: AOJu0YzOF1nVnJkzbta1Zv0nlqsdZru/5roRq5q23gkMwVOozbDrr7Da
	7FGIT20N/idgSjtBmXewJRLvkMcpUNXq664kGDHwbFTA99PTDPtasPtA56BWJEzE+7VFW/GMAMq
	27oAz
X-Google-Smtp-Source: AGHT+IFOKIETF/NcfnTZAMau4jPOgQg6c4xr57c6j/wZ8WJMqxRWXj7PqLOum+RClRVHov4ui2ujog==
X-Received: by 2002:a17:906:730d:b0:a77:afd5:62aa with SMTP id a640c23a62f3a-a80f0c1c04emr413521266b.23.1723579518547;
        Tue, 13 Aug 2024 13:05:18 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f418260esm94406166b.197.2024.08.13.13.05.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 13:05:18 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5b9d48d1456so355616a12.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 13:05:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvMHpK3ZFGNFNtolL+VVjXhW9V1oEPvWqc6g0y5lmaKNnvyYoO8eNKd6BLL8AV4Img//22dOzvjfRlbPrchQ3tKSWyluYM0A45
X-Received: by 2002:a05:6000:1e98:b0:367:8f89:f7c9 with SMTP id
 ffacd0b85a97d-371775d5820mr524329f8f.33.1723579053293; Tue, 13 Aug 2024
 12:57:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net> <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net> <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
In-Reply-To: <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 12:57:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
Message-ID: <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, 
	Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, Peter Robinson <pbrobinson@gmail.com>, 
	dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-list@raspberrypi.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 12, 2024 at 4:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Hi Doug,
>
> Am 28.07.24 um 15:00 schrieb Stefan Wahren:
> > DO NOT MERGE
> >
> > According to the dt-bindings there are some platforms, which have a
> > dedicated USB power domain for DWC2 IP core supply. If the power domain
> > is switched off during system suspend then all USB register will lose
> > their settings.
> >
> > So use the power on/off notifier in order to save & restore the USB
> > registers during system suspend.
> sorry for bothering you with this DWC2 stuff, but it would great if you
> can gave some feedback about this patch.

Boy, it's been _ages_ since I looked at anything to do with dwc2, but
I still have some fondness in my heart for the crufty old driver :-P I
know I was involved with some of the patches to get
wakeup-from-suspend working on dwc2 host controllers in the past but,
if I remember correctly, I mostly shepherded / fixed patches from
Rockchip. Not sure I can spend the days trawling through the driver
and testing things with printk that really answering properly would
need, but let's see...


> I was working a lot to get
> suspend to idle working on Raspberry Pi. And this patch is the most
> complex part of the series.
>
> Would you agree with this approach or did i miss something?
>
> The problem is that the power domain driver acts independent from dwc2,
> so we cannot prevent the USB domain power down except declaring a USB
> device as wakeup source. So i decided to use the notifier approach. This
> has been successful tested on some older Raspberry Pi boards.

My genpd knowledge is probably not as good as it should be. Don't tell
anyone (aside from all the people and lists CCed here). ;-)

...so I guess you're relying on the fact that
dev_pm_genpd_add_notifier() will return an error if a power-domain
wasn't specified for dwc2 in the device tree, then you ignore that
error and your callback will never happen. You assume that the power
domain isn't specified then the dwc2 registers will be saved?

I guess one thing is that I'd wonder if that's really reliable. Maybe
some dwc2 controllers lose their registers over system suspend but
_don't_ specify a power domain? Maybe the USB controller just gets its
power yanked as part of system suspend. Maybe that's why the functions
for saving / restoring registers are already there? It looks like
there are ways for various platforms to specify that registers are
lost in some cases...

...but I guess you can't use the existing ways to say that registers
are lost because you're trying to be dynamic. You're saying that your
registers get saved _unless_ the power domain gets turned off, right?
...and the device core keeps power domains on for suspended devices if
they are wakeup sources, which makes sense.

So with that, your patch sounds like a plausible way to do it. I guess
one other way to do it would be some sort of "canary" approach. You
could _always_ save registers and then, at resume time, you could
detect if some "canary" register had reset to its power-on default. If
you see this then you can assume power was lost and re-init all the
registers. This could be pretty much any register that you know won't
be its power on default. In some ways a "canary" approach is uglier
but it also might be more reliable across more configurations?

I guess those would be my main thoughts on the topic. Is that roughly
the feedback you were looking for?

-Doug

