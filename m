Return-Path: <linux-usb+bounces-14049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612095E285
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 09:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30A43282334
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 07:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3111161FC4;
	Sun, 25 Aug 2024 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="ZutMv8zi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D7A5F
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724571974; cv=none; b=ffKYTyXFhmg93AqS0f5n9Qf2cHTj9yRJJi42CezmTnJ92m8GMaBqjc4E3yXUkG+AFTByB8puBi/jVmCEymJ3Edv3nBa7/9dW05K7Gl+NhHKWuJ4TAB8IIYsISpGzjTS9Y6qZi3mrjF5EgWj+NymRv4GabMe9jtIM1SnYeBmXuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724571974; c=relaxed/simple;
	bh=N/qHwuO2IDhX7PECaW27CEHxj+72ze1dk4PTH0kK80Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bHWEcHwKxnZR0lmUBPr7owjG2y7C8xI+T4D31GU0RKhAa0fxHwftOv3I3Hj3qXiVVzSN13eGQcLg1NyLoLHCXxbqws5FyMK9r5a3Vkb6hmCVphOi4WY4NzlgPVUqeenVG8Eav4APYBAx7i8GdMl/wvpgZP5J0xctfj6Te9rULJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=ZutMv8zi; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724571964; x=1725176764; i=mista.tapas@gmx.net;
	bh=N/qHwuO2IDhX7PECaW27CEHxj+72ze1dk4PTH0kK80Y=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZutMv8zi6waGK9DC+MuVvcBtRADC27pNdIGMwripWDS4gJkYWkX3x/Sv+CFA+ktu
	 jEnGquj8f5KUG++QVn2KJ7c+Ys92b+lmnZ3a6Qdz/ybVPkjdAjM3PjAAiwCBLUWQu
	 5EElQeF5ctWjS9RsL4OgGMg+GL1MnENPx9hT32LnS/b3hKS2K6Cx5JRq/hf9aiqLg
	 BvQEnPnMCh0eFjaZjJcD3O3geiECOcf1NXJ/jG8VijkdLCaIABDM/UP2yz63bdjBH
	 KTpVSFZ932BabHDmK5RXklP5GCpfGJTlKJVtYtITg9JhwyQ/Sg1NXSVRFiuMNF/Wa
	 hxbsEDSnOgJqsGoN2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([149.50.51.250]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqs0R-1sMFRt2XoX-00ka8e; Sun, 25
 Aug 2024 09:46:04 +0200
Date: Sun, 25 Aug 2024 09:46:04 +0200
From: fps <mista.tapas@gmx.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
User-Agent: K-9 Mail for Android
In-Reply-To: <20240825065831.0eaba5b2@foxbook>
References: <20240820130158.339b4d87@foxbook> <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net> <20240821150233.4f8f66ef@foxbook> <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com> <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net> <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net> <20240825065831.0eaba5b2@foxbook>
Message-ID: <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:udo8SAnPHHOY76l8Ll7IBIK5izLWNzgi7PSmGJQuVPaYK1iYB58
 0M7dnkK8ivzcrBzEYcZqzZFXZG26ts2iJU/R299iOg6Y0JJj2bk+I5DZkSWNLBzqySCHRFD
 kp8KSSoMhoWPd74kgO3VZRtnPKR85EclEpRRp8nK5Hia3P7VcSacwjDR52cPL6WykOyILec
 Ktr54WrrJ6/T+aLydSuig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v57vRfgVIdc=;CXj/9Tj39rL/CT8hWhkAD6GMFPu
 bIFg8NqMbfhh2IrDNLIvVkrXdl03fBoLDj8f7ab3J/79OB/N/2rjA6tg9+Me+l7KmzwTKfzSU
 1CNSeLmVHjBE1cjB89K2xXK6XiRUBYQlVD3lKnvO6ZNVykvsJfpqMUTAABGLQH+WrJ8gg7NtS
 4sCqGfOrafs1EYYAyK4/qsH/Vx89+J1GozM0XHWIeCHeZI0bPAKR3YAxXjTDHoDcBMh53VHe4
 49dkcQ+yMMbdwZS5cs/HrL6/aDJ2w2oknGF/5Y8SHYr6VitMTMBENvfXXckDVsQXA/Wa9Y16f
 XB5FroeHGog3sRKQ3yaf6EbbwgoG3k8suqoLZXw9hDLX6SjAUriJGjhl4NgKe8DUmUkQNSEYR
 c+62ZqUl+hr6oY3NnzLwmuEaZKiKXCI328qnvLA7qidZM85cpc2A89GMs+SfNrMjgoUd7Hrme
 /J/7L3Z4AXoKCvRvNueCN2lPTI+Tzl9ACDP6v/IOQxravM6dnOFLVIstxTqzpX15DhEnO9QVq
 og6GjR8WjfBxXNj0UUgxWwX/v7llRxMLEPxrnuRS/WVGTobNbu5VYxDseh/zA0Tc+eTJ2HwNR
 3dci6QBjDl0iNAIsM0rIfbBZQL157uVLPcifKajZRe5l2DzD315KvwQPlVDXQG4UYeNDdWTpn
 uIQarhqQaJTpaMR0aLJTezeLgEvLYdNs93dnc8QZe+cu3hRW+1SJ92G4OGLSnAlBA884ASDwW
 fj3kucWucoO3Nu/y9uAPID5luNwa9ssB3R8+JPkvGJx4ljAgmG/92QCxOKukdeM3SEjLDc6Gh
 Ie4GgM6pD9pyz8M9BI/fB5tA==

On August 25, 2024 6:58:31 AM GMT+02:00, "Micha=C5=82 Pecio" <michal=2Epeci=
o@gmail=2Ecom> wrote:
>I believe what happens is that in full duplex, either by request from
>Jack or on its own, snd-usb-audio attempts to synchronize the playback
>and recording streams by scheduling packets to move in specific USB
>(micro)frames=2E

Yes, at least in libasound2 there is a call snd_pcm_link

<https://www=2Ealsa-project=2Eorg/alsa-doc/alsa-lib/group___p_c_m=2Ehtml#g=
ac6c33091b049985baa6466e8fe93917e>

which jack uses in the full duplex case:

<https://github=2Ecom/jackaudio/jack1/blob/ab2e7363cacd0bf4b961c0466c13b0b=
4c1086ed9/drivers/alsa/alsa_driver=2Ec#L2431>

I know too little about alsa internals and USB to follow through the libas=
ound2 > snd_usb_audio > usb class driver > usb core > xhci chain to grasp t=
he specific way this is achieved though :(=20

Bugs could be lurking everywhere ;)

>With playback only, the queued packets are only marked "ASAP" and the
>hardware can cheat by delaying them to the next frame if either:
>- it fails to do the transfer on time for internal reasons
>- we fail to queue the transfer before its due time
>
>See discussion in xHCI spec 4=2E10=2E3=2E1, 4=2E10=2E3=2E2=2E

Thanks for the pointer=2E

>Regarding capture, snd-usb-audio seems to always queue about 10 packets
>or so=2E Latency depends only on the hardware returning them quickly and
>no delays in the IRO-drivers-application pipeline=2E There is almost zero
>risk that the URBs won't be resubmitted on time and the hardware will
>face either an empty queue or an already stale packet=2E
>
>That being said, I'm seeing Missed Service Errors on the recording side,
>so it's possible that in my case the ASmedia controller is to blame=2E=2E=
=2E

I will try and do a little more "comparative tracing" for the capture/play=
back/full duplex cases on 1=2E the intel xhci and 2=2E the renesas xhci whi=
ch seems to work perfectly=2E

Kind regards,
FPS


