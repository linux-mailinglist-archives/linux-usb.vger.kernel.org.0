Return-Path: <linux-usb+bounces-33006-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH53NzSogGmeAAMAu9opvQ
	(envelope-from <linux-usb+bounces-33006-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 14:35:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A10CCCA4
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 14:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4AE8303CD0F
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 13:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7F3369964;
	Mon,  2 Feb 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NS7FZcdX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9035BDBF
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039043; cv=none; b=HfWgQlRxBWPqJ8CNuc6uiFwFmNOKg9rk6KzxhQoVxjIfwSBEc0m9mcoDc9YZKMiN2/0VKKl1tJg8KgmT02J9HrTaBfvTZBlduA6woemHv57uBvUK/tLR1qyHONBDAuG03hX+UQd70TtqpCyIJu/lDTmpcGhG9tG3d5z8zNn5504=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039043; c=relaxed/simple;
	bh=Jr0aJPvvt5FTZsYtQRnvj55VnUNbgDS7Mc+mwGfMU7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCQEtW5FNnj13YS6UUg5Mn1gI/YAUSYfa3wLHi6ozhLQG6B/zYGLp0UeXeUjpaSaKMFNg6zgsVLYOctsyNFXEYVc06MTcHuFgbGmkRqxDrzTJt9kdsrIjpGoaYDzIUaUl1gfAXISIRwLab9jYdS0fOMEbOXH0TeEi6MFiSxIxl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NS7FZcdX; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1770038989;
	bh=8Dn1vF7FmsV/pcwxOODytHIfZZmVe2MRruzmPzoCDS8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NS7FZcdXsrgNMwQXJF3MaLxU5EfrZwO6AmOXFSwDCfuH9Q5X3XrdDuft6vtSn7UiZ
	 JvJTYlQOel1iFgPQ3gi+GYd3Ui2IKDZIG4dzoawGaiKdg5sj1X7QOvzRtRa7T1k+dU
	 iijdSp8ha3ZT8315YpBc/a6OpTlIJOW/bbS22FzU=
X-QQ-mid: zesmtpip2t1770038978t05416376
X-QQ-Originating-IP: blBQ3Vme4b2c5m3cf1tQ8w8R3jsG4gqrt+uTFwFT39w=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 02 Feb 2026 21:29:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10724276861905932173
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
Subject: Re: [PATCH v12 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Mon,  2 Feb 2026 21:29:26 +0800
Message-ID: <7F2D19446AC21BD0+20260202132936.2660641-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026013013-corridor-giblet-07e5@gregkh>
References: <2026013013-corridor-giblet-07e5@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M0YJCPYfkOgH+IyRxnDs4QX1aXu0KdrBePksXjn45zijjPD+V9TBjy9T
	rYDRuZlfi22Dqq54HKiZdY2PBM9folkqM6uQfGtWhRH8cqv9mwGhA6w0xeSai0sP3Yw1FJr
	A7hA0CRItD+0kff+bsAXWxCY4bgCdeZ6XDjTnpo0ehnSP6X5ItN13fqVHrttgdyW7KXIJZ0
	dCfKtAbX3lMCC6HzYG4sHyBIgwXM62WaOb0vLAnPw0zFbtIu5gNBoyxIHXzCjsrIQlsEBWM
	VdfIq57Ojm1PMYzPGK8GfzW6sn8pWI3X+2x9G8+tmWCsxIN0ioH0tvUmi2ddmcDZb1ADwrX
	txBrwol5fQEBGqRhvWF1rNKULdZ85BB9VRfiyK0RZQJhaJ0f/F7GcM9cnzxN40jcTHFzkkA
	k+hc5avA3oXZGjeUJma16AnUcaXILaL0yD8foO65PeUAkyE0yDmrKTQlvgWyNeQhovuQmQU
	3WJTTXQYBYZ4mEpMpTAfhbEIGDo4EEElpbCwVrvq6QtvG1M0cIYsOaCRDm0QSUHHY/8dup7
	s1YTvHBr1WTS3Cq18rFAr02GMltwN1AfQFvGCqqbU7pmw2LMnV9ZyM1REzgb1r4P0V6vnot
	sjKe0/eUW1XWKFeN4TTFRdTl0mBtEUZAT5QW21iYBzXRFNWVARwGBte2eNHKXPYHZ9vLMly
	maVYhJ134DOlxwCWYwVNPD9jMvXbDRfydlnv5BKTI9GP9C+gFrv5VmsdTtWjig5nk3T8Q4t
	sdoBnf7/0Lq5g1K7uxnhlCV3H9u5Eal5TSlXq+v8KSKGa4qSg6vQgaoudHZzys9O0bAtFUm
	AuGwHBC6jLqUB1MG4XwTRWR2XVvJinIhQXZL4Sr1hcObxhFEHJcOP7Zw2FOcJNymvM3y90I
	ZKyPQWeupOR5Vx0yGVvK6Wjb1Ey4H3hGDSxEc6JlOV8m6s7yEF4gWIjcPMCdPM4ivbgm8A1
	+mHzOg1trJscmeZGuof9p8A+H/rYQf7oJMB99q8hhj7pw0CitpDmab7KTOOjPJg+81DCpgO
	ex0fqTTIcp+9VgpKMtWO1tGZJqOMIEDAWZdOiOsNOo+sMqdVblhtNGpbKNIJh+1FQnlV8U7
	uhUBUEoiSI6
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33006-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Queue-Id: 44A10CCCA4
X-Rspamd-Action: no action

Hi greg ,

Thanks for the review.

> > Test device:
> > ID 090c:2320 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) FF952
> >
> > The results of testing a single USB drive are as follows: there is no
> > significant difference in speed. Perhaps I can test more devices to
> > see the differences.
> >
> > 6.19.0-rc6 result:
> > dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
> > 10611589120 bytes (11 GB, 9.9 GiB) copied, 30 s, 353 MB/s
> > 1024+0 records in
> > 1024+0 records out
> > 10737418240 bytes (11 GB, 10 GiB) copied, 30.3882 s, 353 MB/s
> >
> > 6.19.0-rc6 + v12 patch result:
> > dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
> > 10475274240 bytes (10 GB, 9.8 GiB) copied, 30 s, 349 MB/s
> > 1024+0 records in
> > 1024+0 records out
> > 10737418240 bytes (11 GB, 10 GiB) copied, 30.7994 s, 349 MB/s
> >
> > 6.19.0-rc6 + v12 patch + imod_interval =10000 result:
> > dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
> > 10643046400 bytes (11 GB, 9.9 GiB) copied, 30 s, 355 MB/s
> > 1024+0 records in
> > 1024+0 records out
> > 10737418240 bytes (11 GB, 10 GiB) copied, 30.2851 s, 355 MB/s
>
> dd is a horrible benchmark tool and does not mean that the data really
> is flushed to the devicei (oflag=direct _should_ bypass the page cache,
> but I don't remember if that's always the case.)
>
> fio would be more interesting, spreading transactions across multiple
> devices at the same time, what about running the benchmark you showed
> earlier in the thread?

I have added the following test results.

Test device:
ID 090c:2320 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) FF952

Test script (perf + fio, 1 USB storage device):
  sudo perf stat -a -e cycles,cache-misses \
    fio \
      --name=usb1 --filename=/media/uos/Ventoy1/fio.bin --size=1G \
      --rw=randrw --rwmixread=50 --bs=4k --iodepth=64 --numjobs=4 \
      --time_based=1 --runtime=60 --direct=1 --ioengine=libaio \
      --group_reporting --lat_percentiles=1 \

6.19.0-rc6 result:
  Run#1 (pid=5545)
  read: IOPS=3159, BW=12645KiB/s, clat avg=38.0 ms, p50=12 ms
  p90=89 ms, p95=148 ms, p99=163 ms, p99.5=217 ms, p99.9=228 ms, max=369 ms
  write: IOPS=3158, BW=12638KiB/s, clat avg=41.7 ms, p50=14 ms
  p90=92 ms, p95=153 ms, p99=167 ms, p99.5=222 ms, p99.9=230 ms, max=369 ms

  Run#2 (pid=6633)
  read: IOPS=3039, BW=12159KiB/s, clat avg=39.4 ms, p50=12 ms
  p90=90 ms, p95=150 ms, p99=165 ms, p99.5=221 ms, p99.9=230 ms, max=396 ms
  write: IOPS=3038, BW=12155KiB/s, clat avg=43.3 ms, p50=14 ms
  p90=93 ms, p95=153 ms, p99=171 ms, p99.5=224 ms, p99.9=232 ms, max=396 ms

  Run#3 (pid=8091)
  read: IOPS=3063, BW=12259KiB/s, clat avg=39.1 ms, p50=12 ms
  p90=90 ms, p95=150 ms, p99=167 ms, p99.5=223 ms, p99.9=234 ms, max=318 ms
  write: IOPS=3062, BW=12254KiB/s, clat avg=43.0 ms, p50=14 ms
  p90=93 ms, p95=153 ms, p99=220 ms, p99.5=226 ms, p99.9=236 ms, max=318 ms

  Average（3 times）
  read: IOPS=3087, BW=12354KiB/s, clat avg=38.8 ms, p50=12 ms
  p90=90 ms, p95=150 ms, p99=165 ms, p99.5=221 ms, p99.9=230 ms, max=361 ms
  write: IOPS=3086, BW=12349KiB/s, clat avg=42.7 ms, p50=14 ms
  p90=93 ms, p95=153 ms, p99=186 ms, p99.5=224 ms, p99.9=233 ms, max=361 ms

6.19.0-rc6 + v12 patch result:
  Run#1 (pid=3447359)
  read: IOPS=4682, BW=18732KiB/s, clat avg=26.3 ms, p50=15 ms
  p90=85 ms, p95=94 ms, p99=155 ms, p99.5=163 ms, p99.9=180 ms, max=322 ms
  write: IOPS=4683, BW=18734KiB/s, clat avg=27.4 ms, p50=15 ms
  p90=86 ms, p95=95 ms, p99=157 ms, p99.5=165 ms, p99.9=186 ms, max=322 ms

  Run#2 (pid=3450671)
  read: IOPS=4780, BW=19122KiB/s, clat avg=25.6 ms, p50=15 ms
  p90=84 ms, p95=93 ms, p99=155 ms, p99.5=163 ms, p99.9=192 ms, max=381 ms
  write: IOPS=4779, BW=19119KiB/s, clat avg=27.0 ms, p50=15 ms
  p90=86 ms, p95=94 ms, p99=157 ms, p99.5=165 ms, p99.9=226 ms, max=381 ms

  Run#3 (pid=3454140)
  read: IOPS=4892, BW=19576KiB/s, clat avg=25.2 ms, p50=14 ms
  p90=84 ms, p95=93 ms, p99=122 ms, p99.5=163 ms, p99.9=176 ms, max=300 ms
  write: IOPS=4889, BW=19565KiB/s, clat avg=26.3 ms, p50=15 ms
  p90=85 ms, p95=94 ms, p99=153 ms, p99.5=163 ms, p99.9=176 ms, max=300 ms

  Average（3 times）
  read: IOPS=4785, BW=19143KiB/s, clat avg=25.7 ms, p50=15 ms
  p90=84 ms, p95=93 ms, p99=144 ms, p99.5=163 ms, p99.9=183 ms, max=334 ms
  write: IOPS=4784, BW=19139KiB/s, clat avg=26.9 ms, p50=15 ms
  p90=86 ms, p95=94 ms, p99=156 ms, p99.5=164 ms, p99.9=196 ms, max=334 ms

6.19.0-rc6 + v12 patch + imod_interval =10000 result:
  Run#1 (pid=4172)
  read: IOPS=4669, BW=18677KiB/s, clat avg=26.3 ms, p50=15 ms
  p90=85 ms, p95=93 ms, p99=155 ms, p99.5=163 ms, p99.9=182 ms, max=258 ms
  write: IOPS=4666, BW=18669KiB/s, clat avg=27.6 ms, p50=16 ms
  p90=86 ms, p95=94 ms, p99=157 ms, p99.5=165 ms, p99.9=184 ms, max=261 ms

  Run#2 (pid=5621)
  read: IOPS=4888, BW=19557KiB/s, clat avg=25.1 ms, p50=14 ms
  p90=83 ms, p95=93 ms, p99=157 ms, p99.5=165 ms, p99.9=182 ms, max=301 ms
  write: IOPS=4887, BW=19555KiB/s, clat avg=26.3 ms, p50=15 ms
  p90=84 ms, p95=94 ms, p99=159 ms, p99.5=167 ms, p99.9=205 ms, max=308 ms

  Run#3 (pid=7179)
  read: IOPS=4521, BW=18085KiB/s, clat avg=27.1 ms, p50=15 ms
  p90=86 ms, p95=94 ms, p99=157 ms, p99.5=167 ms, p99.9=230 ms, max=310 ms
  write: IOPS=4521, BW=18088KiB/s, clat avg=28.5 ms, p50=16 ms
  p90=87 ms, p95=95 ms, p99=161 ms, p99.5=169 ms, p99.9=234 ms, max=310 ms

  Average（3 times）
  read: IOPS=4693, BW=18773KiB/s, clat avg=26.2 ms, p50=15 ms
  p90=85 ms, p95=93 ms, p99=156 ms, p99.5=165 ms, p99.9=198 ms, max=290 ms
  write: IOPS=4691, BW=18771KiB/s, clat avg=27.5 ms, p50=16 ms
  p90=86 ms, p95=94 ms, p99=159 ms, p99.5=167 ms, p99.9=208 ms, max=293 ms

With the patch applied, fio randrw 4k performance improves
substantially versus the baseline (rc6): throughput increases
from ~3.1k IOPS (~12.3 MiB/s) to ~4.7–4.8k IOPS (~18.8–19.1 MiB/s),
and average clat drops from ~39–43 ms to ~26–28 ms. High-percentile
latency also improves (p95 ~150 ms -> ~93–94 ms; p99.9 ~230 ms -> ~180–200 ms).
The only regression is a slightly higher median latency (p50 ~12–14 ms -> ~14–16 ms).

Based on the fio results, performance improved after applying the
patch on my setup. I haven't confirmed whether the same improvement
holds in other environments. My test hardware and commands are shown
above. Note that a simple dd throughput test did not show any speed
difference.

I haven't fully figured out the reason for the speed difference.
Please let me know if you need other testing methods.

thanks,

Xu Rao

