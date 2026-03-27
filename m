Return-Path: <linux-usb+bounces-35549-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNyNF/d5xmnwKgUAu9opvQ
	(envelope-from <linux-usb+bounces-35549-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:37:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F9344448
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 13:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74B5530525D5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 12:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A40F222597;
	Fri, 27 Mar 2026 12:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDTOTZSl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A121ADC7
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614939; cv=pass; b=ZQ/V99690AysLdW4n0KRaaWEyuBmY6q6+0hp42nWvipDsjKZiiGg57rbLY9lSC46wAeIA8jlgRg8q+4wYUT2pfJPFDySFsT5+F1GbvDVkqF7OSCdSP6wJsUbJ9dEYZjEs1onjslzgv9f1mKkG5M81UTBsPukOfnHXY73Z1w+ouE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614939; c=relaxed/simple;
	bh=5cOyBNoqrTish9nBBS87UAnS6CU3/R9H+gkn7UHvmow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfW4oJAntytHXwNoqQ00TSNVWcVt3MNs2bXXvm3JqEVzQhKUloS3VoolIE6r+RQ8F0O3g98jhh+r5BCy34Vmk+2W+iGafDY1Ysj4zD0vgYTkiKsDvPNDKO2ugaqvWs9vStEMECfWWbpgI0nRZnvSwQRbqMWtjluP/E4cbUO0MVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDTOTZSl; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b936331786dso229983666b.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 05:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774614936; cv=none;
        d=google.com; s=arc-20240605;
        b=dDrUOq20xijFGZuVixpF5QJD1DKdWCeVzGupbu2/vHBirjCptB99XpLVCPg1BcI0t1
         I2WAhJOY0Uju/J6V4qsyVAJ4nvglBEULgs+SgIRD9fJU+mjNR7mViHHz/1DEfiChTXl9
         7i8jZc2ygXGLMRa4FLvsCXhbq2aIQ5fD34p70rjNgMGvfhK4o7D8nbbQ1hxXWbU4GZnJ
         3UiMGmimKhwTHt4rcj3xFLMjP3R2nkBrPH+2I4IR97ETZ0BpfeSBTelUaDXhf/d7Ugyd
         TwbXAWXIOQCqcoeh1MRS4vhSSuPhg8vq6WMpp/F3DZWde7alZ8F96K+phIxoIAl0nv2o
         nj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5cOyBNoqrTish9nBBS87UAnS6CU3/R9H+gkn7UHvmow=;
        fh=ycO3rTy+/ay3vChLPKZ8ZdZsi4BLWN/HpmfCKky+DOQ=;
        b=QCluzDvcqabjf4TmRrrFM2C2/6lkyhVdxiYWp2qKpJ2pzM46QagN5wp0/pKr3VsNoZ
         CxEn1DRISGLIar+2MhFNJn/wP6lW9htFHx6d1wNIDuP9gFilN5BLakRK/2nQcATMhE+m
         wRTcWPzSrJv1+BgpByxzJ3afmvqUDABCJsIdGYKDE57dJLTOqMKBkm18niNfKv4BAXKA
         wDvUSgAW0mEZZDXS+RpJBx4uNiOhRln7331c4OuPsxj87UfF1+KheovahqRBIeK1ypKR
         hdzzHIObbUVo7t+btZBv/owFQk/52MMq7rU6q555X1z9oaPsMe9wn3rYfE7BsQ1ew4b4
         kxoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774614936; x=1775219736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cOyBNoqrTish9nBBS87UAnS6CU3/R9H+gkn7UHvmow=;
        b=hDTOTZSl8giVTfchqfV1qmgf27MF/qdda6lMtUPEsJgLk6b5H5LsQ0Jl5knXo6igdU
         ulAVPyKxvwSd392+aI7Kwq+ZD1q5jeL1x1xyCtt2ngLHEAt03Q5Xk95XW6/irQhCHY2K
         CaO9iunTyJdkP23j8YUKe1ppnFQ80erIFlhi31M+wMuGVIAu/Fhi/UxS8Vc0lK8gzjq5
         WJl8CQnI+84YsOeo+RJJc8Oj5gACtNYk7uJ/61QA5aDWW0uga4QMfJMsOG1uQHCBgey/
         MIPHguneBhfL6YFnMg13xV2NVGYVBAgwnDWKuD0ntV3caql4L7D26u1LKHpu2d/07kMp
         HZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614936; x=1775219736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cOyBNoqrTish9nBBS87UAnS6CU3/R9H+gkn7UHvmow=;
        b=pfUodJslK45GbAGPj0PLdFk3sJlDZO9QRhjk5LN1Cx8Nb3SRG5xrP703vZo0z3KFL3
         kqWMNgjIHVKC3/PEtRP/+AkwdSJdhEbAUQ1OeooHAd48u/Q5mhXeGb9xPgNYHoShK3MC
         imYx7WGMuQYgHuWfiiAyCr58k7SSGnAeuY5g58zyPguYYmu59PwPETCOe51Iuylo3aJ4
         oc07iHaDRcWQsK4acrJ1bqWQvDIuMCakZFppJ6UrlR/QFI6Y98z/a1qdQn/NSANtn4TE
         ZKy3Cifr23w+SI1PAuYl5idlpshN0kYck6gJrg42+HjftYQFUQ4AFRlSDE+uRfNjw1iJ
         NM7w==
X-Forwarded-Encrypted: i=1; AJvYcCVupC3q6P+Sd8VXjC9Bhs+lUsnJ4QDsCHXYYhMFNysH9YRFFJi7LpAEiblNJZtL0cIirmgy8+UrXMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCnuoPnp8pmwwPe0NMKouSpw0dtnRv6D3ht92MEeEhWsn66Pmn
	0nZDNj2Nml2qwpFnYUNc2PFZxGn1gEw2QtdIjPtpud5UB/MgjJ4qw9SB1IbNbEvdlCjqZnXZxq2
	b4Iftq/jbN7jCfAwY7lPIzUYsBwAkqrc=
X-Gm-Gg: ATEYQzxgHrzmLncj8trJetIKqUEQMXlivT1+NVLzf91Xpvv63Kb2TileC3c+SZfZKvz
	/Li1fcqYwPxr5Sqi+PGf46akc7aSogS4GW0OtAKCJwXhW8VkOVmfCXqeg1B6t7LMyyLHW6fBBqR
	OmxF470llljSivaRG94ax5u4PTy+TdTq1rm8jWIEnHHsthHIChfz0tYTTF9/dER6ssM1KUed2/2
	7M026UwPzUIRonok0i724PObiN+jy/PO6pd7ygkknU7nx8zMnIcB1t5XyMm6Hjm496jsaS9GkFl
	nZwVrdJ5BfjXCcl7ALcxfa4AsSEp8Vqaaia5FrJN7FcPisNE2NvYWOwDRtev0IjQYKQNyt/XvyV
	XqMQUWQs=
X-Received: by 2002:a17:907:3f07:b0:b8f:b32e:e196 with SMTP id
 a640c23a62f3a-b9b507b20ebmr158948066b.30.1774614935669; Fri, 27 Mar 2026
 05:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com> <acZ3ZUXhFHpSXzYS@arm.com>
In-Reply-To: <acZ3ZUXhFHpSXzYS@arm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Mar 2026 14:34:58 +0200
X-Gm-Features: AQROBzAf3n6UCCCVOWz8_h19fmxDUeJxeUYrZ9qKYYIvgXaEOz3JyzyW2dWdB10
Message-ID: <CAHp75Ved0H=QE0CDfThdOexi0BE2JKrcmTnv1GQJyrf0_-M9fg@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, vbabka@kernel.org, harry.yoo@oracle.com, 
	akpm@linux-foundation.org, hao.li@linux.dev, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, linux@roeck-us.net, hch@lst.de, 
	Jeff.kirsher@gmail.com, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35549-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,lst.de,samsung.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Queue-Id: C32F9344448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 2:26=E2=80=AFPM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
> On Fri, Mar 27, 2026 at 10:58:46AM +0500, Mikhail Gavrilov wrote:


> TL;DR: I think this is fine:
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>
> I'm not sure that's the best way to hide the warning but there
> are no great solutions either. On one hand, we want the DMA debug to
> capture potential problems on architectures it's not running on. OTOH,
> we also want to avoid false positives on coherent architectures/devices.
> I don't think reconciling the two requirements is easy.
>
> When DMA_API_DEBUG is enabled, the above will change the x86 behaviour
> that could have implications beyond DMA (e.g. may not catch some buffer
> overflow because it's within L1_CACHE_BYTES). Similarly for non-coherent
> architectures that select DMA_BOUNCE_UNALIGNED_KMALLOC (arm64 and riscv
> currently). arm64 defines ARCH_DMA_MINALIGN to 128 but
> ARCH_KMALLOC_MINALIGN to 8 (why 128 is larger than L1_CACHE_BYTES is
> another matter but let's ignore it for now).

Maybe for the cases where we do not warn we should introduce a
dev_dbg_/pr_debug_once()? At least users may be informed about potential is=
sues.


--=20
With Best Regards,
Andy Shevchenko

