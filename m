Return-Path: <linux-usb+bounces-13670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D724957571
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 22:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5AF8B238F3
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 20:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532BA1DD39A;
	Mon, 19 Aug 2024 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="cXdAckPD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C115CD7D
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724098349; cv=none; b=Z1PKJJrebzgWoVCjxcg29/ThXikV7+sWzVGSCrSC5lsuoIjqHYFxWZlgBgPR5e120P3GRUsprQ2emgg2VSOl3F0B3yp9oFzntFnogn6pt8lAAQ1WKeaBOrvASlRboq7791QKnS/Ky8eg6KLPN96oQs2SGjY3PBPj/+mwm13wzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724098349; c=relaxed/simple;
	bh=9ZymbkLGZlBp5zEaeX8f6+LTn0kw9iGpPi6zJkWexdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jwUXBbAjMxMB4TmJM4kNLlCi3NKoIonV/g8OesQ5uFNHxjofOjwB31zAhryONDUuBrI1+Y/Ox7gy98MFjs4JNaS5k3qsScYQnBaDiXyC5AsEixiXPDDXk68LBRgZyDgi8R/nw9BTzjV+6Sv0XNtRhTU60nh3GyAvmezN51VsTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=cXdAckPD; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724098340; x=1724703140; i=mista.tapas@gmx.net;
	bh=9ZymbkLGZlBp5zEaeX8f6+LTn0kw9iGpPi6zJkWexdo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cXdAckPDw1AGeD++FaNPA/pSdML5/0pKB42nZSKYPlXYcPwoe8t+YuRDrBEDjGQc
	 wPfvVJhe5G52+/ritvYquXRjHA9cCTnGTRQcU9phY2QC2/hv35438vaQ5SUfANNr1
	 sDGaRuuL8eyJoKbfIktNR/tHFD4WsjooeCBCKYmFkRAN8qGMp9isNCHUP/W0fiCuy
	 D/Yg3o393gya9M0h/tpp8arHF/iCUfvPaC9ATSYx3EIXocYHuUx+MBBfRRYoMnw1K
	 aq135JNpibmb+WPU6P5rYe+uCjTD3xh05USrAyxR7oumVXfT8/O+hLb9iMjhpDnzv
	 7ZvX1am2lh4WorgaKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([92.39.26.65]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeCtZ-1s74ZI2sa7-00cJq4; Mon, 19
 Aug 2024 22:12:19 +0200
Message-ID: <a3bcbff4-1e68-4856-bf27-aea3e71298a2@gmx.net>
Date: Mon, 19 Aug 2024 22:12:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
References: <76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net>
 <2a92b0fb-226c-4bc3-a648-9602d869a757@linux.intel.com>
Content-Language: en-US
From: FPS <mista.tapas@gmx.net>
In-Reply-To: <2a92b0fb-226c-4bc3-a648-9602d869a757@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Aozv62BIa2/3O0H9xO56y0sWSVNWb51IouNpRM8YWqefCewfdM8
 jaMzYuA9kkq/JPbIpyjwChTEYaPMwYBG+cLXMkuzvMj/h3v3lgyUCckgUbzFgKEmTJu0rHB
 MXtPdLjHePmAtZj4OKnNSKscJ2VI7AS4l9k6D7csaFD5zGiS9wDqvapr5mdJR7qPfYhCBTI
 U+XKg2jClnLW/Kq846pEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gupAQcQJFh8=;ABTxKbmmtw3plxSHFJhBtMsFR0Y
 HewcP48XCN1Eu6PeXpuc1RYh7gGHRHipncpMWr6egepiALt4KKPalrddkV7buhItMT7ew0Ux7
 bXt047scloJzVuO07Gh3MpxSLW0X1jipzb1qnpNEMLIo8YM6lLkjtA7908xld3bkScsDIacd1
 Mm3VORl9ESCipC6tIg4cyn4EL3QfX4Dw4uKhHF7MKpI9YVWGcdIqxA/3+DS17KV7oUH8J1eut
 hA2q63PSW8PFSa8Sy+AhkOG2qhTUYbNR596pjvjFLabRhyMtzj5BUntSPMPsY9hyj2ZKbDuAN
 bJ8qhO8K9pSvwbKBb5VJlEH9YE7KzCNoHUHWFcarRn1/hcgeo/9KDLtNVPKJrt6v08s46LszA
 bC0qvL1ROayiPpb5jnS+C7kaDivNKGJowCVGDWO98mycjUDJoS1bAUJ9EE0qnPjgxyeZaQ9qM
 OsSO4xOerJkiUSHQfu0+kL6uICpGJhxUuwF9kt2TNIIZJfqZDAEvhrh3SUXEdj67Sa3rwudtR
 jncNM8iTZIQEqsvmRBqLcQorV1Ue5QkPC8b5Go1Xjrnh1E8Z3i+vh51oEEhJwiVQfrtvNtRn6
 Ms1s/DgsigEwVwmtny1AF8o5pziVo1Pv9uctFgDRDDecNH+FJRT/tJlijojm5hCTvw5PDT5WZ
 loeNiawg1XepEX0umm+2/ny7mSzxJ6Hy4NtBwQ6cgNJhztKwRfjerVG9QOvS/lj9/R3MibiiC
 iyUhneyRlL2Hu/fDe/A/kBWpu5z4WYylQkUF3BaLbP4QyyFAc9aGaTxX64FeOG7HsTXY607ux
 DPAsomAC2ED66VBv99k9wDEw==

On 8/19/24 15:38, Mathias Nyman wrote:
> On 18.8.2024 23.56, FPS wrote:
>> Hi!
>>
>> Here's another observation: When I run the audio interface with 2
>> periods of 48 frames at 48000 Hz sampling rate I get constant Xruns fro=
m
>> jack of about 0.004-0.008 ms. It seems that the xHCI is not willing to
>> deliver all microframes in a timely manner but somehow wants a minimum
>> time interval of 1 ms between them (I read the term interrupt moderatio=
n
>> somewhere on the web - but I don't know if the linux xhci driver does
>> something like that at all.)
>
> The default interrupt moderation is 1ms for xHC hardware, but the xhci
> PCI driver should set it to 40 microseconds.
>
> Interupt moderation value can be checked from debugfs:
> # mount -t debugfs none /sys/kernel/debug/
> # cat /sys/kernel/debug/usb/xhci/0000:00:14.0/reg-runtime
> MFINDEX =3D 0x00002570
> IR0_IMAN =3D 0x00000002
> IR0_IMOD =3D 0x000000a0
> IR0_ERSTSZ =3D 0x00000002
> IR0_ERSTBA_LOW =3D 0x05069000
> IR0_ERSTBA_HIGH =3D 0x00000001
> IR0_ERDP_LOW =3D 0x05067b80
> IR0_ERDP_HIGH =3D 0x00000001
>
> IR0_IMOD shows the interrupt moderation value in 250 nanosecond steps.
> i.e. 0xa0 is 160 * 250ns =3D>=C2=A0 40000ns

Hi! Thanks for your reply! I checked. It's 40 microseconds for this xhci:

# cat /sys/kernel/debug/usb/xhci/0000\:00\:14.0/reg-runtime
MFINDEX =3D 0x00001b55
IR0_IMAN =3D 0x00000002
IR0_IMOD =3D 0x000000a0
IR0_ERSTSZ =3D 0x00000001
IR0_ERSTBA_LOW =3D 0x02c00000
IR0_ERSTBA_HIGH =3D 0x00000001
IR0_ERDP_LOW =3D 0x02c01570
IR0_ERDP_HIGH =3D 0x00000001

>> How could I debug this further? All help appreciated :)
>
> Was looking at a similar issue which turned out to be wifi driver debug
> blocking softirqs for a long time. This caused the the URBs that were gi=
ven
> back to audio class driver in a tasklet (softirq) context to be delayed.
>
> This changed recently a bit. USB core now uses workqueues instead of
> tasklets,
> but issue could be similar.
>
> I'm not familiar with cyclictest. I was debugging using ftrace myslelf.
> maybe ftrace preemptoff could show if something is blocking for a long
> time?
>
> echo preemptoff > /sys/kernel/debug/tracing/current_tracer

I will have to look into enabling this tracer on my kernel first. I'll
come back to it. Thanks for the tip!

> xhci dynamic debug could show if xHC controller has any issues processin=
g
> TRBs on ring buffer in time. This debug should be limited to
> handle_tx_event()
> as dynamic debug causes some delays itself.
>
> If there are any issues on xHC side it should print underrun/overrun, or
> miss
> service interval errors.

OK, I read up a little on dynamic debug and performed:

[root@ogfx97:/sys/kernel/debug]# echo "func handle_tx_event +p" >
dynamic_debug/control

which then gives me this log output (snipped - it merrily continues on
like this) upon running jackd with a period size of 48 and 2 periods at
48000 Hz:

Aug 19 22:06:34.029680 ogfx97 kernel: xhci_hcd 0000:00:14.0: Stopped on
Transfer TRB for slot 18 ep 4
Aug 19 22:06:34.029990 ogfx97 kernel: xhci_hcd 0000:00:14.0: Stopped on
Transfer TRB for slot 18 ep 1
Aug 19 22:06:34.034685 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035034 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035272 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035403 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035545 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035682 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035821 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.035958 ogfx97 kernel: xhci_hcd 0000:00:14.0: underrun
event on endpoint
Aug 19 22:06:34.036080 ogfx97 kernel: xhci_hcd 0000:00:14.0: Underrun
Event for slot 18 ep 1 still with TDs queued?
Aug 19 22:06:34.036192 ogfx97 kernel: xhci_hcd 0000:00:14.0: WARN Event
TRB for slot 18 ep 1 with no TDs queued?
Aug 19 22:06:34.036309 ogfx97 kernel: xhci_hcd 0000:00:14.0: td_list is
empty while skip flag set. Clear skip flag for slot 18 ep 1.
Aug 19 22:06:34.036424 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 4, set skip flag
Aug 19 22:06:34.036539 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 4, set skip flag
Aug 19 22:06:34.036648 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 4, set skip flag
Aug 19 22:06:34.036794 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 4, set skip flag
Aug 19 22:06:34.036911 ogfx97 kernel: xhci_hcd 0000:00:14.0: Found td.
Clear skip flag for slot 18 ep 4.
Aug 19 22:06:34.042676 ogfx97 kernel: xhci_hcd 0000:00:14.0: Stopped on
Transfer TRB for slot 18 ep 4
Aug 19 22:06:34.042909 ogfx97 kernel: xhci_hcd 0000:00:14.0: Stopped on
Transfer TRB for slot 18 ep 1
Aug 19 22:06:34.048684 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.048927 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.049045 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.049158 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.049269 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.049379 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.049484 ogfx97 kernel: xhci_hcd 0000:00:14.0: Miss
service interval error for slot 18 ep 1, set skip flag
Aug 19 22:06:34.049595 ogfx97 kernel: xhci_hcd 0000:00:14.0: underrun
event on endpoint
Aug 19 22:06:34.049722 ogfx97 kernel: xhci_hcd 0000:00:14.0: Underrun
Event for slot 18 ep 1 still with TDs queued?
Aug 19 22:06:34.049833 ogfx97 kernel: xhci_hcd 0000:00:14.0: WARN Event
TRB for slot 18 ep 1 with no TDs queued?
Aug 19 22:06:34.049944 ogfx97 kernel: xhci_hcd 0000:00:14.0: td_list is
empty while skip flag set. Clear skip flag for slot 18 ep 1.

I have to note that these "WARN Event TRB for slot 18 ep 1 with no TDs
queued?" were there before enabling this dynamic debug feature, I just
forgot to mention them in my original mail.

So does this actually point to the xHCI?

And sorry for the newline-wrapped lines. I'll try and see if I can teach
my email client not to do that ;)

Kind regards,
FPS

