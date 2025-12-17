Return-Path: <linux-usb+bounces-31552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 153A7CC9669
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 20:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 646A430C7CA8
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 19:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B52B21257A;
	Wed, 17 Dec 2025 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDmwZyIk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DFD28314C
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765999095; cv=none; b=HniZVWQfQLbF84+jNX7DB28ieuhCTRHRrDDxwjy6iVFUkNVGqDXnA98U/6a6oEd4xUSjMoNAwjKfODe2Qu/2ekgyFEPy0x2CQ3TqgMKq1JkGulin/c5nHL2BWPrr5l7i90HNCqNPjvMy0MYpIJfzBwlJSzjy3MtLd7k4aq2FLkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765999095; c=relaxed/simple;
	bh=sNs96snLpe2mrQ+PhaRwK1nZjmBa7OCxvHBdhl9wWQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOsh5mAJlSp0smuTOTeaR9a0ceDnR5aMTgf3r24jK89AfcUf7jh8DOMhtbCo6bsZNxkLwB3Akjwh5stArNHBhFkCQdFOGxStbif9bd06pSA4aNpjGTkZhRrQn46wNlAfvOthfACYLP0KDCb7Pn9iKj8Gau4M94ee5rcFQEHUF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDmwZyIk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so5179834b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 11:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765999091; x=1766603891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=;
        b=qDmwZyIkFAWJBsfp9bORBpVBSb2lVPoY6gDukgqBvR5JYi5CA1PHIkWR4AtukWBuWg
         j/ewA6Nc1ydzcxwUPGquVLXJmUjsFUb6uBnAE/ZCQRcEzuukCgEcxyplExxEQimHPM63
         QphRgWHtqNe0N4sBtosqFONdv/ET4O3RN93Aw1SWjEj06+tvk4V2ypCNlfjRe4Wv1+OH
         cG+K5dGJRgDyhnQVcBqEkBAnFzSaKU62b+WCiA3fQZOIIo5zvWViAt4NrqhxjerxlN8Y
         vxrx9dwoXFnAOzjskP3tuF72GBQZhxnGpkU+KJRNdFPRkD/SPAmp1spW3Hv2oxMVWpMY
         Zzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765999091; x=1766603891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CK2xc4O1CWL3YyR5Jlk5dSHvCSo9+K5mz+4BdYDHf5E=;
        b=EvM57hu0e1rPtbMkhB79txlLKTeb4HBznExlN3eZMsw3pWJa5bT7dbB6zW/boATPlc
         /wn2/WsUfoTuKfP8z6vzsXeOaG+FB98r41hfefBm209lzo3XzWtgzhqftwvWoVms7Oph
         GyZK2xO8CcTM78SHTb7h6hfEjnDiov5McG+HP3mVkuLG8CWQ0R+bmsEz7rBCBh8OEILN
         ZFkdDyGkygTJpArbvKWzg9BTPUJ5Oq4/k/U0SDY+HIttljXBYnZ6aeV04hKqD2jAo7ID
         B8EglST7gC5p+x3FW85SGKBdUYmQ+7v+TCwbbsCXGvrWWaZ+o/awHTVI8wD+pcKej59Z
         wwXA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Pysajw7rkb0HPh9r90bWjKh6wqaLmf5bXuO7RzJ89+y15zRfQkr7gMQLjuCHn3WBnWI/tAKpYT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygdeW+VChWf4LBn54Ja5N6clh1kYivLH0MJ5dCw8/kdBLF2nMt
	rzG0CBI7Fh/6ufXl+1ihn2n4F1dOQ3xH+0fylfYuQ0D9g4aXO9d+FM3pwd1pfB0D2Zzr2aOdPWZ
	/G6MRkFEIKZK5UBKCW20Tvlg46q+WYCs6bvhceS1A
X-Gm-Gg: AY/fxX4o+J9m+DWgaGh5ZkYVdJUGTHDc+2oG67gVPc1X6D78SDv+gKaiFQTKl0hyVdr
	QbiM0G8Afqyk4x3NTzD1KMqm1RFddYfNubHjB4kq6hTZF2aYpeW1zMEJAUI5LczdBaImJ/UNjwQ
	b4f7CxkxotblYc6Ec9RLEb+Tz9a8+jwOL/uN0LYaC53y0VA1nx18BMWIzL5hTvEBuiXuLIwoXLl
	k/7lvgqbYSZPgCO9hITNF43N3FGepeQdikvp+xdbjQb4mW0cNENSJJPwzdVaMleIYsvNALJtc1d
	libpfY8iqdPDhir84vo9lRDk7A==
X-Google-Smtp-Source: AGHT+IHU2vpetQSDEWGYm+Y16+Q+hMrDA20ASiwjGw22PJF4oOT0FZWKdk6jDg2jAFGB5cCqYCpdKNR8qXBpSDUqoaU=
X-Received: by 2002:a05:7022:7e09:b0:11b:a892:80a5 with SMTP id
 a92af1059eb24-11f349c5953mr12769514c88.13.1765999090603; Wed, 17 Dec 2025
 11:18:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
 <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com> <2025121728-reliably-crabgrass-2601@gregkh>
In-Reply-To: <2025121728-reliably-crabgrass-2601@gregkh>
From: Roy Luo <royluo@google.com>
Date: Wed, 17 Dec 2025 11:17:34 -0800
X-Gm-Features: AQt7F2pRcbJChuQijr6nIYQ6eCnDyo-nRUDl_79j5YJBIy8PmN9l851-QlzkUmI
Message-ID: <CA+zupgxZCyNonfNPbGnFymGGOQuaWR1TsL+hujTbH4DEcfEt9Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 5:24=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Dec 04, 2025 at 11:14:39PM -0800, Roy Luo wrote:
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
>
> Please do this.  I do not want to take patches that purposfully add
> dependencies on config options that might, or might not, appear in the
> future.  Please just remove all of the dependancies for now, as they are
> not needed, right?
>
> thanks,
>
> greg k-h

Greg,

Yes, we can remove ARCH_GOOGLE for now.
To clarify, we're not removing all of the dependencies, we still want
to keep COMPILE_TEST for build tests, right?
Please let me know if you think otherwise.

Thanks,
Roy

