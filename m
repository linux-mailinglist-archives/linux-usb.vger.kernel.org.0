Return-Path: <linux-usb+bounces-23943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7FAB67A1
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 11:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7DDD1B65BD0
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 09:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D13822A802;
	Wed, 14 May 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itjnkrxx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1801FF60E
	for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215280; cv=none; b=DLflUVezutMaXv8vvM0A4PvXJrW/8NZzhWFyYM18WjLeX1MmaEl2E6tfSu6TXkbMuur5oFoD4x+OGfsH+djhnEKlP9B+/l8ntv58YixZRTebtmSKorEMTr2llQ1TOGxO+VRf0zT4X9o1oPkMaYXYiUTCGqbn1TCpTuFDa5ZaS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215280; c=relaxed/simple;
	bh=MYfdc1MK265fGHXacHKzcZXpjQolh98+7a+MQKaeeIw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7xfGDh/ZCHxrvA9xazPI+sv8JKXn6vooAGR65M520nNd4XxL+4x4TWYNUMuH77EIE2Y+fruOhYTUC7JJ/CR1r2Q15D/K6QUx+YNI4EDLkUo7BDEScgfp4ctJdERFAoED8EwjtxTKMkqKA/OyNNNLySv4t788jZwqhmH4ctgnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itjnkrxx; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-326b683ac3aso8695881fa.0
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747215276; x=1747820076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvC6d5pUWvhxIZSstOUzwLRCJQrrvDoARH63lPjkc7c=;
        b=itjnkrxxy6vJTHZ4Mw/3Mj4chDx8RUZeQG33sDO+BwqaQJmA5fwKD16Y7cUichvE5u
         w0/mWGrie0S/6SZgu/0/OoYP6JAAqRxEJ8vrpHK736W9Jx1nPiL8M8aR3KUT3FfNtUKN
         oNwztGfTr3lTkDi5RISvgkYFvxPRHxnoPxEs+Jc4xNvBXLZgYcjr4TNI1NVjTtU4h79Z
         H4IJHA3heDRbXrLyYG5LJ15b07F41BgB8gOUJdB8APOdqlQolnO9AnvcLvvZ94k9t+Se
         2yit40DnQrO4gub0ftfr43qf/HyFl9r4PiRYC5xjbPIe5mXTXze6KQopwxFur29KvSwK
         RDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747215276; x=1747820076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvC6d5pUWvhxIZSstOUzwLRCJQrrvDoARH63lPjkc7c=;
        b=ofL4wCHW9/+KRWTIQc++0cZEulQVxS66KpsD4lKg88y4v2z9128y6OdGvcI3PDydl1
         690G19ZFxO4wljOKPSID+OA1rApmyEqaE24WAhbPC/KHRmXoAPz9LotRMad0XA87E5CJ
         QLS/ulF7wkx+/nqxIY2h3GcDr8OVvDBgES90WpUDWvzmzwHRHP9rAbMeirbYhVpzk1gF
         8FhDOCueqVIrgrSrLwFUFEN/gJuqg+r4RU5cN49brFsyJZHGjzj/nYJ1TSgr4ibeMU0c
         MkfJyE+9ysWTx/bWhDNPqJOA9EYLI+Rk+uoKH8rezvwlso37seZgxQ1vFT2/1/P7XkG8
         Ksjw==
X-Forwarded-Encrypted: i=1; AJvYcCXD+TWfymXTCgqE45XzL3vCoJCHWtSn9y1UJePKUG1V3cUjKGvXEr3Z/7ZL9O9/sB+p49YJhXkS7Co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TyrKsH2Mg3EOsEV8/5YpytG82JBwBxoV7O9SvuR73ncNgDPd
	jCNqmqY1UoNVJU7vd4pUzR4TuehcmQY1pdF9BLB/IKEtkeXsOmPOxRRJjw==
X-Gm-Gg: ASbGncuNf2mzj/R7t6ydsbfffyfNGRSwIFEdmPUQxvng0apARjVhUogaXqN85e2J1kc
	TTPrrKK4cOBDBWidGjot6lXK/wwvekBQO3OX+wA9wUWR5EcHMx86S3qjtuTE3ne0038ySY7ltD4
	+BDAMK+TmB/TF1kZvOPHiWT1yi3x3raOdcTVd6QuwysPe837/vSZJ6WX9sVLO8/qkUp6cV6TZag
	Zuu1yw+1a6yJ2ozBn4psLJZT7qhrWSZcuD+duOl3iIvIDxY0uaBbFPVbu90o5Ud7QVYzkj+wG6p
	SBylN4jnqcw7htKXohIqv4hcIuQi2pnJXRAu4L5+KDY3bhuE7qw4kyBoljyHtbSD1VpO
X-Google-Smtp-Source: AGHT+IGPv5DBYZx9HPmoDn3NyIEpnEq0fyGqnNJfIG+W2hwGHRtqHGA3BSx5ivjJjSnvMZqbQG30lA==
X-Received: by 2002:a2e:bd86:0:b0:30b:f599:d78f with SMTP id 38308e7fff4ca-327e12c0e34mr26395621fa.7.1747215275805;
        Wed, 14 May 2025 02:34:35 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326e19da2bcsm11365991fa.74.2025.05.14.02.34.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 14 May 2025 02:34:35 -0700 (PDT)
Date: Wed, 14 May 2025 11:34:31 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: Problematic Set TR Deq error handling series in xhci-next
Message-ID: <20250514113431.632efb74@foxbook>
In-Reply-To: <c606689d-e680-4796-bb65-87424a157e98@linux.intel.com>
References: <20250509114138.7052dd3b@foxbook>
	<c606689d-e680-4796-bb65-87424a157e98@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 16:02:06 +0300, Neronin, Niklas wrote:
> > The case of "running" (or "halted", which "running" can morth into)
> > is possibly more useful, because we assume it's caused by illegal
> > state changes without driver's knowledge. But these are supposed to
> > be detected and fixed by handle_cmd_stop_ep(), because they cause
> > other problems too. It's unclear if retrying Stop Endpoint and Set
> > TR Deq again will solve any case not solved yet, but risk exists of
> > infinite retries on broken HW. (And HW is broken if we are here).  
> The infinite retry loop is a good point, did not consider this.
> But wouldn't the Stop EP command fail first, otherwise the state is
> correct for the Set TR Deq?

When Set Deq fails with Context State Error there are no rules that
can be relied on. Either handle_cmd_stop_ep() queued Set Deq in a wrong
state, or the xHC changed the endpoint state for unknown reason.

Either way, reissuing Stop EP takes us back to square one. Maybe the
SW or HW won't screw up this time and a new Set Deq will succeed, or
maybe it will screw up again, perhaps for the same reason as before,
and Set Deq will fail again.


ASMedia HCs are so unreliable that even their bugs are difficult to
reproduce, but I was lucky enough to capture one successful retry.

The format of the log below is:
slot/ep (ep_state/ctx.state) [dequeue/hw_dequeue] log info
All completions (other than transfer success) and commands are logged.

# the xHC is already in a fubar state
# idle device resuming from autosuspend
[ 2724.482048] 2/0 (040/3) [ffe73960/ffe73961] ring_ep_doorbell stream 0
[ 2724.482066] 2/2 (000/3) [ffeb7000/ffeb7001] ring_ep_doorbell stream 0
[ 2724.482074] 2/6 (000/3) [fff03020/fff03021] ring_ep_doorbell stream 0
[ 2724.482081] 2/8 (000/3) [fff96000/fff96001] ring_ep_doorbell stream 0
# a control transfer is cancelled after 5s timeout
[ 2729.943197] 2/0 (044/1) [ffe73960/ffe73961] queue_stop_endpoint suspend 0
[ 2729.943218] 0/-1 (fff/f) [ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
# Stopped Length Invalid for ep 0
[ 2729.943393] 2/0 (044/3) [ffe73960/ffe73961] handle_tx_event comp_code 27 trb_dma 0x00000000ffe73960
[ 2729.943414] 2/0 (044/3) [ffe73960/ffe73961] handle_tx_event stream_id 0 trb_len 8 missing 0
# Stopped Length Invalid for ep 2, because why not?
[ 2729.943425] 2/2 (000/3) [ffeb7000/ffeb7001] handle_tx_event comp_code 27 trb_dma 0x00000000ffeb7000
[ 2729.943433] 2/2 (000/3) [ffeb7000/ffeb7001] handle_tx_event stream_id 0 trb_len 0 missing 0
# another Stopped for ep 0 and the command completion (Success)
[ 2729.943439] 2/0 (044/3) [ffe73960/ffe73961] handle_tx_event comp_code 26 trb_dma 0x00000000ffe73960
[ 2729.943444] 2/0 (044/3) [ffe73960/ffe73961] handle_tx_event stream_id 0 trb_len 8 missing 8
[ 2729.943452] 2/0 (044/3) [ffe73960/ffe73961] handle_cmd_completion cmd_type 15 comp_code 1
# Set TR Deq is queued on ep 0 in state Stopped(3)
[ 2729.943461] 2/0 (044/3) [ffe73960/ffe73961] queue_set_tr_deq stream 0 addr 0x0x00000000ffe73990 EOS
[ 2729.943468] 0/-1 (fff/f) [ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
# Context State Error, ep 0 changed state to Running(1)
[ 2729.943796] 2/0 (041/1) [ffe73960/ffe73961] handle_cmd_completion cmd_type 16 comp_code 19
[ 2729.943805] Set TR Deq error for TRB 0xffe73990 in slot 2 ep 0
[ 2729.943810] Set TR Deq failed, due to running endpoint
# Stop EP succeeds, hw_dequeue advanced by one TRB
[ 2729.943814] 2/0 (044/1) [ffe73960/ffe73961] queue_stop_endpoint suspend 0
[ 2729.943820] 0/-1 (fff/f) [ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
[ 2729.943989] 2/0 (044/3) [ffe73960/ffe73971] handle_cmd_completion cmd_type 15 comp_code 1
# we get lucky and ep 0 state doesn't change this time
[ 2729.943996] 2/0 (044/3) [ffe73960/ffe73971] queue_set_tr_deq stream 0 addr 0x0x00000000ffe73990 EOS
[ 2729.944003] 0/-1 (fff/f) [ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
[ 2729.944150] 2/0 (041/3) [ffe73960/ffe73991] handle_cmd_completion cmd_type 16 comp_code 1

Note that the endpoint appears to change state when Set TR Deq is
queued to it. This is not the known "late restart" bug, it's some
complete nonsense and I don't know why it happens. The xHC is FUBAR.

This is the sort of conditions which will cause this new code to run.

Either that, or handle_cmd_stop_ep() gives up retrying too early and
a "late restart" condition is ignored. In the latter case, one more
retry after Set Deq failure will likely stop the endpoint, but damage
may already be done. Such bugs should be avoided in the first place.

Regards,
Michal

