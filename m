Return-Path: <linux-usb+bounces-31394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC8CB6D72
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 19:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 596183015E2D
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 18:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA782318130;
	Thu, 11 Dec 2025 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItrsRJoY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FF3161B9
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 17:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475578; cv=none; b=taESwdO8GQBlNtxoqV8KssrzCr9jctqDAKLuSTDYIXQ+3Za+uHyDQqqTz2HbWvPKlJVlqoyC6n25UjyfiN0uzIOjy2uRe6+ZfjxYUyim9RS9UMlxAia931do7MghfemuuHJqcJwVSRGffVa6RKQzv4TSBFIVVfSJ5s+R2l0k8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475578; c=relaxed/simple;
	bh=7kL90s3MMRyzMBV2VPyecpbPc1VFQVYQYnoAV8hJToM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi4sL4E22HUTNaeZw+ujTHmKCaba7aU2SkdVFbAAs1vfqhfLp0zhjTZBY98LYKoF433Ij1gOY7TSMALOfhNM7m7g0FMP1Xa2dFRLL5QFyeiMW7mMOfWBqFYuBlR9OZj2GGbrRdl2H6VzGh8Yh1fapYMsQAoeYI4YFV8WiOwpZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItrsRJoY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so3853315e9.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 09:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765475573; x=1766080373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtKJ31aVc7eZ4Vkjxapl7DR2IbzsUem+kvnYzLog/1M=;
        b=ItrsRJoYSmRKvtaluLXdq0f+YcrWa/jHvLHZN/xM0+FLQlO63Zm6AM6oXQv0V4gHUM
         Ov3o7J5ec083bObi/lps4I2KebPsP0YxewsE8duwbXdwZxzP+HqgBoANp6a/iRdpnr2W
         3RNGxgCuJaoN0H2n4Ao1EeXhmF6CjOy89MrHUyuLzq0+qBqsj4w1J0ShmQyEMScOknWj
         I0MblKKd+3IJSOnwNSFulwkVMjIMgUrMOpFVshpupVJ3i5+mj6EiVMhilylY+qv27gxE
         Cp2S+uqwB03m7Evet0WvxjFqLU70XUfA/iOtaETSTqShMG2GJ1dKO42md9pupmKejtu2
         SijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765475573; x=1766080373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtKJ31aVc7eZ4Vkjxapl7DR2IbzsUem+kvnYzLog/1M=;
        b=CF5109LVJkle5uJxf3UsVMQTrG8oaxZRcJOv9oP5n/LMFERarherDBJCjjiFlFYkum
         4+re1EyIPKnZx3wCvKR5k756rRS+0aEqoyLi+UzWTuaBqg3ZMeZcwYIjdDuh7L2irG11
         m/6NHTmrFLhk26POqrKrMZMeiKPyrunJgowao0uoP4Gz7TLC5TvjpzH3uQxmqkPkBa/t
         dvmowxyfjA3pw761k9wFUiBDQuz2v1zlY7CKd1ATkzWeE4YZwT3PgDDGLq4C27YXo8rI
         tad9hN2Fvqr+WB9Hmpg7d1sE5Sib+5mheUQ8Znnog/rf+6ci70Q1AXB2uWTpJh6gNIon
         7yAw==
X-Forwarded-Encrypted: i=1; AJvYcCXgnwgjkrAoO57FGaJfwWLG8UzxBuMU+ewazMxpkRR6YUVGzAoboKJy4Q/HzP//6QgQuA5nTfAZjWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXvhL6Fz7aLzY95TBLriX8tx4wOZa69u8+fKLQcCiX+6K5nN/f
	u/UiehQSo9+rx3dpLBB2345RmrR4w8KAJjKbqmH1K6i+XCgzp1zKZ7Lk
X-Gm-Gg: AY/fxX6sCxAR+SxIWu1Mcxh8KcyK8M0zShmiBB/jnsTWZZlmKRTNhVX82QHZW3jNXly
	o7+XYPlgJHBM1VVqI+BDW/R7PcCwZNaNGbVkQ2s+ahQ3WU5U4ukvk5/LFxti2Ev0lKfTNqJJJqo
	FDNQicdkCo/rH2aP+Uccmh7DPJ5NOhyvR9wEdGAeoX77nuAMeS3bw7RcdOarSvnZz76NWzay7BB
	YlvWZuRh+/ZhlMEQ+T/v5/yNwXpQ+HxPPT1CN9BrHK+1qGt3lmaa7ubUPtIGCOCnEgqdDgUv0GI
	gC0LpYI5Q2lTiroCo7dIgYyCvsPLa9FgVjbq2NmgRn69E40OX5bRIlP7P06M0G0I6GIu3tZDpG/
	ldswILPUCF2K3c+Oya4ZyJNB5mff3319/ZAfQd9Wmvr+xWtvxh1YaZg0aqWs7WoB86wYg4dWHvh
	KpmVb2JHq9PVR8+kTDgteRnnaChb77WX6wVpc4qWGGBimZ8FQaawcP
X-Google-Smtp-Source: AGHT+IFozGGfbiBE5zxaAY9FAFlPfcorYjZCP0w9DvTisQKQgWsrJxqDlzii4SNT9CnQovoyK2N2Rw==
X-Received: by 2002:a05:600c:3489:b0:477:7658:572a with SMTP id 5b1f17b1804b1-47a837ac5f8mr68325345e9.20.1765475572512;
        Thu, 11 Dec 2025 09:52:52 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b85d1esm6877424f8f.26.2025.12.11.09.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:52:52 -0800 (PST)
Date: Thu, 11 Dec 2025 17:52:50 +0000
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
Message-ID: <20251211175250.4ec21522@pumpkin>
In-Reply-To: <6719438.lOV4Wx5bFT@workhorse>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<2262600.PYKUYFuaPT@workhorse>
	<20251210205915.3b055b7c@pumpkin>
	<6719438.lOV4Wx5bFT@workhorse>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 11 Dec 2025 13:50:28 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> On Wednesday, 10 December 2025 21:59:15 Central European Standard Time David Laight wrote:
> > On Wed, 10 Dec 2025 20:18:30 +0100
> > Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> >   
> > > On Tuesday, 9 December 2025 11:03:07 Central European Standard Time david.laight.linux@gmail.com wrote:  
> > > > From: David Laight <david.laight.linux@gmail.com>
> > > > 
> > > > Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> > > > not be used outside bitfield) and open-coding the generation of the
> > > > masked value, just call FIELD_PREP() and add an extra check for
> > > > the mask being at most 16 bits.
> > > > 
> > > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > > ---
> > > >  include/linux/hw_bitfield.h | 17 ++++++++---------
> > > >  1 file changed, 8 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/include/linux/hw_bitfield.h b/include/linux/hw_bitfield.h
> > > > index df202e167ce4..d7f21b60449b 100644
> > > > --- a/include/linux/hw_bitfield.h
> > > > +++ b/include/linux/hw_bitfield.h
> > > > @@ -23,15 +23,14 @@
> > > >   * register, a bit in the lower half is only updated if the corresponding bit
> > > >   * in the upper half is high.
> > > >   */
> > > > -#define FIELD_PREP_WM16(_mask, _val)					     \
> > > > -	({								     \
> > > > -		typeof(_val) __val = _val;				     \
> > > > -		typeof(_mask) __mask = _mask;				     \
> > > > -		__BF_FIELD_CHECK(__mask, ((u16)0U), __val,		     \
> > > > -				 "HWORD_UPDATE: ");			     \
> > > > -		(((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) | \
> > > > -		((__mask) << 16);					     \
> > > > -	})
> > > > +#define FIELD_PREP_WM16(mask, val)				\
> > > > +({								\
> > > > +	__auto_type _mask = mask;				\
> > > > +	u32 _val = FIELD_PREP(_mask, val);			\
> > > > +	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
> > > > +			 "FIELD_PREP_WM16: mask too large");	\
> > > > +	_val | (_mask << 16);					\
> > > > +})
> > > >  
> > > >  /**
> > > >   * FIELD_PREP_WM16_CONST() - prepare a constant bitfield element with a mask in
> > > >     
> > > 
> > > This breaks the build for at least one driver that uses
> > > FIELD_PREP_WM16, namely phy-rockchip-emmc.c:  
> > 
> > Not in my allmodconfig build.
> > ...   
> > > pcie-dw-rockchip.c is similarly broken by this change, except
> > > without the superfluous wrapper:  
> > 
> > That one did get built.  
> 
> I build with clang 21.1.6 for arm64, in case that's any help.
> I don't see how pcie-dw-rockchip.c built for you if FIELD_PREP
> and FIELD_PREP_WM16 have conflicting symbol names?

I would expect gcc to have found that 'silly' error.
I'll generate a v2 soon.

	David

> 
> > 
> > The problem is that FIELD_PREP_WM16() needs to use different 'local'
> > variables than FIELD_PREP().
> > The 'proper' fix is to use unique names (as min() and max() do), but that
> > makes the whole thing unreadable and is best avoided unless nesting is
> > likely.
> > In this case s/mask/wm16_mask/ and s/val/wm16_val/ might be best.
> > 
> > 	David
> > 
> >   
> 
> 
> 
> 
> 


