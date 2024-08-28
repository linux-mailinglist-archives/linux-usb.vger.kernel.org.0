Return-Path: <linux-usb+bounces-14234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8665962937
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 15:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ED371F2228C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 13:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A531A174EDB;
	Wed, 28 Aug 2024 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="T99rmxzs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DA52D600
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852915; cv=none; b=pPf/80o/k3l4+Qxun0i7i/KQoHd3LMMFOSAWzGJMPU5GCQtX1QkLMkasGuELB3Mh2y8FeK4pmfjodBLb4xUbQ11Fazae9eZCXdKHbEFP6z9jMWjKSuwKRsxweg51UjJRHA1NzKERfmebDAVeS5qE0mbjMKTyGqY0eONgdJqbxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852915; c=relaxed/simple;
	bh=CmN8PA+9LhiQAvWFN6jcrXULfShrT+D6fwDuFjEqQ9M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fYOfsTS5QGgrGFanIXaJBvL9PljsaPFPlZAxFja0/fCoGkOncaanyXBcB1EvBMw3daLCfEUHej2/R315A7n9lUd8hpNpiqMZEuEdym0kvI0iTIn9y/HE+nI3GUkolb893znFRW26bmv2oJ9tvSDgek2dPI8PQ2lftLS1SEc2HmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=T99rmxzs; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724852907; x=1725457707; i=mista.tapas@gmx.net;
	bh=CmN8PA+9LhiQAvWFN6jcrXULfShrT+D6fwDuFjEqQ9M=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T99rmxzscVDY9lygvR1a2wAShjGiVXMhkl1g9sAuRtjijivgVMmaHYCnfuJPt4ij
	 pF/MKQQhr5wussmaLRj99D5YdAX/dkoAt6Olc3SEXmwgUoo6JiQsr0H9UjAx+Y2y1
	 MsFXRkW0frwheyyHxyqmfpQyvONu9Qs1TgfBrkAJW0+GwWW/IeI09QPeaJ0dCQRcQ
	 dtWtYHrt1GhPPyCVUd5RGwPSwlYnH5cv27si5D3rSmRLo39hvXI7obqzctYZMr4ma
	 GcSzsDU8QM707bd5wTeIoSAh7Zz/GrxFwv4Al8RmQlqwjB+2n6lfiv9sTfYJ903AM
	 yzmj3wmVUIjI55J3AA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([149.50.50.203]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsYux-1rpgH33DZr-00rDeE; Wed, 28
 Aug 2024 15:48:26 +0200
Date: Wed, 28 Aug 2024 15:48:25 +0200
From: fps <mista.tapas@gmx.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
CC: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/9] Various xhci fixes and improvements
User-Agent: K-9 Mail for Android
In-Reply-To: <20240828152458.06188919@foxbook>
References: <20240827194625.61be5733@foxbook> <60d7c5a2-bbc0-4c08-8973-5b65b9695400@gmx.net> <20240828152458.06188919@foxbook>
Message-ID: <BB1EB264-D2B9-43DC-ABF6-1415A27A0C5A@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j8rIXhQX+h5B5HlHVTCBXqwwids4D7M+MyxvkKoZCb+9a+0giUb
 +UoW7RszOi+VNd5/Ng9vt4ZIrssEafE5qaBByzdGpFpVTl9gqU8VJ0hkQo+1mAFX8KlPEqI
 2CehIjDBP9Lizn9JQPciq6mNRMylqwNLc1BSvo/oN5xdEO9ifADT9S6YfH1x6xEGpEP9jlb
 UurNRxfq3ZJlykvydm7Og==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z0W7r8C0Blg=;+/B/XAqi1v0cGpQ+6f3mSIK8bqi
 wLwH8JFdJsIs6OMKGCkAO4Nh9xMC63FKhgbkjvpGdHumqiYKanPvdKxG38BLa1WDqIzWWosiY
 44rD1If01Zm1oPfDQlHWOMq9RB9lXOIUr34rMW9q2ni5xQDyvVRnf9SIyG3FLGeNrnb0MKW5A
 7dgzxHBUM7dWsBRverBmt+yqiWu0+kWLrAdaqzQUe9QHa+9Yozsi+iV9ywRLYODOoNmc6Bd99
 DDBypY3T13V6blWoCkTaT89HwBMQQ3nXk9f2KtDNefV6c32CgomH42ttLIdJquAXGPaAPNZ7R
 EYKnV94IIaDsO8jLtE14ojsgVp8TvpQ0saCc6qdkdMIOKvhSPacrkTEwjUl57ud4j6YV26SSO
 qnL1R5gC8Zx+6Gq46d/bRG1vjYPYHguvqJ1y0TqCQ4TSSc1UGXUMLyOdw02USq5RyMqAs4YxI
 V0zHY+CF3dXDxXudJ9aLvkiYU5b9DVuG123IQ7650akEhKvoRdznJMHIbG26XTB2UvtiEs6Zy
 cecBiV/C+BDHCv7eU4XOt/lYihs/kx7Ve5bDPY/nSEUPex4vh4r6H7rqakXLjp6ZWKNyCOQOi
 VA2kIw2q3YaE6MvwHUZUP4rMwfYHDi2Cd716g72WdahPaIXTlMNpleDRfRGG8aaLae+Rz8/Ic
 RzWkv7tEh1/KW9uDB9lhvH04aiugmoAiNKe5td0yRkc5qHbbvmLq6e3gso/XbRhGgEirF+RMG
 aHE2eRs2BUrjnVm9UUDeUlmnxw5OhLpeGvKMMGPwzTeESec1UBN3nBXteYGHANht8sY6BI2H6
 f5+ZBMIiuw0d3OkGTHFu1TeA==

On August 28, 2024 3:24:58 PM GMT+02:00, "Micha=C5=82 Pecio" <michal=2Epeci=
o@gmail=2Ecom> wrote:
>> Are you sure these are against 6=2E11-rc5? Or did I screw up on my side=
?
>Absolutely for 6=2E11-rc5 (but -rc4 works too and -rc6 likely will)=2E
>
>Please try again without --dry-run, some of them will only apply on top
>of earlier ones because they touch the same lines=2E If that doesn't work
>then I may have screwed up mailing them=2E

Oh, of course! My bad=2E Sorry for the noise!


>
>BTW, #3 is logically dependent on #2, but the others could be reordered
>at will IIRC=2E
>
>As for your audio case, #4 is probably the only potentially interesting
>one, but it didn't help on my sluggish ASMedia host=2E It should, however=
,=20
>at least eliminate the "WARN Event TRB with no TDs queued" on USB 3=2E1
>and newer hosts=2E
>
>But the root cause of those audio issues is likely elsewhere=2E

Yeah, just giving it a shot :)

Kind regards,
FPS


