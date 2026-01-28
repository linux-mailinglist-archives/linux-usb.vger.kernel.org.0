Return-Path: <linux-usb+bounces-32861-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMf0L7LFeWl0zAEAu9opvQ
	(envelope-from <linux-usb+bounces-32861-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:15:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 374DF9E1C2
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 09:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CA263039CBC
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 08:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD01337B81;
	Wed, 28 Jan 2026 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="SKsq5Tfx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A062206A7
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587828; cv=none; b=O/CN1eIJtGNzjlFaFwms8KH8yifk3niIHBztSkC63DMIdgqOZn0vC1XKsPjK3jWhKosgr3ZKljFJB+9+V9qdh+OkX1oQVV+1y+vnVcGLGZYZjc3yQu/bQ32kUgTobV8tLhC6z+sx7LuFa1Wa1OETuEwnAFeXtAE9mzWgLirOovI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587828; c=relaxed/simple;
	bh=/XYn2AmdqOxvQ2N6fChMk8FzFoi+jJT2gD+ifTwQ1js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiCz73qg81fi306sF4RZ2O6dziSVTOtwQlhqcYciGc9b9mXFmdc1UZkr8uxsaFtbnE8O/w5P/1bJ6/8v9olJpd3ow0ce7kSl7jSOFu5SjcX7SmgPwVpreroDMFFa2S0lX+1xmE6vWa+qkFleqgsOsuXikXGGTu2bvLN/RKH7MWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=SKsq5Tfx; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769587787;
	bh=rDbj8Zowlq6RvngGd3Gbk70FbEvvMkQLeOjLOd1SXIY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SKsq5Tfx2pDsDvJxV2s01SYI4DcL0RNh2aHbMd/TNpf1PN9sJ1MxFxDuVz6OJAvHw
	 yGQbIrKFO8W6Xs8mpmJgylI0JQB/QZI62ruAtvXKfLX+QLbiIlkaquMBKv7nZFe4/r
	 LTmvqYHE8WjA/wiDB4FEv7NdXAP1HV3f6K7RLwYA=
X-QQ-mid: zesmtpip4t1769587781t98a6c5d0
X-QQ-Originating-IP: iSkf8zex0Ptrxq+6tThB3ScYEPQNwgGxXM4YH4+XR/g=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jan 2026 16:09:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1284392233217659086
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: kenny@panix.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Wed, 28 Jan 2026 16:09:39 +0800
Message-ID: <ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026012754-ferocity-operator-e3b2@gregkh>
References: <2026012754-ferocity-operator-e3b2@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M/tkjzqOKNdvZ6zjBDwr/sSvg/6Jh2+hxMRKX7QqmN4VJb1uQEm9PTm0
	h3Drc1W8DXYY6odfbaK9AklsDgLpgGJ4j72mvo33MskR6+8ZihUii5nR4lTUaH0UT1zf2Ld
	D/strb1lTWwfeypKY3rPWr8obb77C3ufiqSO2seQRdO3z3/g+6BXnXZS6vc419aoFDGQZ3d
	nM+0SjnhxcBaSSTK3+5P5qkBu+Sn/ckXyMZVDmmycAHGDkBlGg8ZxRW6HDhXo0icggk8mTf
	tUiwMq3p1mzyU7u23laR8T+dHz+a2QvZT2H4tttXZIiyq+J/Emom+wSqMmmELJt9de/xgeZ
	jEzsoay4vCyoY7rWqP72ky+sTJDEzWUHv2J21IWjILCq74MT7r65hwE7V4N74vBW3FZNsaB
	rzmHN4Hs5Hu7xli0giZ0HPpT+fhj7mO6TTy+C5kgw1ofuRlfBxESUYGTo/+/PeX95A9xDYc
	UMnu5m1Ljx6PAWCZS/+TZN91q/WdE2OzHhGlE6XwU/irmmfLmflBLuezKHHQKvEb+BNDNzG
	zO0Nq6DFJgKwAclZpdki5eHqPWY7vYMBvrBO6qXyP+wrb2EcirWvbyDzDYVTAMANoftipOb
	qnsXplx04gjN+RFZsUzRBJF4Gbqj1rWoeWna+aE6kq0MbcQ92txf+H39zdZLqn1qhvEPG12
	kFz6bxiINrRwaO0jcWgUXGUsdZnQjeKBurZxrmP5YkIiy2ytVR8s16G2NICfwY08rfvdD/4
	HEkbP4nh3VlC6WmD2Ze6nGKiD5jeSmtk6l4WGNgx+J7Of68UbeKk4YVZwdz6hKtcMnHMQkT
	sLb94QPaevgq8TprRZs1PF1G1aWhwlstR5z2A1s7jmwU5e6WZoTWiwoNkCIey9RXRkR/gSu
	3NWKKwUFuoHE+MQCKc8CbCIOPUX0oh/LsHxFsNwV6cRRAgimvsX7PGxghVRAigpc4hJ60ik
	x7suAShz8MKOBcephXWMEuiyJ1xsf4YynT15Tm79bag2hoXyNBXOE6/RbKhgxxnD/wbi9xU
	eL042h92MMZkOkl1I/jgzBKCU1pYdctcbIORSWrboDOOVwUuGZxDRnJIe5SnjEn+4/nyhHz
	J+eGPOh5z2KqZCR2XfyT50=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32861-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 374DF9E1C2
X-Rspamd-Action: no action

Hi greg,

Thanks for the review. Below is why I believe enabling secondary
interrupters is justified.

> What do you mean exactly by "hot spot"?  Usually this is a good thing,
> driver code is in the cache, as are the data structures, so this keeps
> data flowing well with less latencies.  Why would you not want this?
>

By "hot spot" I do not mean a CPU cache problem. I mean a software-side
serialization point: all devices share a single event ring and a single
IRQ handler which processes completions under the global xhci->lock. That
centralizes the work into one place regardless of cache locality.

> > On hosts that already provide multiple
> > MSI/MSI-X vectors and independent event rings, routing all completions
> > through interrupter 0 creates unnecessary contention (serialized event
> > handling/locks and coupled moderation), increasing CPU cost and tail
> > latency under many active devices/endpoints.
>
> So this is a MSI routing issue, not a cpu cache issue?
>

Yes. The primary issue is routing and event-ring fan-in: everything
funnels through interrupter 0 today even when the controller advertises
multiple interrupters/vectors with independent event rings.

> And exactly what type of contention is happening here?  How can it be
> measured and noticed?  The latencies involved in USB are huge due to the
> protocol and hardware, why would a CPU even notice such things?
>

Even if USB link latency is high, the IRQ/event path is still a CPU-side
serialization point: all completions land in one event ring and are
drained by one handler under xhci->lock. Under mixed workloads (e.g. isoc
video plus periodic audio/bulk), events from unrelated devices can queue
behind the same lock/handler and increase jitter/tail latency, even if
the bus is not saturated.

> > Using secondary interrupters
> > simply matches the hardware's design, similar in spirit to merged
> > xHCI-sideband work: exploit available parallel paths rather than
> > funneling all events through one.
>
> What do you mean by "secondary interrupters"?  The sideband work was for
> a totally different issue, whereby the normal hardware and CPU was
> bypassed to allow it to remain powered down and to save battery life.
> Spreading interrupts across CPU cores does the exact opposite of that,
> ensuring that cores can NOT go to sleep when the work should be only
> done by one of them.
>

By "secondary interrupters" I mean the non-zero xHCI interrupters
(interrupter 1..N when Max Interrupters > 1), each with its own event
ring/ERST/IMAN/IMOD, backed by MSI/MSI-X vectors when available. This is
a standard xHCI capability; the series just enables it with a small cap
and a clean fallback to interrupter 0.

You're right that xhci-sideband targets a different goal (power), and I
did not mean to equate the motivation. I referenced it only because the
upstream xhci-sideband work has already exercised and validated the core
multi-interrupter/event-ring plumbing in the driver. So using additional
interrupters is a proven in-tree mechanism, not an experimental path
unique to this series.

> In short, please post numbers showing how this really is noticable
> somehow.

Understood. v11 still takes the global xhci->lock in the IRQ/event path,
so it does not claim true parallel event processing yet. The goal of v11
is to make multi-vector routing and lifecycle correctness solid
(request/free/sync, run/stop/resume, quiesce/teardown) and establish
per-slot routing as groundwork for a follow-up that can reduce lock scope.

Below is the exact test command and the fio results I observed.

Test script (perf + fio, 2 USB storage devices, 2 USB 2.0 uvc cameras,
60s time_based):
  sudo perf stat -a -e cycles,cache-misses \
    fio \
      --name=usb1 --filename=/media/uos/Ventoy1/fio.bin --size=1G \
      --rw=randrw --rwmixread=50 --bs=4k --iodepth=64 --numjobs=4 \
      --time_based=1 --runtime=60 --direct=1 --ioengine=libaio \
      --group_reporting --lat_percentiles=1 \
      --name=usb2 --filename=/media/uos/Ventoy2/fio.bin --size=1G \
      --rw=randrw --rwmixread=50 --bs=4k --iodepth=64 --numjobs=4 \
      --time_based=1 --runtime=60 --direct=1 --ioengine=libaio \
      --group_reporting --lat_percentiles=1

Baseline (v6.19-rc6, two-device randrw 4k):
  read:  IOPS=480,  BW=1923KiB/s, clat avg=484 ms, p50=79 ms
         p90=700 ms, p95=726 ms, p99=801 ms, p99.5=17.1 s, max=32 s
  write: IOPS=485,  BW=1943KiB/s, clat avg=470 ms, p50=81 ms
         p90=693 ms, p95=726 ms, p99=802 ms, p99.5=17.1 s, max=32 s

With v11 applied (same command, same devices):
  read:  IOPS=1376, BW=5505KiB/s, clat avg=157 ms, p50=20 ms
         p90=90 ms, p95=927 ms, p99=1003 ms, p99.9=17.1 s, max=32 s
  write: IOPS=1381, BW=5528KiB/s, clat avg=154 ms, p50=21 ms
         p90=91 ms, p95=927 ms, p99=1003 ms, p99.9=17.1 s, max=32 s

On this setup, this run shows higher throughput and lower typical
latencies with v11: read IOPS increased from 480 to 1376 (+186.7%) and
write IOPS from 485 to 1381 (+184.7%). Typical latency also improved:
read p50 dropped from 79 ms to 20 ms (-74.7%) and read p90 from ~700 ms
to ~90 ms (-87.1%); write p50 dropped from 81 ms to 21 ms (-74.1%) and
write p90 from ~693 ms to ~91 ms (-86.8%).
thanks,

Xu Rao

