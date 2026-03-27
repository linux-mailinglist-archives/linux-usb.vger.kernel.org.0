Return-Path: <linux-usb+bounces-35540-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH47Lss7xmm7HgUAu9opvQ
	(envelope-from <linux-usb+bounces-35540-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:11:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CB340CB5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 09:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3380730D931F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74453D16E1;
	Fri, 27 Mar 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnQlbQ8g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C193CBE7B
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598857; cv=pass; b=RxEq2zRfHz4p5lXAOwScLWjMbzGznDtHBKaPlGNhbGRV6ufgvIaYi4aqpBmcvucXaoNKwgp7JS37aWox2h5dx0xt4ZyX6tYvp4nYNFzfRq77NxGMm0kNVHwZAbP6QB61hhFBSN1YGy0JWqxThHU0xrVxF54gegfAEgpNoQ2/qZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598857; c=relaxed/simple;
	bh=z5bReYMbAsOBEng2PqcZRA/9wn0+wKy0w6WBlljYVOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAgEo16u7UEU8KPXSyiL7lEU79/Ep2fqJutgCS71z2hIDN+m4kNOuzn/CQ9kDUbL1JM74uhu+m8gwc5Rv3X/iT6hpOpyKlb+0HCJb3mBLeTfsXOnOGT1lpk5sazRYsk1g4ZLzJexWWwtcLneI02tpO5xkIINS6DoKJxZWEy4R24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnQlbQ8g; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d556c1a79eso1813647a34.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 01:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774598853; cv=none;
        d=google.com; s=arc-20240605;
        b=P5g60Lk+q/vf1fNJZgldH4vV0H41x+Vo75av/iZ2gi06ZNd6CyfAvDKHGwmWnPLd+s
         +T10taEZZGxYEH/5tkDmf655eAaAUdnskhP/qjOKw0OvlvAZHXt7jTIVTNeGf0aDv1O9
         3IMEaFQ+RlcQ88UAVGSiwtyEiJTdjKO+P+B+xsQwBxCC2yDFvndjOY28L+kJgnPDoh7d
         DyksDQrmMgpRhuP250qRebt0o1HsHtCAITGewcvOkrUBOFBlmdIMkNChiwp4OvrizPgO
         qHdrS3SX96t0tnC/qJDe3AoHYz4TCkX8/c6yqZVGYk1zf3SLFiToC1tYBuWCM/Vbu97R
         CETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVfFAtvOjT/QY/G+zbXJh5l3DQTsEAM4O7UyelDmPk8=;
        fh=0gdao+oYuZa4/PnkKV34pl4G1Tm+M3Nermni5X1+G+c=;
        b=DUJoV8sao7LwkMg2WMn2mMcaQyDmIUtr+B3DxUHRtKPVK5CFWm4V9Vh8fIbOyEtWTy
         Tr+FGmAoRcQFi0gKYBVHL4f7y6pe8nrtOHZPLhetu4mw8+Fj/Ci87c7gnAs5mOety9zX
         9sAQhkNJTPLg715zYeK50KxX+3Lx+XeIEPWUtDgbwgPlKjCERqs5ioDCjka1KjnFhmOw
         n16XJBdFEy1+NjKICOwTDjqmbbipve4X3uXnNzRv6vMPkVzi5vdZKx0HR9vYMMH6nwtp
         n4gEEgzf7OJm9QQuaIxDxukpzfn/z4FhGuNyoX66v43gUvmym80v/ijY/S8LyiUzdzoZ
         wnUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774598853; x=1775203653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVfFAtvOjT/QY/G+zbXJh5l3DQTsEAM4O7UyelDmPk8=;
        b=GnQlbQ8gsRtpomFh4RUQ/gsOQf1vfSsGdfIXL/gOfJejz8X/ZM4aGmcYBi80mIhuSe
         CRxXa172diWvPLrh7bN47WiDpgKI3WEqwuMiW7FDGIG4yB3pNAl7Xvs5K5TaINynFmJE
         TiBWft2k6QKAKOk1xFxT0NUHDLDfEmbmewUwiDc/8qjF1xes3Ib6GR95dEVQl/reQcGd
         xYegRx4jpfcbivYPZY3DtWxJK3P959/6xeSWLFDgGu7lZ95YS8qRcMWKS7/iME8PLeBk
         /p5Dn8rI4fhuFG5oXJWFpR739Rev8cNQwV6RHky4k2+ydpsY0qo7ObghQlZtVorIVmzA
         cEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598853; x=1775203653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVfFAtvOjT/QY/G+zbXJh5l3DQTsEAM4O7UyelDmPk8=;
        b=CdsosUzBr7C+UIqCsrLDQehRwuo6jiv4edJaogmVz0OXR5GmvvwZeWSsR6vB00uUtU
         8tvc6lhwQSSDbID0vfen711XwZO9uZHO8uLo1KI73rYX89U79MnhvJnOIRsLGIZUTMqI
         YOLqI70zFgsYqzZh1PN1CduZSyuQp5qWs1V2J11AKQpSABrcs4LYBjfLspqT9vF5Ltn7
         jlELDygXNBd1BGS0ABK5/bLW0y9nul87NHKvH/lh7azeN68+JGeKOq/YWA3noHoNpbAh
         FYnx9D2YXPzYGZaJ5uRFzPpxwgftXIR/gW4FPZ921bblvTkqZLRmzob9rpfoArVmNb3U
         NNqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvfCkHmTyF3WrUlllVKsJvDaZ6PHm210g3gQY7RVPnlzZaITLJCVC+5tGYzBK8G/nCHM/MHz/T70w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBrHmuW1wndzjvyu+3LGyGpYaJ3Ee05A9bprXjdNFu5NLNw2k6
	I1VUTAX6hGJb+Bexb2W23ewv2nmVPY5OchyMNe4fFiAchlS9pOqa3D19HnqFNxI7uZwoXf+r8Uh
	yWfzikgpPYOboz+7yT6H+EgQYS5Nxa6M=
X-Gm-Gg: ATEYQzxQfepK59DVZC+KIsiKE3JXoCz1F0Tny73dX3Jw/yTAPLol872hfpJsQXgGPY1
	fS3Fe4Gp6RkXQE8hMNJXiKJ538+g2PXvVYk/Qd8l+f51rnbso+tHgLGD0Hy9pa1vhaA+tdaS588
	jF3/BC+YiDrF1Ir1OtqtTpUqPrXxMVL5JSXXAFnMjN2lMZRicAkBqSINZL0sPCC8t7nzuzJ57a8
	hkXzTB4ezmFm/2iMOvwenC46bzY/KxfIeiMOQVI237jGq6UcYhRunvasNNeTBpc1dE7gUphwvZJ
	YZF86kM=
X-Received: by 2002:a05:6830:67cb:b0:7d7:4e62:58d2 with SMTP id
 46e09a7af769-7d9fad9248bmr731336a34.7.1774598853157; Fri, 27 Mar 2026
 01:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <acYlxRBhSMcwBnja@hyeyoo> <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
 <acY5G-lKZQEsUbRw@hyeyoo>
In-Reply-To: <acY5G-lKZQEsUbRw@hyeyoo>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 27 Mar 2026 13:07:21 +0500
X-Gm-Features: AQROBzCzB3coDtODs6w7gt0-QdNGc5pwWqkx1wDss66ksHdICPpNIJLEWH3TZ30
Message-ID: <CABXGCsPQo=Npum2aHet3QkZWkWEnEVMAw0KQ1AHPrNjMn=9bmA@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, hao.li@linux.dev, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, linux@roeck-us.net, andy.shevchenko@gmail.com, 
	hch@lst.de, Jeff.kirsher@gmail.com, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35540-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 211CB340CB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 1:00=E2=80=AFPM Harry Yoo (Oracle) <harry@kernel.or=
g> wrote:
>
> But dma_get_cache_alignment() < L1_CACHE_BYTES means the architecture
> actually allows overlapping cachelines, no?

Hi Harry,

On x86_64, dma_get_cache_alignment() returns L1_CACHE_BYTES (both
are 64).  The condition (dma_get_cache_alignment() < L1_CACHE_BYTES)
would be false, so the check wouldn't suppress the warning.

The problem isn't that the architecture allows overlapping -- it's
that kmalloc returns 8-byte aligned buffers that happen to land in
the same 64-byte cacheline.  The DMA debug code correctly identifies
that two DMA mappings share a cacheline, but on coherent platforms
this is harmless.

Adding a dev_is_dma_coherent() check in dma-debug would fix x86 but
would also silence the warning for any coherent device, including
ones behind IOMMUs that might have non-coherent paths.  That's why
Alan's conclusion was that fixing the allocator side is safer --
it doesn't weaken any debug checks, it just ensures the situation
never arises.

--=20
Best Regards,
Mike Gavrilov.

