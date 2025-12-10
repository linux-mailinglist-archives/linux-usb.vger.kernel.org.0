Return-Path: <linux-usb+bounces-31371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F214CB3C9E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 19:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B392305B59B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 18:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41F8329367;
	Wed, 10 Dec 2025 18:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iURLgJFw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4611D7E42
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 18:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765392345; cv=none; b=Dvewl9BMO2oTGHabGZdFE8UdgsbNYdCx/8YD1la2YJypALg8EjcQtVv+x1UgD9ja9hzXy110kAmKCtOkSQeL7QBTpvRZJXRjt33gkxyTzypWOwglBYe+jKlc/5RPQEOEb42hg0UxJ2dZU4X4g2TGR2zbJ46cw9MdxICoCG4yNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765392345; c=relaxed/simple;
	bh=t7/Putf0iwaHC3Fwy9HCNAfeymtD9y6WUelPzXFP2Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6mTawHIoXDoqqqPUlnsQyeqzfkbFh6NXH9C5zIXEuCYcl9WFZiEBfDKwhVWQvX4X8guvdgGj7Lm/DgZ5C961i9sI0Qyj5EisjUQK/lG9/6hl9gWvEOpdIwPpnezDetCOY7Wv3wo5NU2iF+Coaj/sKjmF/s9eQN90n1zL2IB3NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iURLgJFw; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6433f99eb15so127160d50.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 10:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765392343; x=1765997143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NKWMAGHjySPur4SPWNwyNpZjWd2mvX3sGd2Im7efoPw=;
        b=iURLgJFwEw+KnLSa2GZhP0G/xmhccY5qWJms2ru00fJkOUgqcDZyRN1QfCocYf5sBR
         wPOEmvWDEi9fpx0rgvERrdp86G8LpbrpG8Dz5rqYCEcxluZn7/Yz3hrKz+nHzNZMsYcS
         gpN2zIFqZ7/ZKsDNpVZBQ94irhagXStbGHFw4UviJhN6HO5q2Wg6bLQPalsrWiw1IcH5
         bKuGG1zezDdJ84PQYY8ri6tZfxwCuGKpPgvT205kitRACOjzYoqGqwyBte71P/znlo0b
         JC3GxODOV4VeKfM5Kw/dtUm90mnnC2JxVABWRFGZhFXz2bWLDljGAc4trnuAq37vuWBG
         N/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765392343; x=1765997143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKWMAGHjySPur4SPWNwyNpZjWd2mvX3sGd2Im7efoPw=;
        b=QqvaqDYzZll0GfN1Xy9ZP3H9uQY5ngXmfOSYGnzK+4sy3lnuc+U9ElsSITvjqw4Azv
         kMIbWiBcGW9GNhQ8M7CMx1hpFf1ePJKP7qI7hJp6AmX7Phm0bhrlSbj/wUUdzLgfgEhu
         HcfRebShoCP64yDV/0EsjdepvHlpagjpb59tFXtd6Iqy+JdWq8Tjnxt9U+m2XiPYfYiV
         jthUU8gDcm5xA1xFTjyA3QGApWeniXs3qNfUm5YdcpIzIclEerCgy3u+WozbVcDaqI2z
         NhWFnS1/r9PcvdPcxlmj0VR69yxumyU0Mai74tNHazh68gECYo0jZXSK8C9vYFZXRa8J
         Tcdw==
X-Forwarded-Encrypted: i=1; AJvYcCUY0taSlcKeN9JB7AguJwxdl7+KIPMc2uwgEfT6MMe4xXJNVEGcjxIYvxP/tygFr69xZxAUg30mzx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOmfpdG5+5RbvAr8XHAqbKRj7iVT2quPld3ZR3iud2XqUSrEGK
	ZnUUk2rwt6tP8toAjVcRdC3fzWA+SVQhw6yz7es+8z6broqfO/oxFfTD
X-Gm-Gg: AY/fxX7GWQ7FT9246GoATCi6XVpKnuR2N0Obtll4ODh0UEb0q8v9WnFb7AYd3eZ7QKD
	5Zfmz4avESRtK0GZ36VJkjYtCAxGIlxGJUQGB+srGYCwemaZGAgQgDs3/utvURvYqfnYnS+THU9
	s45tKPVmz1xjwSOKhOxxnz9e8pLjsYOtMDxGSCGKJr/JTtj3jaou3PiMm33PpjuaNTUCw5e7sMM
	/I+cXcDOeqlk8kwiqLp27IY1ERFVjrysmOKsyCf71+bGUQyp/1vZDp5Zh3k4XZN8TYmxb6HC7fm
	PG47L/dfHLbGn0QThToPH3ds6TemZBwbhTB+Yz7NslMLO4dvcc6WM6u11G7m6h6mmvbt9iafO4K
	4HEIWwXn+PyQ3dl3KPdHl/abY3zIH88QjWOHNaOwfz1DH3l2HrwwUqJMcJub3IOvmuwOODa1D7+
	O8EtVDdp4=
X-Google-Smtp-Source: AGHT+IHq6bwat4MhwQe1AguHAFxnp5U2Bs8TJxUWtTtn0EtgRmStw4pjkxRdMxlyDvVig7YOr1+nUQ==
X-Received: by 2002:a05:690e:4284:20b0:644:6c79:62d7 with SMTP id 956f58d0204a3-6446eafb7acmr2315073d50.63.1765392342590;
        Wed, 10 Dec 2025 10:45:42 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:74ed:2211:108a:e77a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477d3a336sm189571d50.3.2025.12.10.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:45:42 -0800 (PST)
Date: Wed, 10 Dec 2025 13:45:41 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: david.laight.linux@gmail.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Crt Mori <cmo@melexis.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Simon Horman <simon.horman@netronome.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 4/9] bitfield: Copy #define parameters to locals
Message-ID: <aTm_1cJhtnrCy7FM@yury>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
 <20251209100313.2867-5-david.laight.linux@gmail.com>
 <aThFlDZVFBEyBhFq@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aThFlDZVFBEyBhFq@smile.fi.intel.com>

On Tue, Dec 09, 2025 at 05:51:48PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 09, 2025 at 10:03:08AM +0000, david.laight.linux@gmail.com wrote:
> 
> > Use __auto_type to take copies of parameters to both ensure they are
> > evaluated only once and to avoid bloating the pre-processor output.
> > In particular 'mask' is likely to be GENMASK() and the expension
> > of FIELD_GET() is then about 18KB.
> > 
> > Remove any extra (), update kerneldoc.
> 
> > Consistently use xxx for #define formal parameters and _xxx for
> > local variables.
> 
> Okay, I commented below, and I think this is too huge to be in this commit.
> Can we make it separate?

I'm next to Andy. The commit message covers 6 or 7 independent
changes, and patch body itself seems to be above my abilities to
review. This should look like a series if nice cleanups, now it looks
like a patch bomb.
 
> > Rather than use (typeof(mask))(val) to ensure bits aren't lost when
> > val is shifted left, use '__auto_type _val = 1 ? (val) : _mask;'
> > relying on the ?: operator to generate a type that is large enough.
> > 
> > Remove the (typeof(mask)) cast from __FIELD_GET(), it can only make
> > a difference if 'reg' is larger than 'mask' and the caller cares about
> > the actual type.
> > Note that mask usually comes from GENMASK() and is then 'unsigned long'.
> > 
> > Rename the internal defines __FIELD_PREP to __BF_FIELD_PREP and
> > __FIELD_GET to __BF_FIELD_GET.
> > 
> > Now that field_prep() and field_get() copy their parameters there is
> > no need for the __field_prep() and __field_get() defines.
> > But add a define to generate the required 'shift' to use in both defines.
> 
> ...
> 
> > -#define __BF_FIELD_CHECK_MASK(_mask, _val, _pfx)			\
> > +#define __BF_FIELD_CHECK_MASK(mask, val, pfx)				\
> >  	({								\
> > -		BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),		\
> > -				 _pfx "mask is not constant");		\
> > -		BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");	\
> > -		BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?		\
> > -				 ~((_mask) >> __bf_shf(_mask)) &	\
> > -					(0 + (_val)) : 0,		\
> > -				 _pfx "value too large for the field"); \
> > -		__BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +			\
> > -					      (1ULL << __bf_shf(_mask))); \
> > +		BUILD_BUG_ON_MSG(!__builtin_constant_p(mask),		\
> > +				 pfx "mask is not constant");		\
> > +		BUILD_BUG_ON_MSG((mask) == 0, _pfx "mask is zero");	\
> > +		BUILD_BUG_ON_MSG(__builtin_constant_p(val) ?		\
> > +				 ~((mask) >> __bf_shf(mask)) &		\
> > +					(0 + (val)) : 0,		\
> > +				 pfx "value too large for the field");	\
> > +		__BUILD_BUG_ON_NOT_POWER_OF_2((mask) +			\
> > +					      (1ULL << __bf_shf(mask))); \
> >  	})
> 
> I looks like renaming parameters without any benefit, actually the opposite
> it's very hard to see if there is any interesting change here. Please, drop
> this or make it clear to focus only on the things that needs to be changed.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

