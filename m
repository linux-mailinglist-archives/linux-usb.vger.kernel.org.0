Return-Path: <linux-usb+bounces-13955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C2995CBA4
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 13:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B366EB25D2A
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 11:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BF018757C;
	Fri, 23 Aug 2024 11:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="PvwISnk9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20A818754D
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413407; cv=none; b=ACTSFF+uNSTSsV3kd6PppgfzlCPzHqyy8CqJC/sG09XwEI/JtXC6PODlfqLDgvm5zGBRttT547BwEHa6v6OvOe0LDVdDviQFIPlKGmTIeVNftNRwZysNSH39VR8yDw6+wXoJDWoGR4722Kc0xFb1Pe10ybv6PGXCPH7mznVOtpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413407; c=relaxed/simple;
	bh=JRjW73buS6I8mlRS6XSLKSUNp6MxbDavcueV3hIgDhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nccruvWIyCx86YtwCDAgICatzhXzXqJv6I2LGhd54KcBxWd0CifGxr6IUxsbib4Rk7/AitjVgdgW77NYbtq9eEC2l4Ta/6Zj22pILZGdcatANzIZK3VAADQ6IhwigvLd5H6N25tr1qs5Vwe3T41x4gASB3xwmk6EtUzEXQ0nWA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=PvwISnk9; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724413397; x=1725018197; i=mista.tapas@gmx.net;
	bh=JRjW73buS6I8mlRS6XSLKSUNp6MxbDavcueV3hIgDhk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PvwISnk9FmY7s+q6cOOs0UvonV3D2aRCoQIF/SWVCwDFiLOdJmTHVqYqRgknO+Fm
	 ePtq2EBPHaKzJj45bMoieFgvXP2XEZ+49r9rRwJCrFVTz/KUzrMboOqiBztlvutWN
	 UO38REcdTnpNtecyIMA0cCaF10p1RDmBxYHMBiYITkC2SgEpioWja/ojlwCgVAZp2
	 1+F1iqM6JF8ke6Rqth92yXDCO/M3D+W86okw1L+mvLCPeKNkwPZzTvFxMFdMB8siF
	 A3P5MqjTyWSvVih5LlTx145i0qGOadrHdaFaWCmT31XayqvrESene3aquRzMaKRu+
	 qU36+4HWwpYK2E9uBQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([149.50.51.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1s88DK0pJf-00eI05; Fri, 23
 Aug 2024 13:43:17 +0200
Message-ID: <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
Date: Fri, 23 Aug 2024 13:43:15 +0200
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
Content-Language: en-US
From: FPS <mista.tapas@gmx.net>
In-Reply-To: <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lbGSWjBIbEIS/Jld/ox3bDJpK0m0u1x1g2NSAi10R491r/lWAFh
 r+U6LmGiH6aN+xIDTsaF0jRXDs9uO0mP0pThYfrb/OJ5pv/n0rUxrtJJkzNCPKNXGpMe6Fz
 BhOeckWgOON79q1rb1HiMdPP7mft5KVv0skVM1q3QgFvTIzSl/xQ/KKFRNp8qn1nDIElc7L
 Mk+NgfDC7S/dvTWxKqLsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5f8p4fsOKLo=;+fafpIOOlqCZxB/nQXT8zOP41aQ
 JTG1X2KQEMTs48roRZPX/4WVwvBFoPad3Q5epNtBTh8bqla+vpMpPzbKgQECPMAz7UcmWJaG1
 mRfMXYiB9J7D8lRdiFEqkfKMYyeGE4YrSHSNBSw8YVRRi7CR7k9wE+eG22hEn+HViGRRCuTPn
 d+kt1wWBt56BkqeVz/Ch7u6eqUQiJm61CL6xOhWTF1qXfONAkyBLe342PdlF2lLTcPy/FYhe7
 419FDGhKWNF8EUD/3PzxSP8SHg9lSDRbd1mgkCAbt4KZFt13IxWz43HXs6tcpa6LSsIrM9c5w
 vQ+R3tE8FMM7mCpnOm1an7RtshyKhsgGgB+Mx79sKY3mMlDBuu+jv7VwbiMpnHDVA2+swiwK3
 cHlnLZSxk3u8El0g0nfZ8OG/ZfL4c0IxRSgxuUl+JCEq+XYe/xV/Pr8JJrIisHm5v1LBWG2Ci
 HsylRsNz59uXD6fIbyNazwfkUFYXVyr/mj/n+8RU9svUMtzBZi0DIIDGfHZzXAPYZR3OqEeEA
 dZ1mMGEH/XPIrb5oobckcukZyBlhraC6WWTx6bT3JrNH3DC29Jkp3urPFyH4Qx1LBiIRzcYMF
 6CzDPjp+1TNnVcn6yhGwr4SqK3WHXXvCH3H0dc4ckA+ga8yzHUMnnwc5RLIJ0zLh7LHCie5CW
 xhYBte68CRcEDD6ffX1Ac/i14rd/GaJa7+9UCv7XkuzNPzrcuYtGnH8Brm/LygH8JiUrW9WAe
 PDV0RZLf2ph3MRVVq25xMy+HjqUsbWBJhKUJol4jWTyqKDbP+aDFSC8pXKRYeM20sZd5igyBR
 lB4eIoXg+ZqTC9pZsh2BMbGw==

On Wed, Aug 21, 2024 at 05:15:00PM +0300, Mathias Nyman wrote:
 > My best guess is that these are caused by a full xhci event ring.
 >
 > If event ring is full it would stop transfer rings, and we would see
 > missed service events. This matches the logs.
 >
 > The events get handled and cleared in the interrupt handler, but
 > not every event generates an interrupt. for isoc transfers we
intentionally
 > block a lot of event triggered interrupts.

This has piqued my interest. Can you point me to the code in the kernel
source where this filtering happens?

 > The event ring size has doubled since 6.6.45 kernel, using a newer kern=
el
 > could help. This changed in 6.7 kernel:
 > 28084d3fcc3c ("xhci: Use more than one Event Ring segment")

I tried with a 6.10.6 kernel from archlinux and the symptoms didnt'
change. Right now I'm running 6.7.0.6.realtime1-7-rt from archlinux and
the symptoms are also the same.

 > If possible I'd like to see xhci traces of this issue.

Here is a curl'able trace (from running timeout -s KILL 0.1 jackd -R -P
70 -d alsa -d hw:USB -p 48 -n 2 (thanks to Michal for the suggestion)):

https://uni-bielefeld.sciebo.de/s/1ixBodEpmSg8M2k/download

Or should I include it inline (it's ca. 1M.)

Kind regards,
FPS



