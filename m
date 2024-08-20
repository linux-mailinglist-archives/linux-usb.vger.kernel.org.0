Return-Path: <linux-usb+bounces-13757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA91958F67
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 23:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE42D1F2316F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 21:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F3F163A97;
	Tue, 20 Aug 2024 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="FQnthI/P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4477B49626
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724187874; cv=none; b=QIN05U16ckTsrI6SuMgFknaeALAvaSmgT5yiHsPohH41shFMhEb5zVFbByCvRiXAAg0V8gQmPnu4JpqA6c5BZMukqrvmut6Tnoo4rs8pAH7jBoRc9g2wdkR+m/evbGiP+d6wTZvx0TWJDnfdHK1lgw6NZ/FldKnnJEGXtApO3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724187874; c=relaxed/simple;
	bh=RvcnOfMjIGYlNTHO//w5RdndqvxOClR5gidRyVaw3Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J//a6fhl+qF50r+khaFIAj49hFWJ6cbB339bgncMsU1GBAHqMzI2fCKhWyHatmpgOA8MwX9eW6/noLw43b6lyhc9AwWGEkukO7s9Z4JXSVrnRfF2RTFIS83AoINagGNDS2nsWaKdmOYqMDHfYAp3W1Og/Znn0m2+8DZGLYNGOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=FQnthI/P; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724187866; x=1724792666; i=mista.tapas@gmx.net;
	bh=w2OK5z/kOefD6n5cEG0VDsczwsTom4cZ86aE5oJvpgk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FQnthI/Pjd6CeATrLlNkR8h6SJfNC57oVibOZ00DEbuiT80NG9hGrVkVPv3m080v
	 b3dJqdMLImiXOdsRDHtboJKId/VfnNgAkxVWSWjA6j8VE0wWHw3JwXuqMVUY6xEx+
	 sJhZcW7sO88bUcC0Ao0OOWdYghmHvMYRTOf+bsQz+KoqTUetp82OuFmDmLwK2/SoE
	 qGOwjWBmIW93ie5x79c8yqn57WWcGNg21XtLNsDrQHzxxfNZ9HffUkAY0pJ56Tew+
	 nyhBeAqs8pD36d6kQNiye09CJnOjKRCgbBZdxLJlZugHWWINtYD93WWeENO2FbwxG
	 nHhhj0RsWafVTRPVFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([178.208.121.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1rtmzE2BNe-00zYEN; Tue, 20
 Aug 2024 23:04:26 +0200
Message-ID: <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
Date: Tue, 20 Aug 2024 23:04:24 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
References: <20240820130158.339b4d87@foxbook>
Content-Language: en-US
From: FPS <mista.tapas@gmx.net>
In-Reply-To: <20240820130158.339b4d87@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4VRSwBUqBDVLMBuw5azIEcBQTTtQPDShIkIQL92j23F36AQZ1bM
 dfubPLA8XTysciOUi9NLrmArOhvJFc2FWJ/cOqXPq/Po/Z4y3eg2DDAY/8FZheeToD7aY/3
 vlf5SNP/6lAcezbnZijjfdJHdNiaLbhgAhJWzgfmr+o9U4XktdYYVXmsnY5WcvLNW7rnvlC
 iS2U6RJz6kx8RmIbYP7dw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vvjkwwPy4eM=;czCEzbOnr+LNPAcRpXblMSpuKyF
 sP553/p0ZuFqg+AzmeLve4jq99ihblkcHQBHd0Ed8ZbJwVebMR7StK3NW/XjmcS2BYDGUKPiq
 E7vO5WDqM3Y78BvaC4XQsivydPBaO10PbAm8VapoLIHOWUsbezlKEzxCkFYcHmS2SEAtD6XKp
 YrToDNwKPNT4N5s2zGVPh0s0HdtGTO2Nj7XfMrM79t7I9ZOl9/U6nuERAfjo837qhRA5duho1
 VC+53jOrRUHlFqD7Nhm8LuaP492jHdNT7MEExoxCBCTDYc51U9VvrcE6B03Ti+FWrY0W4ORol
 iGlDQMK6sgJIrB7RxeMUeUf/oHbvxxhD6+DNF2CMhGKJi2MyO6nVhDp8ZXdFwkaCsWFAALNdc
 PuKB9eh7IHNLqUl2rXQiHXQOZIztfkK4i4JL7c3Os/E1HA1pARnD2+etKB87fBTY+vyR5SGeO
 JBfNkcbjUJSuutiJ738j6RxhQ9LcRwfNwOBX1RCcTcF44flKl55VbIanGRA7JYtsLfyFhM3lq
 Ku6KvJVRmyZqjO9SXEwURlNtG3EV9AWXrr0DbVIZXBNpje9cgptEuCZzd8VxReerUOdFEFGnT
 8CF660iJFspZMe3DMJpArNz9hZ6/HDkRDPXaWrrcIbv3u9hkE941ROlPAWEpLGCd8CNxzEHF+
 1CTotqlv8Y1HLwZ45fkGCw4yiGkcWnsNvra1N4MsDHfLl2vTj5e/x/HZxuFDhCr15zPFzR2tx
 0NHwFvbiKal5LWTJZuAOurigjBmQfJAZGkraWdBV4t0CVbOU9UMjyt6DEuGv2dRXpP00c3tN2
 iSfXTXo00Q4qxKhoY/GbSGXQ==

On 8/20/24 13:01, Micha=C5=82 Pecio wrote:
> I can offer a few quick suggestions:
>
> 1. When kernel bugs are suspected, try other kernels offered by your
> distribution. See if there is any chance that -rt paches are causing
> issues.

I have tried other kernels, including 4.19.319, 5.15.163-rt78 and
6.6.45. They all show the same behaviour of the audio device not
operating correctly at all with settings like 48 frames, 2 periods.

I have another Alder Lake system with an N100 CPU which has a similar
xHCI and it also shows problem 1 (see my answer to your question 2
below) but not problem 2 (see below as well):

00:14.0 USB controller: Intel Corporation Alder Lake-N PCH USB 3.2 xHCI
Host Controller (prog-if 30 [XHCI])
	Subsystem: ASRock Incorporation Device 54ed
	Flags: bus master, medium devsel, latency 0, IRQ 126
	Memory at 6001100000 (64-bit, non-prefetchable) [size=3D64K]
	Capabilities: [70] Power Management version 2
	Capabilities: [80] MSI: Enable+ Count=3D1/8 Maskable- 64bit+
	Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
	Capabilities: [b0] Vendor Specific Information: Len=3D00 <?>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

I guess it's the same chip but integrated somewhat differently.

In that system I also have a PCIE usb controller:

01:00.0 USB controller: Renesas Technology Corp. uPD720201 USB 3.0 Host
Controller (rev 03) (prog-if 30 [XHCI])
	Flags: bus master, fast devsel, latency 0, IRQ 16
	Memory at 80a00000 (64-bit, non-prefetchable) [size=3D8K]
	Capabilities: [50] Power Management version 3
	Capabilities: [70] MSI: Enable- Count=3D1/8 Maskable- 64bit+
	Capabilities: [90] MSI-X: Enable+ Count=3D8 Masked-
	Capabilities: [a0] Express Endpoint, IntMsgNum 0
	Capabilities: [100] Advanced Error Reporting
	Capabilities: [150] Latency Tolerance Reporting
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

And that one just works perfectly with full duplex operation even down
to buffer sizes of 12 frames / 2 buffers:

$ jackd -R -P 70 -d alsa -d hw:USB -n 2 -p 12

$ ./jack_wakeup -n 2000
min: 0.236729 ms; mean: 0.249978ms;  max: 0.258432 ms

0.25 ms would be perfect (2 USB microframes.)

So the -rt kernel is not to fault here per se.

(see note below on jack_wakeup)


> 2. Does any of that go away when ALSA buffer size is increased or is it
> always there on this machine?

Very good question! I suppose my initial report was a little unclear on
this. On this specific system there are two problems:

1. Certain combinations of buffer size and number of buffers do not work
reliably at all (i.e. xruns). These are basically all combinations of
buffer sizes < 128 and 2 buffers. I tested buffer sizes of 64 frames, 48
frames and 24 frames.

2. For those combinations that do seem to work (for example buffer size
64 with 3 buffers or buffer size of 128 and 2 buffers and up from there)
there are sporadic (about every 2-10 seconds or so) extra delays of
about 2 - 4 ms and they seem to be not randomly distributed at all but
rather always pretty close to full milliseconds.

Buffer sizes above 4 ms seem to work reliably with the light load I
tested but that is expected since the extra delay is then just masked by
the large buffers.

About problem 2: On the 4.19.319 kernel I tried problem 2 went away. It
also has not resurfaced after I rebooted into 6.6.44-rt39. I will do a
full power cycle and see if it resurfaces.

> 3. When posting wall of text errors, start at the beginning because it
> may offer clues about what originally went wrong ('dmesg -W' helps).

Sure!

> 4. Playing a tiny file with 'aplay --period-size=3D48 --buffer-size=3D96=
'
> is a simpler way to reproduce the problem and generates a shorter log.

Good point! But I played around some more and it seems that the problem
actually manifests in this precise way only if I actually do full duplex
audio processing. aplay would just use the playback direction, and also
it does not really do correct realtime scheduling.

If I just use the capture direction buffer sizes like 24 or 48 with 2
buffers appear to work and give me expected jitter. E.g for 48:

$ jackd -R -P 70 -d alsa -d hw:USB -n 2 -p 48 -C

$ ./src/jack_wakeup/jack_wakeup
min: 0.993217 ms; mean: 1.00002ms;  max: 1.00574 ms

Or for buffer size 24:

$ jackd -R -P 70 -d alsa -d hw:USB -n 2 -p 24 -C

$ ./src/jack_wakeup/jack_wakeup
min: 0.488788 ms; mean: 0.499921ms;  max: 0.510261 ms

For buffer size 12 things break though.

Note: jack_wakeup is just a small utility I wrote that measures the
interval between consecutive process callbacks which, in an unloaded
jack graph is useful to measure jitter in the system.

If you do not like the complexity that jack (jack1 in this case)
introduces I can probably cook up a small C program that just sets up
SCHED_FIFO, mlockall, etc, and does either simplex or full duplex
operations on the audio interface.

>> I have to note that these "WARN Event TRB for slot 18 ep 1 with no TDs
>> queued?" were there before enabling this dynamic debug feature, I just
>> forgot to mention them in my original mail.
>
> This particular part is probably caused by our failure to properly
> handle the preceding condition ("underrun event still with TDs queued").
> I can't know for sure, but assuming no hardware bugs, it appears that a
> new transfer descriptor is queued after the hardware reports a ring
> underrun but before we actually process the report. While processing
> the underrun we are surprised by this unexpected TD, then we see that
> skip flag is set so we erronously report all TDs (most likely including
> the new one) as failed to the audio driver. Meanwhile the hardware may
> execute this transfer and report its completion later, at which point
> we have already forgotten about it.
>
> *Maybe* this creates enough chaos that some sort of infinite loop of
> cascading errors is established as a result of one recoverable error.
> Or maybe your problem is elsewhere and this bug is only a side effect.
>
> Are you able to test kernel patches?

Yes, of course. It's been a couple of years since I did the whole
menuconfig, patch, rebuild, reboot, test - dance. I did this quite often
when Ingo posted early versions of the realtime preemption patches. E.g.

https://lkml.org/lkml/2004/11/21/184

Kind regards and thanks for your suggestions,
FPS

