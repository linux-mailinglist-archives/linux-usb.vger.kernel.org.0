Return-Path: <linux-usb+bounces-35565-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BeABiiWxmnrMQUAu9opvQ
	(envelope-from <linux-usb+bounces-35565-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:37:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 823BE3462FE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 15:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DD12300F1A0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 14:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67733F54AA;
	Fri, 27 Mar 2026 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe5ZwjDB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499D3F7A8A
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774622243; cv=pass; b=mZVWdRaZ2nbOEFy80TrNY/svYoa5dgQqT60K9e62MKNESppYwew9p+DqZwezuvu7kPTgULZliODsYrwKwbRrqgIdSMmn3AgU9G5DNSzaDQtHCfPL1nvmU7rCfxg8HiYe2NGRq9nhSPUJY6gPQQBPMhssvHIceXf9mrb8szOeS6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774622243; c=relaxed/simple;
	bh=4xYgmMXOl9QJbCC4GUNiJU0syuEKGc9KS0/u4LFtR4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1C0FVk5sRFTK8ccJ0UKxNk0jaR1Hd/P6VIYuIL/80nph4Jo/TTcwVoIeZuAuydzPDNE0F4mi49aPHIrOYm0pSzW9t0YUCnsIAeVe5hM6QVM36yvPYhu0squ4QQ+2GY/KjD/qTPFAPa+cNwE9SwpcUFYV7YDtdtOf0+UoqCfuGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe5ZwjDB; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d9e22176a7so1074379a34.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 07:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774622240; cv=none;
        d=google.com; s=arc-20240605;
        b=lzt8utycy0Va7g8JIAgD8nUzuPaeFi6rlesPvcCgMtbJjgef1/4cpulbrMMB74LMM1
         SwK7rh+I1CsnHhVII1Tmr1aQvXn1Z5l8/UTmpYnpwf85UmPQHmf9v4xQOnjpXPDhuYEV
         QxnUiiLaORbHhWUv+SNqRkHy16DCf2ikGpVLK4vXUA4+rpmtLOLSP0n12W1l8rsAca7d
         SzELtVH/JS8Txqwl/Yqz9k/74twXmLCnCBrS4j9KRB5AU6Srr+uLJGSSk2YZd8DDWBS9
         nSasDbS/nb2jUuVeB1fGQ+r0E4j0L8/KG3opSljDqjgV03fmy28EL31vdwW3WWH2StAH
         31SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xYgmMXOl9QJbCC4GUNiJU0syuEKGc9KS0/u4LFtR4I=;
        fh=ZMggr6EcTVTDDVhTS5/DL0Y+2blwGWZber2JAGypji0=;
        b=fMJ8v+oijZMBk2KMYCU9DBQooVRRNZk1z0lP1qjT0b/cxx7JRaiv3B+LvxcsYGyXql
         9jZqHR6Wq1YWYwTvWrWhKKBolTLdN45+YEq12+ZPhpsmOEfLYQqSARlqNkk2V78k0/sJ
         /KeLEsn1MmiIn0SS6UOI8zef6YY6aOdPB6xP5r0z+pwOe/4SEJGZhyzdDbhrLI1PAKti
         m+4Jg675QRZQFrWuUmm3reih1bxk8vyi/a0448NJBID6jRBoMVcT/yTPjtt0HPCuk+U9
         wBdcv++mCT3ypJNUAdIow2926DvyctF2X2czGfxvs1pY2pNGzoffW/ubIoq0pxaHNLw8
         VzSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774622240; x=1775227040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xYgmMXOl9QJbCC4GUNiJU0syuEKGc9KS0/u4LFtR4I=;
        b=Fe5ZwjDBd4E2HROog88SVGbIJTLAG1V3YnbVW/D3UkCPq2bblGqnxhEf08gZKAP8LX
         +UVygamTjh87fOXkQEXiitcqUOhlRJTkAxq45S9gEDCMRhOdztiM9BSLlzBeIzZIuWwv
         LfZ/cMFOyA3oA/IMP5q4tZsSrTRD+LLLFZ32qqfKDyqBDLG4Lq9X+A+/Y05gG/giGhtn
         zQA8hBJWf1y+SO+5+n327Fy97tzd1EuFFIRv3j7Gw6aQ7X0dyqyyjCLD3rg5EhgkE/wT
         aorF0OtjoSxo1s4Cbjxv1dj3Pwr48tl8Qkw2CgZrLd1xd3aPFBM7Ta4UxkZ8JvCOFRSD
         R3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774622240; x=1775227040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xYgmMXOl9QJbCC4GUNiJU0syuEKGc9KS0/u4LFtR4I=;
        b=krxDAWa9jiTqS8KllM11bVo7m/82G/AyH8HWHtmBuMVF+jABofoJHfbe/htaNrh5Tu
         ZjSGuV3LoKZRvZy2ee+3k5HHZlKhotKk2NcMCOWtcTsZuibf4dRkYskqpTypnMC/b3ex
         aUeAK3GFsZ4AcuGhcKmZ+it/Cch1pjJ4fJ7zqffa5HSXr2a4ZGn5DkXoglO2JH3kB1GG
         KBWbQeC+RVfE1ZnYneR4U9eNL1ZM4qGvGChs5Yr+kT0nBKu2Ce+GtiisQSV48dFdzhzm
         +bwDPlwS4DqLICFi2Op4IpPb1XU0uFpdakap1tiHQugj0cW8ra1Uu2ODje3YzZDTRRug
         ChHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5ET1gAJmVV9B3cijHgFlvVHk71duj5W4itNqV+U0ldTy+SlZ0hmNlDRq4/RNl3sPJCqw+6MuJcvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxITFpX15uvrGr90iuz1iK6k3LeLLPelPCH9+38b/ZPGPTZklB/
	ZGhR5dfqNn9pI2bfY7awTTAPh3FeGVpJfgnSZ3UOoMpqSu4Q0C5LDxK8yWndirlnDyAmI6jVoHa
	mBNz98kpphEVzG4+EMfzb76MMRhyqG4c=
X-Gm-Gg: ATEYQzzIDr0f1fOGUFcNObAe3YdlMVQwNn2LMKYnyy+mY8LgrbNlGMqO9RrSUhapUJ3
	FKJAYWhdwv+3K0jvVe/vWGQgmQSYTmz4OLLO6ZPit+KZgCrayhXdZQB/wZp7CEkex60UBQiq+bN
	7n+i4ZFwPTfRuBILxpYRnePKVB098nBOeIMG/RUbjNenr2fQ/ojJgV35kDtoEGdj1OKj8ujaWRm
	kdOw/QzjHf+lAsfxz/oNX5MjO4Yu5s7XG2g/5iDv38DeSUu2JvaB43t17KmrXQYwvMJRddNLhbz
	NX6ri9Q=
X-Received: by 2002:a05:6830:3895:b0:7d7:d2f5:1d61 with SMTP id
 46e09a7af769-7d9fadcaa65mr1412844a34.4.1774622239937; Fri, 27 Mar 2026
 07:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com>
 <CGME20260327122625eucas1p10eabcb31aada4e11b5c2ebcff4cb3c39@eucas1p1.samsung.com>
 <acZ3ZUXhFHpSXzYS@arm.com> <d2ed7315-72ff-43f3-bfaa-995025cb9419@samsung.com> <bfa5ff0a-8ef9-46cb-8881-396f71ed5be0@kernel.org>
In-Reply-To: <bfa5ff0a-8ef9-46cb-8881-396f71ed5be0@kernel.org>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 27 Mar 2026 19:37:08 +0500
X-Gm-Features: AQROBzCwIuxZlwe-ZTEq4hn8TNXRa68NgSRLtpj4ujZXiYxMYZMii3XpyteXFcM
Message-ID: <CABXGCsNDfuLQ64r=sMyJ0UYbzZT_j8xsH5h0gpAGTPwV64Qp2g@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	harry.yoo@oracle.com, akpm@linux-foundation.org, hao.li@linux.dev, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, linux@roeck-us.net, andy.shevchenko@gmail.com, 
	hch@lst.de, Jeff.kirsher@gmail.com, Robin Murphy <robin.murphy@arm.com>
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
	TAGGED_FROM(0.00)[bounces-35565-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[samsung.com,arm.com,oracle.com,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 823BE3462FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 7:30=E2=80=AFPM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
>
> So what about Harry's proposal [1]? Mikhail seems to be on board? [2]
>
> It seems it would achieve the goal that enabling DMA_API_DEBUG doesn't
> change the kernel behavior? But I don't know this area too well so
> maybe there's a catch.
>
> [1] https://lore.kernel.org/all/acYlxRBhSMcwBnja@hyeyoo/
> [2] https://lore.kernel.org/all/CABXGCsO_C8%2B%2B4%2BoPfZ%2BbQyrBnEGy5JFp=
XHkGNpfy%2B8%3D5BvVNfg@mail.gmail.com/

Hi Vlastimil,

Yes, I've already sent v2 based on Harry's suggestion:
https://lore.kernel.org/all/20260327124156.24820-1-mikhail.v.gavrilov@gmail=
.com/

It adds a dma_get_cache_alignment() >=3D L1_CACHE_BYTES check in
add_dma_entry() instead of changing ARCH_KMALLOC_MINALIGN, so
enabling DMA_API_DEBUG no longer affects allocator behavior.

--=20
Best Regards,
Mike Gavrilov.

