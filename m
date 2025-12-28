Return-Path: <linux-usb+bounces-31790-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48ECE5863
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 23:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0504A300F9CF
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 22:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7F529BDA3;
	Sun, 28 Dec 2025 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrvU2ZKk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A100277016
	for <linux-usb@vger.kernel.org>; Sun, 28 Dec 2025 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766962211; cv=none; b=hZ5TV2Ajv05OyrBuekciVtakzPa+6VbqnCh9wXGt6SWvKPOdK5GOTq4WLpCbs0lRMZSmMd2cv9i6Mw5TnIqj3f3oLKgDyandZv1lifHZWc+mAsA0QbkPgRXuAwL3GsQMAsRkZpxhAnjnAkRjk2ic1ZNuGggwpN/KxIvCDBaBIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766962211; c=relaxed/simple;
	bh=9KgZlOWCyyz97q21E9W8EANe41Dc0IJ33MJtTZbxqmI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utd9jcahNGUG0UZml59du0PDssSzs5XcwUmKNQrbkKc8xHXY8FOuyfk9tdfxWCWJUBsM7mEV4nz+QdZybr44cwE9QjhW7h10pgl9dj2t1icNzHczU4oIHdVXe9BjKRTMiw8B+8nhzB9Psx0KCZ6cYDnLPzcBsQOEdq6zCG5tRiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrvU2ZKk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-430f57cd471so4236822f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Dec 2025 14:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766962207; x=1767567007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLa9rIWMcGJ8cd3NrQlUFNZ6zmYa0bxNCj5XPgKm3rs=;
        b=WrvU2ZKkHWaMlv7oRkd+S+QEtyC1YuhJKXO7LueTJvIn//5dwNhQ4G8JtP2icFhnPx
         Gz4/ji3vdh/OTs91Ww+RboZbn9yTv0bdQCUtdEDeffvUG6mJAZpUywRn4THuOIsQlWku
         wSpjJgwH3siDX0WafPL4SJFBMeaFj93tfsHooD4ra27hvT2UZdYtr76tks1s+1EPIGMe
         /5Y8CtNk5G84L5xS21viUSTYS5jyXajv95Tj2typ46M9gB6LPYA74QkiWXlR6ldxVKUi
         diEpWgSyO+pI88uWaTW6oH1XBjTw3A4LpcaBn6bb8DMRux2uTTAJ2YTtbyLO7x1a8Iob
         l4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766962207; x=1767567007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dLa9rIWMcGJ8cd3NrQlUFNZ6zmYa0bxNCj5XPgKm3rs=;
        b=f1jXKqeJ52FUbxx6bw39dLCjYMM0XwDXwL7Xrbo2b4mXN/eyq7bTw+QQgOrjDTHIpt
         cs/D+rknGW4r32H4Ho6gWUz9pTRuZ2P0CEfo+lfyByjdaweWBij78t2ngw6BUowUWJQK
         lFPsbu8fA7q28uyDeUv83hNSl6wB5RJ3GARyCJN2M9N0LFeKp8301EBKfQghbg+K2U10
         csJ/RAplr5hVcVIebfgwZw3kvSQOddLXSyTKk1bYSWzwYW1kczyDPhJ1iFrfdKe1ubX1
         VqajpBGRclX9q+7SDlWYsQn9FlrnUuR/sP/jF9ZMkndtblBl5Cy8AuUmTuhi7DB2MW4X
         Fw6g==
X-Forwarded-Encrypted: i=1; AJvYcCWX1Fz9YkulXfjN5+2paKc3sY24vJi3p+mZ7XmDCJRNH3wUU1YumaNui3K38UnPpL52Whmv6UnY9EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqM7BgO0UStZYgd0w+RdrF6q33AemJmKLzS6XbBegJX4iEa+U
	GcV35wsTKqc1JwwrooBfNvrujtckzLn63JJ/qhoKfzAb8hv9aNDnvZYpp+hHow==
X-Gm-Gg: AY/fxX6bVFpkB4d+6/YpU0T0qwBd6qp/5IB/pEUsoLn8ClSjU+Mz33rv4tXQ7JJHlCb
	qxIUrwL5ArTqoW4iUvgk4n6VQr908T3/6yWcPZ4bZw4OV/mUMXGnIZ09Gabgq66fw/OivwTBNFW
	umDW05il0Y2+W/c0JMfoW9/5tNke/KpUtPzpcl118Fen9uMUnE/An0H7mawWt/7DMFdsbtQV6Rh
	Lu5upYvSsCRKFz7DpZvnnClpPIh7e3v4ESjjofjFXDLvdHZQkLj6VsX2JTS2NMvhY3/sITWi49Q
	ANhcKNtroc0OXPOrzA094Y1jWOvYdRzDVvlcdYQpzGn6lWOuZzLG4ScmjS+yS+QPy2nDwk/lnCl
	J+/BM+AlN5llQ/uCb6OjFEvnWwwXbjz9troRskUGN9jpr3dSjAs2f9Hh6a2LVNEDPqMer0P8Osk
	X/7zgqb6h+eNwoE5s/Mhqnlxq04o6uXb6znyvCQ5EfqsXqFjdkTvJb
X-Google-Smtp-Source: AGHT+IGDmQFJXpTex84Sjvl3OcjyzaSsuGGpBNcSV45EAoewFsb1Yr42jHw1dToXppS6Ot5xXmfiDQ==
X-Received: by 2002:adf:f70b:0:b0:432:5c43:64 with SMTP id ffacd0b85a97d-4325c4302c7mr23626302f8f.41.1766962206674;
        Sun, 28 Dec 2025 14:50:06 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab33f5sm59078509f8f.41.2025.12.28.14.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 14:50:06 -0800 (PST)
Date: Sun, 28 Dec 2025 22:50:04 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, Yury Norov
 <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Geert Uytterhoeven
 <geert+renesas@glider.be>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 08/16] bitfield: Simplify __BF_FIELD_CHECK_REG()
Message-ID: <20251228225004.69a6972f@pumpkin>
In-Reply-To: <aVF8uQxjz9trZAHY@smile.fi.intel.com>
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
	<20251212193721.740055-9-david.laight.linux@gmail.com>
	<20251217102618.0000465f@huawei.com>
	<20251217223155.52249236@pumpkin>
	<aVF8uQxjz9trZAHY@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Dec 2025 20:53:45 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Dec 17, 2025 at 10:31:55PM +0000, David Laight wrote:
> > On Wed, 17 Dec 2025 10:26:18 +0000
> > Jonathan Cameron <jonathan.cameron@huawei.com> wrote:  
> > > On Fri, 12 Dec 2025 19:37:13 +0000
> > > david.laight.linux@gmail.com wrote:  
> 
> ...
> 
> > > > +	BUILD_BUG_ON_MSG((mask) + 0U + 0UL + 0ULL >			\
> > > > +			 ~0ULL >> (64 - 8 * sizeof (reg)),		\    
> > > 
> > > Trivial.  sizeof(reg) is much more comment syntax in kernel code.  
> >                                      (common)
> > 
> > Hmm. sizeof is an operator not a function.
> > Its argument is either a variable/expression or a bracketed type
> > (I don't usually put variables in brackets).
> > So 'sizeof(reg)' is nearly as bad as 'return(reg)'.  
> 
> Yet, it's a style used de facto in the Linux kernel. I am with Jonathan on this.

Not hard to change :-)

There is a more interesting question as to whether that check is
needed at all?
It is only really the sanity checks (and the fact that __builtin_ffs() is
sub-optimal) that stop the functions being 'reasonable' for non-constant
values.

	David

