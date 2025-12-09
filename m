Return-Path: <linux-usb+bounces-31304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C7CAE915
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 01:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81942306220F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 00:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDC224677A;
	Tue,  9 Dec 2025 00:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JakMt7fu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81821B9C1
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 00:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765241681; cv=none; b=iRnn9yj4EUfQN+XnIGdM6C+no3LCmZ8X7zEfI8sI0cTErR+ZFCDVos+3FMTn7fIx1L6vlAZIA9rv8biNTDNHxVg1LN+1/qzL2ZEDtv5tVEQnsa4/5UoNKG7ZJLhgjz9nAXjE9gh97mc3b0A9Mz4OGOEOFjWyjTueR54h7keVnQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765241681; c=relaxed/simple;
	bh=R3HTORznw4PunwqF5UY9WmY5UBYOQRIYE2ddOQAl1b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+YHBndHREyOOf5SSTfDCjcNYxXcoliqE/USXO+XIG031O2gpLOXFybNrPp72NF2k8S/6nWMFFE7W7gqiV3nWo8Ox+yDurXD7cE0X6KdB6a5v1DClSdr+1AQ3Af9AvjBv4dbNegHr2gfprKfxL8446mvAc3M65Fx+NDuLRLTmok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JakMt7fu; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-786a822e73aso49360047b3.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 16:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765241678; x=1765846478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QbmgJ8SXgomnhQrXnal/L3T1Ho6uY0BHQ64Obkt1Fv8=;
        b=JakMt7fuilJjKdlo7uEZDz92zRGanV6aKn7FxK7IezO0g8khU/oDwKmlOpnq6GgXfD
         xeQprUuj4YkXRWOfkIteDPyUQkXHbtdbWrm3hzednT+CcExSUWhW90hOkSybdYNHIf7E
         84V3gRBzKnAxtcsKYemeBd3ax1TBGv9DWAuMmOV4OEibTx78hP3difkexHL7k6rdg3Vo
         PlbzR3+ngGgruDAG6dbUlIYD2OcN/kBDXMxRptRobFm6vLFPmKuREfKTUcFYWVey7t8v
         pnIzqTlA8n0vuU3tuyJHNXOuL8Wsq9UGDDooiNFzmqycMb5sB/Kr90nu60b0QBdIhEBf
         pXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765241678; x=1765846478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbmgJ8SXgomnhQrXnal/L3T1Ho6uY0BHQ64Obkt1Fv8=;
        b=ADKm3BDa8h5AiUoB8QX2OsgtDOrpTZxB7ZXZxLvSW7rZsVvgewlbvmWKlCkXC85Ckt
         HR8i4EBcNZ/cnVUUSFyH28CwfHyDx4OLOSsYeKw42ij5Y9jJKYeYdKfgOhiBCDqdjjSd
         DJGVbD5LRH53eNDmeC6r/PALwA4oZxZbnHnkfK/v/x/LFfQZlxp/ADAAMCrykdc3v+vl
         YnK2RTp+7DXkU09WgITOxxi4Otyp6whOa7eQlEY+RWY5NQtGMAWj+tMLVzvnBVXlKUcg
         /YPGoFnXHw5XhyX1m09aWGSXKh1jOFpmSoflFAF1Pq+snEfvR/vwhSLVkMcUSRqbH1Sd
         kSxw==
X-Forwarded-Encrypted: i=1; AJvYcCX+LmYX/FUfAxf2eWiVs7oRXM2Te8OFlqCD6nJy3EG21Rn6Oa0sBjRyZGEl65aFrufseC48VxH82MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSA/aWOrCzsfou2F5H49EaVuC4CmqO0suZHUHLYttY9AYoHi5
	GuyGGS1n1g0fGPCMnqRCkebvEyG/yqLPb6FZmColGmPpOI70Sz0OJ+fQ
X-Gm-Gg: ASbGncuHsC3vQF4ezkCx02egbzi+Zqzx1E2v9RZwl5uQzwxi8WKDTkY39KSCHc9Acxg
	UbZf1wmzSMfKga1N9ByXAQITlGYoJICO2odX2Va/KCMPDZOhB+DLgnO1aU2JUGmxIiXCqSflXY/
	YFD6Jg3NN9jpUME0CRs0lt7foBLorOl+lYiJJbXaimcf0SLmc+IoPpJg1QWzp+I6sf9SiWsQBg+
	qQDg87CIe2wF4ISK0PegDcLo1icxS8MYLRSgon8pzFFkUNp5DMgX7VhQttbEwwyvnlJsDAmSD+2
	eKCSjnPhwjOUNmvjOWB2+tLlSZLy/rqaM4UnKg9X5Zp4L/uPy2r8qqCCT1HLGK6s1gt1L6YOyUN
	vuwJa/iIO5mpg+MeeQ7nQGJhVtk02y52/3rvrwk41DXpJ4rOMn6LvfFAIIuwlJwYrXTeK6oW5oY
	kmEYaFnRfdwzmYbzAj
X-Google-Smtp-Source: AGHT+IGUOc32nFKVkZfeW+FxsgKA89R8HgWPXMfk7Jq7N7c59LFlMQorOiV8lriyGNd1TCHgnReG5Q==
X-Received: by 2002:a05:690e:24da:b0:63f:c816:1171 with SMTP id 956f58d0204a3-6444e74d0a3mr6406509d50.13.1765241678443;
        Mon, 08 Dec 2025 16:54:38 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:1249:65ad:a6b0:361])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b78e18fsm53950567b3.40.2025.12.08.16.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 16:54:38 -0800 (PST)
Date: Mon, 8 Dec 2025 19:54:37 -0500
From: Yury Norov <yury.norov@gmail.com>
To: david.laight.linux@gmail.com
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 3/9] bitmap: Use FIELD_PREP() in expansion of
 FIELD_PREP_WM16()
Message-ID: <aTdzTdoPLJqvgqZ_@yury>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
 <20251208224250.536159-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208224250.536159-4-david.laight.linux@gmail.com>

+ Nicolas Frattaroli <nicolas.frattaroli@collabora.com> 

It's always good to CC an author of the original implementation,
isn't?

On Mon, Dec 08, 2025 at 10:42:44PM +0000, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> not be used outside bitfield) and open-coding the generation of the
> masked value, just call FIELD_PREP()

That's fair.

> and add an extra check for
> the mask being at most 16 bits.

Maybe it's time to introduce FIELD_PREP16()?

> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
>  include/linux/hw_bitfield.h | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/hw_bitfield.h b/include/linux/hw_bitfield.h
> index df202e167ce4..d7f21b60449b 100644
> --- a/include/linux/hw_bitfield.h
> +++ b/include/linux/hw_bitfield.h
> @@ -23,15 +23,14 @@
>   * register, a bit in the lower half is only updated if the corresponding bit
>   * in the upper half is high.
>   */
> -#define FIELD_PREP_WM16(_mask, _val)					     \
> -	({								     \
> -		typeof(_val) __val = _val;				     \
> -		typeof(_mask) __mask = _mask;				     \
> -		__BF_FIELD_CHECK(__mask, ((u16)0U), __val,		     \
> -				 "HWORD_UPDATE: ");			     \
> -		(((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) | \
> -		((__mask) << 16);					     \
> -	})
> +#define FIELD_PREP_WM16(mask, val)				\
> +({								\
> +	__auto_type _mask = mask;				\

Is __auto_type any better than typeof()?

> +	u32 _val = FIELD_PREP(_mask, val);			\
> +	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
> +			 "FIELD_PREP_WM16: mask too large");	\

Not necessary to split this line.

> +	_val | (_mask << 16);					\
> +})

Can you share bloat-o-meter and code generation examples?

For the next version please try to keep as much history
untouched as possible.

Thanks,
Yury

>  
>  /**
>   * FIELD_PREP_WM16_CONST() - prepare a constant bitfield element with a mask in
> -- 
> 2.39.5

