Return-Path: <linux-usb+bounces-31319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF0CAF84A
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 10:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D2443009399
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 09:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA4A2FD1B7;
	Tue,  9 Dec 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZjD5AZK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127082FCBE5
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274191; cv=none; b=TCVWYKPUT1ZjVHNwxcwFf+DroPkDfEfe2bueaZ8HC1kCaP1HslRLWsFohyuxfTbAlHi6XgqyYk9fM84D2W4ehHxtz6em2Ho8PhNUY2KtN1u4Spa7lYmNgclTtm5MIDu5zz0+eGFAXHxVYEnJFqzHIpLK6DZOrvfLoYNzShRQx20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274191; c=relaxed/simple;
	bh=0ztR6jj1kdHeM2HvWUV76MiZZnJx3iX4COKK8r02Bqc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hv+rvXR3bvPSWtfONZ1WH1TKrpsM3NVkXhoma2+8KleCY17lAyhd7SjfJT2IqtR/VR0Ln7VMW5Y1BQJetPMdRfajdzSIq2KGiGD2F+2tdzwLGhCmywhC23jbBKi+5pZRbJ3qmB8O/B68G1tyv2WLjA67Fsf2VBsqrXaMcEtTVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZjD5AZK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so4079374f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 01:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765274188; x=1765878988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+NhgqRfgxOwgdPhqdTsST7UgPu+2reXJUJ1H1ugq6Q=;
        b=bZjD5AZKldn9eUheexC1Y1odtGkVDuOmpiu2djpFh1bzSaZHWgFaynZktCDczpIHxo
         2gRndYMLHIgUDE6iAOzF2lDIhI3SCOunE2GNUenm0WCnqJ+dkEcwDXpTHBLfE73OwiXO
         9Gef3pV4eLVb04t7TCgJ8cepakUX7tDK8xW1/9Lzs1IwfFw/r8RV75oNFVw1+hV23MOy
         0k/tmslyMwbR9f+g76Lzcn12uym3loRKLD9F3sHh7eAt37kXUdPiiWjVmFEmYFhrb8XG
         JmOApU61/yOdZ4uFD3yOpVqRZVtZW3GxkSE6OnRJ138x1eyWntSWYcNsYONgJOLVYqdd
         Ba4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765274188; x=1765878988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+NhgqRfgxOwgdPhqdTsST7UgPu+2reXJUJ1H1ugq6Q=;
        b=jGe6I2lzusPgcpL4/3Js5ESYgW3aHAfB/Ct8UneOJ9EarZ1L/zwgF1sWGKJW5qRsRB
         mVDfXJ5AY47blAX5oUfK4Vl6ARbBKa5NfPC8fh1G84Vu2eiI9Qz+CfmaSYOaVtaMlhwK
         7bo2c2lJxcFqU/eoi9RgA9q76vbDuNMguPgh8vW/E4WT2W0UZF+XxEGDLyN7lg1a+QKD
         6nF4wzZ6DUFZ/mjtCaspIwVd+qk1LN+JO2U3d9GnW//GkyPOfaVAxrHBkgMCNHL0ks3m
         sgzzIe2WxkltWZtJhAbExtFYEF/dJ7HuTcIIoZautAZnCSwT0j8zxYfRLKkbuVnflglC
         skFg==
X-Forwarded-Encrypted: i=1; AJvYcCUBpM2uOMELfOAIlaJdb5tA30Wak90m7H1kQCaADKN7jTGMVrHZB9DYRJQbmLDl/Az/M4nGiUDJyBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMTUeZu5YBvyFzDYucp6pTV2/LHwSfkYyXq99eqn0Vo+6Bxqj
	sKBkJo3+uJRX9Jf0OdPvqiE0u9MTyed8UIsEkgEjmUnD3qQAY5qxHF/4
X-Gm-Gg: ASbGncvVwqRL3la05D6EeK+Im9uWGfseuSOFaeWoWOlkYTCx/zTRMXwaR/qhy47xVxV
	qoQ0n6AW5ufnVzKqbZ6OFnnAUwA8u49L5wuj9uVy7Tql96Ym8iPsCsjb24LhDBgJ7NxedL1N3mX
	0qHCXCSJPfFV9mDA4fU26Qqg+u79L40wNktXMZ7Jq944aFCf1Aa+TKdeAn+cob/17fX5fjAKFrN
	ZcIERBbrt+Nl7D9K9AGaNuwLECoGPH0rew26oMksZT1LehWfaTWn0dlcxQ9v8BmLij9xxE27dLU
	ZKUU1GXmtODsOfHetyzZWjWdaLKlWKhjofAgCDry5MjY5FIfaFDzTunsG3152uoLDb8NnHuSbBh
	mGt/1LiNIdUbTo5GB435QRcjOZKKACxZartRnFiiFSdTnpDIVMAp3zZ5dMx7xyuReJ9vxQaYrFS
	iKQvkiTULauX90LztbhSHMyNHV0NAo8n/7HU+4H8rWzaJnHvEMbgzX
X-Google-Smtp-Source: AGHT+IG7hc90ntk8TlUXpcPXG+fItVwX9c1S1X97vIBaIvlLCfuiaQPSSG3/jWgjpLUJhtwJztiraA==
X-Received: by 2002:a05:6000:1843:b0:42b:3108:5671 with SMTP id ffacd0b85a97d-42fa086938bmr1149928f8f.29.1765274188199;
        Tue, 09 Dec 2025 01:56:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm30431284f8f.41.2025.12.09.01.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:56:27 -0800 (PST)
Date: Tue, 9 Dec 2025 09:56:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 3/9] bitmap: Use FIELD_PREP() in expansion of
 FIELD_PREP_WM16()
Message-ID: <20251209095626.2f664ffb@pumpkin>
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

Generally yes.
Mainly because you only get one expansion of the #define parameter.

> 
> > +	u32 _val = FIELD_PREP(_mask, val);			\
> > +	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
> > +			 "FIELD_PREP_WM16: mask too large");	\  
> 
> Not necessary to split this line.
> 
> > +	_val | (_mask << 16);					\
> > +})  
> 
> Can you share bloat-o-meter and code generation examples?

The generated code is going to be pretty much unchanged.
The changes only really affect the compile-time checks.

> 
> For the next version please try to keep as much history
> untouched as possible.

I'm going to resend the same patches with the full cc list for now.

	David

> 
> Thanks,
> Yury
> 
> >  
> >  /**
> >   * FIELD_PREP_WM16_CONST() - prepare a constant bitfield element with a mask in
> > -- 
> > 2.39.5  


