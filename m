Return-Path: <linux-usb+bounces-27089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC44B2F40A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 11:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC130566E56
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 09:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A01A2D9ED8;
	Thu, 21 Aug 2025 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuzKaBQ0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D6F1F3BAE
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768774; cv=none; b=Mlww5cJV0GZ/DQGgAuqkw3a4O9MwACnd+w27GBLkymRksXjJx4sG/FF+tM1ovaMW/fRsZJ+MloINv+CZfyPQndVJeJObXoHBK0XG+RP7xw3BBEPymj8VHhvsKNUGtXmyhx057lhx995Y7xU6CnGzc9Sk3R8TZQ1GSuv01JaCaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768774; c=relaxed/simple;
	bh=ysSF9ebmKEVHfdprQ5D5Dm2kzu+I5Ld0ThPsC2tCW5w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlRgWAI43V07HC2XqoFi3KqhrEvzcFtt2SzV7up4Tdd6pUt5IJTZIYmZtgktFNLUmGouGu9k7a4jLHOiN+pDMv100QYGuh2hpeA1P2SEM3j3MFEdILVcpxzVDsA2r6S6LejINX9d9oFDHUh7xQ19kO4FC3DSc4hPXQw4pVKlk8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuzKaBQ0; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce520caf9so809590e87.1
        for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 02:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755768771; x=1756373571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbqQVG2o4Ov7l0KF995f/VySFMSSluItZPPu707e06w=;
        b=RuzKaBQ0/WnmFaGmb2DHuj4YZJkS2WiCWw+qDFPov+cCPizMufbioUZ7ePAsTzaYeo
         zgGKjP9R1h8P2s0XdPqknCSqjnq18d+O3fGlvXufgO7NNE3rdSiLiDNNnP6hx7XAkkmJ
         KSk8UwpC6TlXaB+Tl4GL4c1YyipfqiY1DYkbMtjv6+GjZ+SjyI7roAcn/I8GdR0HCFwQ
         K3zLRtP/FrTG1onKAfskk+NpMjTzS39XSXRQF0Q3zufw8RqT6nAYI/tNxF3sKr8QLFoF
         J8H5t9lxTtnCWJ14NPsRxIy5NxIhHJqcWkPH8FZ+QJaaemneZDelWpTIsZ1PGjLvkYoj
         71KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755768771; x=1756373571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbqQVG2o4Ov7l0KF995f/VySFMSSluItZPPu707e06w=;
        b=p0urSUMqvgJM26jJcgliEOPA9z2VMRHyV8ytf5rDa+O42e+oi3endeK6zbZ4tiN8bf
         w6gzZaL9d0MbvKUKZ+YVFiqoiWXDbT5Brv8tjVEh//89KqZcf6rRGsaOisOcYSWaNqa5
         SNfVyTD4BwXW5OE8dP1JBTfw3vTGB9YxinejFOuDeNman8bdKRkZoaLkBMoZK+liTH3+
         PsCaPj9FfJWscBXrIbjhzOnErOGNV0p5gitPvEUPXrjc8Mcd+rrBquy7H0+qoNh/Ragr
         Vl0JCt1Hn+8yBuV+fXwnBF0St9MDPjFi9iDGpGB8btD9Uuwi85rqPYJ91keDQ3kUVfvJ
         YFdw==
X-Forwarded-Encrypted: i=1; AJvYcCVze0UZrj3Dy/h2uAwAStqlV962H4hF7tOmHg3Nke+HpJbuTFY0Ct0lTEUkAP51gVtllpkkr0Ju+zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEIMmrjS8mNzxKu1yZqnf3atDDv7ZnO7Wh8cFKyU1oE8PyDdd
	+3cfoZ5gcgofjvJZ5koxjuLyyuJQPEOItwwlPE2BFyaORk/9TiM/uFzDKRk+Hw==
X-Gm-Gg: ASbGncv/BXHrrF7NOPZQXThDWAha6txD4hhwYS8wSO7Ep7HeIYdXG2i2r3omovZVz39
	apTwD4M/i31OYzBKrYPfIo1S+eHRqLZSJhCwr0k5BxsBOGa0xvCQM3jk8kzI7plTjgeZQmaJzSC
	bdfbQQygW1QA3JJ8R0wQlkp4Z0daR9dCnTdPBF8sTj+LN0BnTi8TRVZJAqwhPjOy58Ea6uQxaLU
	UwgbE1QxiaYDUiZm0T647M7xhjS1V2+vBqWxBdBI47rs0X/PdOiIOxG2uD1BLfZ9wxNWN2jh4hC
	caHfNJM838ul10FelAdw17y9ba++Pg2XtcFefBEpAbKh5p5IJQ6bZQzl235JenrjzTeUFqM7O68
	XMP4/rd+PkaPMrEW0PVLTCZ0Uz9bRfEi4H3w=
X-Google-Smtp-Source: AGHT+IHfWKzY9gy4V6+p/TjEyOjOFhGHxJGkbgO3brrAt34QNGN688JZLz5Kh9AO1py3Y6d86FveQA==
X-Received: by 2002:a05:6512:3e2a:b0:55b:8e3e:2be6 with SMTP id 2adb3069b0e04-55e0d520fb9mr680135e87.24.1755768770521;
        Thu, 21 Aug 2025 02:32:50 -0700 (PDT)
Received: from foxbook (bgt225.neoplus.adsl.tpnet.pl. [83.28.83.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3517f7sm3040308e87.31.2025.08.21.02.32.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Aug 2025 02:32:50 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:32:44 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: xhci: handle Set TR Deq TRB Error
Message-ID: <20250821113244.14168b1a.michal.pecio@gmail.com>
In-Reply-To: <20250818125742.3572487-2-niklas.neronin@linux.intel.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 14:57:39 +0200, Niklas Neronin wrote:
> Set TR Deq TRB Error can occur for two reasons:

Surely for other reasons too, like the infamous ASMedia case
I mentioned last time when this patch showed up here.

In general, any illegal value in any TRB field is a TRB Error.

And in general, I think it would be better if those log messages simply
named the error received from HW, without trying to speculate about
possible causes (and getting it wrong). It would be less misleading and
it would instantly give the keywoard to search for in the spec, without
grepping for the error message to find which event code triggers it.

> 1. Stream ID is zero or more than the Max Primary Streams.
>    This is currently caught by xhci_virt_ep_to_ring(), at the start of the
>    function. Thus, this commit does not add handling for this error.

Nit: this is only true if ep->stream_info->num_streams at the time of
handling this event <= MaxPStreams at the time of command execution ;)

So there are two theoretical bugs which could make this check fail.

> 2. Stream ID is non-zero and Stream ID boundary check failed.

Not sure what's the difference? Per spec, boundary check *is* checking
if Stream ID is in range, to prevent the xHC from writing to a Stream
Context outside actual SC Array and corrupting some random memory.

>    Add a warning detailing the exact reason for this failure and print
>    the deq ptr from the Set TR Deq command.
>    Macro 'SCTX_DEQ_MASK' is a mask for the TR Dequeue ptr bit field 63:4.
> 
> Reuse local variable 'deq'; just change it to 'dma_addr_t', which is what
> it should have originally been.

Not sure, this is an always-64bit value read from xHCI data structures.

On a 32bit DMA system it probably won't have the high bits set if you
are reading it from the command (unless there was a bug), but later
other code will read it from HW and then all bets are off. Note that
a 64bit xHC may be installed in a 32bit system. And it may be buggy,
or it may have escaped the transfer ring due to broken Link TRB.

