Return-Path: <linux-usb+bounces-14222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06004962329
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 11:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84ED81F21581
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 09:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800A015C15D;
	Wed, 28 Aug 2024 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="aHvVvfB4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585015C149
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836544; cv=none; b=OaJQfF4BdixX9/7nE+Htr0UCLrPBtrjLFE9DdD35U0PmCO7m2QCzKxLFUqydrxlbdugiebhFEBULRxmGg81T4SkSsaXqPxi/v+MRawqJLXCPhkpydoBVnxnrNgczf0J5SyHOXecrZbEiIupQZcvyiRKQJoXuGm5kqqlH/0+g9Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836544; c=relaxed/simple;
	bh=HmGZcbIetLy+WYTSVt3zoel+5PKKTXBtdhOpIEfOA8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqNA5BPvaB9S0qZoPO09rbbjQB3JxJ0ELaZ4nKIq15BOAayfD9jKYiGtHVgtWmsRyuHBCUBGLCH5Lnhsk9m6xGA1qAD2LtJcbvRfRho0uQuqgXPTH2VNP8yg0ufu3SyxetAaE4qv42GKmhmRu93IzGyrfbHdKWf4HzckeMFLpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=aHvVvfB4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724836536; x=1725441336; i=mista.tapas@gmx.net;
	bh=4dBwVsz4I/pvMWa1rbdwwXs5ONxZG/nVm156xVBe2Yc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aHvVvfB4b1nWRC15KmaAi2TUPpUWZzgJI4/jehZcGOSyr7dluhgV7qJh1cUf8AHr
	 kso98uDoZnhqg6hBHajI2bElZmAmIOicdauVIDjgy/xyLD/mXAFrSLpOJWToYaFu0
	 A/g6SlxMtlewZy6oVlkQYvBSsoVFRrYx4iFdAUpg+5LMFsyf1J7Mu+5dG12+3m+Tt
	 tctaVOPCX/22IxXnXGGRgA7CFDTxeIxJBCzAV6eTv2UK0MLFGcuVqw03b9Ucsslrc
	 tVCeU/VPqUDHQNW3fE1HToNd6gNqVJ1V7Is6z5FgZIfgM9wizkqkd7h8VZvLFTIme
	 Svn0r7l7DP3XPOJE/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([149.50.50.203]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1sI79R3z7K-00qheN; Wed, 28
 Aug 2024 11:15:36 +0200
Message-ID: <7c55cd6b-83ef-4004-9898-b004fdabb820@gmx.net>
Date: Wed, 28 Aug 2024 11:15:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
 <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
 <301bfda2-72d5-423a-bed7-87ac786dac83@linux.intel.com>
From: FPS <mista.tapas@gmx.net>
Content-Language: en-US
In-Reply-To: <301bfda2-72d5-423a-bed7-87ac786dac83@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7UUOizOw0BJ00kuS3u0H3XqLwhYmByEyQUVPyg87uK6BHSZAvSG
 9kDRPAfsSa7IvlYWc1HS1BbmrCEZHrBBT51H0ggLOiQ0fTAJ7mGIP/3iF63+RxoBEZw274y
 Us/ULFD5e4XeLVxXWBnLJ6Imw0NnQHq3IPUvCoEszdtpbkt0+UWFzmfoSgjjZ6FbkJNhUjJ
 YysxFXZm2GMtfUF6As1Ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UL+moYFaSu0=;rXBrncDQj/vuv/UR+ndOCPbRaI4
 cWFLjRWEsQK2yeJAM/lnQ70Tc+xoQl7icCycKDFn+LgSzQjAvWB3tJqmYUtpQf6B+FLXmoG3X
 8CQLuvm3xe5FryO2KzG6XB5W2H2XlMPy+HCol1pGJVawzfp3fIsckpdLtKnncP0M+8toY4mVb
 r36wo3VL7rFOi0YbuWOAMJghUtXuqMPSY5eOqzfMUdUfQLLDGfWTaKn4t/Ctt6lTa1Dj7tWzV
 8rpa/KFstGOjbbBMN+SfW5WOBZrbHeBBpKu6IsZXxBoyQewRpqZDNdapUhYFfNdP2T9/Zcbb/
 A1domEvnZNyuYphSXiQSKU4pZHtPqSO3iEPmPk0dnkUGB11NvkDMyel2S0XKi+YMkVuCXSF3H
 IWikrasJXGXlo/3ro+aMp27o7TOH3VT4SfeTLNLlCKHVm6CRHt0tbWylUaZvuiNKE1D5KTF+t
 y76FnHn8fuVQtws2Ecmyf43aMAY3GoxcqcslLl/JhGwdGJffMjTyeyt/8BjyM6iKR491HRO2Y
 ELaCuA1uifNOgSISoPrej2uVEmeL8Ieq0ExE8FKbPskVXY15+vSYTMXT4X40q6SbsMEkXiOE5
 9cbVgXg8OxFI3AhfOF0JJD3JoFJdLA2assP7idCKN5tlidzLuQ9dVLbmupEyY/1MwT6bs5m5/
 PyjGVnjfpckz0SMlSYi/P9THYHo1LF7XS3xRCs/2Wrx7mKVk1JwXnJqTz/wx/Vzepe9muPH7r
 47d/BNGMjUxcIdjkfqM2CsergOrXEuGoE4cHxBboYam7ehckjKlCBRE3bTgdmlOtR4vY9HK5V
 omxc8ZHb8x2G2Plqtf2T3KOQ==



On 8/27/24 2:37 PM, Mathias Nyman wrote:
> It's a bit complex, but it shows the missed service events started from
> out transfers.
>
> Quick background, audio class driver queues URBs. One URB containis one =
or several
> TDs (transfer descriptors). One TD is consumed each interval, in this ca=
se each 125us.
> In this case audio driver uses two URBs, usually containing 7 or 8 TDs, =
each transferring
> 48 bytes. TD (Transfer descriptor) equals one TRB (Transfer Block) in th=
is particular case.

Thanks for the explanation!

> USB audio driver queues two URBs:
> =C2=A0 185.943950: xhci_urb_enqueue: ep1out-isoc: urb 000000007faac5c4 p=
ipe 33792 slot 3 length 0/384=C2=A0 8 x 48 bytes 0x10a3f5000 - 0x10a3f5070
> =C2=A0 185.943966: xhci_urb_enqueue: ep1out-isoc: urb 0000000094a36c26 p=
ipe 33792 slot 3 length 0/336=C2=A0 7 x 48 bytes 0x10a3f5080 - 0x10a3f50e0
>
> xHCI gives back URBs once completed. About 1ms apart which is ok.
> Odd that audio driver doesn't queue back the fist URB immediately after =
receiving it, this could cause missed service event.
> =C2=A0 185.946834: xhci_urb_giveback: ep1out-isoc: urb 000000007faac5c4 =
pipe 33792 slot 3 length 384/384
> =C2=A0 185.947705: xhci_urb_giveback: ep1out-isoc: urb 0000000094a36c26 =
pipe 33792 slot 3 length 336/336
>
> Audio driver queues both URBs after it has processed their content.
> very odd that the other URB only contains 1 TD (covering only 125us)
> =C2=A0 185.947732: xhci_urb_enqueue: ep1out-isoc: urb 000000007faac5c4 p=
ipe 33792 slot 3 length 0/48=C2=A0 1 x 48 bytes (0x10a3f50f0)
> =C2=A0 185.947745: xhci_urb_enqueue: ep1out-isoc: urb 0000000094a36c26 p=
ipe 33792 slot 3 length 0/336 7 x 48 bytes (0x10a3f5100 - 10a3f5160)
>
> Audio driver cancels both URBs, Odd, why does it do that?
> =C2=A0 185.949843: xhci_urb_dequeue: ep1out-isoc: urb 000000007faac5c4 p=
ipe 33792 slot 3 length 0/48=C2=A0=C2=A0=C2=A0 CANCEL why?? (0x10a3f50f0)
> =C2=A0 185.949848: xhci_urb_dequeue: ep1out-isoc: urb 0000000094a36c26 p=
ipe 33792 slot 3 length 0/336=C2=A0=C2=A0 CANCEL why?? (0x10a3f5100 - 10a3=
f5160) turned to no-ops, deq at af5100

I looked a bit at the snd_usb_audio driver for places where urb unlinking =
or
killing might happen:

[fps@arch97 usb]$ grep -n usb_kill_urb *.c -R
midi2.c:242:            usb_kill_urb(ep->urbs[i].urb);
midi.c:1496:                            usb_kill_urb(ep->out->urbs[j].urb)=
;
midi.c:1507:                            usb_kill_urb(ep->in->urbs[j]);
midi.c:2364:                            usb_kill_urb(ep->in->urbs[j]);
mixer.c:3647:           usb_kill_urb(mixer->urb);
mixer.c:3649:           usb_kill_urb(mixer->rc_urb);
mixer.c:3658:   usb_kill_urb(mixer->urb);
mixer.c:3659:   usb_kill_urb(mixer->rc_urb);
[fps@arch97 usb]$ grep -n usb_unlink_urb *.c -R
endpoint.c:1053:                                usb_unlink_urb(u);

The only really possibly relevant file here is endpoint.c since we're only
dealing with pcm streams.

endpoint.c:1053 is part of

*
 * Stop active urbs
 *
 * This function moves the EP to STOPPING state if it's being RUNNING.
 */
static int stop_urbs(struct snd_usb_endpoint *ep, bool force, bool keep_pe=
nding)

But none of the call sites for this function look as if they would be call=
ed in
the middle of an active use of the endpoint. Weird.

[...]

> URBs contain 8TDs with 125us interval, and should complete 1ms apart on =
average.
> This won't be true for every URB as sometimes urb giveback might be bloc=
ked for
> a short while, but it should average out. Next URB would then return a b=
it earlier.
>
> In this case it doesn't. URB are permanently delayed.
>
> We use "SIA" (Start Isoc ASAP) flag for Isoc transfers, this allows cont=
roller
> to queue TD to be transferred "as soon as possible" without forcing it t=
o a
> specific microframe.=C2=A0 Could be that this flag in combination with q=
ueueing TDs
> very close to the IST limit causes the delay but not triggering missed s=
ervice
> events, or under/overruns.
>
> Adding more URBs could help, but causes a bit more latency.
>
> Or maybe see if we can get audio driver to use 3 URBs with 6TDs each?

I will play around with the code a little bit. I'll probably only break th=
ings
though :)

Thanks!
FPS

