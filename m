Return-Path: <linux-usb+bounces-31370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E9CB3BF0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 19:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70822300F711
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 18:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435A730102C;
	Wed, 10 Dec 2025 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcRY/Epd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501B2135AD
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390819; cv=none; b=WKvnotaQIdtM93AfXOuGq77KJ2hLrs2TabaxJeyehZageVFSQHFFhuR0JwagxgzGdwvqic8XS3rMrBZsQn4UwzYGluGSQENdU4CBgvEZE8AjxxRL4FxJEyYHh5+K7m7ZyNz29ZxOu5R3zq13Bss0i79oGUYLZqJr1K1UAHYuSr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390819; c=relaxed/simple;
	bh=OMUV2lsVO0vgVB97nGcWM2iaIieqmLn31V/i6wQ/4Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guyDWqavxUGidtFSivIffO9RecuIGdmmw6HX5AudzaQ1mS/u7EhdV6hqP3c4UCpEselctQyOGQxLHk4JPDjdxTMQUAXh6vyrNgbTGLBUKV1zCiKitnPfs79aWAz+0qZi2wg42Vpv6K0Fw7r9/yJhDGy83kMBdlId9GxIKKdUU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcRY/Epd; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64470c64c1bso198963d50.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 10:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765390817; x=1765995617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=26ZykUE68kYzxY2osVKqbTWmByRt6J5f7oLz9O5oLCs=;
        b=UcRY/Epdkux9tCOuz/idsmMCeT5muwsywT4jVrD+B2GQfQ8dcxVr/khT7mYEDIURmy
         neRZXhcgeAvAwRheq/P4CmlilpZKnYEEGCusRG3u4NHpAArbuF8QtYxp++cud6McqbCc
         JHQ1TSG8pqEAQXOjfrIG5WRwGiA/BYXgB4LBMERPa4m41CZNfAycf0IRwsSWYbwRtWIH
         oMSlos0fuFf+kwCY8imNbAF1qQjc/xIgsGqctCHh1kpWPr9VoMesA+ecDmjrp4XAq2jx
         A1+VZlzNk2uq/x0tZF5/g/moaflrXL9TR7Q2BG4wH3hL7BimhddVFXWTfRxYi46zYtZb
         2qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765390817; x=1765995617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26ZykUE68kYzxY2osVKqbTWmByRt6J5f7oLz9O5oLCs=;
        b=oRWgcPe5F31dtERUHgFv4rMK2q2QWM6U6u7RzT11eQZTGOGZhbz1F/Pr+CmW5Hz0Ts
         G1eoynt0H+L6FX60Ylaxv7JDGR1u+2on1c/+lkdskFn8QQetaZ24eg5+SJxROtYqs9hU
         Wv4ZOsnJ+ySWvZO7uAwUYS7uW5Pm/o8hACRG4/BSkG/XNVHQaOgxfB76LmWfmzLtTPN7
         FzrV3fc5UEgajnJDQdCKuChlS9Fg0r47IfOE9RbpfamD5157pzlj/xUso1x2ANBFsk7L
         JHRVacaOPNNkJAp/2Oc4JmsMNUQnEFLLKWnVhXDjslM4mnNu82/gCI7PV0xc1LRP9Zqk
         9zfg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGaJYRC7itBxM78ASJZmDnt70MswDgAUnHGnNl2f0AJzx+FDoVVwKNGaXQMQ/THdk+FCOAF3cLtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbYUvxkh2vbMY0NUjy0rKkL3ptDuGFGOLw0izBgv5bqxzK2Lf8
	50vWlFZ5HqF/ybFGyXjV+eGUlNOnjkw51aSCxNTE32GDWudm3gXyqjxS
X-Gm-Gg: AY/fxX7vtuJoz5wCOQ8XKnCVogdioS7SQzSHOXLdqTq81reJx74hp5plCfKV3cVQxv/
	GAyidZdlrhdc0GVW8SlTmxW8YIRhKLwzNo7Ph9eVwArNRySF93+oMe0ffEGsLNGX81bt3gvo6Rd
	QjDHBV8OzURHRnLKLDDl0bk4SPlwZlGUcq4UKaIGOSlvsPAhS0uLN/ePsJbnvjroiIAitC3f96/
	UCTNMiTXF0UGQUjIxiQ/iR6QsYz9fwoRI9yCwaYuGN5j3SFgRXji4ml9mrF0/CMYsZGMSlpwbBt
	1TIo46d5HWfsipsIaA9mkO+UPUQv+2NfoIt9df1dRbgNMgeljIUG7S2uco3DZk2ZWUlQ+EZavK7
	cCYV8rUrBzQRdWB6TTYVRt484+MXh9s2RnYlN7GcbZv1hVzCwgUFcTELjtqPa9umAHZkD5LfRcB
	0KlU8dWus=
X-Google-Smtp-Source: AGHT+IG4pdaOgBhaD/ogNnuNZowdk6sXIUNM9GSwkyT/kLByNCRMGoQEZX93AEfCrKwGDkqhTH4aGQ==
X-Received: by 2002:a05:690e:4198:b0:641:f5bc:692e with SMTP id 956f58d0204a3-644785e41d6mr233379d50.39.1765390817101;
        Wed, 10 Dec 2025 10:20:17 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:74ed:2211:108a:e77a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477cca6bcsm179533d50.0.2025.12.10.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 10:20:16 -0800 (PST)
Date: Wed, 10 Dec 2025 13:20:16 -0500
From: Yury Norov <yury.norov@gmail.com>
To: david.laight.linux@gmail.com
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Crt Mori <cmo@melexis.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Simon Horman <simon.horman@netronome.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 0/9] bitfield: tidy up bitfield.h
Message-ID: <aTm54HCyCTm5k5ci@yury>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209100313.2867-1-david.laight.linux@gmail.com>

On Tue, Dec 09, 2025 at 10:03:04AM +0000, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> Re-send with patches going to everyone.
> (I'd forgotten I'd set 'ccCover = 0'.)

And this one again appeared in my spambox. Have you any ideas why?
 
> I noticed some very long (18KB) error messages from the compiler.
> Turned out they were errors on lines that passed GENMASK() to FIELD_PREP().
> Since most of the #defines are already statement functions the values
> can be copied to locals so the actual parameters only get expanded once.
> 
> The 'bloat' is reduced further by using a simple test to ensure 'reg'
> is large enough, slightly simplifying the test for constant 'val' and
> only checking 'reg' and 'val' when the parameters are present.

So, can you share the before/after?

> The first two patches are slightly problematic.
> 
> drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c manages to use
> a #define that should be an internal to bitfield.h, the changed file
> is actually more similar to the previous version.
> 
> drivers/thunderbolt/tb.h passes a bifield to FIELD_GET(), these can't
> be used with sizeof or __auto_type. The usual solution is to add zero,
> but that can't be done in FIELD_GET() because it doesn't want the value
> promoted to 'int' (no idea how _Generic() treated it.)
> The fix is just to add zero at the call site.
> (The bitfield seems to be in a structure rad from hardware - no idea
> how that works on BE (or any LE that uses an unusual order for bitfields.)
> 
> Both changes may need to to through the same tree as the header file changes.
> 
> The changes are based on 'next' and contain the addition of field_prep()
> and field_get() for non-constant values.
> 
> I also know it is the merge window.
> I expect to be generating a v2 in the new year (someone always has a comment).
> 
> David Laight (9):
>   nfp: Call FIELD_PREP() in NFP_ETH_SET_BIT_CONFIG() wrapper
>   thunderblot: Don't pass a bitfield to FIELD_GET
>   bitmap: Use FIELD_PREP() in expansion of FIELD_PREP_WM16()
>   bitfield: Copy #define parameters to locals
>   bitfield: FIELD_MODIFY: Only do a single read/write on the target
>   bitfield: Update sanity checks
>   bitfield: Reduce indentation
>   bitfield: Add comment block for the host/fixed endian functions
>   bitfield: Update comments for le/be functions
> 
>  .../netronome/nfp/nfpcore/nfp_nsp_eth.c       |  16 +-
>  drivers/thunderbolt/tb.h                      |   2 +-
>  include/linux/bitfield.h                      | 278 ++++++++++--------
>  include/linux/hw_bitfield.h                   |  17 +-
>  4 files changed, 166 insertions(+), 147 deletions(-)
> 
> -- 
> 2.39.5

