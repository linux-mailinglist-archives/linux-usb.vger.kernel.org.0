Return-Path: <linux-usb+bounces-14175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747869609D7
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 14:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7454B2287E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 12:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A901A08D6;
	Tue, 27 Aug 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="FvuP805k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844711A01BC
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761121; cv=none; b=oZoqwHsX44daxo6KO0DBN+X8wYEvYBa1xiqUKjrWyQvYqqxrkm1ZPrLKrs5dEuAnVhaIz6WwdOTlBajEEJBDpBOAeaKqk+U9YXcR1dG20ZRiQ6JS0jnoRGZHkhATrgTmFV57+nl5UaQeICT1cUTTG1yX4bkW37QVdIXh6o84q1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761121; c=relaxed/simple;
	bh=GLT69YwDMenIgOOfJZ1U3XCwokTqXmaq9hxtPOQLDeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYUGFpG0BOMCJ8LXu8vy4cJovR7wOsqQ+8s7AG4QVtDm/EIQ28e8PfMFvlz/X/rUBk2AwLJ7WBAT0zTLKLIDpP4kRGRDk/Fy+MvSo9eZd0/ZcSoVnOo09/UyEngz/roioiO/0lENdXk1mi+gkcGkCVy0aNpSV1IE1RRAbobMxsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=FvuP805k; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724761111; x=1725365911; i=mista.tapas@gmx.net;
	bh=GLT69YwDMenIgOOfJZ1U3XCwokTqXmaq9hxtPOQLDeM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FvuP805k64Aaa1RK++DqEd4d8J+1VGL5EyXCGBM9iTHjaE5uM77bWz+gUVA4xLF5
	 TeK+GJYIgEKU9hFm6EipGv9HU0BqnpxqN+zW+QpGhtiSwz8IvkCUxl0n3dDbH3dbL
	 InWZ6cayzR/jYF0dIGey12ui7T6L2o7nvX2sHNcl+oaFLDhEAghNhzNPzfUlmGR8K
	 wk0ZGFFZU5NTgpEjbxNS24HwC74ZoGtxVuxfyLCjWvMmyVeQoTBk4rrzPLgdi9CFG
	 ZnoJnTg1yyMUjUeErFnGm0K3HROsT4yIb5mkRkzh4/c+adtnWQR9c6nbdh7d/5Z6/
	 011nX5ZKeyJ4GtuppQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([94.229.156.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHMP-1sFxGg2Y0n-00nfut; Tue, 27
 Aug 2024 14:18:31 +0200
Message-ID: <4e78b499-c1a5-4ab1-8bb4-26908d2cc75f@gmx.net>
Date: Tue, 27 Aug 2024 14:18:27 +0200
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
 <20240825065831.0eaba5b2@foxbook>
 <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
 <eb8ea495-6854-4e2e-9474-6348a7a0bf69@gmx.net>
 <744a35f4-ff3e-40d1-8f3e-6f3b28eef756@linux.intel.com>
Content-Language: en-US
From: FPS <mista.tapas@gmx.net>
In-Reply-To: <744a35f4-ff3e-40d1-8f3e-6f3b28eef756@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ym804ihqiWFjHR8Jaw9EtCAGMtxaB64y66OCNi7ohvae3V5a8u0
 oOirOgyKISeLQ3yJFU1o6AmZOfu1qqf7m5vQ4rXi/9uP/3t9tGJi51ruZ2yTDPAnIKsqRHU
 uRtYuQ/8nG6hYUpttnWmngUknE2czAJHa+jEglnDFYjMDtxNe9D4BXvLGG6eWDUzMD8b3zp
 BEDSNBeOFSHew70EG65Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gFJTMQO6ikc=;6sdnCqcPfCyznDc+38+wvkZmh6k
 Z+1txd3ApWvgXyyzhr3dPIqfS/zSxirC2Ne4m8oWBT2aZQwSPviaAfIkTYPTX6ETzo7v5IG3W
 7XSmWlENtIBFbJMfkTup5SdQlhRTALneiJG2m9m6HwTZFNfckZsWYkV2MP+2buF6MJ7xQtWWD
 ngEHvGnjqwN6BUIBQ16CN/Lsyu73dZhv4E5x0Zdhev7vL+fze22DX/aLF+0r8kb8AnQZG+LY+
 35EN/4hbxTzFDhDxG/E+4ZK3JktTzr3GOAX0z6aW5Ig2Ho7cdJ2ycJiHzh8gycGcwIYO53FB2
 rzYDyLL5sYPmBMbWsTIZO8arPUtS/+hER4X2acUFlonVGRu604FRsbvf/GUm6exoPs3VvX8wR
 vKpXMm4xfLgbB6PwO2HIH51j3Vd9aL4RqwB3BAASADKFgBgylj3Wyclh7Y+KhG9UgdElCfQ0s
 7eYXr7czy5oGwiMhSL8gi5QliqWNlopDpK2gkKWliaLvPfXLdq3hSVD/zYj0ummCW6WPKwAeB
 Sk/57De9Xs0eCvtmAzI20U1hgGbN3AsRYKvPbSp6+1uu/1SEj193XL53MfL0Ag+P8WwRmoGKN
 2R3kDAP+UQUd8H99Txk7DIUkDIpm+hWIcD1DUWvSJPaoLUMEfNCX6ox/oSgR55/kqCl+pK8T4
 fTw0DoDHP6gvNJDHLofXmvTEPGyw2bDelffWmtkfulTfJl5aUHqINDRmgSu/yV0ftF0t3jWQy
 N4fUceoBcBzrWfz59JXw13bv0eqTyh/bGTmX0s+s9LKVTJ2V/9c5ktZ4p3VJAtKidcdUort9J
 C6HzjGZx7K0OM/gyCP+yO5Fu23ZLOjeXcdITyLQH5aIWQ=



On 8/27/24 1:31 PM, Mathias Nyman wrote:
> Should be harmless, the cycle bit and capital 'C' changes each time the
> ringbuffer wraps around.
> This is how TRB consumers/producers keep track of where we are in the ri=
ng.
>
> segs 1 vs 2 just tells that we have allocated 2 segments for *Intel host
> event ringbuffer while only one for Renesas.

OK, thanks for that explanation. I uploaded the full Intel controller
trace here (curl'able link):

https://uni-bielefeld.sciebo.de/s/0O4XIzW529sKYQM/download

And here is the Renesas trace:

https://uni-bielefeld.sciebo.de/s/jB4qqFL0okPlYwN/download

Another difference which I find maybe more interesting then. If you
scroll down to where the steady state has been reached, e.g. timestamp
119173.008004 for the Intel trace and timestamp 564371.959089 for the
Renesas trace, then there are always 8 xhci_handle_transfer calls for
TDs of size 48 and 8 queue_trb calls between doorbell rings for the
Renesas controller, but for the Intel controller it looks different:
There are also always 8 xhci_queue_trb calls, but either 7 or 9
xhci_handle_transfer calls. This is quite odd, no?

Kind

