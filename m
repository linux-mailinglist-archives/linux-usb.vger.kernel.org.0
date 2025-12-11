Return-Path: <linux-usb+bounces-31395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF7CB6F5F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 19:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44C13301CE88
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 18:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7B92DE70B;
	Thu, 11 Dec 2025 18:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2NZt5Wz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9C65B1EB
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765479205; cv=none; b=cfP9bIqW8pZ18awv0pW1sdzRTMEKaAAI0/YLtNDhxgoiBPCRKqSAf4XKOGzAy26ZXMBOTPd0vYIbTCTQUarqzKq37r3YssdLSU5dlS1dzycE3jQ6Ojlmmgy2dsJbGAI1v5TwkgFcVb05ll0kIcYyN9+kSpTrfuQTyk4e3H+eYTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765479205; c=relaxed/simple;
	bh=VkB+6zy76nPRjdv7lnMqbpoc024KlOHN88aqW2VQG5M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU8yMw2cGF390MWK8rd1aHDhee/Ffy5fX+H3yaQuzS6So+pKpdsxLfKsaTkc6q9bZFn3ivICsgO6rbj9ziteOacHreTn3B/7109B/Ln8DGt35ty+hl5kPHIbh51R4k7adfdH29xSAFKojWrQdlzx0OvK3qiTEAL/qqnlE5nYkRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2NZt5Wz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2ce8681eso352110f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 10:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765479201; x=1766084001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnAKCx6pcJwqau2tXcc6tEiu3zuLgufxgOh3790LZMo=;
        b=O2NZt5WzIlniranqt6WtnuPmJ1hcOenLizUkQLDaUPkLqwiaZ/YW2FxhOdxig3iuyt
         Y5cVmLeqrp+oJP5OZFjO+C/A/xBt8hKY+Mob5rWjq5E08T6wRqJYdfO4EZlVVoW4igC8
         uQtmr9yfzpvsnhp7qc0gYbCRVzEcRiGn+AJcoFsRPfGVQ5RWN21Zxkq2JJf4je4qJD1u
         bKX5CsYsQ2oqsas17VXnVdLmp1pYszetPB0Wh50t5O81yDg92GE3Wu7M64CK2DTwyxr3
         NlMcuBRFXOwmp45aQ5k1lLXVU4qC/k/vlx9si4d0vNWw6h0P08j2+wdYngUFQG5Q5mMx
         1F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765479201; x=1766084001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SnAKCx6pcJwqau2tXcc6tEiu3zuLgufxgOh3790LZMo=;
        b=rs6aPyGb+Lu98F4nFTfgm0T4UjZA3cVKZoc9OJ/ZHIc2GAllW1mZRhtrQUQT7gpxI/
         6g67oHerfUx+z+umCabKyd5sp4cR98xiAYiw/ZwyG4SYHkGqXVu92QbP5EcWZ1Asx+q8
         HMD3FA65M9GHC2cn4VbaQ+xozazQt44PJx6aBnFuZEefjox0GXZ+gqT9qUNWDrwZ8cko
         Ti1ixlB4+bziqaNyXJf54cUdyKI7Q61dI1fhAzoWu1or3n86DcafGIR4aUzHdwR6fIxY
         fhHGJSHo1gZdl9fwMKDefU8nPPFvya+bvKc2eHplH2Nc2FDFF/CxGPoZPVFOryHLSNkH
         qEcA==
X-Forwarded-Encrypted: i=1; AJvYcCWgsv4Xi7oi5/2zky0mvo7E9+43LD+JERSxpWg6Ch8M9FLrt7zOhHEOSQ9M4pPEt2DwbiayIyDYt6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxs8EDAfJPyo/E0brB8AfhKzAEh5DGJOTMyyJ7AiFPFBaEKSgh
	C9ShRf5JywUJyn01JieVDUhLTxLcmAtyfQt20vXRkC+U5lf9NIhEIG07
X-Gm-Gg: AY/fxX4N904KcD1dp1j6drtVjSy4S65h6BenZYf21Do2z5tWpjupGUwVifRS2v1I76i
	p4cpC2ndNXfBQ4/4h6t6V8saCBHJ2HVPr9TaRHoktP9mIEv9nvMY1qU3TbyxElklx/OOIWTlvRK
	+hgurGDwvTQMzKYh0KB6lW+qc/A7Sf5w1Sx5N/0dLJaAFjD6DZONU3zqW/wx0xzEV8rZamJWEcd
	zKCm7Bsncv0G2Vuv3CatQHv6DjDCk+/zU2cS5pNk236uR/hVxp54Xup0qqYKw4SA66diH66XCsY
	Ta96PMYukoZYFmi+sYGIoA517bxDrhAZOJ1g5cx+FdQSEdP/Lh4wmcjOtGNqVvsgzuWS9qRWx3Z
	0hZ/41U9FrzI9fWQGKJ44YtuzsqtiGfxCqRU1qXQ9GISQXK+yJgoanRRyytilau4WecISF2QoXU
	Logdi082uJ2+8Iwxm7CNOY+/e6NZoLUd8XoY/8OpYE7zQ+F4dFAVg9DnJuD9jkW2s=
X-Google-Smtp-Source: AGHT+IGOoJHbwGg7uIW+U8a9VenNXQ/ylQ3MqrCzzXMSwYQ+hNbjIYNLEepLtruEb4GMCFkRWKX2Hw==
X-Received: by 2002:a05:6000:420b:b0:42b:3701:c4c0 with SMTP id ffacd0b85a97d-42fa39ca093mr8176360f8f.5.1765479201402;
        Thu, 11 Dec 2025 10:53:21 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70665sm7773345f8f.17.2025.12.11.10.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 10:53:21 -0800 (PST)
Date: Thu, 11 Dec 2025 18:53:19 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 3/9] bitmap: Use FIELD_PREP() in expansion of
 FIELD_PREP_WM16()
Message-ID: <20251211185319.4daf6e4f@pumpkin>
In-Reply-To: <aTdzTdoPLJqvgqZ_@yury>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
	<20251208224250.536159-4-david.laight.linux@gmail.com>
	<aTdzTdoPLJqvgqZ_@yury>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Dec 2025 19:54:37 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> + Nicolas Frattaroli <nicolas.frattaroli@collabora.com> 
> 
> It's always good to CC an author of the original implementation,
> isn't?
> 
> On Mon, Dec 08, 2025 at 10:42:44PM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> > not be used outside bitfield) and open-coding the generation of the
> > masked value, just call FIELD_PREP()  
> 
> That's fair.
> 
> > and add an extra check for
> > the mask being at most 16 bits.  
> 
> Maybe it's time to introduce FIELD_PREP16()?
> 
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
> 
> Is __auto_type any better than typeof()?

There is likely to be pressure for a global change soon.
6.19 contains '#define auto __auto_type' to match C23.

> 
> > +	u32 _val = FIELD_PREP(_mask, val);			\
> > +	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
> > +			 "FIELD_PREP_WM16: mask too large");	\  
> 
> Not necessary to split this line.

Only because I removed a level on indentation.

> 
> > +	_val | (_mask << 16);					\
> > +})  
> 
> Can you share bloat-o-meter and code generation examples?
> 
> For the next version please try to keep as much history
> untouched as possible.

Even the minimal changes (not moving the continuation markers) change pretty
much all the lines.
So It really isn't worth trying to keep it.

	David



