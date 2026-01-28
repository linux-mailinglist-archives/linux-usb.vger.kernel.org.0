Return-Path: <linux-usb+bounces-32862-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIraEVrKeWkezgEAu9opvQ
	(envelope-from <linux-usb+bounces-32862-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:35:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C99969E45D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C307030143EB
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0B72F361A;
	Wed, 28 Jan 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G1DXuh5Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9118326ED37
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589328; cv=none; b=WIcAuL/fPseOKUv1Pb0XOia1liwl6WzM9G8W47bOeJC71vcar4OUciLmWd3MJgduoIGa7/+O08QxJ1s3bqkbOeKgT/tK7WNBI8hqTiZtzmbddFw2w88gxwbWN/n8Ona2UHXCykNWTCzm8UqLH8g4St/mUZxur/kH6z+74LGNxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589328; c=relaxed/simple;
	bh=mvHCHcu9aVrUdyvy5T/RaJHRckdc6mrrXcUlwul3FHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXZDdxLIofsj7NaD36TF1F9180vnxFRBv+hvJYk1Tn8Ymai/P/M0Nprsy7gPVaErIdVlgO3pgRYW/gfhgF8Fk4jcLCvl85cBr65UHJBiSpNIRYNALZ70IgMM1DXMESBC81PSrPSYd3zALoozxVPHSlzL0+liuGyGX32FEbX6zfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G1DXuh5Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF65C16AAE;
	Wed, 28 Jan 2026 08:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769589328;
	bh=mvHCHcu9aVrUdyvy5T/RaJHRckdc6mrrXcUlwul3FHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1DXuh5Z/qmfPanSvaNP0s6IutZ1bRpGoLYAFz2/wOTQ6fCA1oPQ/FbcGtcWQnCmZ
	 vUd9Q7ayGFT4UmrwVOFfnthmKs1DskluNgnHs90yfW9jl2/qMHDCdSHmQ0eZAX9KWS
	 0wTTj5Sg+ZPzXUxTy3+CpWOVVrDXqphxlLAS5/Uw=
Date: Wed, 28 Jan 2026 09:35:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: kenny@panix.com, linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com, michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com, zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
Message-ID: <2026012818-boxer-speckled-aa78@gregkh>
References: <2026012754-ferocity-operator-e3b2@gregkh>
 <ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32862-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C99969E45D
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:09:39PM +0800, raoxu wrote:
> Hi greg,
> 
> Thanks for the review. Below is why I believe enabling secondary
> interrupters is justified.
> 
> > What do you mean exactly by "hot spot"?  Usually this is a good thing,
> > driver code is in the cache, as are the data structures, so this keeps
> > data flowing well with less latencies.  Why would you not want this?
> >
> 
> By "hot spot" I do not mean a CPU cache problem. I mean a software-side
> serialization point: all devices share a single event ring and a single
> IRQ handler which processes completions under the global xhci->lock. That
> centralizes the work into one place regardless of cache locality.

Ok, but is there actually any lock contention happening here?  Using the
perf tools should show that, but again, given the slow device speeds, is
the lock contention even measurable?

And if you still have a single lock, spreading out the irqs over
different cpus will make this contention WORSE, not better.

> > > On hosts that already provide multiple
> > > MSI/MSI-X vectors and independent event rings, routing all completions
> > > through interrupter 0 creates unnecessary contention (serialized event
> > > handling/locks and coupled moderation), increasing CPU cost and tail
> > > latency under many active devices/endpoints.
> >
> > So this is a MSI routing issue, not a cpu cache issue?
> >
> 
> Yes. The primary issue is routing and event-ring fan-in: everything
> funnels through interrupter 0 today even when the controller advertises
> multiple interrupters/vectors with independent event rings.

Ok, but given the single lock, that still makes sense as doing that
"fan-in" is faster than hitting lock contention/bouncing across cpus,
right?

> > And exactly what type of contention is happening here?  How can it be
> > measured and noticed?  The latencies involved in USB are huge due to the
> > protocol and hardware, why would a CPU even notice such things?
> >
> 
> Even if USB link latency is high, the IRQ/event path is still a CPU-side
> serialization point: all completions land in one event ring and are
> drained by one handler under xhci->lock. Under mixed workloads (e.g. isoc
> video plus periodic audio/bulk), events from unrelated devices can queue
> behind the same lock/handler and increase jitter/tail latency, even if
> the bus is not saturated.

Do you have measurements of such latency and jitter?  USB is horribly
bad in latency and jitter at the hardware level, and does moving the
data to different cpus like this actually change anything if you still
have the same global lock issue?  I would think it would make it much
worse, especially if you are sharing across big/little type cores.

> > > Using secondary interrupters
> > > simply matches the hardware's design, similar in spirit to merged
> > > xHCI-sideband work: exploit available parallel paths rather than
> > > funneling all events through one.
> >
> > What do you mean by "secondary interrupters"?  The sideband work was for
> > a totally different issue, whereby the normal hardware and CPU was
> > bypassed to allow it to remain powered down and to save battery life.
> > Spreading interrupts across CPU cores does the exact opposite of that,
> > ensuring that cores can NOT go to sleep when the work should be only
> > done by one of them.
> >
> 
> By "secondary interrupters" I mean the non-zero xHCI interrupters
> (interrupter 1..N when Max Interrupters > 1), each with its own event
> ring/ERST/IMAN/IMOD, backed by MSI/MSI-X vectors when available. This is
> a standard xHCI capability; the series just enables it with a small cap
> and a clean fallback to interrupter 0.
> 
> You're right that xhci-sideband targets a different goal (power), and I
> did not mean to equate the motivation. I referenced it only because the
> upstream xhci-sideband work has already exercised and validated the core
> multi-interrupter/event-ring plumbing in the driver. So using additional
> interrupters is a proven in-tree mechanism, not an experimental path
> unique to this series.
> 
> > In short, please post numbers showing how this really is noticable
> > somehow.
> 
> Understood. v11 still takes the global xhci->lock in the IRQ/event path,
> so it does not claim true parallel event processing yet. The goal of v11
> is to make multi-vector routing and lifecycle correctness solid
> (request/free/sync, run/stop/resume, quiesce/teardown) and establish
> per-slot routing as groundwork for a follow-up that can reduce lock scope.

I think you need to determine if you really do have a measurable lock
contention here, and work to make a patch series that removes that.
Just seeing this intermediate step which adds complexity for no
noticable gain is not really a good idea (especially given the number of
attempts this single patch has taken for basic things like "does not
break the build").

> Below is the exact test command and the fio results I observed.
> 
> Test script (perf + fio, 2 USB storage devices, 2 USB 2.0 uvc cameras,
> 60s time_based):
>   sudo perf stat -a -e cycles,cache-misses \
>     fio \
>       --name=usb1 --filename=/media/uos/Ventoy1/fio.bin --size=1G \
>       --rw=randrw --rwmixread=50 --bs=4k --iodepth=64 --numjobs=4 \
>       --time_based=1 --runtime=60 --direct=1 --ioengine=libaio \
>       --group_reporting --lat_percentiles=1 \
>       --name=usb2 --filename=/media/uos/Ventoy2/fio.bin --size=1G \
>       --rw=randrw --rwmixread=50 --bs=4k --iodepth=64 --numjobs=4 \
>       --time_based=1 --runtime=60 --direct=1 --ioengine=libaio \
>       --group_reporting --lat_percentiles=1
> 
> Baseline (v6.19-rc6, two-device randrw 4k):
>   read:  IOPS=480,  BW=1923KiB/s, clat avg=484 ms, p50=79 ms
>          p90=700 ms, p95=726 ms, p99=801 ms, p99.5=17.1 s, max=32 s
>   write: IOPS=485,  BW=1943KiB/s, clat avg=470 ms, p50=81 ms
>          p90=693 ms, p95=726 ms, p99=802 ms, p99.5=17.1 s, max=32 s
> 
> With v11 applied (same command, same devices):
>   read:  IOPS=1376, BW=5505KiB/s, clat avg=157 ms, p50=20 ms
>          p90=90 ms, p95=927 ms, p99=1003 ms, p99.9=17.1 s, max=32 s
>   write: IOPS=1381, BW=5528KiB/s, clat avg=154 ms, p50=21 ms
>          p90=91 ms, p95=927 ms, p99=1003 ms, p99.9=17.1 s, max=32 s
> 
> On this setup, this run shows higher throughput and lower typical
> latencies with v11: read IOPS increased from 480 to 1376 (+186.7%) and
> write IOPS from 485 to 1381 (+184.7%). Typical latency also improved:
> read p50 dropped from 79 ms to 20 ms (-74.7%) and read p90 from ~700 ms
> to ~90 ms (-87.1%); write p50 dropped from 81 ms to 21 ms (-74.1%) and
> write p90 from ~693 ms to ~91 ms (-86.8%).

Ok, yes, that's real, and frankly huge, speadups.  I take back what I
wrote above, this type of information should have been in the first
patch :)

But, is this an actual use case?  Your devices are not using USB
storage, but only uvc cameras, right?

thanks,

greg k-h

