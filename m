Return-Path: <linux-usb+bounces-19232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F4A0B0C4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 09:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 234AC3A42B1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 08:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75DD23315A;
	Mon, 13 Jan 2025 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fVtw/uv4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF852233141
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756068; cv=none; b=DmwnY0+J0Xn7MXez2rmoBPGon3/fEBhLDv1KGzHs/dLLctq7fT8euzRT4s+scbBHohaBFwde5rsK1h4ljPIqvkRQFUK4zT0ugxgt+0W9qNXuwwdX2JW6WDt8yub3MUzMoPBI+UhOZI0T62N7P1S5T20CdfmgAhJQPal5pk/RxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756068; c=relaxed/simple;
	bh=f8QHHGrrqWcN4uP06DPr8DutPMgJclVuN0rJZGNwAzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlT+ttoCQmtEKAptQmsAddXDpaUdjqMuKrmgEk47YnF3ns660+YH1dLjwx7GSVpcXmZ448ED6GSDS553psVykSBpUGZ+XEeE63DqpfzBSCiVpdYytebGFX2hxNs8qr69SnFcL+sZ01yNxwGguHYTrWTGVmlOLspr2htDKZcXzyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fVtw/uv4; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AE67F3F148
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1736756059;
	bh=NJkM3CSB0Pgz/We9Iy8m1WmoRuOM6PbsthVCHJC9pB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=fVtw/uv4sMncQJU4A2Hdn27wVRHDfC4kZQhr2xZQDEcEAe31b5hKCQ6cUakD692il
	 s7vgsu65Us9SFNLlQHOZsElGBI1fvltHhP+/WHdtkJJx3Ar5H72n8Qsl1ZkCjN0p4U
	 REHN+NTbNrE82IUtRCA7Gqa0w304ZOoYNvv/UK2zyQ8AmTGy50pot9ZhiOOacKFkCt
	 kP7EFlDd6xSBmqcXaLpSrUkXluuafDHphAbktYfjGFFhmbxwk94R/8v6hLtAuC+tq5
	 7aAnK7+zaVzPVg1fxBeiAQZgQT9JSFbwosfE6vl3ac+cXs/RB0ntG/HxZYpW2dABUN
	 R1Mf4nD+s0oFw==
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4b11463b42aso570021137.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 00:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756058; x=1737360858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJkM3CSB0Pgz/We9Iy8m1WmoRuOM6PbsthVCHJC9pB8=;
        b=NFqce5rn/gFfyDHyXIDng1r0lOuPsyV+Z1iPCEs3NIVl7A+RPvNCA2HkJQ0hpVsV1z
         IVzU7cyfxYoTFRGIojkZjPDXjlhD9pd5bH55Z/QwhKW8L+xAX6233HgR1j0lpJtW6p16
         ATSnoISjiwqPQnXMgIXO7DNeTdDdq6uRHVCGvVvuqzqBGthfeTW4h7d0OhYM/xihhRC4
         BIpNjcmxvaSpIRrgzL1QelDpzLnfTwb1vQCo1E0MNO2uXkZ13xW1FTMTxFN+pwbHkJve
         UB+zNqGz05kwVcsz40Nooz1ZQB4q3HhAXj4fr0FMrWwcEd5WY5PV1TJfUu51243QIi++
         ilKA==
X-Forwarded-Encrypted: i=1; AJvYcCV3t/VaDXsm9yoA5rmEO3cXAVB6rtmD0Zq7NwCjmQbc56Clu1yoCyGGN2LvB+Oim+brkPs9aSuDZ/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFzS14qwlY7PRCaoUhbK+gKnrdwkRRDuI0J/noBkC91yAMV88T
	MyIHHlTT8Daqw5uxoR8wHureRqYF3s+rzqyQwDCUE3OIV9U5JRLzFqyRClDPM/GswpEsR76quTg
	k766jrhjoZX2QnLeZBrVOyY9uFlP7y902UMyZTTh9dTnlXRXECIH3TDvQZI7IFq9Fn/gxcC57Vj
	uAYVSwatSmzn1waqTEOBs1VCeNC0TLFFaTdlt990xPsiZcuFg+
X-Gm-Gg: ASbGncsMM2vxXR/dPrTg8AlOpXDqZNmLN/3+EM3bOrR3uqBWcVjAYcCjOyipEkxKRro
	78eEEdL1vZHn4DLRgkbwYNaiUsScrBglFDZhCa1k=
X-Received: by 2002:a05:6102:3a0f:b0:4af:fca2:1b7 with SMTP id ada2fe7eead31-4b3d0fc7ad0mr16244225137.14.1736756058230;
        Mon, 13 Jan 2025 00:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYCvwisC3l8FBYF2gdmAMcld8qH4qVUB+MvAbH6eZfZowGTRecWBCVwdrDJtvYcA3dlbvb4oEYjvtsRISObW0=
X-Received: by 2002:a05:6102:3a0f:b0:4af:fca2:1b7 with SMTP id
 ada2fe7eead31-4b3d0fc7ad0mr16244215137.14.1736756057932; Mon, 13 Jan 2025
 00:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110084413.80981-1-leo.lin@canonical.com> <b16e2b38-e9f8-43af-9df0-0510895c02ee@rowland.harvard.edu>
In-Reply-To: <b16e2b38-e9f8-43af-9df0-0510895c02ee@rowland.harvard.edu>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Mon, 13 Jan 2025 16:14:07 +0800
X-Gm-Features: AbW1kvYHv1rlGa0_EloDnK9Kx-ziOPd6kTh9v1VO-JWEZv4ZAe9n9iMxMqEKvSc
Message-ID: <CABscksPKS1prbikpF4FwoTLMvxN13_xrQfdXoXDnbo-4byUB6A@mail.gmail.com>
Subject: Re: [PATCH] USB: Prevent xhci from resuming root hub during suspend entrance
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, pavel@ucw.cz, 
	len.brown@intel.com, bhelgaas@google.com, duanchenghao@kylinos.cn, 
	dlemoal@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, hdegoede@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan

On Fri, Jan 10, 2025 at 11:44=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, Jan 10, 2025 at 04:44:10PM +0800, Yo-Jung (Leo) Lin wrote:
> > The commit d9b4067aef50 ("USB: Fix the issue of task recovery failure
> > caused by USB status when S4 wakes up") fixed an issue where if an USB
> > port change happens during the entering steps of hibernation, xhci driv=
er
> > would attempt to resume the root hub, making the hibernation fail.
> >
> > System-wide suspend may fail due to the same reason, but this hasn't be=
en
> > addressed yet. This has been found on HP ProOne 440[1], as well as on
> > some newer Dell all-in-one models. When suspend fails due to this reaso=
n,
> > the kernel would show the following messages:
>
> I believe this problem was discussed on the mailing list before, and it
> turned out that the issue was caused by a bug in the xhci-hcd driver,
> not a bug in the USB core.

Could you be more specific on which bug/thread it is?
If you were mentioning thread about d9b4067aef50 ("USB: Fix the
issue of task recovery failure caused by USB status when S4 wakes up"),
the log in that commit message suggests that it happened on ehci, while
here it happened on xhci. So this may be more general than just the xhci.

>
> Basically, suspend is _supposed_ to fail if a wakeup event occurs while
> the suspend is in progress.  As I recall, the bug in xhci-hcd was that
> it treats some non-wakeup events as if they were wakeup events.
>
> In particular, a port change on the root hub should be treated as a
> wakeup event if and only if the root hub is enabled for wakeup.  Does
> xhci-hcd check for this before failing the suspend?
>
> This reasoning shows that your proposed fix is incorrect.
>
Thanks for the feedback, This indeed isn't a correct way to address this.
Will try to figure out some other ways.

> Alan Stern

Best,
Leo

