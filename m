Return-Path: <linux-usb+bounces-31343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F6CB0DFE
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 19:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A431301CFAB
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 18:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D96E303A26;
	Tue,  9 Dec 2025 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgmPErcd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830B26980F
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765306497; cv=none; b=KHn515WTnd7nzViUVmW4MqnSbgERfuFpC7FiClRIZAIFDR6pv/WbsPQQv2ncL1NWRWTbsS2ARkjbO27IevCSkEPcpoDAE3a1Ugyz3akCFtmWImy68Rmm8978zYp6ORH+92UOqQM4XQeB699b+0B6LiFAJc3nCNAoTUzAOTkuNKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765306497; c=relaxed/simple;
	bh=oxnsSzSSQAu/Bk/v2zSRSRpD8UW0cATc07H6GarnzDA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrVO4PhXhCDzvosam8x/xiCZ/N80GzdjXpeUpqFZCuKlhlmrHGiKiTgUjTbhH2SeK4HvOCLEC/jgUh6a+3/f5sw5CQtYJBKyB85E3MHFXSuiJ1eTujw4ovaseGu+VXfGjqVX8Cb6aZmEMbZ6sfxZJkdGo1ZLDxrKOkOpR6zTClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgmPErcd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a1c28778so75546645e9.3
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 10:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765306494; x=1765911294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpdLUaMszOte+9P9trLbr49o0T/8IL0zVkv1y9a6ACQ=;
        b=hgmPErcdpbOmWNv97DFI6MjvwovMomPavckD2iQ/zkYmw1PxLyXmJNwIWcKt5I0EDk
         U+5r5ujCHuKSyWjPGyaBIqyP4UmwKS+lUsWnqCCLTwKg5GbDGIkrA16ZidVCfyFlDwCU
         hPT2D9Ki5Tl88Y0jMGMa3SPDMA7LYl2LbkUT2fOsuwB1psGSHE93Twai/5sDGyyyeBSI
         TPQxA6fONxJKZjbFxAa53IJsk3n2T4gytPU7mD5H2QKFqRi9ESqMzGwApHiWW0P9uciX
         N17Av0DtfJjkw7TJ6YyWk/JmhOV8uS7XcLGfr2WhQHXYLXg35yxesgy4BqgXfzIYdr6A
         0iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765306494; x=1765911294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HpdLUaMszOte+9P9trLbr49o0T/8IL0zVkv1y9a6ACQ=;
        b=M110aiWGXj0DFdfNZExGGgVLUkikPkEpV12HpoxKoyM8qPqUDAZDiJOC07cU9v2WCa
         7l7lnXFAb8sT3WsC2Xef7PoNGHMrrakVr7m/tOym/eVH7u/isq0lZcoowK4qJuKB+2JB
         Sdqv4ffxvBOqWhE1etxnuQAPRteeYzWbYUvUihacqalaRaSkuYwGmRF/63Hi0y+nTS36
         Gojx2jzet3VPNYuvof3if0xywGYKjEsQJzNT4aWXXgLko5nUsBB6pEY2/hXMLzLhdeIY
         r4pZsbqB04sAKAFZyP/oW91gqJVZ/QSwmzJfsnNfxFjVS3U/5tmE0moTogKRlgvGlQpe
         G3jg==
X-Forwarded-Encrypted: i=1; AJvYcCVixAJt6KVrj5pI4Ou+z4aESwaA/BpPNx7SWwXV98lQpdwZYwSCiLW7Lx+up32KohzERaCUwc896i8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13hMefqcLW/q4jRSw/XRx2ImFJrW4xc9JGkE5hoAuAL2P8eR0
	wtvszNyVk9mleFgzQH2RLZ2P9IlWoz2wMajMlp/XEhCSvxQRQAHGZYhS
X-Gm-Gg: ASbGncv8DqV6vThVRiz9jraaWo/YGW8b7tPBHDu1cnA9nNK6G2+dzXEkFH4B87qQ91O
	z+qxC7sg8OG6HXDRBC1grCNAI8cn5iwd4SkR5Nf/nuLFRmsTlBZIH/gcu4Hhlypx5RnN5lYLNx+
	PIAPkj9F96XDg9KXJMO+Oj/xIzIxZwsW4vUe6QoXbba2NKmeDFAfl47X27IT+/RV9CbT4DN0UlZ
	KN7SGb146Nl5Lo3lKgfeTnXPP6/p5f2+/W6zFVHioo0hEvHYTBV9C7CFe8fJRNFSkE7OUV7DNLm
	yFePzUvHTKdZ7pC4riSu2OWk1guh89IYKNa3SgzjqN6YyqIpv3IpFvJb3LEw8V+rIwy+WbyupEx
	PJ30J9lLup5taQ4gay9qWurA8fYn8867Lg6Qd2aKECQu3S78kKLPcqHoShPG0VmctO1QTQ8tIdr
	7I+Xf+SL+JPz8NCajGolsVQz51Dos2AiSwr+lQWw+YBxkZE4AdNhDGQ9icawtabrI=
X-Google-Smtp-Source: AGHT+IFirw91TWSXU8QHpRvuGGX1U+haycOXGSNcwfW+RwtLxsf2h/xkUvj8XnU+zmLfR4fhgmr1+A==
X-Received: by 2002:a05:600c:444a:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-47939e20a92mr115156485e9.18.1765306494210;
        Tue, 09 Dec 2025 10:54:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331092sm33581359f8f.30.2025.12.09.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 10:54:53 -0800 (PST)
Date: Tue, 9 Dec 2025 18:54:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Simon
 Horman <simon.horman@netronome.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 3/9] bitmap: Use FIELD_PREP() in expansion of
 FIELD_PREP_WM16()
Message-ID: <20251209185452.707f4dbe@pumpkin>
In-Reply-To: <aThETSRch_okmCbe@smile.fi.intel.com>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<20251209100313.2867-4-david.laight.linux@gmail.com>
	<aThETSRch_okmCbe@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Dec 2025 17:46:21 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Dec 09, 2025 at 10:03:07AM +0000, david.laight.linux@gmail.com wrote:
> 
> > Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> > not be used outside bitfield) and open-coding the generation of the
> > masked value, just call FIELD_PREP() and add an extra check for
> > the mask being at most 16 bits.  
> 
> ...
> 
> > +#define FIELD_PREP_WM16(mask, val)				\
> > +({								\
> > +	__auto_type _mask = mask;				\
> > +	u32 _val = FIELD_PREP(_mask, val);			\  
> 
> > +	BUILD_BUG_ON_MSG(_mask > 0xffffu,			\
> > +			 "FIELD_PREP_WM16: mask too large");	\  
> 
> Can it be static_assert() instead?

No, they have to be 'integer constant expressions' not just
'compile time constants'.
Pretty useless for anything non-trivial.

	David

> 
> > +	_val | (_mask << 16);					\
> > +})  
> 


