Return-Path: <linux-usb+bounces-31609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A951CCD51E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 20:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F05243062E02
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 19:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0B5313E1E;
	Thu, 18 Dec 2025 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3NMCRnA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD74314D2C
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 19:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084588; cv=none; b=FWHxLK6BnCc8fxY1gbDpk0XdJZTWJEd0nHqhJW7arpzq+G/uNQBNBIIqFllxnxXLuywgWe17L6bBnBxAxmqQLCg5RL7bLbP+pju1QJG6VJPa3+yI2x5t+NCZNqNpMbVu5jIJ6Y5LnVVi4blSEk1djO/GIldJxf1RuIBTc6nwmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084588; c=relaxed/simple;
	bh=ZIqvP7iL1pnOGTT3mHNvxEK6HapIGS532C02nV8uGts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPCTSV2Cpq9N7HnsVaqLEjsJZe8il8UbbtQhIJtNRMXTRoEKJGjF6HNHjV0sxkJJQ5AOJvJk/+X50zC8Iyr+gwNKfTM7dINkD6B0KS6itGTKB85bJ0v1/R8Z4M40FmQKH8XpIE78V7SLfL0iPoHBSie9l0y7ngztGCClvS2IOvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e3NMCRnA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso11300015ad.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 11:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766084585; x=1766689385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZURydBRs6THPGEYtxtuXyqkrMfiNHxW6djvEvJyle0=;
        b=e3NMCRnAvfYuH093iQMCYioAIC78Xp3yhoqjVsoU48QsKoezqh/U3FjaUHADJvE5Nv
         MWhLoG6Ee+uSsHcjOmeOtJIFf/yI8UBH/WQTd1BJr0NESXbXhpIs5kBD/dEE7rUJYUTs
         DGelPFm5izTwcsft78qKb4MaagKby1SPgdwqy0sGX2RRsS9X664UjorIHUo+pIxCdLce
         br5YfjVR4bHrshVAuUjJVBOYRhUUtLDNX/B2aUUbRTiR8MunYrBfIgwmLxjWr1Sio3wy
         JlFFJsP2+/9vPfkCilQnhBkzBXDXmcFfDu7ByEJZGgiKb78rHa2LKKq49u1Q16umbaap
         S2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084585; x=1766689385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UZURydBRs6THPGEYtxtuXyqkrMfiNHxW6djvEvJyle0=;
        b=jTS6KzGrmrXTSMV8TjjtlRxi2HgQJQGlJRuS7ggem/z3AtHxMpWoc9f8HwEsV9FmJB
         s7H66UYH+2UIPz6RsJlOreaYYlYpc7LNtgLodEqWFjBwYTk8XZ6ulnyApf639U5zNL0y
         uuv0wDAqK85onQtql4mmgtxPI67P1mSZIOKunuNC5pR1xBHFACDkdPxJioZke4ToDgnJ
         BJwNbthaD65XIPF/MU39JIuktT1DhXj/Hs7qMBVe9yyhGNf6mtSvNKDfJ01b+h4k8UVE
         y19UQ7C1mSPzryGiBTzudalfj2KfD518NL4xJkrUcDOLbYVRl8uSnKLDtKmzThWQ/cO1
         gelQ==
X-Forwarded-Encrypted: i=1; AJvYcCVddifuQXSNYPJfNbU3Ef91WUFrc6lUY6wVjwrnuDTAoPyy5kzJPYoaXUuNOwHhhfpfywOG9ijeGLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+s6jB8qxDfh2JgZENmUAgMmtlfkkJu6n/MoCJAxYHIDBQBasF
	ma3YUdCPP30Iw72oaSmn2Ucpu+z5EgAUSK1gfmJZ4PCPJrT3vnVXgkPVwB59JgTvWEy/UDGvXOE
	+PQ3Ian4ogZ4xp+tBjMZaKpoanTfKZrya9IfMUfOM
X-Gm-Gg: AY/fxX65bts7QIQPfIEHA8x6F3yZ0zUhd2HVEuUpn6Mn+0F8lk85/8LfYuoDFj8h4C9
	6jiu4By7SNdJWjriC+8x/4R+l0mNnAzHs6y/tR5JVlAITefmBhd2EGA0/vMBqOWAD4xzPugB0ml
	c1u2u9KvlhVj1lf4m0ErYG5VuEZltuH7jT/XN1ao+/pxvudwZGFdaFCa9PDmQmnE3q0F4qL13eC
	gak6d+DBXn11NfDNuGkMlu0xyuN1U6N+nsxc/R1ZfnWG/0jx7EhgujgPjfRlCQK9mnLThIYl1dg
	eXsePa1L6L50/7SWOBry2KvDUjHJQVc3rlPq
X-Google-Smtp-Source: AGHT+IHjlHQlXH87LizBV98xCNNrE/r6NnWxVA8MyqbsxcZpdW5xdnwO9aFCs2usLY1INPEf7TlgBEyb3iR7vLbl1rw=
X-Received: by 2002:a05:7022:2586:b0:11b:8278:9f3a with SMTP id
 a92af1059eb24-121722a760fmr302395c88.8.1766084584998; Thu, 18 Dec 2025
 11:03:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
 <2025121728-reliably-crabgrass-2601@gregkh> <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
 <CAD=FV=U63F-wxwKDo9be6_X2P2zp6aTBjNghZRbXX1rn4jFNyg@mail.gmail.com>
 <CA+zupgyG4Nov0=jihSApp_3_0hy6YNZMkfOp6Q4-zmERFm10Ag@mail.gmail.com> <067e0b1f-ffb6-4f38-b4ac-8abdf46518ea@kernel.org>
In-Reply-To: <067e0b1f-ffb6-4f38-b4ac-8abdf46518ea@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Thu, 18 Dec 2025 11:02:28 -0800
X-Gm-Features: AQt7F2rN06AK2QuvXUYDJOc3cWSY2JUStjC0ZUUhHBMZr4GDA95FFHyZwdmt4so
Message-ID: <CA+zupgwgfKwPYqj8G2tNf4pEXNEWA+vL2WYJPhJ16xExgko7Dw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/12/2025 02:34, Roy Luo wrote:
> > On Wed, Dec 17, 2025 at 12:14=E2=80=AFPM Doug Anderson <dianders@google=
.com> wrote:
> >>
> >> Hi,
> >>
> >> On Wed, Dec 17, 2025 at 11:18=E2=80=AFAM Roy Luo <royluo@google.com> w=
rote:
> >>>
> >>> On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
> >>> <gregkh@linuxfoundation.org> wrote:
> >>>>
> >>>> On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
> >>>>> On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
> >>>>> <gregkh@linuxfoundation.org> wrote:
> >>>>>>
> >>>>>> On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> >>>>>>> +config USB_DWC3_GOOGLE
> >>>>>>> +     tristate "Google Platform"
> >>>>>>> +     depends on ARCH_GOOGLE || COMPILE_TEST
> >>>>>>
> >>>>>> There is no ARCH_GOOGLE in the tree now, so how is this supposed t=
o
> >>>>>> work?  Shouldn't tools that check for "invalid config options" tri=
gger
> >>>>>> on this?
> >>>>>>
> >>>>>> thanks,
> >>>>>>
> >>>>>> greg k-h
> >>>>>
> >>>>> Hi Greg,
> >>>>>
> >>>>> The menuconfig looks like the following and it doesn't complain:
> >>>>> | Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
> >>>>> | Type  : unknown
> >>>>> |
> >>>>> | Symbol: PHY_GOOGLE_USB [=3Dy]
> >>>>> | Type  : tristate
> >>>>> | Defined at drivers/phy/Kconfig:104
> >>>>> |     Prompt: Google Tensor SoC USB PHY driver
> >>>>> |     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]
> >>>>>
> >>>>> According to Kconfig documentation [1], the unknown symbol
> >>>>> would simply be evaluated as an "n", which is what we want.
> >>>>> "Convert the symbol into an expression. Boolean and tristate
> >>>>> symbols are simply converted into the respective expression
> >>>>> values. All other symbol types result in =E2=80=98n=E2=80=99."
> >>>>>
> >>>>> In a different Kconfig documentation, an environment variable
> >>>>> "KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
> >>>>> undefined symbols in the "config input", but I can't find one that
> >>>>> catches undefined symbols in the Kconfig tree itself.
> >>>>>
> >>>>> That is, the tool seems to allow this.
> >>>>> However, if this turns out to be a major problem. I think we
> >>>>> can either:
> >>>>> - Remove ARCH_GOOGLE and leave COMPILE_TEST as
> >>>>>   the only dependency. Then add ARCH_GOOGLE back
> >>>>>   later once it's in the tree.
> >>>>
> >>>> Please do this.  I do not want to take patches that purposfully add
> >>>> dependencies on config options that might, or might not, appear in t=
he
> >>>> future.  Please just remove all of the dependancies for now, as they=
 are
> >>>> not needed, right?
> >>>>
> >>>> thanks,
> >>>>
> >>>> greg k-h
> >>>
> >>> Greg,
> >>>
> >>> Yes, we can remove ARCH_GOOGLE for now.
> >>> To clarify, we're not removing all of the dependencies, we still want
> >>> to keep COMPILE_TEST for build tests, right?
> >>> Please let me know if you think otherwise.
> >>
> >> I think you'd just remove all of them. Normally COMPILE_TEST just
> >> allows folks to compile stuff even when they don't want the ARCH. We
> >> can can add ARCH_GOOGLE back in later once the config exists.
> >>
> >> -Doug
> >
> > Doug,
> >
> > Thanks for chiming in. I'm hesitant to remove COMPILE_TEST
> > because Greg specifically requested its inclusion in v7 [1].
>
>
> What? No, that's not what Greg requested. Your COMPILE_TEST in current
> form helps nothing in build testing. It makes absolutely no sense at all.
>
> > Also it seems beneficial to get some build coverage before
> > ARCH_GOOGLE is officially added to the tree.
>
> And COMPILE_TEST like you wrote it does not give you that. Please first
> read how this function works.
>
> > Greg, could you clarify?
>
> Can you first look at Linux kernel sources to see how this is properly
> written?
>
> >
> > [1] https://lore.kernel.org/linux-usb/2025112144-claw-recolor-49c3@greg=
kh/
> >
> > Thanks,
> > Roy
>
>
> Best regards,
> Krzysztof

Greg and Krzysztof,

Thanks for the clarification.

Regards,
Roy

