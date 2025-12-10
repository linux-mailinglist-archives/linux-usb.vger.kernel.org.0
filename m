Return-Path: <linux-usb+bounces-31364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2ACB2A08
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 11:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24F4C306BD51
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C613093B8;
	Wed, 10 Dec 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTUSbCfY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04FB3090D2
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765361104; cv=none; b=H4D5Xo1K+1VjzxVc3kAvyx8C35fdiCHIdap5dqElubGe0RD1u0GGxw0rc3egzFT739o6AZPAcXxD5YR0iq6uzHNHZleHKetcfYtiHeCqfK+1G9HEXObD+kO9SmI/9gYPhborZElWBZPP9sEvrIip5NVuTIn6PZ837P95FgzGsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765361104; c=relaxed/simple;
	bh=mn4zdl3vn29wXnpVK+tSko8k/DOvLsEFY2jIMYzzMAc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AzxXfIo+nzCFA30VBcHfN1vDEi0WYyqP7PjsvWZZtxBAa+11AtDh35Rpudky1SRe1iEg1xYFXSshnQrVXasA/x+2Djwq+oaP1jXtfNllzH0O8JSMKu/zCa4Jxb5vGcI0p9om7NToN3fhc1okCf4sbupPh4mRJ/M3ZLImi6y+APA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTUSbCfY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e6aa22fso3095841f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 02:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765361101; x=1765965901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM9jv5+Xf8bSG44VGgVRyBWdElgj5hCgqPr3kHTSQBM=;
        b=TTUSbCfYyOtNhOmldmbpenarwGIfT0H4MDYD9MsV5RqxWql3COoITbKzYia9PIU2v1
         NwCulhObWQkfxCK2VqS9u3ALRcjYAKb1ZBoyTfPTt8ovBe7eHstkmzPLVPm/INspRYvB
         iVqRw+uF57YAPLNwFKqVKx80zHz7EKLC84qSYmqBKnik1Id1cK/Y0CGufzk80POj5Xbo
         jdBkC/VMrn5GfXUpCykmmMH5q2nK04DQSOJ7o5m7FzYn3OWaeXQmrB61zZyJGQSTBOV5
         DZufdlqZkk5m1RnfQ5W3Bj8YbcBWfZybUexgiCG7Jz7xikFfWRJlDXXZdh+1SPbTrtar
         jKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765361101; x=1765965901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uM9jv5+Xf8bSG44VGgVRyBWdElgj5hCgqPr3kHTSQBM=;
        b=NdQpq517woli+WbDFtQn18oJNoLwIHef0kQ4fiVXbtBv+d0g/xl5x7GXvab83ORGxY
         DfvkPcx8UUKd7GZo8cMXMzFOqYeXK3Lpmr98LpZ8xrtdw1KQoq1N33aZnDvFFCSRmbGt
         /GuQLVrgdG7CZJTZOXnKBYUX4FmwAu1kG2dECiTlG1bAhnlzIlnO9w/rFS2ytC/QL/Cq
         NSY3XiN0udRzA5hNExuCCyPseXpd+T9g4I9QLOm6UR9AX7Z7jeHpE9npHCxUxu9dFVIb
         sxVNZDyMnl9AjFuQ8jnDOmrSdJCcyHq6mlrmRp8hbRKZLxplZy2GnTRLiDJDAJ/XUGPy
         d6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaZYT7K41lyFCik3zwLdssfmzf2wZkf9ahrBE7YmhXnZFSstvDKCnidchVNVRuJfE1U8k1SJ6U4sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+WrKHl9CHLhUL0Jh0jLf0YYhtWUxi/FeuyVSbCWDr+eZIZS2
	4GI+dQcOVME+50uS7AL36vvVBPJu7S2FzlatOWBIQspclty2+waT0BYr
X-Gm-Gg: AY/fxX6lSdSyBrNlnSCmM/ZmYtvVdKG469mP95aTqBpGmtaN2xYDZKuUnJl4FsItrGf
	gn3ylRdc/V1u+UmzC6OullinnLdos3nNtDytfq2Qjvv+ELWeVgo7NPljcHmDCt8OLSUJNCP0q5r
	XIW1DAEoYOuII1ggZinoOqKT9adSMLf+lWTBOKfLCYkXKVAcKRIVBMi/EWR9Ejtoxiu3b8IzN5X
	Y0gmNS81Nn4Wt0/dEHce5MERt3XA4SBBeMGbfJMqiFklKE9oxSnAlBbYNTQVpT1BYtevtJ6kAa9
	RTMXlODxdSzlLfGw/KqE6H2ZHUwrfRxq3MpFaj2sUhvTeDetZOTQfX275bz1BRQ5KTvY/8LDzUR
	Q2rYG+S/B3eRELMNvedtYYMGfCaCzQRIsrhtJ9AULiB7ZxldANOzIWNO6unJwOhNAtHAQYFbzE/
	YWnLdjuw7pHBk0fm9iwp68U91h6MCjtyM5Aqw+Xoc7cNVGH+YVon20
X-Google-Smtp-Source: AGHT+IGc/2temuso/dMXAd/z/Fp268Bw24VHuUY6WJXcwM+QAE/5iSiD8jpsCrHfLSA7sKTxPtCcmQ==
X-Received: by 2002:a05:6000:290f:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-42fa39d1f95mr1650927f8f.14.1765361100899;
        Wed, 10 Dec 2025 02:05:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d222484sm37265629f8f.24.2025.12.10.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 02:05:00 -0800 (PST)
Date: Wed, 10 Dec 2025 10:04:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Luo Jie <quic_luoj@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org, "David S . Miller"
 <davem@davemloft.net>, Simon Horman <simon.horman@netronome.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Andreas Noever
 <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 1/9] nfp: Call FIELD_PREP() in NFP_ETH_SET_BIT_CONFIG()
 wrapper
Message-ID: <20251210100458.57620549@pumpkin>
In-Reply-To: <20251210182947.3f628953@kernel.org>
References: <20251209100313.2867-1-david.laight.linux@gmail.com>
	<20251209100313.2867-2-david.laight.linux@gmail.com>
	<20251210182947.3f628953@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Dec 2025 18:29:47 +0900
Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue,  9 Dec 2025 10:03:05 +0000 david.laight.linux@gmail.com wrote:
> > Rather than use a define that should be internal to the implementation
> > of FIELD_PREP(), pass the shifted 'val' to nfp_eth_set_bit_config()
> > and change the test for 'value unchanged' to match.
> > 
> > This is a simpler change than the one used to avoid calling both
> > FIELD_GET() and FIELD_PREP() with non-constant mask values.  
> 
> I'd like this code to be left out of the subjective churn please.
> I like it the way I wrote it.

The 'problem' is that I want to remove __BF_FIELD_CHECK().
It has already been split into two (for 6.19) but it makes sense
to split into three (to avoid code-bloat in the cpp output).

IMHO Using a define that is part of the implementation of FIELD_xxxx()
is wrong anyway.

> I also liked the bitfield.h the way
> I wrote it but I guess that part "belongs" to the community at large.

There are already significant changes there for 6.19-rc1

	David

> 
> FWIW - thumbs up for patch 8, no opinion on the rest.


