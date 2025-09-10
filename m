Return-Path: <linux-usb+bounces-27848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF5B50D94
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 07:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD0D9176088
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 05:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7032D97BE;
	Wed, 10 Sep 2025 05:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwFamgef"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9B221F39
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757483800; cv=none; b=dHIYM2mRMMpYhZDbI1xeUxYS/I7tFyiGDJurMyeJm2Vl/fh1CuHbZtfRQSsaA1vUYYrJtY/4MaAX78VQOpeshWQdSCZm/KJzyGSVOYU+QMQSIINonaO3U5lo/K0r+yp8nnEeZngYWoEY33P54phvKY13l2C0o1hz3kJASOs+vQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757483800; c=relaxed/simple;
	bh=9++PZYukPGGADAMP2a+HFGZyInWOwmLjj+7OP5i4f6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfl7SDyo+kROdAVQwG4nkV99+kgF7QsujJAjZ5j8KuxC4yK7DZLkw7YZ8pS/Dk6UNL5Dq47QSllYBQMnS0SrWBPHWsL9EStpgEvavsUSkWgKWqEmZrgn7YmajIq6l7bEZ6wkqTZO7RzHF0uIeGY2FS+OFysRMeRthf4MoBAePeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwFamgef; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-33ca74c62acso28499851fa.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757483797; x=1758088597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYhKOB/nNT0m/oRbT/R00T0pzYd5JXBR3EXmY7og46k=;
        b=HwFamgefJY3DvxH07Du/8Wj/3YKns2nKhtF2xE3PDmM0RNxKfu2IW7SGlTBQ4vh3FA
         +Vx5FtNBmLAoGc25EfilrjkBOmfunLLn6uGg7gNSChiUjFgVHzGB1UaiEELIJjV5L2S0
         ENA9f9DoWJ33BejpBDWDXNyFBQ2qjU6WFZMh4PlSSRGG1cygJyhSlFg8w9Q3eBPUQooj
         gQGAZbScSN2Mh+3+QhbPCw1+sQIKJcjRwK4RQ/EAs9EoSI1wP1L4e6Osa10jNrXEUd87
         ee68s/Rp9RIc2Uddi+a648g34zRnBHDX+NhacdeqpudFxtknbHiQjhCCjCT/eT6GMl7X
         JtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757483797; x=1758088597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYhKOB/nNT0m/oRbT/R00T0pzYd5JXBR3EXmY7og46k=;
        b=o/qXCG1sJavFdDDu+X5cBezs9C5ZcOtcGnItk9vX2tfYXItVMPiDkERAJ3b6jskhxP
         Mzbi6PdmFLaCqC1mc0B8YGeNJkofZC0xO8UFsAsv6JFdjtTBXwfvPCZWljjSqv/L9EVf
         Ro/HbUEa7ZpJMYFsv801vQ/E5pBiJO7piQ0wHQjQPyZ1rALhtlgs/c7TtmW/3By0qXSP
         w4DjKe3hWkgKdd79pUlg9vd36476YtleGMCO+ynKWQSsNlpG3+PCiIHWqV9/w/kAMHS4
         qAPf1fM98MsK1qxg9hQ4mYKV8MpGFwh9DXhSUQAP/uMqaLan2p/ZPuYG6Gr6l+cG+6qe
         N1aA==
X-Forwarded-Encrypted: i=1; AJvYcCXI+Ya44/fchEh629r3/PohmCdt8m27Nj1OzpYM2tZvouQusqLEJ7rBoaeTosVIKm7bIyl+ym10NIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+Tk1O+7Ppl214RJ70/tVVp0IxnaaS1vrLjPG6rwbnL0F8PLu
	8XR/Jokk8CETA8R09lTU/K23gjkM6exM7T3dbpz8dU+kmeZDAz6Bx3I1
X-Gm-Gg: ASbGncuNNOQqQZuyWfUhiuBkFh1V9hTlzCaoI5huCZiOcliaiXv9zsEJOPYjSw0LSeS
	Bsy6dy2nng1iPcrSWJ7w1DG5RJlT4tT8CXmQKzNitNoHiiVQnjMYSfxH9ipuG6YEOaF48y1khhR
	5IX0iLVuCkWpjF9K4j714pl4f2mHhhM8ywbbGoZYU/1e3b6Bf+vghGT1K4WA+H1zTprkwpq+9jh
	NPkOIf6pvk/Q1uFgBfUM/rG7qscqGJupoAOMzGoQa4/qtQIrBg3ZSHq9y7PJSSZ25+jOSfR/Va0
	tKLFTNRY2QfW1CLB6Sx5DRp7rJbVxh0Ct347tG6818zrtmW/vrbVWbDmox6dzcsxe7W9wn3I+1d
	cltdkujHc402MMX57fJ5BBtx4F5pgZSw6MoveUW+0wDlV3Y95IrPoOcNA
X-Google-Smtp-Source: AGHT+IFhQziyBScT81oc9Nc/Yh0/oOtvaZXRD7L+JPNW08YIWLCCO7uvFkkatQKj14se0Tl9sM+TZQ==
X-Received: by 2002:a05:651c:4183:b0:336:91c7:535d with SMTP id 38308e7fff4ca-33b5568f35cmr37454351fa.45.1757483796409;
        Tue, 09 Sep 2025 22:56:36 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3380f68331asm33643871fa.12.2025.09.09.22.56.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 22:56:36 -0700 (PDT)
Date: Wed, 10 Sep 2025 07:56:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250910075630.0389536f.michal.pecio@gmail.com>
In-Reply-To: <20250909224416.691e47c9.michal.pecio@gmail.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
	<20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 9 Sep 2025 22:44:16 +0200, Michal Pecio wrote:
> On Tue, 9 Sep 2025 14:29:20 +0300, Andy Shevchenko wrote:
> > Not really. It prints unnecessary long values on 32-bit machines
> > making an impression that something works somewhere in 64-bit
> > address space.  
> 
> The %016llx format you are alluding to is used in two error messages
> actually seen by users, that's an issue. My crazy personal preference
> would be %08llx, but I concede it's unprofessional, so %pad it seems.

Actually, I take this back.

I think that leading zeros are evil and I agree this message is bad.
But I don't understand why 64 bit users should put up with this:

[  140.106751] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeec7f0 for ep 2 status 13 not part of TD at 00000000ffeec800 - 00000000ffeec800
[  140.476573] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeec1a0 for ep 2 status 13 not part of TD at 00000000ffeec1b0 - 00000000ffeec1b0
[  140.502855] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeecd60 for ep 2 status 13 not part of TD at 00000000ffeecd70 - 00000000ffeecd70
[  141.225300] xhci_hcd 0000:07:00.0: Event dma 0x00000000ffeeb970 for ep 2 status 13 not part of TD at 00000000ffeeb980 - 00000000ffeeb980

when we can have this:

[  419.967755] xhci_hcd 0000:07:00.0: Event dma 0xffc34760 for ep 2 status 13 not part of TD at 0xffc34770 - 0xffc34770
[  420.100611] xhci_hcd 0000:07:00.0: Event dma 0xffc34bc0 for ep 2 status 13 not part of TD at 0xffc34bd0 - 0xffc34bd0
[  420.360917] xhci_hcd 0000:07:00.0: Event dma 0xffc34e70 for ep 2 status 13 not part of TD at 0xffc34e80 - 0xffc34e80
[  421.719530] xhci_hcd 0000:07:00.0: Event dma 0xffc35770 for ep 2 status 13 not part of TD at 0xffc35780 - 0xffc35780

with a simple change (anything wrong with u64 cast here?):

-       xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
-                &ep_trb_dma, ep_index, trb_comp_code,
+       xhci_err(xhci, "Event dma %#08llx for ep %d status %d not part of TD at %#08llx - %#08llx\n",
+                (u64) ep_trb_dma, ep_index, trb_comp_code,

These zeros only add noise, and in many cases make difference between
line wrapping or not because this is longer than 99% of kernel messages
and some people want their terminal window not to take the whole screen.

The main thing we care about here are the last 3-4 digits and we could
have made it little more than (ep_trb_dma & 0xffff) long ago, but then
Niklas asked "what about correlation with tracing/debugfs/dyndbg?", so
it was left the way it is.

Regards,
Michal

