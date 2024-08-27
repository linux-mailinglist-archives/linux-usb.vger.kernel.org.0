Return-Path: <linux-usb+bounces-14176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96895960A93
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 14:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0811C22D60
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 12:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9361BFDF7;
	Tue, 27 Aug 2024 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HX1Ujx8t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D721BAED5
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 12:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762100; cv=none; b=lDzFlA4y2ZLSbt4e+wU2s0Q03jdY/YClRu1GXkhKBSzjA/44JA9R8ylX+/yOMF1CzVd6gzXO2vqCspRX+UWBUL4PCv6tARgzKA7jVKsV6kyBMscesRdDuQhvBlr2vnwYQ8Dh50dPvW+m2aHJFg36R6h5+Gbr3jvvK8PFCPCL60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762100; c=relaxed/simple;
	bh=8bKDRM1hzsoYBy9XI+fAUUy9VAfWSys7iVTYTR+tp4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bG9UTb/g52cg4v0DAdTAj0KZ0f2US0Qp5YF2njo3LmIAlRVhevGjeNDNdAfY8obyu6pMEbRu7A2MMIw28jyNvlXc1aQB43cL2nWa/VGi5iPi/fzRnEScFMsUr+6KW8g9TMGEnTi/mRQdXroI5mYfd2obtgWn41bWImckzdABctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HX1Ujx8t; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724762098; x=1756298098;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8bKDRM1hzsoYBy9XI+fAUUy9VAfWSys7iVTYTR+tp4U=;
  b=HX1Ujx8tUOWzlhfmdaxfHuCJ4oGaMi1QYMxycKCg2tyVp8/XA7Tq/iKH
   LJvOoMytYEjJBrj5y6IKkErdnsjW80Ga8B/qP19b4xY6NdRQX5sYqNh3r
   MsLD/16aIfMXXuxZqC0o/OsejGhDxtkU5xzZ+Xzr8HuoZXyilzguQ/31e
   YJSdkbDylWnuxD97mKoXG7CN+l1lJ4SbDxH1317gotgi+89o4RN13Vyhb
   69OqRoNS3df7i8P/EA6tVyua6mOcCE5amM0lXQklEefKFXvBqzQTD7hms
   /wVz7mlRQnny84Jp24hemDUuCwP3rozQLDX5YbXV9Ms/j0RZZLg3WaVN8
   g==;
X-CSE-ConnectionGUID: RvuCbrfeSQmTLPfqv+N5sQ==
X-CSE-MsgGUID: FyTYNBPlRY6EgA25f8v+3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23396033"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23396033"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:34:58 -0700
X-CSE-ConnectionGUID: BoA+l0txQjKsGi0Iw9IqHA==
X-CSE-MsgGUID: F07JITM+TyiOXjGLff7e1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67188390"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2024 05:34:56 -0700
Message-ID: <301bfda2-72d5-423a-bed7-87ac786dac83@linux.intel.com>
Date: Tue, 27 Aug 2024 15:37:01 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: FPS <mista.tapas@gmx.net>, =?UTF-8?Q?Micha=C5=82_Pecio?=
 <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
 <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.8.2024 0.22, FPS wrote:
> 
> 
> On 8/23/24 1:43 PM, FPS wrote:
>>  > If possible I'd like to see xhci traces of this issue.
>>
>> Here is a curl'able trace (from running timeout -s KILL 0.1 jackd -R -P
>> 70 -d alsa -d hw:USB -p 48 -n 2 (thanks to Michal for the suggestion)):
>>
>> https://uni-bielefeld.sciebo.de/s/1ixBodEpmSg8M2k/download
>>
>> Or should I include it inline (it's ca. 1M.)
> 
> OK, that trace is possibly unnecessarily complex. Maybe it makes sense
> to look at a more isolated issue first. I mentioned before that just
> using the capture direction with jackd seems to be fine, but the
> playback direction is broken. It is broken in a somewhat "weird" way.
> Jack doesn't report XRuns, but playback is definitely broken (Sound
> plays back as if there is a zero buffer inserted after every buffer and
> with ca. half the speed.

It's a bit complex, but it shows the missed service events started from
out transfers.

Quick background, audio class driver queues URBs. One URB containis one or several
TDs (transfer descriptors). One TD is consumed each interval, in this case each 125us.
In this case audio driver uses two URBs, usually containing 7 or 8 TDs, each transferring
48 bytes. TD (Transfer descriptor) equals one TRB (Transfer Block) in this particular case.


USB audio driver queues two URBs:
   185.943950: xhci_urb_enqueue: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 0/384  8 x 48 bytes 0x10a3f5000 - 0x10a3f5070
   185.943966: xhci_urb_enqueue: ep1out-isoc: urb 0000000094a36c26 pipe 33792 slot 3 length 0/336  7 x 48 bytes 0x10a3f5080 - 0x10a3f50e0

xHCI gives back URBs once completed. About 1ms apart which is ok.
Odd that audio driver doesn't queue back the fist URB immediately after receiving it, this could cause missed service event.
   185.946834: xhci_urb_giveback: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 384/384
   185.947705: xhci_urb_giveback: ep1out-isoc: urb 0000000094a36c26 pipe 33792 slot 3 length 336/336

Audio driver queues both URBs after it has processed their content.
very odd that the other URB only contains 1 TD (covering only 125us)
   185.947732: xhci_urb_enqueue: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 0/48  1 x 48 bytes (0x10a3f50f0)
   185.947745: xhci_urb_enqueue: ep1out-isoc: urb 0000000094a36c26 pipe 33792 slot 3 length 0/336 7 x 48 bytes (0x10a3f5100 - 10a3f5160)

Audio driver cancels both URBs, Odd, why does it do that?
   185.949843: xhci_urb_dequeue: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 0/48    CANCEL why?? (0x10a3f50f0)
   185.949848: xhci_urb_dequeue: ep1out-isoc: urb 0000000094a36c26 pipe 33792 slot 3 length 0/336   CANCEL why?? (0x10a3f5100 - 10a3f5160) turned to no-ops, deq at af5100

xhci gives back both cancelled URBs (empty)
   185.949902: xhci_urb_giveback: ep1out-isoc: urb 0000000094a36c26 pipe 33792 slot 3 length 0/336
   185.949908: xhci_urb_giveback: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 0/48

Audio driver queues both URBs, almost at the same time
   185.950017: xhci_urb_enqueue: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 0/384  8 x 48 bytes (10a3f5170 - 10a3f51e0)
   185.950031: xhci_urb_enqueue: ep1out-isoc: urb 0000000094a36c26 pipe 33792 slot 3 length 0/336  7 x 48 bytes (10a3f51f0 - 10a3f5250)

xhci driver successfully completes the first URB.
   185.952765: xhci_urb_giveback: ep1out-isoc: urb 000000007faac5c4 pipe 33792 slot 3 length 384/384

xhci reports missed Service error for the first TD (TRB) of the second URB (at buffer location 000000010a3f51f0)
   185.952876: xhci_handle_event: EVENT: TRB 000000010a3f51f0 status 'Missed Service Error' len 48 slot 3 ep 2 type 'Transfer Event' flags e:C

This is again odd.
The two last URBs were queued at almost the same time, and the TDs of the first URBs
completed successfully. I would understand a 'Missed service event' at an earlier stage,
for example at  0x10a3f50f0.

Maybe the missed service event TRB pointer isn't that exact.
Also, audio driver cancelling URBs right after queuing them does not help.

> 
> I ran jackd like this:
> 
> timeout -s KILL 2 jackd -R -P 70 -d alsa -d hw:USB -p 48 -n 2 -P 2>&1 |
> logger
> 
> This gave me (somewhat imprecise) timestamps for the jack output:
> 
> [119172.966606] arch97 fps[177753]: jackd 0.126.0
> [119172.966616] arch97 fps[177753]: Copyright 2001-2009 Paul Davis,
> Stephane Letz, Jack O'Quinn, Torben Hohn and others.
> [119172.966619] arch97 fps[177753]: jackd comes with ABSOLUTELY NO WARRANTY
> [119172.966621] arch97 fps[177753]: This is free software, and you are
> welcome to redistribute it
> [119172.966622] arch97 fps[177753]: under certain conditions; see the
> file COPYING for details
> [119172.966624] arch97 fps[177753]:
> [119172.973620] arch97 fps[177753]: no message buffer overruns
> [119172.975503] arch97 fps[177753]: JACK compiled with System V SHM support.
> [119172.989889] arch97 fps[177753]: loading driver ..
> [119172.990672] arch97 fps[177753]: creating alsa driver ...
> hw:USB|-|48|2|48000|0|0|nomon|swmeter|-|32bit
> [119172.991245] arch97 fps[177753]: configuring for 48000Hz, period = 48
> frames (1.0 ms), buffer = 2 periods
> [119172.991249] arch97 fps[177753]: ALSA: final selected sample format
> for playback: 32bit integer little-endian
> [119172.991252] arch97 fps[177753]: ALSA: use 2 periods for playback
> [119174.533438] arch97 fps[177753]: delay of 1003.000 usecs exceeds
> estimated spare time of 966.000; restart ...
> [119174.533463] arch97 fps[177753]:
> [119174.536202] arch97 fps[177753]: delay of 1051.000 usecs exceeds
> estimated spare time of 966.000; restart ...
> [119174.536222] arch97 fps[177753]:
> [119174.539134] arch97 fps[177753]: delay of 1060.000 usecs exceeds
> estimated spare time of 966.000; restart ...
> [119174.539152] arch97 fps[177753]:
> [119174.542173] arch97 fps[177753]: delay of 1049.000 usecs exceeds
> estimated spare time of 966.000; restart ...
> [119174.542192] arch97 fps[177753]:
> [119174.545145] arch97 fps[177753]: delay of 1047.000 usecs exceeds
> estimated spare time of 966.000; restart ...
> [119174.545164] arch97 fps[177753]:
> [119174.548423] arch97 fps[177753]: delay of 993.000 usecs exceeds
> estimated spare time of 966.000; restart ...
> [119174.548447] arch97 fps[177753]:
> 
> which continues for a while until jackd is killed.. The timestamps allow
> us to correlate (again, imprecisely) what's in the trace (curl'able link):
> 
> https://uni-bielefeld.sciebo.de/s/5gXyqY0cqNrQZdE/download
> 
> It is quite peculiar. Jack seems to start up fine and is done
> configuring it's "driver" at 119172.991252 and seems to run fine until
> 119174.533438 which is ca. 1.5 secs later where weird things start to
> happen. A delay of 1.003 ms is reported which is just above the 1 ms
> period duration of 48 samples @ 48000 Hz sampling rate. So the last
> buffer would have been sent off to the soundcard about 1 ms before this
> time. Now looking at the trace I noticed a little thing. In the part pf
> the trace before the excessive delays start I see things like this:
> 
>   irq/125-xhci_hc-169     [003] ..s.3 119173.246016:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
>   irq/125-xhci_hc-169     [003] b...3 119173.247898: xhci_handle_event:
> EVENT: TRB 000000010a3f14d0 status 'Success' len 0 slot 3 ep 2 type
> 'Transfer Event' flags e:c
> 
> or
> 
>   irq/125-xhci_hc-169     [003] ..s.3 119173.248024:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
>   irq/125-xhci_hc-169     [003] b...3 119173.248883: xhci_handle_event:
> EVENT: TRB 000000010a3f1560 status 'Success' len 0 slot 3 ep 2 type
> 'Transfer Event' flags e:c
> 
> The time between ringing the doorbell and the next xhci_handle_event is
> mostly below 2 ms. But lateron I see things like this:
> 
>   irq/125-xhci_hc-169     [003] ..s.3 119174.323020:
> xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
>   irq/125-xhci_hc-169     [003] b...3 119174.324897: xhci_handle_event:
> EVENT: TRB 000000010a3f1d30 status 'Success' len 0 slot 3 ep 2 type
> 'Transfer Event' flags e:C
> 
> Suddenly this time has jumped to almost 3 ms. I'm still getting my head
> around the low level USB stuff but possibly this is a hint?

It's interesting to see that there are no 'Missed service events' or
buffer under/overruns even if host clearly doesn't handle one TD per 125us.

10 returned URBs from last log show additional delays.
grep "xhci_urb_giveback: ep1out-isoc" trace_playback.txt:
...
119174.201925: xhci_urb_giveback: ep1out-isoc: urb 000000005f2dc90a pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.202916: xhci_urb_giveback: ep1out-isoc: urb 0000000032ac090e pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.204924: xhci_urb_giveback: ep1out-isoc: urb 000000005f2dc90a pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.205913: xhci_urb_giveback: ep1out-isoc: urb 0000000032ac090e pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.207926: xhci_urb_giveback: ep1out-isoc: urb 000000005f2dc90a pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.208912: xhci_urb_giveback: ep1out-isoc: urb 0000000032ac090e pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.210923: xhci_urb_giveback: ep1out-isoc: urb 000000005f2dc90a pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.211916: xhci_urb_giveback: ep1out-isoc: urb 0000000032ac090e pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.213925: xhci_urb_giveback: ep1out-isoc: urb 000000005f2dc90a pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004
119174.214912: xhci_urb_giveback: ep1out-isoc: urb 0000000032ac090e pipe 33792 slot 3 length 384/384 sgs 0/0 stream 0 flags 00000004

URBs contain 8TDs with 125us interval, and should complete 1ms apart on average.
This won't be true for every URB as sometimes urb giveback might be blocked for
a short while, but it should average out. Next URB would then return a bit earlier.

In this case it doesn't. URB are permanently delayed.

We use "SIA" (Start Isoc ASAP) flag for Isoc transfers, this allows controller
to queue TD to be transferred "as soon as possible" without forcing it to a
specific microframe.  Could be that this flag in combination with queueing TDs
very close to the IST limit causes the delay but not triggering missed service
events, or under/overruns.

Adding more URBs could help, but causes a bit more latency.

Or maybe see if we can get audio driver to use 3 URBs with 6TDs each?
  
Thanks
Mathias


