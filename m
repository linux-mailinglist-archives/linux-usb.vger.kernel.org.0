Return-Path: <linux-usb+bounces-25851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C9B06654
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 20:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ABC21AA19F2
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 18:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EA42BE7AC;
	Tue, 15 Jul 2025 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="v7+D7ZSu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F77C29E117
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605666; cv=none; b=KxOxigAq2e9PwE/GprchBdLukLHzGaEN/3p+cAYLLpJtd2AfhO66lOckxcNHzKfBtm514bQOtuoThY6r6ym/Jd+LnoZKIhFsyNxByDOa+cp57DHwFsecpdULmFY8rN2ANamikA7ZkSKFEkujg+IAmGJ+RAhD5CJl3H2oklcgZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605666; c=relaxed/simple;
	bh=eiWActdfHOI8oeeJEbcY3YKFLwfcbkbqlswFOrYbJms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOC+UZ3T3T3UXz3JWfe19+6VZlgb/cC4T2FLJjuYz0SdYL4m3fTCmxSyGlm71skiO4jCKNAEFMS6C2BMGYrYJBBa2mGfpFvoD1eckjU4wBb5muck8T7BY/8gxNyZ04HELjutfBs7u4jHhyiFB7+pAImspHedPrLEq7zPjmCgj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=v7+D7ZSu; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e32c95775aso234102685a.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752605664; x=1753210464; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6L7Xk5SLTqSGeNBwfmprp+iwshdHjMDQuZqDyxpk10=;
        b=v7+D7ZSu9RtbhEtQtvgXprbzJ7/XkFRiuU6Bz8DTdAgyQWii9yuiJ+jezu4KoeD5ai
         MTb653Rwy/vuo2rJQ8F+UNYLB6n9l9f7UFfkWY1ev88Cg5Ao7b5jJ4H6Wl0qlONAnv5y
         M2y+i3QshJGbcASVd9ysU5qFZhdk73oGOiu/j2soGlNJFoCx9jhpdFhb5RHB97d3tucQ
         gEUpWIqrqsgqAUiWz/+fVL0UiVxe++TfWyY2FNnJUWMVPZFMrbFifjkIdKENfcAudYII
         1mAY8XY19TzcnELO3Sv+K6sFu+dSlmrzoe2ux2EnA5cqGU08NFCjgv6CuJrWU2WzPury
         o8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752605664; x=1753210464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6L7Xk5SLTqSGeNBwfmprp+iwshdHjMDQuZqDyxpk10=;
        b=FW3IRWIgl9f9VmKbRpo1+tRoyhTYpNJnulVP5uxYNsmi7LqpE6zQUe9ukUi9cp51nY
         fQIJFGlFKZasfHeyydcZw82TAT5HUjmBkdpaT3nRBhPxL4JftqBncZjQQNpmBeucxFMp
         Bvt+qeCC3N1+Sttz2JPzoiJFuR/Zc3I2ovvg1xvqWvdBgpz4qw0Vas6ECMine1N9bxPh
         IM4wG9TfPEsBITXuyyoV6IHZ0iU0mcgv1x8b18x2u2FD7ve+LGIp1WrZLO0dyUq4z++3
         Jc6KKgAzHBUmrQBSCgriUt/8ebr0ZQH+LSHotTYCdEAnOPA17vfOt5S5h0q+fhwk9KND
         Leaw==
X-Forwarded-Encrypted: i=1; AJvYcCX6yyb7JIvfr3ghHpDf9txJAr9xLO6iuDXnF6JhHqZspPRhn0LhE/5+908F8NXhALjsquJPS8g2Rq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqqpxhyJOIzJLPvdSYh7juNmg67lcFqx+DAtVqH/pqq3qcCzn
	dl7vVl2QHBBtbMcze4ZLhxwJMju3TYJ2/l+F/HwlVc04iEo09Wm8j500/MYLsg8D0g==
X-Gm-Gg: ASbGncvKAeYCK+Bm9uS9jy6NF/m77+KQlNq+w71orfHGMZrliiVhUrm4KNmKgGYgUfK
	34ex4QTTqWbYnd2FLFNpziigPM32/a5+R3HU7prpF2dgOI50Fv/MV/jaQNKAVQpUQHbfrjdSB9+
	4ieUneBauAOwhWZ33bH6mUPM2VyiZBhi7t5+TMZ6hov08honwKR+rvAFHHM0MzLuh/Aanlv1fwr
	ujmNf5b+zT8YNWVhHabvwuOu35kVhDM+iTKhi9RwAzNRjR3XC9eZbCtc2XCFs8sC8wZA38enCov
	45Y1nNGOurt4lSFWnAZu6OgNQ15SrKY8tzwa6yBdsps5jXap88bhUNf8Y+ZnJrc5ZpiPRe6g2Ot
	lK6BHkmtLW18ycc5ztZCzk1VJpyA3fEMTnlgbkjgseDD9WHiJ6ya8eTwdqHWH8HWqit0OSRoChU
	z1Pnp6POaPaZ3S9pQ=
X-Google-Smtp-Source: AGHT+IEXn4TQ02fu1uMkkFZdTXgxqxb8mfiHmn8c4hx03bTaKQ7HGTfKW2NtkQZ1wyy0UH2HyLy+iA==
X-Received: by 2002:a05:620a:4513:b0:7e3:4104:f72c with SMTP id af79cd13be357-7e342b839d3mr31475285a.49.1752605663964;
        Tue, 15 Jul 2025 11:54:23 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e3397f4e38sm106909685a.28.2025.07.15.11.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:54:23 -0700 (PDT)
Date: Tue, 15 Jul 2025 14:54:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, stable@vger.kernel.org,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: Re: [PATCH] usb: hub: Don't try to recover devices lost during warm
 reset.
Message-ID: <e14963bd-bf80-4b1d-b1a8-23207dd5b7ee@rowland.harvard.edu>
References: <20250623133947.3144608-1-mathias.nyman@linux.intel.com>
 <2025071527-vendor-rockfish-ef19@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025071527-vendor-rockfish-ef19@gregkh>

On Tue, Jul 15, 2025 at 07:48:50PM +0200, Greg KH wrote:
> On Mon, Jun 23, 2025 at 04:39:47PM +0300, Mathias Nyman wrote:
> > Hub driver warm-resets ports in SS.Inactive or Compliance mode to
> > recover a possible connected device. The port reset code correctly
> > detects if a connection is lost during reset, but hub driver
> > port_event() fails to take this into account in some cases.
> > port_event() ends up using stale values and assumes there is a
> > connected device, and will try all means to recover it, including
> > power-cycling the port.
> > 
> > Details:
> > This case was triggered when xHC host was suspended with DbC (Debug
> > Capability) enabled and connected. DbC turns one xHC port into a simple
> > usb debug device, allowing debugging a system with an A-to-A USB debug
> > cable.
> > 
> > xhci DbC code disables DbC when xHC is system suspended to D3, and
> > enables it back during resume.
> > We essentially end up with two hosts connected to each other during
> > suspend, and, for a short while during resume, until DbC is enabled back.
> > The suspended xHC host notices some activity on the roothub port, but
> > can't train the link due to being suspended, so xHC hardware sets a CAS
> > (Cold Attach Status) flag for this port to inform xhci host driver that
> > the port needs to be warm reset once xHC resumes.
> > 
> > CAS is xHCI specific, and not part of USB specification, so xhci driver
> > tells usb core that the port has a connection and link is in compliance
> > mode. Recovery from complinace mode is similar to CAS recovery.
> > 
> > xhci CAS driver support that fakes a compliance mode connection was added
> > in commit 8bea2bd37df0 ("usb: Add support for root hub port status CAS")
> > 
> > Once xHCI resumes and DbC is enabled back, all activity on the xHC
> > roothub host side port disappears. The hub driver will anyway think
> > port has a connection and link is in compliance mode, and hub driver
> > will try to recover it.
> > 
> > The port power-cycle during recovery seems to cause issues to the active
> > DbC connection.
> > 
> > Fix this by clearing connect_change flag if hub_port_reset() returns
> > -ENOTCONN, thus avoiding the whole unnecessary port recovery and
> > initialization attempt.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 8bea2bd37df0 ("usb: Add support for root hub port status CAS")
> > Tested-by: Łukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > ---
> >  drivers/usb/core/hub.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> Alan, any objection to this?

No objection, it looks okay to me.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern



