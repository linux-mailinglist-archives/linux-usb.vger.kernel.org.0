Return-Path: <linux-usb+bounces-35543-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKSmCXVexmm+JAUAu9opvQ
	(envelope-from <linux-usb+bounces-35543-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 11:39:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD8342B43
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 11:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 926CB30E1C77
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 10:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25643AF641;
	Fri, 27 Mar 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbVZvc9A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1323AEF55
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607115; cv=pass; b=gQeOU6o+9M1vteuwzT1LNsukK4lOww/kHJ+UM0+LWclxf4xilfkI9vQEcezrzaRt47FyMdyMmBUFQdnuy4Kd8shsD+Jvpfjw4G0wxQJphGNH7ul2IV5rqauQkD9daJObQVwGMN9KvxMBtWIRVnxmd24PAGF9fOOjsbg1JAvFJuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607115; c=relaxed/simple;
	bh=pMHKrbaRIHV+dpJrYTKreLOhjOfA8HtBZFKU4xx/CTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8J0gGpEc9u3cvpQCvfRxPSJtAeKhZn59Klos8W4BvPU1zvYxPWAqTjh3JzD0fnGo+3gcHZZ9osQUaURdV3YZlptP6UYkZzvhB6hF7DvplJb15Ufh26KUGBAMHwzsZ1kgmmf8X9N4Z1S+h1yEb7T2KQ0WDMKcNHLQ6v6Af+rm5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbVZvc9A; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d9e22176a7so930758a34.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 03:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774607113; cv=none;
        d=google.com; s=arc-20240605;
        b=MBT3QuBIwdg/lVHhcTo9Jrr2lDZxZFYltZ36Ra25NclhvjemeSNU6dw9pO4ugCDF6f
         0j5al154eCXwNRP2TXpP7ajFPx6e6KEaLY0P4TK0OchzRZNq7iPcc8yWBsUlY6c6K1cr
         rBaRrLTWkdDntxjzDJGfwhe0Ug5rs9cDAAATqNto0mDB9ShjCI62vMeKOcGSPqSaneuB
         VpWubakRxeus7pm7NidB4JTcPP5TEJCUybVkzUUR3jeir1sQ1Xgd69Q5JZARQV2PbOCf
         UUcAoL645aVWLfyBCzpsiytAVyJzqCyZXm5tFnJ5sBFrdkR08iqwARHK6H9hXaPINMfg
         DesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s8zHlEOpelJ8OaHxvldDIFJWwtoMMZAhyRutBliNnVo=;
        fh=wfFjA79SGQP2gZp0O2OphhwtJa+AKuROYTBBZqVs3a4=;
        b=Jx6J4Di8qGxNB2Wmvc79h/+stlUDA3XVgk1ZqUeVqnjOy6VwacFkGyEgi4sPoxpsl+
         wMOrfenuPN50BcgwvfDIe0l1IJoYO+1XsraKlu5PvofVvE9nPmYMBlkkDddawY082dBs
         QrTiH9BctH1OIpKO30XI/tS3Tby3xvlclnDtOiZLCuvKvnTSdD6AhVKkgumhkcSDqx9F
         Y+6wV3uFVgbSitD4Qjb812rcMNYENYFVOhXXdLXTFzy2Kv3+s+t1EjVqNXpsqhFm52nG
         wDUp2DJduetclxm8zALifFv2p3BzgMBdkaW0jEBxHzsjvJAD5aLsLheFSVQJVi5qkc63
         ngjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774607113; x=1775211913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8zHlEOpelJ8OaHxvldDIFJWwtoMMZAhyRutBliNnVo=;
        b=nbVZvc9ANh/4jrjQsK5DLund5aJD0RV9yWNaXafe5lprSKVa2X6zLP4J9gyF3tMxaV
         oyKGbQhswjT0Ailtj6M2ZcM54ySMrlAFaSgjY9bgT1Ss1nbQigfVU2XvHngMb6y0RJeo
         BysFlDm0lDdj+ylpohGTMJCctKfAYouZlvIzzjErm5X15+3RsD1UV5AhJHFOhn3eCq9i
         4bN7s++jhmr+ferYLtyk4jLEv9kF+VhXZYcof7lBLJv7poZ8k3+ZvlSM6SlfyEVI40u3
         6Na4d3YiNtyPZCyoO1y19WGZ6fIIXiF4j5yLye3xs8jVvh5vjwgvHvSaXRGWlt2BhOxh
         t91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607113; x=1775211913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8zHlEOpelJ8OaHxvldDIFJWwtoMMZAhyRutBliNnVo=;
        b=Cts94aMOII0LBoTWeq+gzDLgDf9bzDvHKeRWLVrqD4yqBWLUS1M9GRByR5HP3a3oV4
         SupMOwhmIS4ObVqYeqaEJ8PHNVzzSl5Wn1d54nMB+syg2xMZfb9ZdKx5t6Mr2Vwk66mu
         64lC1JjiaenUVHnPMnnevDnO/RdAkPHuur8YOvNzCZdIeLSq+vToIfI/Odn/xUYWwTTD
         8pyXg4n8M1EF/bzDb5Sdwdb1hAdoJKCjo0tRafULsGrC0oxdBXhyT2zfQm8PsIPopCLB
         q+sLGo7stCA/5JqzRJVmBotKC3JIIymYvzn917uBQw0BDVNcxF+QUN9J5NTDV/aazKlz
         MrJg==
X-Forwarded-Encrypted: i=1; AJvYcCXehn7fETYYRyFsJQLmhBCIEldivwJ1Aozbtedm/7ufjCIcvd7ADcxWG6yr0RG5Snba3mt9jtLdl2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJdBctyarVDo2Nif2Ifj1Lu9DtqfDvY+AY9a6yQGz3AM6patC2
	o5sFQEGY+1vJlrq3Wn7xErSl+SOcgS9JxsAwqIDSuiBAzU4b7on13YAmuHB0mGE5TGOaejBkwd8
	gpdh5OLJi/jngz1pDws9BknClFeZ1pQc=
X-Gm-Gg: ATEYQzyQxG0TNVgzxuxIPCCsR1IZgdXtiBBPkPJ+ix5bwH+wFSAm1+XTA797NOzou4B
	XWsvMu27HvVZB66ufWkeub5utd9pA0MWMaAfgMynHfN1odDMqGaSE41tQpfAFAmDzukJgrVnt5/
	6RHmvdyPb1KMzy3ISY/RwvqPGN95H01+Irrbi198FA11U0p7X3gLMxqoxeY32lHeMsPbvkr8vM2
	w0PJB16TtVn1nh5iuGPjOY1mzhhs5n6esBhmcpRhz4MvE3SnZhGstqj/qOKVvQ+PY2flAYOdSrm
	1asHfrM5ttZiM8jgjw==
X-Received: by 2002:a05:6830:8d1:b0:7d9:f50f:9693 with SMTP id
 46e09a7af769-7d9faf4ca25mr821072a34.23.1774607112582; Fri, 27 Mar 2026
 03:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <acYlxRBhSMcwBnja@hyeyoo> <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
 <acY5G-lKZQEsUbRw@hyeyoo> <CABXGCsPQo=Npum2aHet3QkZWkWEnEVMAw0KQ1AHPrNjMn=9bmA@mail.gmail.com>
 <acZDJ4Nfw4x7HCSr@hyeyoo>
In-Reply-To: <acZDJ4Nfw4x7HCSr@hyeyoo>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 27 Mar 2026 15:25:00 +0500
X-Gm-Features: AQROBzB0-C_A6yb1j1_yQpuE6IZJqUuOjkwiTCpaemv5WY_Vd0aH5YH0GiQl35k
Message-ID: <CABXGCsO_C8++4+oPfZ+bQyrBnEGy5JFpXHkGNpfy+8=5BvVNfg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35543-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25CD8342B43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 1:43=E2=80=AFPM Harry Yoo (Oracle) <harry@kernel.or=
g> wrote:
>
> Probably what I said was misleading...
>
> I didn't mean "the architecture is fine with overlapping cacheline".
>
> I meant "not defining ARCH_DMA_MINALIGN or defining it as smaller than
> L1_CACHE_BYTES is how architectures tell kmalloc subsystem that
> kmalloc objects don't have to be aligned with cacheline size."
>

Hi Harry,

You're right, I was wrong about dma_get_cache_alignment() -- on
x86_64 without ARCH_HAS_DMA_MINALIGN it returns 1, not
L1_CACHE_BYTES.  Sorry for the confusion.

So your suggestion to suppress the warning in dma-debug when
dma_get_cache_alignment() < L1_CACHE_BYTES would indeed work
on x86_64 and other coherent platforms.

I don't have a strong preference either way.  Both approaches
solve the problem:

  - slab side: prevents the overlap from happening
  - dma-debug side: tolerates the overlap when the arch says
    cacheline alignment isn't required for DMA

Would you prefer I send a v2 with the dma-debug approach instead?
Happy to go whichever direction the maintainers prefer.

--=20
Best Regards,
Mike Gavrilov.

