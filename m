Return-Path: <linux-usb+bounces-32601-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCfdAmEbcWmodQAAu9opvQ
	(envelope-from <linux-usb+bounces-32601-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:30:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138A5B4A6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D898AEF3C5
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31CF3563F4;
	Wed, 21 Jan 2026 16:57:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E60314B7C
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014624; cv=none; b=p4cNg2LkJW7glgzvYbXZ+4v2l9UMOa3c5mF1bktQfMHjieDB2clO/f4RLIKaZQjS2UyCk5oN9fkeDB2PEjcWZ8KfdOGtPEAcrnxu4kLn0pFnJ0lF1T2GmW1ehw/6Pf7TNTo05ochwx0oDDUnhcuqreSmudpF2WoSgyQn3StQH8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014624; c=relaxed/simple;
	bh=Z7VKEEbh/Mgf1KxHQovLwFtrWR4g8Q6l3XL5VtPDtHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aN/dvVUlJfrTfO90GzxkO6MHL2HA+VXec0TtPaI5Js4/kDM55a49JH49HnazHo1fz96jaD+E4gYtBkUoqh6/PK4ZUIxrGIDloNxdgl+pqTz3vZmrng6AKpdTxthZ+n6LUyZynldq0nTSilHsPWz9fJO/8rk8afG/HPdFIsgIVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so77919a91.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014622; x=1769619422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfo6ycbyZBbclnkJIZoIDjxzdLcGep03l3zua5CmEAY=;
        b=OojLIGw1yybQZFoj//GWzT8Lv94cDY1fTnXq6pz1qRIuDICRlHJ0qmwAUYbDmbHMQJ
         cW4AtushzEgLppMWuozPtbtJ4zVZr1nLJch9aQpqmnwOdf2J1lLkijA7kwsqt9IBmt18
         6N81iVGlraFwpNcAlFdZ8FU9G59cd4JqsJVvN2oJzkx45wbGzX6SDsX936ctmz+AC8Av
         hosc4zzXyxpfPyuulJIhbFXOMCtmycA+MSWftnKXJehNS/ygiND/LswrDdhJKfkIA+jj
         3w21UkOuZypVwe9TM6t9HvOrh4M/tgPB0/h18qrLkHQ1+o+bx2haIF+k44f1ZOW7eIri
         jA2A==
X-Forwarded-Encrypted: i=1; AJvYcCVxqANOLnI/3Rvi64ij4XjjvL4RUqj1zYTFvU1lJ9N7Lv9u/sdSs8DjKbOYDmxSQRm5ymZ6frfKvR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx467JB6+4zurffJJULbwLrns3FBk3AUXMb2IG/YS0mEp3kYZzd
	sgZ5YC9Hz8iFJstiLQTmH2XWUYO/ktsZb7kVcurA0qTlCGQnPm9kR2vg8URlMJ4U
X-Gm-Gg: AZuq6aIt6YiN+7e3nnT6fDmdCqw1X1hoV4I/3ehTppYb1+Ewipk16owv1qkEUZpyBse
	+8Yq29WtDczubWOkBoZLiyN6QFA0e8QGUeAFw3YTWXa7NcMR5FMeOnrXujI+fzA4AlZH3shB1Gq
	xVeKX+nhif7Sq6+dWLsYcCPfTSD/txASLjdYh8NXgT8ZO5hySNV2J9jDV7WcWrAd8sHwr4gmL3W
	sN2T0B+8MMuOxMjkhXcxeicX1/zYmKDfkEDoWGAGNXWem7G3banqFnv8bJGkE0mbeEO4YwfPDcE
	072wQiKN4Vos6FxGD8KG3uBPdzvVvD6SFelylD2soEvUOLozJCfne9Lv39o/BStId0LWaJX+IKC
	qsnS2D+0gbUu6NU7feKu/eJ3z+zDgcIGEAdZGIouLpghcx5K8TrIuu/3jpbq2aq2alkckqlyuYz
	NYRXShC9PLwcAyWp/Rp0x2P0BRnblIC36uVLX4e69bYRInbbcYWxNXaM6Ob+WjeQE=
X-Received: by 2002:a17:90b:3e4e:b0:340:d81d:7874 with SMTP id 98e67ed59e1d1-352c40a9cf1mr5632202a91.26.1769014621709;
        Wed, 21 Jan 2026 08:57:01 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335205a2fsm37532a91.2.2026.01.21.08.57.01
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:57:01 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f5381d168so85647b3a.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:57:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5EBNa1nyPBMs1fvUSHFW08aFcg9TGagjWJLFLm2tIyyFHd6od2ZUY7B4qvUXlNULssSz/ajshIoA=@vger.kernel.org
X-Received: by 2002:a05:6102:162b:b0:5ef:b3b7:6e3f with SMTP id
 ada2fe7eead31-5f50aaa8a2fmr1678275137.3.1769014232636; Wed, 21 Jan 2026
 08:50:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212193721.740055-1-david.laight.linux@gmail.com> <20251212193721.740055-4-david.laight.linux@gmail.com>
In-Reply-To: <20251212193721.740055-4-david.laight.linux@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 17:50:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3WAxshZL9gw4+NeovX-9FjUZrk+coUAA7+=y6GmPECA@mail.gmail.com>
X-Gm-Features: AZwV_QiqIMwt_a12kTPgIHFmNfmJbn0zP9R9-I36H0fdo0DzJDyqVo7w364KYOw
Message-ID: <CAMuHMdV3WAxshZL9gw4+NeovX-9FjUZrk+coUAA7+=y6GmPECA@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] bitmap: Use FIELD_PREP() in expansion of FIELD_PREP_WM16()
To: david.laight.linux@gmail.com
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Crt Mori <cmo@melexis.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Luo Jie <quic_luoj@quicinc.com>, Peter Zijlstra <peterz@infradead.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.24 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32601-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[gmail.com,rasmusvillemoes.dk,vger.kernel.org,bootlin.com,huawei.com,melexis.com,intel.com,quicinc.com,infradead.org,kernel.org,davemloft.net,linux.intel.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,glider.be:email]
X-Rspamd-Queue-Id: 7138A5B4A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 12 Dec 2025 at 20:38, <david.laight.linux@gmail.com> wrote:
> From: David Laight <david.laight.linux@gmail.com>
>
> Instead of directly expanding __BF_FIELD_CHECK() (which really ought
> not be used outside bitfield) and open-coding the generation of the
> masked value, just call FIELD_PREP() and add an extra check for
> the mask being at most 16 bits.
> The extra check is added after calling FIELD_PREP() to get a sane
> error message if 'mask' isn't constant.
>
> Remove the leading _ from the formal parameter names.
> Prefix the local variables with _wm16_ to hopefully make them
> unique.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

