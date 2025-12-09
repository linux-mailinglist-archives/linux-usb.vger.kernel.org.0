Return-Path: <linux-usb+bounces-31318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A52CAF7F0
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 10:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 379463084284
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 09:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0F2F8BDC;
	Tue,  9 Dec 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAOqwt/I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160928DF07
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765273479; cv=none; b=Sac/CEgqOH5RV+TwH5JW/bS4ioaehjTHgGU2Jf4sk04HqamnjGXvqKpwQueNkt97xg0N1NzBfx+0R6fFgfMia1kb4rWYonQJ6beooepAAtBJphe+QQ1NkfZRspKas7yDohdW2j+LLCkvb7GA8UlK8vl4V8eiE+9HMzAFOZirVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765273479; c=relaxed/simple;
	bh=8vdv4yr8ba5Mi4hoItSJoOgm+sx3gDJTt66t3a7BHyc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAa0Xm1OUMT2wDFPnTCj4T2YpyHes/2taYNezt1YQYvXWCMrONpzwU/KpCwSLIoXZ5RJA/L4A7uWyg42kv3ww7cgNz/T8/AQ02N1eAUJLbh3W8Is3AkZAtxpAtOmc+Rns8s1Ib2xH+1Z7RqPuuuYTHmupRAL1hRyauS8HH0f3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAOqwt/I; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso39740755e9.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765273476; x=1765878276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTFO6ZSVbqg5cNw3sne2kKUbTWQNeVaUcpcLa/7h/qo=;
        b=bAOqwt/IYqF6oG8i8/v6a5PdK3yoIxBSoGS1cCcfxQQpfQ6B7hJU7AXJ1zcitb35p6
         CBxcvua4BnxDapiT4gXl1I6FEMyVU8QZVC5lFwrybRlB1lk2u8PCXda9u5fFNAJvwMt2
         KanAxLwvyWwRpuk4FJ7cq07rz6d+ycDe/xhcG7u2FFQkvqJ1LRJGagR/3F3fDRqQ9h8x
         cwsAc44P/0hCyQKAaZOVRifGN8DpFOhre27gn1dB6I16n6ThvktljwUNXLnaQ4TNrgDy
         7tmjqfR3aAgD3gGaKauSdMftJeSOutT9OXlnv0JI1qKKXJOD1gMFKSohygb1Knpd1RZj
         C3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765273476; x=1765878276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTFO6ZSVbqg5cNw3sne2kKUbTWQNeVaUcpcLa/7h/qo=;
        b=h84UTT7NXNwsgcVQbpJkrt3O9DX50SiZeWQ4T+6ZNYtNuAqYCbKTKVgWVDzbL9QEPr
         J8vCLBT/gmV/drfLZmoTRlKWNU3+4WJl/3dDLmledjfbUeuIRPvKdIXDfkg7NvYxfXDd
         YkumWWyViocvkjZLMWD7U15vet701DZgU9QxhOVk/ztFKXQfRYznISlN1akdvakwTJ2z
         xemT4OYpEWP0fSx+0QzDSv/ec0L1sBvCXOY+cGXZWZGOSRvV7QDxITO28esPUb6iQhBo
         WpdNsc4pAVq328qEc5p47iI49iNniM8OjSCbrfWFJnih5Wc1B4oMSWjxgCTnARU516vu
         756w==
X-Forwarded-Encrypted: i=1; AJvYcCXjlTSRVbxnR1egrognSt9PK9Wa+aBB+o1/pV4u43kNhgtXGi9STwMh5oKBKAuYfdXT3WZBrkQist4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJfeq+C9LL5VJlSLPEV4COPHHUge4BN2ljCrErCGT1Me1friI
	XliK7iiz5fnXUBoz93Wd8DBqyKYwjhFyH0M03LsFPNPc3ac7cWwMCAl1
X-Gm-Gg: AY/fxX6NxE2tydZkgvicYrIn23DHDgZOjkIar6PUfDSll4yqsnXb9M9nB5Uu0+GrSCr
	DKWChEMaK2ojTON8E25PnOmCG9g7EH4lQa/2OFxVqLSelz/vEXnXq3/Jfi1jL1fJ+wJzcPGL5vY
	Hq2DkSOEkfDcEYLMJbH9M4UG+1H9SkL+hFEoI7Sf7MwTtks8EVMQh3HGGa0zKt2HnbEmIGmaYpp
	IyC/m6EZCgn/A3IgBkR3gPHdav7FURGeq3xo/GfcikghzVsQzQ/Bc27F3T0NinSktAVH/ddDht9
	T6pTKWcybNswi0lNVPDvFYJ5hqiSnnrO/j0bni0ucL8X2r70UDRabiHzz/hNOlA1DTLwdeu+N9I
	jImqhkmh99tBRdpcvCl/sRql9ORqpdjXsPjx4bg1T107c4iBMqiMWXKiFJSZm+eJkjziLGQ8gG3
	4mA+jVSDQyOx7CCwnm9yYpkUgApBcY8KNse9aF9hhrimW5eUVuRnWR
X-Google-Smtp-Source: AGHT+IHrJDrWaABHIRTeuvG2zFhXIU+ST2jOsXds0P3glgaBQZcSHGkgwT0Qbc1qhO2zyeSs/kfp/w==
X-Received: by 2002:a5d:6952:0:b0:42f:8816:ee6d with SMTP id ffacd0b85a97d-42fa091ec48mr832773f8f.31.1765273476003;
        Tue, 09 Dec 2025 01:44:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeae9sm30973774f8f.13.2025.12.09.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:44:35 -0800 (PST)
Date: Tue, 9 Dec 2025 09:44:33 +0000
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
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH 0/9] bitfield: tidy up bitfield.h
Message-ID: <20251209094433.768a76ae@pumpkin>
In-Reply-To: <20251209070806.GB2275908@black.igk.intel.com>
References: <20251208224250.536159-1-david.laight.linux@gmail.com>
	<20251209070806.GB2275908@black.igk.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Dec 2025 08:08:06 +0100
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Hi David,
> 
> On Mon, Dec 08, 2025 at 10:42:41PM +0000, david.laight.linux@gmail.com wrote:
> > From: David Laight <david.laight.linux@gmail.com>
> > 
> > I noticed some very long (18KB) error messages from the compiler.
> > Turned out they were errors on lines that passed GENMASK() to FIELD_PREP().
> > Since most of the #defines are already statement functions the values
> > can be copied to locals so the actual parameters only get expanded once.
> > 
> > The 'bloat' is reduced further by using a simple test to ensure 'reg'
> > is large enough, slightly simplifying the test for constant 'val' and
> > only checking 'reg' and 'val' when the parameters are present.
> > 
> > The first two patches are slightly problematic.
> > 
> > drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp_eth.c manages to use
> > a #define that should be an internal to bitfield.h, the changed file
> > is actually more similar to the previous version.
> > 
> > drivers/thunderbolt/tb.h passes a bifield to FIELD_GET(), these can't
> > be used with sizeof or __auto_type. The usual solution is to add zero,
> > but that can't be done in FIELD_GET() because it doesn't want the value
> > promoted to 'int' (no idea how _Generic() treated it.)
> > The fix is just to add zero at the call site.
> > (The bitfield seems to be in a structure rad from hardware - no idea
> > how that works on BE (or any LE that uses an unusual order for bitfields.)  
> 
> Okay but can you CC me the actual patch too? I only got the cover letter
> ;-)

Ah, sorry I'd changed the git settings..
I'll resend it all.

	David

