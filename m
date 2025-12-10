Return-Path: <linux-usb+bounces-31362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E84CB2937
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 10:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D08DB3107BA5
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025B2279908;
	Wed, 10 Dec 2025 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsSAxWfh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C605F263F5F
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765359249; cv=none; b=qkzIJ6PrAwwXhlx1YB/tTkdyaRrEFZX2BXmtYCr5IQZQsg4wSxQKsWxV4VLqcanmD2gDaE6pGCUKqBxNF8WJCWyxNkb3aesCYwPvVwzKEJ2NBXL7XHSySdyW6wbOVKnSI1b4Ggwj9FLIM9KxZn/SgDH4KJGJMjoX6AICwpQW+p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765359249; c=relaxed/simple;
	bh=M3M9okF8InGndq8/V81yatcnsCbWgobmk2l0EWs/1+g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i0BzvD9ByAbEO3KvQeSyeG5hKBgkVCafrFlKg5KZKplruJkPp/UNdwLCKVf4/0mfMO9Oaj1Y9fY0vpVH+BibGIaTD4hq0IITKvhhu+RDaURT3NXpQFMgFeNu+L6FII8UfzSn5UV+aikmscpxMRkfm+uOrWAP1klwjEBHf+dXfiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsSAxWfh; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso3811775e9.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 01:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765359246; x=1765964046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhQYB4KwC3z/GZcHsZYxbavJNnVI8WynGF/8rShdEFo=;
        b=lsSAxWfhj63h4fO6V8pXNUm0Yz6mM5aj6eLI4Lp+vKEj52eoKFVL8O36lv0EqgOjyt
         GzF+SmyJFmBfqwNERymLyEXfpFDu7Fb51LYl7lXkGps75rOyvI0h88PfaXBrh9vBlDyQ
         OjKUb5BMvV+elWtbhLYzQQdnwlUUeCIDOcrNiGF7fKbM2EVitO3j2WuNR0Dk28UeuJJV
         loX/jLhuCYRVSE/UHRVEGMJkuAig99Nrn/haghhvuHyatpGvUWyc1BXepPaYeW3Xvghu
         CgpDHUlLw97zkXs6IzxjJgis2vfUziBGNyPO5bVW5c/O98CKaBp+fr+mG3cgJXytwz6m
         XIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765359246; x=1765964046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OhQYB4KwC3z/GZcHsZYxbavJNnVI8WynGF/8rShdEFo=;
        b=nw9K1SiHUkwsbTKe0ngI7Y7mCxDjJFdQ+zgnuUPS4otRCC+jfJMKdYCUrDNwXZWy6o
         VtuNd4+BZya1bAnqa0uREGWk0vEG7cORqvLUHe1g5ytuXVLUljsVWeBFLWHCWtyxdngf
         hBoBLeJF8gMXMVrum2DJhNyR/MULaLspqVF0eb61H3f269zU0vPcxejhq232us0FhDSL
         +8DHo9KEBcsQLMzaxCK6OSeHAyQEDkJl6xV8BZyAdJaz9VMBsfQPiPssfLMS532GcXQa
         OWrql3/ntcWLPcALfE2PrPq0cRDG702q5+mwlEOw5DXpouEX1kQWeE/K8ZMaxEOZmedu
         6IUA==
X-Forwarded-Encrypted: i=1; AJvYcCVHep4lQlm7BcPInCBdWZVq634ZJWxMNRraT7oKMMhc4DOn/8ZyknYf/ndqK6AvNZRpY2OGpxya9jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdC+jKJz4tKp4Rm5IjesI666LRl5aYI7K2kQGDNI9lRhqWyoF
	dj32S9WzzYSV0NDxq2YigcvSxEDUgDKxlq/wGQpKend8eSA5BC1Hdiv5
X-Gm-Gg: AY/fxX5ajcnHmJR0ht+U1yXm+Z13z5jO5/DiRi5+uve42GYHn3ijAgv7WTrTwz7LHfP
	VMvYrdSKn/6isMdxRIqM1RSC+w4cdTdPN8tC1q4vAZbaKxT9KOJGM1/MWXnnQiZcDq8kERUurFT
	lAi5TgvgFY1R8ABh1DTGcCAbod5rvv0VUNd/+goaaZ/EtYN0G8D8tRHFiCRRoaSesNOF0huV68N
	p/3KHskXPKaXqob0ZR37HlABaX6Cb65G91XA9Zutf/gO0vn4LhJK3iH23YBBkNWzqjiRWT5nVro
	e6r8aaV+lbfL5XqtNmxpOt3mZwevgdGCcr3K3jmIVXR/NMPIP/V+5qvSXs+YAWoIHLowX+5c8xe
	O6/H6FRkegdImN9ZO6Uw23MJ5x2Y2vYDIhSdjpK4yCSRY5OV3WpzQYrK+OmGYBTUIMBW4dzkGPs
	/6M8ymmWtLBZ2JzrQ4WGvLad3g+rx7thKcXuE6Cr/pDkKMOK1iU6lo
X-Google-Smtp-Source: AGHT+IE7rYejhRbyl0DO+pkIwWD46QEKa2tZgut7YIWRTjFqNP11BsWUZQcBOZystZ2OE7SoB+Sumg==
X-Received: by 2002:a5d:584a:0:b0:42f:8817:7ed with SMTP id ffacd0b85a97d-42fa08697aemr5623626f8f.30.1765359245754;
        Wed, 10 Dec 2025 01:34:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe8f85sm37665903f8f.5.2025.12.10.01.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 01:34:05 -0800 (PST)
Date: Wed, 10 Dec 2025 09:34:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Simon
 Horman <simon.horman@netronome.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 2/9] thunderblot: Don't pass a bitfield to FIELD_GET
Message-ID: <20251210093403.5b0f440e@pumpkin>
In-Reply-To: <20251210055617.GD2275908@black.igk.intel.com>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<20251209100313.2867-3-david.laight.linux@gmail.com>
	<20251210055617.GD2275908@black.igk.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 06:56:17 +0100
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> $subject has typo: thunderblot -> thunderbolt ;-)
> 
> On Tue, Dec 09, 2025 at 10:03:06AM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > FIELD_GET needs to use __auto_type to get the value of the 'reg'
> > parameter, this can't be used with bifields.
> > 
> > FIELD_GET also want to verify the size of 'reg' so can't add zero
> > to force the type to int.
> > 
> > So add a zero here.
> > 
> > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > ---
> >  drivers/thunderbolt/tb.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > index e96474f17067..7ca2b5a0f01e 100644
> > --- a/drivers/thunderbolt/tb.h
> > +++ b/drivers/thunderbolt/tb.h
> > @@ -1307,7 +1307,7 @@ static inline struct tb_retimer *tb_to_retimer(struct device *dev)
> >   */
> >  static inline unsigned int usb4_switch_version(const struct tb_switch *sw)
> >  {
> > -	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version);
> > +	return FIELD_GET(USB4_VERSION_MAJOR_MASK, sw->config.thunderbolt_version + 0);  
> 
> Can't this use a cast instead? If not then can you also add a comment here
> because next someone will send a patch "fixing" the unnecessary addition.

A cast can do other (possibly incorrect) conversions, adding zero is never going
to so any 'damage' - even if it looks a bit odd.

Actually, I suspect the best thing here is to delete USB4_VERSION_MAJOR_MASK and
just do:
	/* The major version is in the top 3 bits */
	return sw->config.thunderbolt_version > 5;

The only other uses of thunderbolt_version are debug prints (in decimal).

	David

> 
> >  }
> >  
> >  /**
> > -- 
> > 2.39.5  


