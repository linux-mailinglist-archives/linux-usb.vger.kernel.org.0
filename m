Return-Path: <linux-usb+bounces-31526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F070CC598D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 01:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03CF3302B774
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88871C3BFC;
	Wed, 17 Dec 2025 00:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elYhHcuE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90FB3A1E7C
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 00:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765931161; cv=none; b=JwXQYeNxy4yu3biHVYRLjXhb91IYP+oHiZfPLroE7fYCaPKA3OeM+RUHtmu6YcKCLu3XZPItLfzwVqtlRWcfgjB/Apfyjci5npTCYgRwPj/enIf+K/AGMwE6eym6EoOep6eerUPMP4KqpVe2SyXYvGh0vFnl1eS/WGkq3dxJ1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765931161; c=relaxed/simple;
	bh=9QZkPyxxxv0XvNVPkvBCDLdyp8ZhJIeiVto9GvIKdqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIrsv1aR1I7t8Ho6x7GxJ+YKO+OJrBP/VEsNOENqyfPUbGTnAYW9k1I+TGInImXKAgW0gR1xl5PNrbqdlUV7nnM89PtSsL3P10jS44XceYE/ao4gwRsApRMHIkbBwi4M3ktu4bwIjsctH96rgo+rlfJ8T1raSMwguyAEEr7a94c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elYhHcuE; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso2993925a12.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 16:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765931159; x=1766535959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nStCldhYeJbsakQb9GL71otPBPnGKef27diqrwm9pSQ=;
        b=elYhHcuEis90cotJkLhvVkSvTEGlv24MJuRH51JIvNxByNiIKS1m72XZcLqebgzoNC
         Qmls4KA6phCM2T4hJG9jG3tXGPrUH2JEBXnu8ldbdPkQst+n9Iepg+cQVPn2PPjgav2m
         xvBaS4l40VGc7HIpPUOGWlFSQQjRw/8a8Sm9MaHMTx10PZeaSp4Xm3hrKp2hlIdJ5tKL
         WDmN9CqaR1qwCuOOcxP+a+j1wtSbWjstxgr4eqqrbXfNVx4CO3PvYwwuHbqoaN07q2o3
         q4ee+PK5O7Nu2wcED6bBAr0zY7ZHo2gGIQNo48BZl4VgCS+D2k+Smygte3FJwXAYIJn1
         5UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765931159; x=1766535959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nStCldhYeJbsakQb9GL71otPBPnGKef27diqrwm9pSQ=;
        b=PmbDvHhAI0bTYHSiTZyMV3RE/NALOcXQcp8IDGO6hke2cgJluIzN67ep48y4PSc9p+
         V8XkqflJZ9Q82uLc6Tfxs3nmMeOjwxDuL/wpxpPPLYj0MRbshIh6Y6E2xyHdB6FzqBuz
         0yLAffSsHyqwuFK0+aydgV5WfOyy4vtwBiPABvFscLU+3MMPNMhz90U9aY+5ZimMplpa
         nHGe0ymE2tE+ySWxa+2iFOJj1EbAYAoG7aRN6qdxrTwm7BeUOBdV06BvlICrytcI3YAP
         lbGtqlXTU4UdTgi0KN1KX/madXgKxgyaLkPWP/AEtqg7bxZlGTTjnMbIe/9zWCLshxiv
         qB1g==
X-Forwarded-Encrypted: i=1; AJvYcCUG4S2AkA1T7ATjPNXhgO9ZvNLEUi6YdQyPDVD/zKT4yM1Lg1Qje525dur6UMngsAFZ/uF+FOm4/3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YygWQ/kd9ymboG8w/cMwRciPudVulPMXmlBRBOTu25IUfxZiEuv
	jDQ2370c3OgVnuBHXrlM/EoYBAKq+jkqj12WOe79ijbg7OUK0wFndr0hFJpVLGxPuI2d9MCjCi3
	iwvCLOkj/Y3xAKp5bDaRTYMBbAJ5a+voMScsHNR6x
X-Gm-Gg: AY/fxX7fEB9q1u1FjSaIp4AbecQZuuWJzRXj/pLabM5RRZBa4Jdpg5FEPuq4ul9qk/E
	Va+xE7gPWwKPeI6E95kco2ftvLCM+ZncgCMdJO5UQMt3PtYhwqKXRFVvdUQzLMN5K1DsLW3Sido
	Wn+zY1tdoF4yrLakm/+xUL99/D7Npe4Ktrre6MTIZ24EknlzCOB7r1fhhm3hCFD/TCkFjl2e3ze
	7s0rfazaMg+Lhp8FaVjZJACBNFdjs9HWtzxJejOieksE4eagzlidU+yPcrNCiTil1P6FDj8CjW5
	ou192lLVq27TXSKTwdYnIP6Y1KP0DQQ+Nz4t
X-Google-Smtp-Source: AGHT+IE72YZLvmMskEnRrYKXqAR/Z4B1+w1UCRGWDCS1wBfVqFBXKeWBfxxKkJ6DLO7fN/x56A6EPSj52vq8pdguqrA=
X-Received: by 2002:a05:7301:7015:b0:2a7:1232:f3a2 with SMTP id
 5a478bee46e88-2ac2f92967fmr10246834eec.0.1765931158534; Tue, 16 Dec 2025
 16:25:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com> <20251216233439.vqigcx2zs6taergz@synopsys.com>
In-Reply-To: <20251216233439.vqigcx2zs6taergz@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 16 Dec 2025 16:25:21 -0800
X-Gm-Features: AQt7F2r_jcpuKgHpjELMuIOr3JbsyWh8DSH9IaZ5PBx8OH-Ix2ElNBkBRfsI7ik
Message-ID: <CA+zupgxV0aHEXqmmHbe6cKSQUvYg1iFXjiDfG7wKdF7KKTo6iA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:34=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Thu, Dec 04, 2025, Roy Luo wrote:
> > On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > > > +config USB_DWC3_GOOGLE
> > > > +     tristate "Google Platform"
> > > > +     depends on ARCH_GOOGLE || COMPILE_TEST
> > >
> > > There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> > > work?  Shouldn't tools that check for "invalid config options" trigge=
r
> > > on this?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > The menuconfig looks like the following and it doesn't complain:
> > | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> > | Type  : unknown
> > |
> > | Symbol: PHY_GOOGLE_USB [=3Dy]
> > | Type  : tristate
> > | Defined at drivers/phy/Kconfig:104
> > |     Prompt: Google Tensor SoC USB PHY driver
> > |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> >
> > According to Kconfig documentation [1], the unknown symbol
> > would simply be evaluated as an "n", which is what we want.
> > "Convert the symbol into an expression. Boolean and tristate
> > symbols are simply converted into the respective expression
> > values. All other symbol types result in =E2=80=98n=E2=80=99."
> >
> > In a different Kconfig documentation, an environment variable
> > "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> > undefined symbols in the "config input", but I can't find one that
> > catches undefined symbols in the Kconfig tree itself.
> >
> > That is, the tool seems to allow this.
> > However, if this turns out to be a major problem. I think we
> > can either:
> > - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> >   the only dependency. Then add ARCH_GOOGLE back
> >   later once it's in the tree.
> > - Defer the whole patch series until ARCH_GOOGLE is
> >   present (I hope not).
> >
> > [1] https://urldefense.com/v3/__https://docs.kernel.org/kbuild/kconfig-=
language.html*menu-dependencies__;Iw!!A4F2R9G_pg!e-y2_BsSNhXF1v5K6tBJX-Oabg=
KJM9WVdvwyKoB6tg9ooCLVg8WiQ4UrStOF2YZQ_Zs6tC6HVh7wCpqkEfU$
> > [2] https://urldefense.com/v3/__https://www.kernel.org/doc/Documentatio=
n/kbuild/kconfig.rst__;!!A4F2R9G_pg!e-y2_BsSNhXF1v5K6tBJX-OabgKJM9WVdvwyKoB=
6tg9ooCLVg8WiQ4UrStOF2YZQ_Zs6tC6HVh7wHpoUlhY$
> >
>
> Hi Greg, Roy,
>
> Just checking, are we aligned here?
>
> BR,
> Thinh

Thinh,

Thanks for checking in. I'm still waiting on Greg's reply
regarding the Kconfig question.

BTW, I silently dropped your Ack-by tag in v8 due to the
changes in Kconfig and MAINTAINERS files, which I
should've noted in the changelog but I didn't. Sorry for
the inconvenience. Could you please review the current
version again and provide your tag if it looks good?

Regards,
Roy

