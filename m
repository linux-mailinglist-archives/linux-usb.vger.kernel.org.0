Return-Path: <linux-usb+bounces-31374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B7CB4049
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 21:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 254A330133CD
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 20:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0370632C926;
	Wed, 10 Dec 2025 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYljs9pz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114CA4D8CE
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765400362; cv=none; b=C3WgVkPUuov/ePOV+dw6Knj3IkPPd8ZUyezTq7jks2yEFBn4Q7OHzHklLFDDe87p74bD2OlTRtKDSg1+/baEgV+dsQdNfJAL97ZWgGfIew5ajHuaQKcAkYaqTcLOo8KSzwK4m2cSKc7Y8yThbxJgTsoMnoLqigiUsJeVThyuY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765400362; c=relaxed/simple;
	bh=ZcpC8Yxl/yp8T2h64azfVcrrmb4wlFbuHSjkmVg+Wjw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d2tIXKzQserm5+LOSHMfh6KJ8YR1r52q7wVQf53UZelUkOgzrL00+SDzPOYb31JBmnK8Sgtxge2nmfFIWqbSXK8FknMyJS6CmlP7m4r9IKJFDs2pdB8+eWvEQxb8EZM0siBGCXRDsUfP9CEq4eGrBrukiXWMIbjLHrJeFIF4ldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYljs9pz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775895d69cso1076235e9.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 12:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765400358; x=1766005158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XOBeiFzLRRI29udaIQcvDgIeWaap6zQQyEf4EzZYCk=;
        b=UYljs9pznvRD9MzX6MYUacxIqSINCRfbY5mWBARDuSYv7K32CGbYdHwD35NOBeavze
         iScvmXoAcWODmMQrRvzV5XvNyQ9aLZs0E7tOoy6JjudtLbV2zAQBco9mahJSCKCCRduc
         3bxjzIXEH/fETAsoRjTS1EXqLqeK5rwjQ9G96dQdfd9NzrD0rSB5ancpY1BxM3G8YFLz
         TEabuXdzHD2JutZa0oBozU1x19KOikCs0hyBD3E+fXczr7dmq4hKigFR9faBzSGPraZr
         AKReKW4yAUk6hXfM3LhjHdvq2eCvQGJfTUvX4Oee0UVdG1D+sv8hWXKpsFCPkp+rXs6n
         /Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765400358; x=1766005158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XOBeiFzLRRI29udaIQcvDgIeWaap6zQQyEf4EzZYCk=;
        b=nznHUQYET7wSjZ88xbVZuPWb2ffy7Piwknp6tsAuAxaR33vXh/eVgu62ojlScVyImq
         xnZaX710Y4Hh+FEf0DZqj9qtqkKDSNO1bEy0YUvO80m1CnmodenJF1UC6JFC9hTpfkaz
         cg6hKNPvARRuAADdsa59+F+g3ooLUxXVgzfoe2tKfBWhs7+144PCP6YDJ5xz/z6jYjRg
         Q8c8nkI+jzfxikefThyfJHvCqd+RRx8fz6+dtOaQjVQt3KfeVg2NQC611PKdJqotfXbz
         QM4YKKvb75HzS38YfBS5O5PflmcjZAVD2uF3UPqn+xjUOStjaUTxBsBxOLqRjYci2Uvi
         egZA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ32XdxMT/8P7J6rX2AMjCKhp5NFoUvssMTXqBzyRnsOLxxNmc0OvVCcoaqn0ucm4yfS/iaC8fYfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuroopqOF8pK/VhpQMWFdwdYPrhE8m+QkQA7OoJYd2PZQOw6tP
	tHJIdcHhMwytZaxOBSOB5f/upBufzTllfkxw0/hfRHc8j5Y5XrtgIeWw
X-Gm-Gg: ASbGncsjpYfzWtIuZLImBSJkci4mZzAANau4QsdapB5C0ULAamB0EJT+exR6rCkeCe5
	OqgAvXxoP8d12NE4LZaphiWixt988kmTYgN9uI1UarB4hQDDSNGHqX5CG/171sowHmJbYkhkc05
	kr8O0II5qhbrmvdjo/bTKs3/6ElecUvITxuBFlzqkMO+RfQhUBVm/0ooDOp/MqLbYF/dXxQATFS
	TAWc/rQ3sIRdbNs7wVjIMr4q+1Yxlapb8yqTN3AKdFIbqGfToomS30XRsHW34G3lXVhUcb6UiUT
	dEFkCfGJ4bNKNbHuCBYyO10cnuAOiuD05ePHOtQrgWMpdP1sdXwji+D+dhCg4zVZKawpXVhUseZ
	ult0B4WACYubKhIMaGsXirqbSJx0mf7wgErxOgElqjumU6lSBA8SQhuR44lcvvDSVYMlDLk1IRb
	UiR7nzP9wqlS+7jSRsKXDdSNmw/vH2APByuCO7XDbrdCXiq28Ej2V1
X-Google-Smtp-Source: AGHT+IFqWl1AEZJdv33HjXUj4u2PW+9exisa6AWNrimk2s7J9PgpfVbwFVoIk0HS4W55/QiDrON3lw==
X-Received: by 2002:a05:600c:3105:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-47a8376e315mr34983765e9.2.1765400358218;
        Wed, 10 Dec 2025 12:59:18 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85feasm1051301f8f.27.2025.12.10.12.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 12:59:18 -0800 (PST)
Date: Wed, 10 Dec 2025 20:59:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Simon
 Horman <simon.horman@netronome.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH 3/9] bitmap: Use FIELD_PREP() in expansion of
 FIELD_PREP_WM16()
Message-ID: <20251210205915.3b055b7c@pumpkin>
In-Reply-To: <2262600.PYKUYFuaPT@workhorse>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<20251209100313.2867-4-david.laight.linux@gmail.com>
	<2262600.PYKUYFuaPT@workhorse>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 20:18:30 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> On Tuesday, 9 December 2025 11:03:07 Central European Standard Time david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> > not be used outside bitfield) and open-coding the generation of the
> > masked value, just call FIELD_PREP() and add an extra check for
> > the mask being at most 16 bits.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >  include/linux/hw_bitfield.h | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/linux/hw_bitfield.h b/include/linux/hw_bitfield.h
> > index df202e167ce4..d7f21b60449b 100644
> > --- a/include/linux/hw_bitfield.h
> > +++ b/include/linux/hw_bitfield.h
> > @@ -23,15 +23,14 @@
> >   * register, a bit in the lower half is only updated if the corresponding bit
> >   * in the upper half is high.
> >   */
> > -#define FIELD_PREP_WM16(_mask, _val)					     \
> > -	({								     \
> > -		typeof(_val) __val = _val;				     \
> > -		typeof(_mask) __mask = _mask;				     \
> > -		__BF_FIELD_CHECK(__mask, ((u16)0U), __val,		     \
> > -				 "HWORD_UPDATE: ");			     \
> > -		(((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) | \
> > -		((__mask) << 16);					     \
> > -	})
> > +#define FIELD_PREP_WM16(mask, val)				\
> > +({								\
> > +	__auto_type _mask = mask;				\
> > +	u32 _val = FIELD_PREP(_mask, val);			\
> > +	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
> > +			 "FIELD_PREP_WM16: mask too large");	\
> > +	_val | (_mask << 16);					\
> > +})
> >  
> >  /**
> >   * FIELD_PREP_WM16_CONST() - prepare a constant bitfield element with a mask in
> >   
> 
> This breaks the build for at least one driver that uses
> FIELD_PREP_WM16, namely phy-rockchip-emmc.c:

Not in my allmodconfig build.
... 
> pcie-dw-rockchip.c is similarly broken by this change, except
> without the superfluous wrapper:

That one did get built.

The problem is that FIELD_PREP_WM16() needs to use different 'local'
variables than FIELD_PREP().
The 'proper' fix is to use unique names (as min() and max() do), but that
makes the whole thing unreadable and is best avoided unless nesting is
likely.
In this case s/mask/wm16_mask/ and s/val/wm16_val/ might be best.

	David


