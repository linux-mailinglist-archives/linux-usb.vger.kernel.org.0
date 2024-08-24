Return-Path: <linux-usb+bounces-14040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED95795E004
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 23:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C7CA2828D4
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 21:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBBD80C02;
	Sat, 24 Aug 2024 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="PGCU05Fs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED71C2AE8E
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 21:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724534538; cv=none; b=moy5VELb2vAoiAhfzcnqLa9nzmA2JBJTl/wBl3Ksc1IjR7M5sjuNJbH1BuEuFErrtWE80t0DP7/D3bpyFYNo5fxNtgBpAYs48tHf9uQhnjyv0IXfsCZzsC3zAPbweYQUvZ17/pRGtj0cb+Gb2erGMtOrhBi49e8cBP8Ugyd0e90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724534538; c=relaxed/simple;
	bh=Cnj0KJqxvsGtCaAuLu4s0pauHWPLZec0r6/mwKwTFJM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OewSg69qUJdNweUlJfgTphb8LmtpTH6QIz4shml/EpzwSn6RFBe++Wl1rNzRPl2VWNh/9IqPLc0f59XXTqeS1ZkXvjcMfLNpPjhD/gARSXOyFXBRbc4C5P1TxZ1bTlwxHmJZmZsDzrg5JGxBaCWSOzqomoR1g5GFIYEsiOHdLY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=PGCU05Fs; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724534530; x=1725139330; i=mista.tapas@gmx.net;
	bh=1JkDEaXtE1lg5D77Wzin65XY4q6+kFxTmhlaVq5cq+Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PGCU05Fs5Y9IlRi73kgrItW9eEttEo2CQWpFuBLySMnnmN2t7h0fq6XX84UXX2lK
	 tExj0E1Q98KIkCiMVHFK8wylidV5sZk9k/pqzg82i71fSwJpZBhVuY3H62m3YLFg3
	 vqmpp5E1H9YtXNfTYwbZQ8liHiCeY325tsYl9L0vsRu8HgYRqT3mp4kjET02JqXRS
	 ju7DxfsfuakiH9gOo4fjRZ+UnAdq5PMIynf8RrPHjxvf/lwt6xitHTO9YETLfXwuv
	 6hf5T0pGo0fI5FZaxStBGxH6QNM+zuwQTt3jeFjEPbd+iadFdQibPdkq9ruQdG77B
	 ZgDULjYF91hbs+mIqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([149.50.50.53]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ma20q-1seeJx2s6u-00YUjR; Sat, 24
 Aug 2024 23:22:09 +0200
Message-ID: <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
Date: Sat, 24 Aug 2024 23:22:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
From: FPS <mista.tapas@gmx.net>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
Content-Language: en-US
In-Reply-To: <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BAYjTIIOLNTcJPU9zc2PFfaXGufjQkI23XX7uUU1GvYJOh9fnr0
 9CgqaDlO0hhyul0l7ZeeMescBzqZWQNGci9ZlSxTAELb1c2WY1NcxjdbXMa5Id4kWMM1Isr
 Ps6FBAjApthA77rpFY9a3GbsC8yCkvI/DBrPS98Sea60Sh8mEwOHfkUS+HMphliiTJH08yR
 cDVZQ2TzBBhn5NgKQl9mw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uvrlVglv6RY=;08XOvA0fLGc9kFb4NB+iFER/28O
 mDiies4O8SbRh4ZOu9WxB6u3WpihnGonuXW2yjOv6QGv46KbbEd3ev9Q9cwjnEkWTjBjMVtp9
 gW9Wg1h1ZzT/7WdeBuq1IE7CMV7a5a8K+HjCM1DWPKd+yqJTmEvc4x0wLO9//5f1ir1qkEvyT
 KcJwh2BqDWSYe5TLxS0EA3EBv8ypFa3B102Tbsh/HQQjYQbuP6lSfgChY8yZ1V5VdehJ8zvVB
 SVJ0e6vSjxlfi9ee0hr9r7z+KvXeDOJUvxXMfZriVlA/dUkuy9PkyP5hjLapD4FW6d7N4cjj0
 fhXCQBVk9BEvYCcrc07JWjCIvJ4LTvL/uKblEpjzC333B6/K0iml0TNLwzCqbhQaXyCwlU1g3
 Bnk+nLMuj4lOiFBe9+J+HoxP6Q68wXtAtzR4mMKUo8BYY0Kv6Tm6+n4VQM2ORTpVQ90T91N55
 wxxkJrwdGbmU3tZLebd/WfnN4kiqHSF9fW/ya+AW3DlHI85DVu5+uwcncAuCnUWGRvu62MGcp
 S7F1PqBxijIGNC7IJ6LAJMFuBOTeT0ok1Hm5GHKSWco4QNNN0v97Krc8Vj0WWVwfJH38MlVkI
 o0Aq50Xp3DNjnC3kk+8pUl3RzJDxTzzzVbv8ydNVM+J2neJEUzs0cmd3A/3N33yXjtjK720mq
 bP8PJhwZcVQFT7ImQeBBJLvUSbjfEcaXNBwj6AUNJg/csuBfhrp+kuxvafvyzDlLPkAw685v4
 HOdd8uPn2M5RR26OPcw5C4PlPEcL2NZaog8udIB5C14uAiU46LmKJy0d4SwgXtYqrGivbkOnU
 kbkrt8Hyqga9cw303zWipaRg==



On 8/23/24 1:43 PM, FPS wrote:
>  > If possible I'd like to see xhci traces of this issue.
>
> Here is a curl'able trace (from running timeout -s KILL 0.1 jackd -R -P
> 70 -d alsa -d hw:USB -p 48 -n 2 (thanks to Michal for the suggestion)):
>
> https://uni-bielefeld.sciebo.de/s/1ixBodEpmSg8M2k/download
>
> Or should I include it inline (it's ca. 1M.)

OK, that trace is possibly unnecessarily complex. Maybe it makes sense
to look at a more isolated issue first. I mentioned before that just
using the capture direction with jackd seems to be fine, but the
playback direction is broken. It is broken in a somewhat "weird" way.
Jack doesn't report XRuns, but playback is definitely broken (Sound
plays back as if there is a zero buffer inserted after every buffer and
with ca. half the speed.

I ran jackd like this:

timeout -s KILL 2 jackd -R -P 70 -d alsa -d hw:USB -p 48 -n 2 -P 2>&1 |
logger

This gave me (somewhat imprecise) timestamps for the jack output:

[119172.966606] arch97 fps[177753]: jackd 0.126.0
[119172.966616] arch97 fps[177753]: Copyright 2001-2009 Paul Davis,
Stephane Letz, Jack O'Quinn, Torben Hohn and others.
[119172.966619] arch97 fps[177753]: jackd comes with ABSOLUTELY NO WARRANT=
Y
[119172.966621] arch97 fps[177753]: This is free software, and you are
welcome to redistribute it
[119172.966622] arch97 fps[177753]: under certain conditions; see the
file COPYING for details
[119172.966624] arch97 fps[177753]:
[119172.973620] arch97 fps[177753]: no message buffer overruns
[119172.975503] arch97 fps[177753]: JACK compiled with System V SHM suppor=
t.
[119172.989889] arch97 fps[177753]: loading driver ..
[119172.990672] arch97 fps[177753]: creating alsa driver ...
hw:USB|-|48|2|48000|0|0|nomon|swmeter|-|32bit
[119172.991245] arch97 fps[177753]: configuring for 48000Hz, period =3D 48
frames (1.0 ms), buffer =3D 2 periods
[119172.991249] arch97 fps[177753]: ALSA: final selected sample format
for playback: 32bit integer little-endian
[119172.991252] arch97 fps[177753]: ALSA: use 2 periods for playback
[119174.533438] arch97 fps[177753]: delay of 1003.000 usecs exceeds
estimated spare time of 966.000; restart ...
[119174.533463] arch97 fps[177753]:
[119174.536202] arch97 fps[177753]: delay of 1051.000 usecs exceeds
estimated spare time of 966.000; restart ...
[119174.536222] arch97 fps[177753]:
[119174.539134] arch97 fps[177753]: delay of 1060.000 usecs exceeds
estimated spare time of 966.000; restart ...
[119174.539152] arch97 fps[177753]:
[119174.542173] arch97 fps[177753]: delay of 1049.000 usecs exceeds
estimated spare time of 966.000; restart ...
[119174.542192] arch97 fps[177753]:
[119174.545145] arch97 fps[177753]: delay of 1047.000 usecs exceeds
estimated spare time of 966.000; restart ...
[119174.545164] arch97 fps[177753]:
[119174.548423] arch97 fps[177753]: delay of 993.000 usecs exceeds
estimated spare time of 966.000; restart ...
[119174.548447] arch97 fps[177753]:

which continues for a while until jackd is killed.. The timestamps allow
us to correlate (again, imprecisely) what's in the trace (curl'able link):

https://uni-bielefeld.sciebo.de/s/5gXyqY0cqNrQZdE/download

It is quite peculiar. Jack seems to start up fine and is done
configuring it's "driver" at 119172.991252 and seems to run fine until
119174.533438 which is ca. 1.5 secs later where weird things start to
happen. A delay of 1.003 ms is reported which is just above the 1 ms
period duration of 48 samples @ 48000 Hz sampling rate. So the last
buffer would have been sent off to the soundcard about 1 ms before this
time. Now looking at the trace I noticed a little thing. In the part pf
the trace before the excessive delays start I see things like this:

  irq/125-xhci_hc-169     [003] ..s.3 119173.246016:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
  irq/125-xhci_hc-169     [003] b...3 119173.247898: xhci_handle_event:
EVENT: TRB 000000010a3f14d0 status 'Success' len 0 slot 3 ep 2 type
'Transfer Event' flags e:c

or

  irq/125-xhci_hc-169     [003] ..s.3 119173.248024:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
  irq/125-xhci_hc-169     [003] b...3 119173.248883: xhci_handle_event:
EVENT: TRB 000000010a3f1560 status 'Success' len 0 slot 3 ep 2 type
'Transfer Event' flags e:c

The time between ringing the doorbell and the next xhci_handle_event is
mostly below 2 ms. But lateron I see things like this:

  irq/125-xhci_hc-169     [003] ..s.3 119174.323020:
xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1out
  irq/125-xhci_hc-169     [003] b...3 119174.324897: xhci_handle_event:
EVENT: TRB 000000010a3f1d30 status 'Success' len 0 slot 3 ep 2 type
'Transfer Event' flags e:C

Suddenly this time has jumped to almost 3 ms. I'm still getting my head
around the low level USB stuff but possibly this is a hint?

Kind regards,
FPS

