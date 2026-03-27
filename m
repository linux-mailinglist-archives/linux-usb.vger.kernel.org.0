Return-Path: <linux-usb+bounces-35536-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHW/FSgsxmmNHQUAu9opvQ
	(envelope-from <linux-usb+bounces-35536-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:05:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E23402A1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 08:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F1FE310C8F6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 06:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD35F3C061A;
	Fri, 27 Mar 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CivIGDIg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CE3C199B
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774594228; cv=pass; b=n6BK+uAP4ukwanjUBcB9Ay/Wl7Aq3/3TTpoMUTILjJG5wRQMS9s+nOOdM5cpfhr3W1K1YMyfwxZnNxSNlvgdn6aTWx4Kk44ER4emm9ncHuxdPeVgSZBFqqll5idkEz/PQRO5WXoCVBoTbrPzYXvscT0XlYt6/aml5+DdHW0A4mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774594228; c=relaxed/simple;
	bh=mWr59OIPiCZdjs/Wa4DCoMAu/k7cJ4tF3qAkyfBgVvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsRtPIDpLKEp7ZpKJZcoRqWEFAE4SQBpp2nMxrwjsqH3YQ7Gzffkj6G9dh3T8zCe30BDJh30fgvy6B61jLoD9vLDBoFeeD8TwULbmSMx/ZimT7kKzqlShqTnAZugkGS3CapVDdhp5avpD7Ii7BvX9aLxN4Ye1qdPAJHbGIe4OBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CivIGDIg; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d9e22176a7so850104a34.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 23:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774594219; cv=none;
        d=google.com; s=arc-20240605;
        b=Zw5SCqGSOb6Eok4HEnbX6KpBHv2VR8Tl+HAM1ngn8FMyrqIfmpg2jy06q8mqHOQ6QB
         5ffOav8BalAV0HTJIqRd4INrO99Ko/zDDiw1AbU6O95Oq+tBrFAOpsjzGikv6n0PfKmo
         f1EsIuFPxL3S+uVE4pvePLZXBq6C8nTgd0jxm6pzYOTAKBfR9iXaMPR3TY6mkAQKRLOz
         zybWd5/B96LOILoZm233OyJDHwecxedjpPZt7eJLiPbambcy94CeihVm+WRYy+wqNVyB
         5ii+Ii4BlBv6FUldtXoS+Q3aWNE+VM0xooSeX5P3cnokOoVFrlTli3p7ZX7knQlr+CVC
         P6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iXjFFBcD3SJF8SimrCdKf4tkm13+ZSGuVlzsZ43PuGk=;
        fh=tLT+0s8r7nKtmLxcqAHWeBQz1igmHUgQOe/oe3YR5gQ=;
        b=G+Z1c0yFuxJQ4KlDhux9Fx+ceEdlk6b3IbwD26ngQ0Ys1/U8et48RgDuLQv30gm9Db
         ypl+85LRXM3vCls8TUkLwvjJCcTNBqGHuMSqOj/VUV8l2UixNNSVUo+zLwN8EhkuYTVJ
         cxoRdaDAFyFNy/o6/5RPeEVoGqV4YgEckODPDPE5tJHeMCkGeRNlCg12FRRAhxufL2dA
         H/xnENt0wK0fx9S9D84YdSGpjFkky3tEDezY47/rt3HLEnipQlxscDsxq21aP0T5p9kI
         wcyunLUSVRwqCMlqcTq7ZMssOWx4RyXwvssa9fbljUbUjAt5IPikRSxPEo/2O1ajrXxT
         oyyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774594219; x=1775199019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXjFFBcD3SJF8SimrCdKf4tkm13+ZSGuVlzsZ43PuGk=;
        b=CivIGDIgxRz5Vy6nC1xhBQp4PENupx+Gt0M2vsYaqdKg0wwG0uLK93Ry1l4eKtO4K1
         Baa2xxHchnFe11AI838/Yo3ZjsLnJscwF3RP7khXSRsPddLLfI7/HTkqQUqR6K+BS/kf
         UuAS2kOSjEJutB4pFzaqJCevFQm5En76jzf1smyu8LhjdrPEWhDHie6Q2OT1i6DGlSFv
         OV9P8mVNYFtWEerPpR7mOXDzSkakPailw83ysrXlRMbNM6PCyUMr+TW55J5R1lkWwqqj
         imqrBjdqDlAmA45Vkf6yfyUcVrn3YLQd1An8ZWpvl6zeldce5JqnBfz7HlBm1m37NO/y
         wIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774594219; x=1775199019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXjFFBcD3SJF8SimrCdKf4tkm13+ZSGuVlzsZ43PuGk=;
        b=hOt/GrxlHm/+NgqFzrRcWNBm/15r4WioG8ppFuIw5iYFLQ9iAt1xw4pfLTfoYUUPea
         9JOEEk0/Oi62YMy7Mn9zXZTprB2y49feW/6Dn9Xl2WdkMmC3QN3fpgylnPwvw06ICJpk
         M1cmIwouiGGy0EK9wSUAx2eppsETrglxU/vJvxANsrOJTaz8zt23OSiNOtAhaEVARLRk
         rkWWF2HYh4TCI+7It84vOKCffc6ktfgMlClCDzWJfRdbOsqoWWV59CRhLt8+wnxp3j87
         GkpeavIGhHD9GiiLrz+UzMwrZhhOmCLuTFP9puc5gJoKHAwv1EzxwWV+TgSMAJkcavWU
         wRHg==
X-Forwarded-Encrypted: i=1; AJvYcCX/fbOm2+rOpsyqBNHmVABM1XuGKCLn5I2JdBKF51Ov92NZpZkuAVoej73D4lQCfzDz5T3133GGAYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJ1/inou3Met//v8Yg6P1E0dDUiyRsBUv7A51MbhIjciu495Z
	MerIZzxg8CyK+ECVJv0kI8/E0sD9rRTMlF9ec7kJTQJzYrOTv+dqv6HY5MCBIVJNLmsi0HkSib3
	pnfgRIL72g0RR5pE4QYiPDzxdac3XScQ=
X-Gm-Gg: ATEYQzzykZLhSbEZFM6entKtYBuRQXh+rO/iWmRnRrGGJzsVAMzDKtmDJPu29zruHdO
	a4ZW3gTKVEoAPUwZ2+pts0U/CWd1YOdXUaRwupS/xi/QpYQATmCWC1GEY/QApILPlCQp6TJH/ca
	Z4aSX7pGuqEt8KZousFTkXqX1kSgb0azWlhM9YRIceJ5RsD8kY88j3dVePqDaw/FtIXSFJikyoD
	m8R3yQRWIDHdIsgSWFtHRkAvNhsdHwPrv0YECWCH4rJEb7cZWOc7MFwmcHIcF96PTFWDkH6nMX5
	VgFl47eGeqLp4yZ5HHUE
X-Received: by 2002:a05:6830:82d1:b0:7d7:419a:7ac8 with SMTP id
 46e09a7af769-7d9fae3e615mr593879a34.15.1774594219320; Thu, 26 Mar 2026
 23:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327055846.248829-1-mikhail.v.gavrilov@gmail.com> <acYlxRBhSMcwBnja@hyeyoo>
In-Reply-To: <acYlxRBhSMcwBnja@hyeyoo>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 27 Mar 2026 11:50:07 +0500
X-Gm-Features: AQROBzCSJ9XrV9me08FJoe9N5FsTCYU6wreGwMbyYjqv4H9TotPPKCpBSj6ZRjM
Message-ID: <CABXGCsMTk6kDuJxsTAUKP6npTvp4X6Ryng+P4xjMUsPbTA43+Q@mail.gmail.com>
Subject: Re: [PATCH] mm/slab: align kmalloc to cacheline when DMA API
 debugging is active
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, hao.li@linux.dev, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, linux@roeck-us.net, andy.shevchenko@gmail.com, 
	hch@lst.de, Jeff.kirsher@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35536-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linux.dev,gentwo.org,google.com,kvack.org,vger.kernel.org,rowland.harvard.edu,roeck-us.net,gmail.com,lst.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB4E23402A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:38=E2=80=AFAM Harry Yoo (Oracle) <harry@kernel.o=
rg> wrote:
>
> On Fri, Mar 27, 2026 at 10:58:46AM +0500, Mikhail Gavrilov wrote:
> > When CONFIG_DMA_API_DEBUG is enabled, the DMA debug infrastructure
> > tracks active mappings per cacheline and warns if two different DMA
> > mappings share the same cacheline ("cacheline tracking EEXIST,
> > overlapping mappings aren't supported").
> >
> > On x86_64, ARCH_KMALLOC_MINALIGN defaults to 8, so small kmalloc
> > allocations (e.g. the 8-byte hub->buffer and hub->status in the USB
> > hub driver) frequently land in the same 64-byte cacheline.  When both
> > are DMA-mapped, this triggers a false positive warning.
>
> Is it feasible to suppress the warning if dma_get_cache_alignment() is
> smaller than L1_CACHE_BYTES?


Hi Harry,

Good question. I considered the dma-debug side, but the issue is
that the cacheline overlap check in add_dma_entry() is intentionally
strict -- it catches real bugs on non-coherent architectures where
two DMA buffers sharing a cacheline can corrupt data.

The check already has suppressions for DMA_ATTR_SKIP_CPU_SYNC,
DMA_ATTR_CPU_CACHE_CLEAN, and CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC +
swiotlb.  Adding another special case (e.g. dev_is_dma_coherent())
would weaken the check for all coherent platforms, potentially
hiding real bugs on devices behind non-coherent IOMMUs.

Alan Stern discussed this in the bugzilla [1] and concluded that
the slab alignment approach "seems reasonable" [2], noting that
"turning on debugging should not affect the way the kernel behaves --
otherwise what you're debugging isn't the same as what normally
happens. But given the way the DMA API debugging is set up, I don't
see any alternative."

The memory overhead is only present when CONFIG_DMA_API_DEBUG is
enabled, which is a debug-only option not used in production.

That said, if you'd prefer a dma-debug side fix, I'm happy to
explore that direction instead.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D215740#c31
[2] https://bugzilla.kernel.org/show_bug.cgi?id=3D215740#c44

--=20
Best Regards,
Mike Gavrilov.

