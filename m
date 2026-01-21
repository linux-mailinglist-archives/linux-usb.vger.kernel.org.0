Return-Path: <linux-usb+bounces-32602-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAJoEfY3cWnKfQAAu9opvQ
	(envelope-from <linux-usb+bounces-32602-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 21:32:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B005D4BA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 21:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 033E8724F7D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 18:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887033AA19B;
	Wed, 21 Jan 2026 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCobc10W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E5634FF65
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769021949; cv=none; b=cbHZ6PaZYPS6WUEhPN1jnvPIxAmde0p1DgYxtEk9kIkFkxDIm3xRTHOAnClvk9R1XzaFi7KZ8GomkkRoVRmsOuuETq85kFcPDfDQ0oOKusPYB6/NRYd3VZpfrLdiLxszCMZvBMjI4D8FitMuScDCE3xKKVo5E5gwDnIo7H/M3nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769021949; c=relaxed/simple;
	bh=wrxxGjfP+5GnkRibkSGpyCxIsIz43rN4YQvaQ7oPfIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6MaxKM+0UFBhtC/fMkZajJpUQcLQO5aT/9ON19eRSDNu3PXeWhDFa29f9rkcTHkWj/s2EDB546TEBZvEJG07YD6u/ZIbSHFjgd0Anh9Z8XDnjbuFESrq7oa2wkT/qOwRMmDF5tirQBE2U8sOPhWlNThCQPiFqnQpv6b2nV+MhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCobc10W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso1739155e9.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 10:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769021946; x=1769626746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3CiRXfW7OiyeqDRS/V5H9jo7jqnwu85t2dfMJoFCM0=;
        b=QCobc10W8qh+W1kpAc54iwiZcOtuAkIgrjliU3QHFE3QfrE0ZElvW/B8q4Fu0Avo6b
         J7Tl1wtv6oz7OvvXArZGOh4PNag0ch/56cJdZye2pvyjoe/bCkh3s+suNIa4Se4XPsxm
         68PFZ8kuHOFYnLxowd7ufvcJFD9phNt8cDE3yn+1+2dMXsdv9Iw3ajMS3CXhfnoQOFOH
         jg0XBcX29zU5DTN8AH6VNwG1MpBbptPi0kdlsrRo7UvE93VMghaAoyWQsjsOer9R0h1q
         nGdD3TcAVvC3iiOg7/1h+0QZYom3x61VXzj0wrUt0m5s8/jpcN7TlC0mrspnNbvuXpKs
         a/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769021946; x=1769626746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3CiRXfW7OiyeqDRS/V5H9jo7jqnwu85t2dfMJoFCM0=;
        b=JccnX2p1NmWgrA8j9lu6RhkDmyKkxaC29IQAtbd7BqjM3y70vm/0q1KW+J9dAGgh0y
         yYKzTMVO9605YdremTDREbnnGLHpTyZb/CBCBkM1+CWajXKb4bre260/IYICrTZN2L5z
         PwDJia3IfNXcUsRmsaQG+NosT0kDQSFhc+xhkTWx98kRXCUdmYvTpJ+701vJNNrZ74eY
         qSoMfwNUNWeLdueP171O4jQ1x05YFSYrXTC3rFxpjYtsdIbPiRM3Mop/UgYsCsYoWdNA
         y3zDjUQoflnmhp2et31OwQ+LjI7iGKkWGkxLqx6N8vP6xI7tmItsKaSA7EqopkVJLHfF
         EDcg==
X-Forwarded-Encrypted: i=1; AJvYcCVePtKffMK8NkEZkwEwxM0MA8lVvWNF4jk3Uyq6nFYX+P5+4zpdyeCbKenZqbk0WYMRACk4RT8MDiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHWC43SNldFDW1UQmHAEpHd+eWOV8k4C8mZBAL3FOFqXrRz7a
	mOx5ojl/EQpIkx/k5r83NUvtAONhnw1uqkzGC2qXx3i5NbjkdFVI6YnW
X-Gm-Gg: AZuq6aIOWtRsPjHd7jY/wPB/q1nca+Fa2KpZbKTm3bsiDcPHQiytQs9j0Ye8ZhqP14Q
	2k2d1/YXZHcD3ttdMEu6qgyykxhAH5sJ9l8Sk1L72d6cNbtuhikyZINPi5nFGD1vyPaWUGge+f4
	6bWubjODSmHqYBwEoJNeNpkOuKrTRi9LzTKk9QOYKp4HIfrZMWwfyZuz9wu27/ymAJWTvWjZIXn
	UYnMWmnGr/hzNMkCoV5vIbwtyNis/XLIxVYeOl9COfwyZLOudyRU9Ep9rVGumjOeDN9aaiwRVQF
	oRJoEJargVub7yoMDb3DZLsY/w8colp24Wn+ga8XK0uQiBDB7W933IHx403/P9rEewuD/pulN3e
	w5pEOlKBNf1A/KgWa3Cj9syp+arCLTpg2bYLZECTYEoMj7jPctPGkpha57Ih5nmzo9FELo3ngnO
	RAzJzLrxponcrg7Xuei71eWLVc0VEIIIZxg9c/v9QFZzk2TILWyUmc
X-Received: by 2002:a05:600c:1f87:b0:480:1e92:dc65 with SMTP id 5b1f17b1804b1-4803e7f3c8emr99522385e9.31.1769021945554;
        Wed, 21 Jan 2026 10:59:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804245320dsm9691175e9.0.2026.01.21.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:59:05 -0800 (PST)
Date: Wed, 21 Jan 2026 18:59:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 03/16] bitmap: Use FIELD_PREP() in expansion of
 FIELD_PREP_WM16()
Message-ID: <20260121185903.201abe71@pumpkin>
In-Reply-To: <CAMuHMdUo_Xow2YwMaDzPUW8w-3O12nqguzvoR6ij0X3R+syvOA@mail.gmail.com>
References: <20251212193721.740055-1-david.laight.linux@gmail.com>
	<20251212193721.740055-4-david.laight.linux@gmail.com>
	<CAMuHMdV3WAxshZL9gw4+NeovX-9FjUZrk+coUAA7+=y6GmPECA@mail.gmail.com>
	<CAMuHMdUo_Xow2YwMaDzPUW8w-3O12nqguzvoR6ij0X3R+syvOA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32602-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,rasmusvillemoes.dk,vger.kernel.org,bootlin.com,huawei.com,melexis.com,intel.com,quicinc.com,infradead.org,kernel.org,davemloft.net,linux.intel.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-usb@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: E2B005D4BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 17:52:29 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> On Wed, 21 Jan 2026 at 17:50, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 12 Dec 2025 at 20:38, <david.laight.linux@gmail.com> wrote:  
> > > From: David Laight <david.laight.linux@gmail.com>
> > >
> > > Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> > > not be used outside bitfield) and open-coding the generation of the
> > > masked value, just call FIELD_PREP() and add an extra check for
> > > the mask being at most 16 bits.
> > > The extra check is added after calling FIELD_PREP() to get a sane
> > > error message if 'mask' isn't constant.
> > >
> > > Remove the leading _ from the formal parameter names.
> > > Prefix the local variables with _wm16_ to hopefully make them
> > > unique.
> > >
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>  
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>  
> 
> Oops, just noticed  commit 2fb6915fa22dc552
> ("compiler_types.h: add "auto" as a macro for "__auto_type""),
> so you want to do s/__auto_type/auto/g.

That wasn't there when I was writing the series.
I knew it was coming but didn't want build breakages.

	David

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


