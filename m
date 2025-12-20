Return-Path: <linux-usb+bounces-31654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B55CD2F8E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 14:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C303F3001832
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 13:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A8B23ABAA;
	Sat, 20 Dec 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDTUDEaN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7C24468B
	for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766236520; cv=none; b=i8D8wiMzjy5HDd/HLsU7mytQRNXNZcLgSw216v4v6yojoZMwZiEDkMPijyBJvoz+73cv5Vb9fRgytVJ09Umifw1hZmCERiGqmLI2jgmn8Fyv3CbiEc4zrr3aS7gxbVMUKBABabAt3C1dyr1P8KmaWdXqnWT9To8cxj8k0QNApYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766236520; c=relaxed/simple;
	bh=7jK704Mqtj6QiA3VlfvZIt/Bxv6TMyGPOWrng6Upt2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMm1p2jQEEyo7OD6fiHuCoAis68l2v+EKi9SiMgrH53wEz/aDyBpqh7zyP8/Ju975XYQG9YvUBabR4B2U90Z8UA9NfCu7FvbWZBlvJVyLI0pPyw085lTnhzoY3s2HlFUbbGwYQJkp7KwhTl8zFbHl4kU3a7wokJ3q0F/N5FWtKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDTUDEaN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso2293340a12.0
        for <linux-usb@vger.kernel.org>; Sat, 20 Dec 2025 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766236516; x=1766841316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzN1iErmKRYMzjyS2Nnjlf728qTYKE6BOmNVmIqMOzw=;
        b=HDTUDEaNMpDvys0k3PprDVLdBvVABXpfSu9pP2NqL3U0ffLIdP2b5w+4RCrX+ErYr1
         zvpwyHtPf0fnE7+u4DMfvA+XT12jqfaO35ZH0jGf9IEmEoo9kuZ82TfAa8nsU9TwxgR2
         hf8Jyi0EpsvXz0wVFmAsQaIYeDIPnwAZgZYpnn82Jut45obgcO+oWQcSaXBhimH92UR/
         Kcdm3Fn6S9Cbb1OwfEuPw+NokZCQ8adyeIAyWMMO3fGOGzQRva4XzceYCKSJpTuafbY+
         vll56y8Saf6ZQLVM+q/nw7s9y4H8ztljkFeVa7HggqPLE7RSCkKqm+XExuSPkvvTdEv7
         U++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766236516; x=1766841316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uzN1iErmKRYMzjyS2Nnjlf728qTYKE6BOmNVmIqMOzw=;
        b=mr9s6Nhu3Bc3YaMVESiVJUK3SsC7Qsh2pTDb5RTJJ2Px9wF8BP7vg5CcZBOA6R86dD
         q06yuwUVJXwieFnpsc73yYYGC6zEa635oPd/orjD9UdquttpsuN67VtxcSIL9N+dCMao
         iGjjNeiEapXF+6xAmMwMfPqV4hB5ZSJKVAh+R0oopildDUlM7Vq1LeTZ/Wpz/BnUKbr/
         oVYkWdHjHZJRrf6lcpXe+V0VI5kT+6xhsXIPBJdpP1k4xhdBTZlJrYlbw9Cpz4kwlvZl
         068nE1cemrqwKwFI5xRo/7EqCM4JG8iZseYmglUssrcmyugbIGt6QpEOOMdF/m09VIil
         QPqA==
X-Forwarded-Encrypted: i=1; AJvYcCVDrOogbUhksZqau1YsUvkKHUNDI6B6wnFGPym1xLSP98a/L46Q6P8VvLA07aYOh6FvilopVd3COpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG8j1HGm7OtRgK36y8tL8ykZUpdl763TrPQ9NwHAhAR7NddBI5
	8aAlPi6qIcAMQQNcKvFtMwV7MLDZq4HJpvK9vwDqu3OOi4no7dTOFFaV
X-Gm-Gg: AY/fxX5Er+IT3e4fBx+ujo+4BOLlrn3iZSSv4gEN40zIMuR9BDOCQONHLEifwcR0f9u
	GgK48OA0eVwfZkwdnmOfSue0MWILX9QkRHkg7AhwMTmXOBeIqWhub/0cX09+7UcS52oo0tAXuRj
	LEgmRhzqsw78YqBE5qzf0sCzQtYSzEFkD3rtEc0UAqN6rMhbKblb3eUuzCT8Ykm2ZWqhTU5xCnH
	oIOgRn8jYPnkcWJtMRugCg9qOT8rbNJ7iKjHFRm8qvMAuPT38y50Fy5dtMYazzOOOimo3zNigmg
	CHqzsCEgt6O6um76XeTBdxwduIWsEGP/o4w3l2jsepWRQ6XLvqGv7Xq0FUy3HQXtEcpFLmG6OJa
	uAcIg6iYBUPtEasJI9rOqqXMQYzoVkFaSLamAtwDM5wdE4DcRDGuRlK+JdJgGA2MMEPuvJXg7bl
	68d+JYbne/Jg25uJrQIa8wO+0XRPzFngEuhg==
X-Google-Smtp-Source: AGHT+IGYWZU+cwyFaqBHNyGQOpa3FT4HZheHu9DiPgKQ2wU4Bwi/x1G+SZAxq1LghZc3C6cndsVwig==
X-Received: by 2002:a17:907:7ea2:b0:b76:f090:777b with SMTP id a640c23a62f3a-b8036f13dfbmr528837866b.22.1766236516230;
        Sat, 20 Dec 2025 05:15:16 -0800 (PST)
Received: from foxbook (bfd193.neoplus.adsl.tpnet.pl. [83.28.41.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f511fesm509765566b.65.2025.12.20.05.15.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 20 Dec 2025 05:15:15 -0800 (PST)
Date: Sat, 20 Dec 2025 14:15:10 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sarah Sharp <sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251220141510.1bc1ef19.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 19 Dec 2025 15:53:08 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> [ 4021.987665][  T332] Call trace:
> [ 4021.987668][  T332]  dma_pool_alloc+0x3c/0x248
> [ 4021.987676][  T332]  xhci_segment_alloc+0x9c/0x184
> [ 4021.987682][  T332]  xhci_alloc_segments_for_ring+0xcc/0x1cc
> [ 4021.987688][  T332]  xhci_ring_alloc+0xc4/0x1a8
> [ 4021.987693][  T332]  xhci_endpoint_init+0x36c/0x4ac
> [ 4021.987698][  T332]  xhci_add_endpoint+0x18c/0x2a4
> [ 4021.987702][  T332]  usb_hcd_alloc_bandwidth+0x384/0x3e4
> [ 4021.987711][  T332]  usb_set_interface+0x144/0x510
> [ 4021.987716][  T332]  usb_reset_and_verify_device+0x248/0x5fc
> [ 4021.987723][  T332]  usb_port_resume+0x580/0x700
> [ 4021.987730][  T332]  usb_generic_driver_resume+0x24/0x5c
> [ 4021.987735][  T332]  usb_resume_both+0x104/0x32c
> [ 4021.987740][  T332]  usb_runtime_resume+0x18/0x28
> [ 4021.987746][  T332]  __rpm_callback+0x94/0x3d4
> [ 4021.987754][  T332]  rpm_resume+0x3f8/0x5fc
> [ 4021.987762][  T332]  rpm_resume+0x1fc/0x5fc
> [ 4021.987769][  T332]  __pm_runtime_resume+0x4c/0x90
> [ 4021.987777][  T332]  usb_autopm_get_interface+0x20/0x4c
> [ 4021.987783][  T332]  snd_usb_autoresume+0x68/0x124
> [ 4021.987792][  T332]  suspend_resume_store+0x2a0/0x2b4 [dwc3_msm a4b799=
7a2e35cfe1a4a429762003b34dd4e85076]

This looks like some out of tree driver tries to resume a sound device,
and apparently it's doing it while xhci_hcd isn't ready, perhaps during
the power_lost branch in xhci_resume() after full system suspend.

I suppose dynamic debug could show better what's going on:
echo 'module usbcore +p' >/proc/dynamic_debug/control
echo 'module xhci_hcd +p' >/proc/dynamic_debug/control

If my guess is right then USB core is failing to prevent device resume
during HC resume, but IDK whether it's supposed to prevent that or if
the out of tree driver simply shouldn't be trying such things.

Regards,
Michal

