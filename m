Return-Path: <linux-usb+bounces-16821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D86E9B4439
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 09:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EC061C21AF1
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 08:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31BE203719;
	Tue, 29 Oct 2024 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JImNaVVG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4F202F67
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730190492; cv=none; b=WFrOZKLFfZnxWc3ph05LVUF4qteJy5Fkac1ZK20JfxmLdd+obfV1aihtKX39dGOkcIyc4J3XT736QV011+sRE2EvaeUJa8Yv3F7XDThZiC/4bDzTHALVQ0ZgZLRUFgcuJ6fTXC1o/TZ/Qja8+qi1UriQCTWJMcpWfgk1gW4P1Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730190492; c=relaxed/simple;
	bh=bq9KV96/CdGhq9cACwcJmrW3nGLRBLszyaInHfBNLoM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3DUiqz0UshzksjHblF6QnGTwlhOvA0Oh3kJw4J3B3M7ju1J5bTL9+3GQqnbyXDdevb/OyoSK0oxuKRQbu5uxLJoO7S82dw1d64rY1HcL/TedUimZsDLmlHzYnwdva+euGJz4I0FsK4DkB8ISXb66fmq50VtRmIXmdsuFBUE/Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JImNaVVG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53b34ed38easo2454989e87.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730190488; x=1730795288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq9KV96/CdGhq9cACwcJmrW3nGLRBLszyaInHfBNLoM=;
        b=JImNaVVG3EXOlp0ZAkJrlXAZ3roftsBdawExaC79FfrJ545nQEcjHZCebpHpugfbeb
         Y4+dNuk6xUJaOuL0vUbcgjsc6B6ngPTYvxt6FMR1kiKXG9vHFMG0rXEI2LMyAoIfiX1f
         aEv8lYBZCrcKphbna9GOd1+MvIGQBfNivySOmPPodDZf+qdiamlo0vWzM6aQsQHs09wn
         JrDFw5Al/CDT+BljW3IlZbsbCGjGg6yUJXayerNiJG70gPa/1cGC7YytPlRyD6bGq25k
         pvt3uH72+5za5P2/sCR08aWibfDPjKvR34OXKzrlakJY3n4ij6V+uBfZ5BZRjTZDFLry
         gaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730190488; x=1730795288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bq9KV96/CdGhq9cACwcJmrW3nGLRBLszyaInHfBNLoM=;
        b=oEvPAjp5mMJp9M+h1dRLk94jeXBNi28cGi+yCWadSplFwOXBNVe97COYVwQpzE4yAY
         TZVoffu+WTUUPqPinoZ0to/3Z+nLxx7p9/XLQMhS+b4p6LG8IZWAyB/7+jqyWVnar5oc
         o60DVouLBpexV3bcioXwV8z6OaLjCxge/334POD1R/GpuqatxjS5Hypdd0lU9w1yHM//
         I/sU0wo6Zbi2NYPJj53FJX48jp/T+Eampxc2i1g5VYMqWgNLsUNzZCl+s56H+F/UF/2w
         5DuFOVpza2VP6aMVtQ8PWsDUDLF0Cs5hxiPZQcP0K0hRyZLQwqwUDjYYAV+dmA7+jvDn
         e77w==
X-Gm-Message-State: AOJu0YyCc/1I93TlonVhfezHY4apSej0oloJbP3w3bkZLzz23zUIgVio
	Qjs4zHUipHz1fRyfTkR5yD8zpKa55uUrJkM7KSo7zn6IyTfmoO9Q
X-Google-Smtp-Source: AGHT+IFaamYLb+ELAiNHs7En4PPCi2/CivZFyK7RmUuAWddDrdejwXJ4JTcB7agJzkN9TIycguEtPA==
X-Received: by 2002:a05:6512:baa:b0:539:f1ad:b7a6 with SMTP id 2adb3069b0e04-53b3491c819mr4901561e87.37.1730190487931;
        Tue, 29 Oct 2024 01:28:07 -0700 (PDT)
Received: from foxbook (bhd254.neoplus.adsl.tpnet.pl. [83.28.93.254])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a555sm1295879e87.34.2024.10.29.01.28.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 29 Oct 2024 01:28:06 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:28:00 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241029092800.32eccf3b@foxbook>
In-Reply-To: <f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
References: <20241025121806.628e32c0@foxbook>
	<20241028083351.655d54cf@foxbook>
	<f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Oct 2024 11:54:39 +0200, Mathias Nyman wrote:
> The SET_DEQ_PENDING case is trickier. We would read the dequeue
> pointer from hardware while we know hardware is processing a command
> to move the dequeue pointer. Result may be old dequeue, or new
> dequeue, possible unknown.

Damn, I looked at various things but I haven't thought about it. Yes,
it's dodgy and not really a great idea. Although I suspect it wouldn't
be *very* harmful, because the truly bad case (failing to queue a Set
TR Deq when it's necessary) is triggered by Set TR Deq already pending
on the same stream, so the stream's cache will be cleared anyway.

But it could easily queue a bunch of pointless commands, for example.

By the way, I think this race is already possible today, without my
patches. There is no testing for SET_DEQ_PENDING in xhci_urb_dequeue()
and no testing in handle_cmd_stop_ep(). If this happens in the middle
of a Set TR Deq chain on a streams endpoint, nothing seems to stop the
Stop EP handler from attempting invalidation under SET_DEQ_PENDING.

Maybe invalidate_cancelled_tds() should bail out if SET_DEQ_PENDING
and later Set Deq completion handler should unconditionally call the
invalidate/giveback combo before it exits.

> We could ring the doorbell before giving back the invalidated tds in
> xhci_handle_cmd_stop_ep(), and possibly xhci_handle_cmd_set_deq().
> This gives hardware a bit more time to start the endpoint.

This unfortunately doesn't buy much time, because giveback is a very
cheap operation - it just adds the URBs to a queue and wakes a worker
which runs all those callbacks. It finishes under 1us on my system.

> We could also track pending ring starts.
> Set a "EP_START_PENDING flag when doorbell is rung on a stopped
> endpoint. clear the flag when firt transfer event is received on that
> endpoint.

Yes, that was the second thing I tried. But I abandoned it:

Problem 1: URBs on "idle" devices are cancelled before generating
any event, so we need to clear the flag on Stop EP and Reset EP.
Not all of them use the default completion handler. Maybe it could
be handled reliably by tapping into handle_cmd_completion(). But...

Problem 2: hardware bugs. On ASMedia 3142, I can trigger (from
userspace) a condition when EP 0 doorbell is rung (even twice)
and its state is still Stopped a few seconds later, and remains
so after repeated Stop EP / doorbell rings.

It looks like a timeout is the only way to be really sure.


Regards,
Michal

