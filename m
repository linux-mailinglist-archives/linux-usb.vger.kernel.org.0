Return-Path: <linux-usb+bounces-31126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B314C9ED1A
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 12:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0A15346F43
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 11:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2743B2F2606;
	Wed,  3 Dec 2025 11:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESlFKDqx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F36D2EC0A2
	for <linux-usb@vger.kernel.org>; Wed,  3 Dec 2025 11:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760354; cv=none; b=u2mxfI37o+93v4HOP3Dg0DPh2HLfrNLsWBDXiVpYLZDQf+DYYSILEBom1qLgKFTlxTZDc27YZN8OTolzT3OZdgR8/LNsr7DuqsWZahlUswS6YEIjWU5C5Z9EP6ZtB/myxV8qqY/QtcQoA1E1iFpxQP1b5CWPlplTOPkA57+nrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760354; c=relaxed/simple;
	bh=A+VYNh3DdPGW8JH8O/r8RWezwdIzQnyYEOwBeGy7DL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grUH32K52RZfI3L5kXDqpj/qK/Ws93I71fPWQJk+AI5nDIr8p7V2st1C5mkHH5FqzcYw89vOd63diAzWEbcfirmgqLNVtoKrNitOQPbun11noIrtupq/sJTbx/VB9ss0IpwpBt3s2QbAoEO8REDuba5jyxnzbtRKo8lUAReA1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESlFKDqx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b77030ffad9so836912266b.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 03:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764760351; x=1765365151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0fgGO/WBQF7n0PBGH5KD3L9epDqCTawoNIMaD7tfiM=;
        b=ESlFKDqxIC8HCLMq4Y/Ik9nUP3uz9XmsboV7Vv2d6aZf66ZUR/HXySb7h/ppc7Xfy3
         DpVOK3sg3vKRYHxpMA5hdFY7cDO/0m1R/pvnGXbel5d98/7YjCsr2oEYAsbZcedAFUAn
         /1MeKpR6dKjPqCKSjdSFu89UFgjxdVS//lmjNIoG8g1lQpJpgg1CGR/i0mnFD4lBVves
         uqAS4ogQ/lDzzsA3esfCoPv3OY16pHOJ+xlh08dE8Rusuih60qgafG65CpU6gEfhRGiW
         J+KizM/+kQF2BwZWntbKpeesvCSVMWaAG4ydnP8oWvNS1ylE3SQ5sMbmZUe/1pAN+nrv
         Pkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760351; x=1765365151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0fgGO/WBQF7n0PBGH5KD3L9epDqCTawoNIMaD7tfiM=;
        b=Ms2wvV004Cqry0+PXIJ8qUMjZUJeKqO57PftMaiT3WvuNIGSP47hoF5+s3AFrJwu7G
         zQftZIQQPJ7hlOoQDHSKPC7LIyC+wGXIS9tPe+34dXIfg03aYFBReFowYpFDy0kguDPD
         9eIAeHEZ1povIOQJt1FuOf5UIXenOGxZFy2j+ZjUKhR1lxYa7K17gbYnfAqQrNYNDW9T
         N0Afv8pMuAHr2yYcOvqjYnmFdt3Bu/j6wwpjcP545Q1b8KmQ6zMYrniXP55lrtYbk483
         0pdj9BctQxHIQzwXNh0ZhnF1OGAjiLXauOxpVn1pB0CcNSdCA/Z3cMkhHxl7lgQL7L32
         55vw==
X-Forwarded-Encrypted: i=1; AJvYcCWFuS71oShpH1v8Fe+tVxUwUN3jfRueAOalQ8h8SkcNyLd8s8ehcMt3S4PhazEKe3RYNY0JHjuTm8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTEp6yULNDWEcemqaCYvikbjsHWUPl+C37P7CLNgm/xWCe68a6
	FSUZ+5nX3uV37c2eLuqGjGySUaXdGT3JngcnLkLqGBpoJ7RYdceALb45G+3QaA==
X-Gm-Gg: ASbGnctQMDzhYUr0jcK36K0RS7cmVmP1rwR6j+gPhcr6BBD+iklsbbUQnpW3m2I0twM
	k1JXk85iZXUKUSrwI8ttJ8X0DP5QgxOBK4qTGq+WIRpF3+F4VuOarNZIg5pInqjpJy3EpUd6Pfl
	IM9T/NJvbf5tsZrTMyTZpYmB+CsWvYQIhiME9XreTRPG8QfbAVX/hM1xTZ9yZcjapSw94uZKNS3
	NeLQoY6SIa8KgQ+NFfrwoDgDoPXwkj249E08fgIlUBE9fQiYzEijqZzguNQaxspB2KTVOmswoUA
	QPpJjT+9NQi2dMEwt0ejyf9orC3LU7k/CHUIQDp5Rz/eNMmKhSH2QPF7NTfYZelwsj3m6HscCbb
	RXd2jFqjkR45QkUr1pPc2us7LR9ce2cmnxU9m90N06v03d4H9jQ2h1/qsHaWYw7hy18cj3XuPeQ
	74m7gtXHgAtmRxjzFzGt5qZ5A=
X-Google-Smtp-Source: AGHT+IHs/ZFYporqXwcyCYuLS231NUajCUE8MC5Xid4M05KnnMOWCepEoV0p9BqTWqOg6PLKx/Pljw==
X-Received: by 2002:a17:907:97cc:b0:b73:5e82:520e with SMTP id a640c23a62f3a-b79dbe8f4ccmr179043666b.19.1764760351184;
        Wed, 03 Dec 2025 03:12:31 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f4d533f2sm1768950066b.0.2025.12.03.03.12.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 03 Dec 2025 03:12:30 -0800 (PST)
Date: Wed, 3 Dec 2025 12:12:25 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
 niklas.neronin@linux.intel.com, zhanjun@uniontech.com,
 linux-usb@vger.kernel.org
Subject: Re: usb: xhci: add optional MSI-X interrupters for isoc and bulk
Message-ID: <20251203121225.61ae88d1.michal.pecio@gmail.com>
In-Reply-To: <26CCB3E37C6E9AD3+20251203100824.1168562-1-raoxu@uniontech.com>
References: <26CCB3E37C6E9AD3+20251203100824.1168562-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

USB patches should be copied to linux-usb@vger.kernel.org,
please run ./scripts/get_maintainer on submitted patches.


On Wed,  3 Dec 2025 18:08:24 +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Some xHCI controllers expose multiple MSI-X vectors (e.g. AMD 1022:15e0
> with 8 vectors) but the driver still routes all traffic through the
> primary interrupter. In mixed isochronous and bulk workloads this means
> all completions share a single IRQ, leading to higher context switching
> and CPU migrations.
> 
> This patch introduces an optional quirk, XHCI_BULK_ISOC_SECONDARY_IRQ,
> that allows the driver to allocate dedicated interrupters for isoc and
> bulk endpoints when the host supports at least three interrupters /
> MSI-X vectors. URBs are routed to these interrupters via TRB_INTR_TARGET()
> and the corresponding event rings, so that isoc and bulk traffic can
> interrupt on different CPUs.
> 
> The implementation is generic and can in principle be used on any xHCI
> host that supports multiple interrupters. For now the new quirk is only
> enabled for the AMD 1022:15e0 controller to be conservative and to
> limit the initial behavioral change to this tested device. Other
> multi-MSI-X controllers could be opted in later by setting the same
> quirk or by introducing a more generic policy.

That's apparently one generation of AMD APUs from 7 years ago, so it's
a little weird to single it out. If the change really is an improvement
it would make sense to apply it on all capable hardware.

This quirk ensures that the code will get little use in the field and
most likely exactly zero testing by developers in the future.

> The single primary-interrupt path is preserved:
> 
>   - If the quirk is not set, the driver behaves exactly as before and
>     only uses interrupter[0].
>   - If MSI/MSI-X setup fails, or fewer than three vectors are available,
>     the driver clears the isoc/bulk interrupter indices and falls back
>     to interrupter[0] for all traffic.
>   - When MSI-X is disabled (e.g. INTx or single MSI), TRB_INTR_TARGET()
>     is forced to 0 so all events still go through the primary
>     interrupter and existing logic is unchanged.
> 
> With the quirk enabled on an AMD 1022:15e0 xHCI controller
> (03:00.3, MSI-X Count=8), and a workload that runs a USB camera
> (isochronous) and a USB flash drive (bulk) simultaneously, the secondary
> MSI-X vectors are used as follows:
> 
> cat /proc/interrupts | grep xhci
>  32:          0          0          0      11917 IR-PCI-MSIX-0000:03:00.3
> 						0-edge     xhci_hcd
>  33:     267794          0          0          0 IR-PCI-MSIX-0000:03:00.3
> 						1-edge     xhci_hcd
>  34:          0      33441          0          0 IR-PCI-MSIX-0000:03:00.3
> 						2-edge     xhci_hcd
> 
> Vector 32 is the primary interrupter, while vectors 33 and 34 serve as
> dedicated secondary interrupters for isoc and bulk traffic.
> 
> perf stat over 30 seconds, with the USB camera and USB flash drive both
> active, shows the following system-wide numbers:
> 
>   With dedicated MSI-X interrupters for isoc and bulk:
>     perf stat -a -e context-switches,cpu-migrations -- sleep 30
> 
>       context-switches:        389,068
>       cpu-migrations :         18,665
> 
>   Original single-primary-interrupt case:
>     perf stat -a -e context-switches,cpu-migrations -- sleep 30
> 
>       context-switches:        509,633
>       cpu-migrations :         42,644
> 
> In this workload, using separate MSI-X interrupters for isoc and bulk
> reduces cpu-migrations by roughly 56% and context-switches by about 24%
> compared to routing all traffic through the primary interrupter.

What's the practical consequence of that?

Some isochronous users may care about latency (maybe interrupt too),
but is it important to separate bulk from control for example?

Regards,
Michal

