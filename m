Return-Path: <linux-usb+bounces-35788-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKBqGAUdzWk0aQYAu9opvQ
	(envelope-from <linux-usb+bounces-35788-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 15:26:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BFE37B346
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 15:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0F04301061E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AB64266AC;
	Wed,  1 Apr 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bg57Im07"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E148425CDD
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775049959; cv=pass; b=llAvDzws/0AcUzcfGwtmGe3UiLbp+h0RaQi+reU3uUK9wTAdf1Fu3aeGbp8hh/ksNnumc27Jdm5hEyWMe8UufjwaT0KPya/f97CdpimtbdChl8fH1yFm/KxXVgeXDUH5ofUYe8q+pcKyBga2nsLQq9/fj95YQcffCAoekN3oRVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775049959; c=relaxed/simple;
	bh=1qGvVqwik+E6UaA8EtHo8Y9hkD9P8wNTkAKesdsaWMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RAGu16E+DOFF7YDBFYdqamts1YV4r0QuJR5AWJyww27gD8JCENOiTpQlZ+b4/vSG6tmWC1MrNFIM16zyyP/RlhTTlHrvEfbfawCBxN6PC4Ph4rPMY1rRvIr9icPz/QyZ0X7WrbgvPbx4VOhBCcdzK97vamN2KAyPqxOuFm/ikyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bg57Im07; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso953309766b.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 06:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775049956; cv=none;
        d=google.com; s=arc-20240605;
        b=SAzPM0FB+2d5kbJAx2QjMFJhMzE7YqU1iACGQDMIeicxAjGwokzfbNy41K0Z2t5+LC
         JUyJ+v8lLwdmTXWJcPLDfwsQd9OenvSNd++vgxWBD/y1heEsmmlb3VRd3yL0NJaWLsTm
         iNphfVF8Imx/7RFwWGMpQQ4dxmuRdIzsQk7vwC1PfJIou7fOtbaZvcYd+o5Taw76+6Hq
         qVZb4rfHwditGlZ5Rv5UH2Y6Gs3xJwdnfN8h3mXwfJE21qfHbnUSDB/FUivUEp5p1SlM
         HOrRYe0yWm3CQfnQ4xQ27a5TUxGMhBrpfBUke6CN5c6xIrPo45mc80iiOxad5FMcnJl5
         MwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qGvVqwik+E6UaA8EtHo8Y9hkD9P8wNTkAKesdsaWMI=;
        fh=0uV+IWU4KK4dPYurX8TPHfLuzqkMH6D1P5+jhtC+77s=;
        b=Sj/psEfmChbF5y+Tw7y0IbCAiY8O6A6HQwbgixwk946JTxnU3eaDEIID+locch3sp4
         0XdqqADkJArAvyhn6zkBKwwNWolIVhAk2XdTCR/xyVt3VxJhV17hlGGujmynpSdRn4oS
         BpwoHpMPAtxsOOeZNAdZ9IlhuZijqrJ1icc4mopEkfyRoimy0P9TY35TGL11+EAKIFi5
         DzcRoRKht47ZCOHVWgo3z2fBttuA1cKCiX1/sMgC9akBMfMBNNpg6LsvHrA4gXQwtMHL
         i5b+7Ddhh8ryL3hzs+5iwmQsMAdzYTeKoq5vWLPo9hPZV8/iBYGygAgRw0TMGYcixRpx
         p35w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775049956; x=1775654756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qGvVqwik+E6UaA8EtHo8Y9hkD9P8wNTkAKesdsaWMI=;
        b=Bg57Im07oKpD2Id2uVjX3zSW+EFamrhu5+kDDEffJH5u3B+Uy1mkXXq0veHW+BYspr
         wQROVUnEvm693lDq3w9+R/ySBIX62lKuMVdtXzR4oWXszGmfh0A+FoJAZCdTA0tsyKQU
         2KRCjKmc1Bk5NBvR+fhTy7+sXOG/MkPoCZc5m6VXPehMJ2TrFIqvbzIDdxRUkto0Se+m
         uosq+MC1ZenvI7gy5YgcAwKy5IKsImLZrozs5gqlqJY7Xpk2gJZWc53MRZ1jLC3/NIii
         PSWABeLceppngSDh5v8M7/V01lqelIEn7kbUBBPCoGS1shEGhHLBrO9mCn8p7YWtTPWw
         qKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775049956; x=1775654756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qGvVqwik+E6UaA8EtHo8Y9hkD9P8wNTkAKesdsaWMI=;
        b=IKB2Rmxx3UaIMNeAZnNlHFrH5B1KFvAUs1Uw08ltpD/PM3EXaVghTn1gH5+8uK0Vtv
         C7aHn82tNRwFbkPHJmx57kCtNFADAhgGZv+I10KVS2D6RMwzKtUjunKQ1tSwzYvrDMSk
         h0ALU3DOk2+8IWqfph8J/bTFDQOXw78PwafD/p4uMFFCGOy1uxk4g90OwYKMZWIBcy5n
         0v5Wzlh5VWG55S3WbO2i9tzlFzY+QA7bmq1UpMahpeNthmwyH757CVX+ObLMzE1isMeY
         hljtpFNJujeplqP00lW3roTQdIiLj7FoFomazOR3ahG1a+p/7tPqd4+/vevz/s9unBir
         tV+g==
X-Forwarded-Encrypted: i=1; AJvYcCXcvrURItETPyTiM+EXrcn4R1CEJzvcnmGlURbnhKGoqsLl+z390JZYHUwSdNXuwyKZ0Q7NVJwp4ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1909W7PFvAc0Fr5IfA7c0ObFgHZG7fLfPIOy6qT+OKWKlyehG
	00Wc6Mj4AtNRny4bB76fd5FLY1BwBcEynIz/uS89I9Ndzhzwa7iMbeBtjC6W+oO99wIHpr1f6NZ
	tKzUgZpPZnJXKjv5Qg4y3SjJdormFqpk=
X-Gm-Gg: ATEYQzxmX6nw4GHzRwDbYdwVAVXhaQsF7cWL2MUZzT8VDTPE/KxZoCnhKnt2V3LsSGm
	xM4aSiGHlpYFbyf63u7B8cu8yhbcisEJlJEx5ZAAP3g8YA5Sc33FDnXy0FImvMwR21ucIj2vw/G
	KIKk2ZBZHB6uMv+IEcfm7vZkfG0FGXSZaOI6nunU+WhZi44zB+Ogc9mzwnp2q/8fjD6dViuTXxd
	zmyAG8uhkhstgESkaEWvxovHE5ooxcMiesU3QM6THUVRBjxqzh2NezWHNhpEjMcoWkeiC4wqaTK
	4URNEw3WT1WfTqJ8xt6SHn7RpmBwDNtbB0/lrEs6DpKldXDUVyQtbKM1Axs8GUnXF8Ruljh06F6
	1Iky7wmg=
X-Received: by 2002:a17:907:786:b0:b97:3bbe:e42b with SMTP id
 a640c23a62f3a-b9c13b0a2bfmr237863466b.28.1775049955607; Wed, 01 Apr 2026
 06:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260327124211eucas1p10425a28f67736d2043e7e4dd77d58e72@eucas1p1.samsung.com>
 <20260327124156.24820-1-mikhail.v.gavrilov@gmail.com> <6270d4f0-85e4-496d-8db4-87ccb791ca4d@samsung.com>
 <c9ded35b-fc10-47d8-bfaa-cecb4fa91add@arm.com>
In-Reply-To: <c9ded35b-fc10-47d8-bfaa-cecb4fa91add@arm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:25:19 +0300
X-Gm-Features: AQROBzDDLArf0c-hToXUOK8do2aJGAPhYCPRDaClvBGUScWSaymi-rt5o9xqIis
Message-ID: <CAHp75VdrGk=foAzQBJNRNDZ1yfFY8p-tC_ApM8_gN4EehpmN_Q@mail.gmail.com>
Subject: Re: [PATCH v2] dma-debug: suppress cacheline overlap warning when
 arch has no DMA alignment requirement
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-mm@kvack.org, 
	harry@kernel.org, vbabka@kernel.org, akpm@linux-foundation.org, 
	stern@rowland.harvard.edu, linux@roeck-us.net, hch@lst.de, 
	Jeff.kirsher@gmail.com, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35788-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[samsung.com,gmail.com,lists.linux.dev,vger.kernel.org,kvack.org,kernel.org,linux-foundation.org,rowland.harvard.edu,roeck-us.net,lst.de,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 02BFE37B346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 3:11=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
> On 2026-03-30 8:44 am, Marek Szyprowski wrote:
> > On 27.03.2026 13:41, Mikhail Gavrilov wrote:

...

> TBH I'd be inclined to have CONFIG_DMA_DEBUG raise ARCH_DMA_MINALIGN as
> appropriate such that genuine false-positives can't happen, rather than
> effectively defeat the whole check,

I dunno if you read v1 thread, where I proposed to unroll the check
and use pr_debug_once() for the cases which we expect not to panic,
but would be good to have a track of.


--=20
With Best Regards,
Andy Shevchenko

