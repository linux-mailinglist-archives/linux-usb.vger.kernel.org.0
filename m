Return-Path: <linux-usb+bounces-31569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C8CCABEC
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 08:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D9E8300F9CF
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 07:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8822E7BA3;
	Thu, 18 Dec 2025 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxQmoiYz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16852E336F
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044632; cv=none; b=RalIYJtx3tBVkkS3BI+QlAJJAfSg+jq+iwENXS/A+2HLChnc8RHK51UEYSIkwElp+XfW25qLoxfRxtQDpKFqDVLzywhvEDO3GEoChvvX8OKibyXe0De0QXdzeN4MC7aIpgs9myI1v3SMC90lHOIwkaGHrCqZFqoBYHGoMsR/aBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044632; c=relaxed/simple;
	bh=UyRtmk2Yoc9VOY/42ir4JFTj3gKit6lMxg11Ri/rM/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cT4CnorNLgjcg7rPOP0FiVHACgdRtTxzCAptPfKpc8bwFV/ZOYdf0/+6o/aRW07ls+JXEPPMiptzZj9cibkXYtYM+MddnNJA/Rqli5OAqBHDC9phvuFtjyRUu9zpf3Sd5dW/msspAhOEsZai3wo1VCcwldro2yc2Hm7eEgnpcLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxQmoiYz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so578214a12.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 23:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766044628; x=1766649428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRWOyK33qwpV/U3VqIR0l/iaDsvWuGLCpLQPhS7lStI=;
        b=fxQmoiYzjKcKuuHsWSiE38k1r83YaSI862FF37nL6stmQf3a7ywA30Lbn1nOxkbYAg
         SfbC9MmvrDzOtiJaMrEosluvFYEshUF26ExjYJjbp3cGr/RvEB8HFEMVLbyUxCirz7xr
         DF73svBynNItT4f2zIWKMGwyYulvryODI7w4qFdcCieHhbvh3t0lqLJSUxZHs6Fx9LJt
         34iGBUjJaCP+hPovlqDmQZDpSR0gCn7X5RBpCly7j+zMj9PQ7Bmb8Kw569pdffOixdB5
         NZGiLFZ9JKbLg18DfnoBUF4gO0sZs3E3U/6CmoEbUEV1vyQ/tpA702/Vy6JLCWLaVbQn
         rHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766044628; x=1766649428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRWOyK33qwpV/U3VqIR0l/iaDsvWuGLCpLQPhS7lStI=;
        b=Jp8hBWbw7CGMr+DU1EwheQ+PLZqyau1cXYyo0+spiUiKPA+NBzWN/SK/kvTPOJHU9s
         ERjBwm9M8mk7bAYq0QbZ1PbBObS/w2MOcF8CUjGpa61rxhG+bSNPKf2K7sOSu6ngABlk
         KXSzx7rptKku31lbqw0l8XeVsWt7vbvy/ol2Q6K9zLvoyZO1AbOgixQidqEBGA3IRyPT
         x8U39A2BNCHGoeEVF5FLab1CAi0UTMKHnF7vgrYowYdZqd/scyxmcGrPg4JHr6QSrJir
         3N4dzXaPsZUY9FHoNlAKl+Ii/4oHtZh3miK5tmAFcCs/FovWT3nY7ln6LrazeGEpbR8B
         gGLg==
X-Forwarded-Encrypted: i=1; AJvYcCWRmSE42A/zPZLj4DWCoDme1LXdXTR4LrqDnEmsOkiHleZB0t82N+c2zfrLxQ7u2VwaJTZYQRb9UtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nFYqKbfyf8JtRLpdlS34UIZeY+/AcHtRGDMuZV3gVrv6ZG0/
	67iuMvVpCt2v59LuAwhpALvTljICDyr3BVEZJQ1jqhId+Jn5XgUcyX9KZngsAA==
X-Gm-Gg: AY/fxX46CvdaUehhq+hSwBONZeW1K0dpZYRfQffc8f6dd54mexTlv30IKa32Pj0G2k4
	U2vc6P1NnYb61pVf/ODDQdtxqANQg4bHbrXDv1Vb0J9PwLoDCTeCWWLWbkEarb7H1OUV60h3v5r
	PyIsC0QuF7Jyy7c4fVDnAkwa5RcV5XBroqQzENQU25rPYeMl5g/rrY3IAd5aBo+0E7tbMsZAe3Z
	H6JdzwIzuSzCaDCflEkOxCVRs09J0grwhsRRpPM84MUE+sWKojKGiUEJQyuwVIlsBj6zmi5IbbI
	9KiOpV03Ug//HHMNromkPw1QKSIDjf2OnJwRZmuG7+aU9vvMdsVS/HFnn410CvkACiViPpQgIS+
	dj4SWrzWSIyyKLBZpcDjd71wWnz633VJ3M46Gjz4lnzayKjcDY1SvjXRACPHMvRBZYeWxLliEsn
	FapUNuGs95bVWvZVHPDyi1Xm0=
X-Google-Smtp-Source: AGHT+IF7VO7E9y3OkIHQIy8g8u+r5EYZai2IA9Ca+7sfa3SW2WwnKq2Gobvme6PToPJKu12XfRAOhw==
X-Received: by 2002:a05:6402:42c8:b0:641:5bb9:fdfb with SMTP id 4fb4d7f45d1cf-6499b2fb753mr20271719a12.33.1766044627581;
        Wed, 17 Dec 2025 23:57:07 -0800 (PST)
Received: from foxbook (bfi139.neoplus.adsl.tpnet.pl. [83.28.46.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5886e9e5sm1713329a12.16.2025.12.17.23.57.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 17 Dec 2025 23:57:07 -0800 (PST)
Date: Thu, 18 Dec 2025 08:57:02 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, niklas.neronin@linux.intel.com,
 zhanjun@uniontech.com
Subject: Re: [PATCH v3] usb: xhci: route endpoints to secondary interrupters
Message-ID: <20251218085702.1db9eb95.michal.pecio@gmail.com>
In-Reply-To: <D7A2A2BD5BF19E5A+20251217094608.3848027-1-raoxu@uniontech.com>
References: <D7A2A2BD5BF19E5A+20251217094608.3848027-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Dec 2025 17:46:08 +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
> currently routes all transfer completions through interrupter 0.
> This can lead to unnecessary contention on the primary event ring
> and IRQ vector.
> 
> If the host reports more than one interrupter, allocate secondary
> interrupters [1..max_interrupters-1] and cap the number of created
> interrupters by num_online_cpus(). Each secondary interrupter has
> its own event ring and can be requested as a separate IRQ vector.
> 
> An interrupter is bound to each endpoint once at endpoint enable
> time. EP0 is always kept on interrupter 0, while all other endpoints
> are assigned in a round-robin fashion over the enabled secondary
> interrupters. Multiple endpoints may therefore share the same
> interrupter.
> 
> Interrupt routing is performed by programming TRB_INTR_TARGET()
> from the endpoint's bound interrupter number when queueing TRBs.
> As a result, transfer completions are delivered to the event ring
> (and IRQ vector) of the selected interrupter instead of always
> landing on interrupter 0.
> 
> All interrupters share a common IRQ handler. STS_EINT is only
> checked and cleared for interrupter 0, as it is only meaningful
> for the primary interrupter. Secondary MSI/MSI-X vectors may fire
> independently and simply process their associated event rings.
> 
> When requesting IRQs, the usb_hcd pointer is used as the dev_id
> for both primary and secondary vectors. Although each secondary
> interrupter has its own event ring, using per-interrupter dev_id
> objects complicates teardown ordering in xhci_cleanup_msix().
> In particular, IRQs must be freed before the corresponding
> interrupter structures are removed, and the existing cleanup
> sequence imposes constraints on dev_id lifetime. Using a common
> dev_id avoids dev_id mismatches during free_irq() and keeps the
> IRQ teardown consistent with the current xHCI removal flow.
> 
> Testing on an MSI-X capable host controller shows that interrupts
> are effectively distributed across secondary vectors. For example,
> after sustained USB transfers:
> 
>   /proc/interrupts (filtered):
>     32:          0          0          0          0          0          0 \
>           0        522  IR-PCI-MSIX-0000:03:00.3  0-edge  xhci_hcd
>     33:      12297          0          0          0          0          0 \
>           0          0  IR-PCI-MSIX-0000:03:00.3  1-edge  xhci_hcd
>     34:          0      17082          0          0          0          0 \
>           0          0  IR-PCI-MSIX-0000:03:00.3  2-edge  xhci_hcd
>     35:          0          0      27567          0          0          0 \
>           0          0  IR-PCI-MSIX-0000:03:00.3  3-edge  xhci_hcd
>     36:          0          0          0      33234          0          0 \
>           0          0  IR-PCI-MSIX-0000:03:00.3  4-edge  xhci_hcd
>     37:          0          0          0          0    1519411          0 \
>           0          0  IR-PCI-MSIX-0000:03:00.3  5-edge  xhci_hcd
> 
> This demonstrates that transfer completions are no longer handled
> exclusively by interrupter 0, but are instead distributed across
> multiple MSI-X vectors.

What's the practical outcome and does it justify all this complexity?

The patch isn't even complete, because it opens a can of worms which
has never been dealt with before: completion events could be handled
in different order than they actually happened.

Most transfer events will go to secondary rings, yes. But some events
don't refer to any TRB and there is no TRB_INTR_TARGET applicable, so
they go to the slot's default interrupter. Command completion events
can only be delivered to the primary interrupter.

All event handling code relies on the assumption that transfer events
that happened earlier on the same endpoint have already been handled,
which won't be true if they are waiting in a different event ring.

It doesn't sound like fun to go through *all* of that code and come up
with workarounds. I guess it would be necessary to scan the other ring
for relevant events before doing anything. Figuring out ordering may
be further complicated by not all events having TRB pointers.


Also, I think there is no debugfs support for secondary event rings?

Regards,
Michal

