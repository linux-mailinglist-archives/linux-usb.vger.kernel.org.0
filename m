Return-Path: <linux-usb+bounces-23112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF7A8B293
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 09:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E54188A663
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 07:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D471322DF99;
	Wed, 16 Apr 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jt5UjPgz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE181607AC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789694; cv=none; b=n7/83ZC3AkDTyaKzkLeYqzDxjsSspnFCUa31Qg6qg3s1EyoG1CR6AlMzqF82X1T2TPvx1k9bWrWCK3ul0ue4cP9jzHYtir4XLuj2TJvLCLtyAne7ATAwDvAMXNBFe9DKxMnjBXbHJP5fRNDSGdZD+4E+Wm+SgZIHtLoujZvnXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789694; c=relaxed/simple;
	bh=mlLugVIgUXMn68LUKrSnqKZfI+aiuTTmcGRKFxZQE4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjdub2KF6hy+6xe07KpSj8Vmwq7oCSkwUYIckj6a5RMYigy/uBgAa8PLWuPP66VB/+86lTfNQRsNjD3ll4Wq0Das3MoGt2jp/Ig+dBJoaB2d0urprGKWe19u2BAaUd37l6NKs0wBzu9ScU6lIqzmVAUYsur8yjc3f7p2Glo3eYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jt5UjPgz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso8056365e9.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744789690; x=1745394490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTvOaDEQG30yWMqYolrBjhpkdSkM8de0KjZNMFJpHHE=;
        b=Jt5UjPgzrvOaax5/Qeg5J5Xy16YvkCOVc4HtM2AuF51gyQHKFZggelDMuKijMuNg0g
         RPvDbT0ZhKZL5PxUaTquwS23aOgWNVsD/AHXFMVQ9vnzXchG8EjEXx2nXnafAGBFS8zZ
         95C5/w1YIiWs/w3/pJXy99B7GKf4YI+cWVoHn3tzoVlFg8T/0zL3i9gzBcWgRJh8lOMh
         aH8X5PHWN5MnOmT6vB+b8QWSDCt6rgkSMaB4wmvSCxUmGjT41Qi5E6yJaQ+VsKxBuLfr
         EbCWNEsHI/PjhzlJtPYvp2Z14fyU5uad39e2bo0bH5e4hx/nyPm2OJA2UPinLnaGusR+
         R0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789690; x=1745394490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTvOaDEQG30yWMqYolrBjhpkdSkM8de0KjZNMFJpHHE=;
        b=hpTk/Bf8hKt9IsWBp+AZ7X1lVZ1qmlpzmr0PwvDdUm1menyMlAdDCECad1L1FEg29H
         G2QVZqs9ymLqlFrW9d0qJT3Z4zuNdA0d+eU38HNKVxpKjs/N6g9NZa9j0xG3/L9z+WtV
         /5A8Dj52h3k0EVAw0j1QodAI14f0H0dh5x1xWw3yET86eBWLj6yqRIn5//eYM0HbLJEu
         A/gtEM83cGRus0GDhRUn6IEb9pGw1xWZf7i3kZ6Wdsm9yrJHkKpjdd3FY2ki5G68e7/z
         Y3ZhNXVovPOLOolIvPe17lD1WylYVg+cjJXbBmzSfMlzKOrCal5Da5NMfsuglArIC7nC
         pj6w==
X-Forwarded-Encrypted: i=1; AJvYcCVjhRIe6QaAbXj4R4ybGQ1MwbLNRZ0ZIKeenJWw+7vktcX4aTvRIEPcu+NLrv1A6b4iRS4V77rzkDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kbGgKWcQwfzxiddZx3FbjyVTA/7BGc/5JdamxgFXwd3+cgOM
	+bjGBoTwwOg003MdzqFDDILVWvBZfOiP/HJ2evjrLvhKYThPiEt+A2gWiXubHXWhIkJ/dl355iq
	9QvsRRQ==
X-Gm-Gg: ASbGnctG5dih9FFp0FRlGEsX7+lVcE9f4SpkZc54RW7jIEdF/BU1fxBsStqCYxzeX1G
	WUTHkbwOOaLGW4RLkrT3wgmNUDaJ3ajXyppqGZUMMd9QeHpJBEtAGHE9x+y0yarjWM38XXe5Huv
	1I0z/jty302a+cweUOfUNQERSozMxQFznnH9pCkNUYh1JcYg8cmDuIahP4ONOqX55UNxnzi4N44
	pVH5oG9Bs3HTBce+pLYUFN6NS33FEy/YwYSYfP2kFTwA399HTv7V/KV3z/quiEtnqe/RL52ynrb
	RDZDnIoAY2nmi3i1dd1IsPwEf/2Zi65TGttzVC3bL/F5ufxyrlCy3HjFTrnIUfF33tc/6Twb5C5
	k8yT4zBhvHGbUukYYhOZoAEVOp8R+RA==
X-Google-Smtp-Source: AGHT+IFOauWmzV5VTo8P00eam5tza1oS3n8d1LwySwXAoWJeZ+FWxgBAT6OBdbDfI53apvgsnPAh3w==
X-Received: by 2002:a05:6000:4205:b0:39e:dce8:1c01 with SMTP id ffacd0b85a97d-39ee5b99f7emr245421f8f.12.1744789690290;
        Wed, 16 Apr 2025 00:48:10 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3ed7sm12862225e9.24.2025.04.16.00.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:48:09 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:48:07 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250416094807.2545efd8@mordecai>
In-Reply-To: <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
	<2025041110-starch-abroad-5311@gregkh>
	<20250414090216.596ebd11@mordecai>
	<522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 09:53:24 +0200
Oliver Neukum <oneukum@suse.com> wrote:

> On 14.04.25 09:02, Petr Tesarik wrote:
> 
> Hi,
>   
> > That's the point. AFAICS there are _no_ in-tree callers that would pass
> > GFP_DMA or GFP_DMA32 to hcd_buffer_alloc(), directly or indirectly. But
> > nobody should be tempted to add the flag, because I cannot imagine how
> > that would ever be the right thing to do.  
> 
> You do not dream about putting USB onto PCMCIA over Thunderbolt?

Oh, I do, and that's precisely why these GFP flags are no good. The
address (and other) constraints imposed by different buses may not
(and often do not) match any existing memory zone.

However, zone address ranges are determined statically at compile time,
or latest at boot time (e.g. arm64). It's too late to adjust the limits
when you hotplug a more constrained bus at run-time. And I haven't even
mentioned bus bridges which add a non-zero offset to the address...

> > I can change it back to mem_flags &= ~GFP_ZONEMASK to fix it silently;
> > I simply thought that driver authors may appreciate a warning that
> > they're trying to do something silly.  
> 
> People rarely appreciate warnings. I think we should limit them
> to cases where something goes wrong or something unexpected happens.

I'm certainly no expert on what is expected to happen if you include
GFP_DMA in your HCD buffer allocation flags, but the current code will
*ignore* it, unless the HCD uses PIO.

I thought this was rather unexpected.

> > Whatever works for you, but please keep in mind that there seems to be
> > agreement among mm people that DMA and DMA32 zones should be removed
> > from the kernel eventually.  
> 
> Well, if somebody finds a legitimate use case for these flags, the mm
> people should deal with it. They are likelier to find a good solution than
> all driver writers being forced into finding individual solutions.

My goal is to provide an allocator that is a better match for the
constraints defined by dma_mask, coherent_dma_mask and bus_dma_limit.
For now, I'm trying to clean up some users of GFP_DMA and GFP_DMA32
flags which look obviously incorrect.

Petr T

