Return-Path: <linux-usb+bounces-20809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EEDA3B69D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 10:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E83A17EDCD
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 09:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F77C1F2B88;
	Wed, 19 Feb 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHWZYQT9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B31C701E
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955406; cv=none; b=PSysXdIzKIUN8iQWNhTBmVoqE2qLRp1IeiQFphtAWoWk9xcJZB51zp4MroGkEQinxK1g6UyWznz2vpRDiT/hPzJ3QW4EOHoB2R9jbpM2tWBqF7oTSAiuUgt2mY+w+N4LzMwo4eh1f1aHjd5b7nNR7mNWgTLbWQ1p9CS7Xhes4eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955406; c=relaxed/simple;
	bh=C7GBJEVFG2vL+xK0fVqAByaH6C6CM+XGqrwjJ2fLlsU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=StA4UkheVoN/js9catPCvCuxkB39cnMw+dvmLWKm65aI3V4nmjVecpWew2Na+kP7L+8QE6+5b1H9nh1VT2AEMzFBLUIYa8VXIrArRoW9AijCEU8Z7fVUjkBMo3cnp5r3OjkSgAluMDYeYiKonzNaGGmHGl3H6+rgDliZrYDEpEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHWZYQT9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so187199a12.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 00:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739955402; x=1740560202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+2Ge30Q+ndaSsCETTVVD8wtlzHUZbJH+Pno/UFAiRI=;
        b=BHWZYQT9FpWR0oNygDNRYIbtEhnlnvqArpe1wyOTFCrbcTp1K8yABKE4wn6ajChWjR
         y7YbDjoK7sNCekb6fKyFmCrCGsCcDg1cZmJ3svA67JTKeQlq54ipADN5Zk5vTvAEwKOS
         eAqdlUjXKKpIA27Z0DpkiUUbTBxkzxvBJMgcYT2oaDgn5Q7+nWB1aCqM27PIAlTpH7QD
         Gw/zRO0H8vZWdkkE/hgLpqj6+oV5EcIxrX7zbFokwaou7rswIOHNWh90i3f5fDMa71JQ
         OVNrFBsL1i3yeCPacorSVbXNfn0KzcDfNLWu0ISkutVUwMlmVjhgZDZjxSDfdOmlYEzl
         97QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955402; x=1740560202;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+2Ge30Q+ndaSsCETTVVD8wtlzHUZbJH+Pno/UFAiRI=;
        b=nytNhJyGedKmqOik0hIXky8TDlH/K0efCG0iM8lJFphqdxXfMBkyyjYBR3n6H95nZv
         FjsxnN9N3n04lQKbBT05gHZQXeuj/ENVo2jR0oR09N13VlD2PtUPw2y7oKDbtzmnlmVW
         B/mSiizface28F8EVRqOfJ3Q94DZfCox7xNVZZU0KB2uyD4CgB6EKcfda3gCHvpFAB6G
         ULXDsMXGuJQN04QFDueplFA4RT5fFBQCMSxSD4P58yY15z/feLSj/mYGm7gbNlT7Vmlk
         93JLzWTR0aCHFT1yaRcoMCwVW0d4+Ln00adWxEQb1iwUGkDPi9G0iCsdhw1bUg5q6Xuo
         mUrA==
X-Gm-Message-State: AOJu0YxALZWXrXdoeeYSRD9wK9taMyfQxuP3+23toxs7cr/v4BxIOCRM
	hbzLUaTPtnEdK2dwDqWg720jyAy/VIbs6hlThg7/AydAYv/s/vMbor8gDQ==
X-Gm-Gg: ASbGncv21xR/OAkCu2T7GZgvPA2dfGdLoockjh71wkrWMjVAD7vqxbzsld6lsA0nH52
	BqqtCA6441GuS/BIB+51z9TuOFciMRsrEw61memz8CFwY/HH0GYlH4n4f1m+tGNSnxdVAfQdLU2
	cEqJDVOLryTBvTGK6sSfUvzMZ31L4pZrWSuLP1Ug3b7WERc2ygemxn6Jg3DumewDsaquDtvQ2k6
	uRchhRGGv/q2NhoMiSi7NTGIpg5lb6FyGpJTIOX3zzPVT6O2fyLpNNpDeTFgdKprr5Bff63TjKr
	fMA3Hne8uppcSZCq2RojDsfgVEjzo4FN
X-Google-Smtp-Source: AGHT+IFMqvqwkLZGYgjKsV3emimgVpuYfT3YVP497pl+Vaw9QIqkAF4ZGLwfm+KUT4bf3Su1nCrW9A==
X-Received: by 2002:a17:906:4794:b0:ab7:cccb:ae2b with SMTP id a640c23a62f3a-abb70a7b7f4mr1958184166b.4.1739955402201;
        Wed, 19 Feb 2025 00:56:42 -0800 (PST)
Received: from foxbook (adtt173.neoplus.adsl.tpnet.pl. [79.185.231.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe1326bd1sm22010866b.172.2025.02.19.00.56.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 19 Feb 2025 00:56:41 -0800 (PST)
Date: Wed, 19 Feb 2025 09:56:37 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: niklas.neronin@linux.intel.com
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH 3/4] usb: xhci: rework and simplify trb_in_td()
Message-ID: <20250219095637.5bd6e9e4@foxbook>
In-Reply-To: <20250206103428.1034784-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> +		/* Edge case, the TD wrapped around to the start segment. */
> +		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma &&
> +		    dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
> +			return NULL;
> +		if (seg->dma <= dma && dma <= (seg->dma + TRB_SEGMENT_SIZE))

It should be strict inequality for the upper bound here.

Note that this wraparound case souldn't be happening (the driver avoids
moving enqueue into deq_seg to simplify ring expansion) so no amount of
testing will catch problems here, until maybe something changes one day.

> +			return seg;
> +		seg = seg->next;
> +	}

The situation is tricky now, because we are either in start_seg and
end_seg is elsewhere or in start_seg->next and wraparound. But it looks
like the loop below will work OK for either case.

> +	/* Loop through segment which don't contain the DMA address. */
> +	while (dma < seg->dma || (seg->dma + TRB_SEGMENT_SIZE) <= dma) {

This condition looks like it could use the in_range() macro.

> +		if (seg == td->end_seg)
> +			return NULL;
> +
> +		seg = seg->next;
> +		if (seg == td->start_seg)
> +			return NULL;

I suppose this only happens if end_seg is not on the ring, fair enough.

> +	}

Maybe a comment here? Something like:

* At this point seg contains the dma and either:
* a. start_seg != end_seg and seg can be anywhere
* b. start_seg == end_seg in wraparound case and seg != start_seg

> +	if (seg == td->start_seg) {
> +		if (dma < xhci_trb_virt_to_dma(td->start_seg, td->start_trb))
> +			return NULL;
> +	} else if (seg == td->end_seg) {
> +		if (xhci_trb_virt_to_dma(td->end_seg, td->end_trb) < dma)
> +			return NULL;
> +	}
> +	return seg;

This should be corrent, but it's not something immediately obvious.

Not sure if this new implementation is really simpler than the old one.
I wonder if it wouldn't make sense to reorder this after the API change
(patch 4/4) to allow emergency revert if something unexpected shows up.

As for efficiency, those virt_to_dma translations aren't exactly free
and there are two. Maybe it could be faster to translate dma to virt
once and then compare. Sometimes also sizeof(*) < sizeof(dma_addr_t).

Regards,
Michal

