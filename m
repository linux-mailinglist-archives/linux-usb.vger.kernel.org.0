Return-Path: <linux-usb+bounces-31425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F9CBA342
	for <lists+linux-usb@lfdr.de>; Sat, 13 Dec 2025 03:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE5903002EB7
	for <lists+linux-usb@lfdr.de>; Sat, 13 Dec 2025 02:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5DC280018;
	Sat, 13 Dec 2025 02:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmiqz8yK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18E427C84B
	for <linux-usb@vger.kernel.org>; Sat, 13 Dec 2025 02:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592917; cv=none; b=LHGkhMgS5UQ/f1GsXqO6s3ooXWUuDaFIkBxPqf58TQS+c5V32sz3cqE6p2TpR0CjONEDaONKokdV1xXrBLSxDO1svprAMcyGUCoTX89jCC+skAZ4ZFXTy5YwjSm4p3+sOxw9OMjBEvLfn08V2RCPYb6T+VGscOVkrzRE8J2MnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592917; c=relaxed/simple;
	bh=0x1vMcMShduTmxRWyvBiBRlMvGc3ZDzpLSl3K9pvsVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqNBVVu0bkGmmU6RDHNIzwdIxBHPlaAgzv4lSeessjQugQaTdWjQAMlsnGF2NCvGNMb++K4szsRnGJdJdlDm6G/V3FbgPZieEZC4LCvo4Mg3NzceAc6DOeJcvo/gfIwak7hSuq1OwY1I4chX+n3TLVBk6l49grYJ0/BJ9MktmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmiqz8yK; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a835353e4so19848267b3.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Dec 2025 18:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765592912; x=1766197712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8tj7zFmiGIgl+/XLeshTiYqJVDhHxNQCvlvR2nqqLk=;
        b=fmiqz8yKiqzwLZquhd12/HuAp0bAsycTk1IlQwq43jp1H+NwQRey3u+yUmkcuZ+GpQ
         Xjse24767hWTx2b4gn8vZknuwop1ABNj2Hxxv+gESdZlhSdErhrsZmJAGkUJTwBPMQrU
         Gkyiib+2WqAOMVAQ3Ox6DZcdiw1w+HayrQ8bl2Uw4cXpnt8A3jeq9WD/Afr9zhD938jx
         dgOHo0XM/qL974u73KDD+UZKwdejRXMnCn0IdMEsbS9ZwhpWq/LWUT9vBDG42ReDlwAb
         vPA8YPgH7nBoSXaQescWuyeUbx+CISriWu/bauQ8jjQxySlmmjAyF9+xtR+rcPHMj6zH
         3r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765592912; x=1766197712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8tj7zFmiGIgl+/XLeshTiYqJVDhHxNQCvlvR2nqqLk=;
        b=Dy55G6GbkZ0v+9d0ycPYEkr3UQSmG+5g57FLcEcTb3QzMzneytGZc1PDdiLwZeaDQC
         JAe/5SZDM3d3SN/FxIuzzCTsVU0Hc7Jqd4jvSaIbNZRjrfsYZ6aF0ee8jZORR8sNHwnq
         JdJTFjB9Jdc05c03ADY0ut7yNmQ8uMzMJh1BCHIIaX2mE2ox/QqOSy73R6VfCjkIMEqV
         D8PXIP0/wvya9+p1ZhrTbsLDRgAGv2R0zGhmu96Sf+UjOtYOsPH5hyqbe1adeLfzt0K0
         1ZMxTtBQPi0PWrRwfQmNLg12xc0Xe1ecNMAjnjTB1pT0z+l1zbW/nLI3qXpA0lkKvMvb
         hJOg==
X-Forwarded-Encrypted: i=1; AJvYcCXW05K/2zZKDhPlPS3Rs4h2w2AHeUV+RxIdp39I0CdV0t0xsmQvaNTThpVGQmOHI4c2a+X9YnEfRdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LD93vPlKJ4IsvhnZ8S+u2MwAgj0EDLqPGE/+VMzoPUBfeibx
	XrP1NIaaKjgU6+c1wcuY0t+a0AYfCzCICLy74mo7pOBMkUw4BnKt2hgL
X-Gm-Gg: AY/fxX6cYsg2Jj7yQYS3fA1IpGa3yPZ5i4w/DPPUQFTrReD2OiRUOBmBOTatWPqpKAJ
	qzhvp3nGXwHdP3q+rXFi7nbEvdBihIVUclSvJeneeUnshzXvpdP99U0KFnNa6J/Z5BVcb2vHr8e
	nAtYeW3ka7S0kLY05F+mDh3yFw+1zzAmWJEQeo3if+Ze4j6iXvAY8LImev6v3fmY22ixCtL/vwJ
	MqdanJr3jcLB4P9EktXrlwB/bzGWU49K+o1dlbfBEJVGJ7kE9vnyD8TZ5SJiZmoONIszL1uaClS
	lB/PM05zL+hGgSVj8ufYYMD4nM2qWqNGxYUEcPOHuBTBh0Yul+PSht2iL4ZvrqJFOg6NSnX//2b
	1wJOXuND0xePy2oeccoriOOwqKjyk0uOWxvtalbDxxoD0ThUDiD78Ym2v9biGLZnAxQoO+9cw+S
	Ppb+BkMQ==
X-Google-Smtp-Source: AGHT+IGpiya8RbWHXeXIazjjoeNE0QQuWIrlOz/AC0+4esxyba8hfzVjiroZs9tNrTzZxt7cJ04SSA==
X-Received: by 2002:a05:690e:12ce:b0:645:5b0e:c914 with SMTP id 956f58d0204a3-6455b0ecac8mr1974338d50.66.1765592912124;
        Fri, 12 Dec 2025 18:28:32 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:86f:7039:22f0:5fbb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64477db607esm3280998d50.18.2025.12.12.18.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 18:28:31 -0800 (PST)
Date: Fri, 12 Dec 2025 21:28:31 -0500
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
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 02/16] thunderbolt: Don't pass a bitfield to FIELD_GET
Message-ID: <aTzPT2kAt96ypGU-@yury>
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
 <20251212193721.740055-3-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212193721.740055-3-david.laight.linux@gmail.com>

On Fri, Dec 12, 2025 at 07:37:07PM +0000, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> None of sizeof(), typeof() or __auto_type can be used with bitfields
> which makes it difficult to assign a #define parameter to a local
> without promoting char and short to int.
> 
> Change:
> 	u32 thunderbolt_version:8;
> to the equivalent:
> 	u8 thunderbolt_version;
> (and the other three bytes of 'DWORD 4' to match).
> 
> This is necessary so that FIELD_GET can use sizeof() to verify 'reg'.
> 
> Signed-off-by: David Laight <david.laight.linux@gmail.com>
> ---
> 
> Changes for v2:
> - Change structure definition instead of call to FIELD_GET().
> 
> FIELD_GET currently uses _Generic() which behaves differently for
> gcc and clang (I suspect both are wrong!).
> gcc treats 'u32 foo:8' as 'u8', but will take the 'default' for other
> widths (which will generate an error in FIED_GET().
> clang treats 'u32 foo:n' as 'u32'.

FIELD_GET() works just well with bitfields, and whatever you do breaks
it. I pointed that in v1, but instead of fixing it, you do really well
hiding the problem.

I see no reasons to hack a random victim because of your rework. So
NAK for this. 

In v3, please add an explicit test to make sure that bitfields are not
broken with new implementation.

Thanks,
Yury

