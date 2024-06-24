Return-Path: <linux-usb+bounces-11601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4C9154F3
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 19:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F13FB24AF5
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 17:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9FA19E839;
	Mon, 24 Jun 2024 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="aieM7N45"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7513D539
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719248545; cv=none; b=oxnaZzAOOzUFx9l4v9MLdgmz7B9mUyni4Sodf06W6lk3et8E/zGdEQT9Pm8eN3HMrgunSQY6AMjFlaC9g7XCTBc9Zvj2ErfBPhpUqOMYvY+UFXYw2DF+6Rq5ldNBbOukp+cCXI4FfXXikqiibyzzsRGOQwYRsrxHs+ncRKRTF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719248545; c=relaxed/simple;
	bh=qOE56w0ktJJd9akk7x9QFeWDNrCx33c/tpi1K5dettI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mJYKA8sZ7McCsumFsb61yylBQYnWX+nl2pPt6KkL6sgOywabeCVL7F6RhIZSYavC0WgCpPfImY2in230ueaDByrixhFMfjmDM6VGDzzeskBwCpcBA6WEhwme4UPnjFkqMzbMjc2DbOGn0PrSteU9KPiI6uqYqCheMai9mwkiJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=aieM7N45; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719248523; x=1719853323; i=wahrenst@gmx.net;
	bh=qOE56w0ktJJd9akk7x9QFeWDNrCx33c/tpi1K5dettI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aieM7N45SG4j2wJp8qQ0vkUp7ju+mEcESJiSvL/Qi/TFdQWCZAyVQ5gj1LvaICb1
	 V4I74pF1PXV3jtyn/8Iaccq9h+cnqdL7mDGxXv6RQyt1GAjRXaNQJEI1XHT7l2xJM
	 8eD2d1Sa3t/5e0EGjPlKfe7BWbp39bc07PdfEpCe7hzvYvG2YtXi4j99driGeE/TU
	 Jf5n3N500hcJ8NdIKC5ydPMePqeVhsQQaoe7VK2vZDlK6e1xTeAugJb/5qTZMZPaa
	 CxS8KHOVCxmRRGg8KLNSjViqgGWoopdIF/w2BUkkFJAFbOXTQeb6pNM7E/p7RByYx
	 gIVFFu9N42OSTe6pkg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Msq6M-1sb84J1Oh6-014n1e; Mon, 24
 Jun 2024 19:02:03 +0200
Message-ID: <3fd0c2fb-4752-45b3-94eb-42352703e1fd@gmx.net>
Date: Mon, 24 Jun 2024 19:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dwc2: irq 66: nobody cared triggered on resume
From: Stefan Wahren <wahrenst@gmx.net>
To: Lukas Wunner <lukas@wunner.de>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Zyngier <maz@kernel.org>
References: <2bcf7fac-8e8f-4d7a-a837-08805a0076e3@gmx.net>
 <ZnccVLINb_xQcmZG@wunner.de> <eb4a0b47-b382-4ca9-8008-94feb1a34c03@gmx.net>
Content-Language: en-US
In-Reply-To: <eb4a0b47-b382-4ca9-8008-94feb1a34c03@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CCpXIav8XGdBBv7GqvLBNq4Tv2xl2XffNnzZ8LT9zWFijYP26Te
 8kZCJ/wwv3AYOkr8GHy+xNoWDun2YbmdRxLx7egpWRUoziB3s/SiAK1tEFrARBvHzIghBRP
 Q5J8E0dtIZ6Xtf3yMI/hGfRqq+079l2Kf6gQ+L8+GA5oTRyW9QACbZxVuT+eQMJESFJ8Cmj
 pevrLJY4g9kPCNCflJnzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B9irqgBdb8Y=;8TxSaOGZXdglIlDb/kpsT/AN/zZ
 h8frn1B8kJFeVP///uGFRu54h++I25+16V4aUg+J6z5MqQY1IuPW7HnhAGQk9tTiuCMcKr6Zg
 ZKeHdK9vFrrZ780NwRmoBzRgT4gxR09Yq9GUf2LH+ItwZ3ZUkL8ac+s5NnRjFrp2jmgfExgp5
 sdFtpWknYeYAwvmJO5Cyktv6PL6Q9mNnns1hLBzWmUFcNVzheSuAO7tL9y+jRUY3TWQBBc0uJ
 zi7zxh5NlgWGyHj4kdWNkeuxNeMmOrLSDriqfapzj3Sf39vpO5pE2h7PQ4vpOL7kPkVC8CseO
 4nF2W9HgVlE/pIc+AbSP+eq/UvKCGD44Nf4MhTcDf84Rvlm8hg6DR80SJNLD01XGleoF+gKpJ
 dzWhnwrsKwU0t3MdFw65G+a4L5kHSdbIHR79tfXEstvzVIwXyfgUiJcrvxVZqXp3a6P4DTWj8
 taA2le4zIWuXz0+e1sghGhSguRAOGPT6Prt50zLBf0zeXiSiym8OBG+K6r8NmwmNDCWmRudPv
 d0LM+ScfuQ2nlaKQ4TaHGZ4VvJ5YwxQQy9owy6iya4IC18GBRXelmEWrBnXHUixKQ2EQsDmlk
 YM2WLwdieQCevqlz1XGfwL0IN640PDdRBfk53oEs+cdJyKR8CTmfAEH1N37BfMq/OGik39tJQ
 wZ2TZzM9ia1mjDFJYMDGq7OQQvKKcaJfxxf6SHc34MT8gBNqtNUQ0iV+XEnLy/BOrnO00zFeA
 EnoYFK2irTvsmEFLBY2x3uwqtcH0EF2YtyHzKUuZKIE4G+yUuSxmtbg4vOTmBu+upDmQqBi9M
 WMgRFx+MJzlQ8B8mU8DIx85oF/X/WUA9wjRj5XqjuJmFo=

Hi,

Am 23.06.24 um 15:27 schrieb Stefan Wahren:
> Hello Lukas,
>
> Am 22.06.24 um 20:47 schrieb Lukas Wunner:
>> On Sat, Jun 22, 2024 at 02:23:33PM +0200, Stefan Wahren wrote:
>>> i currently experiment with suspend to idle on the Raspberry Pi 3 A+.
>>> Supend & resume works expected as long as no USB device is connected t=
o
>>> the board. If i connect a USB hub to the Pi, the resume phase is
>>> significantly delayed and the kernel disabled IRQ 66 which belongs
>>> to DWC2.
>> [...]
>>> [ 1131.109996] PM: noirq resume of devices complete after 1.273 msecs
>>> [ 1131.111208] PM: early resume of devices complete after 1.051 msecs
>>> [ 1131.230277] brcmfmac: brcmf_fw_alloc_request: using
>>> brcm/brcmfmac43455-sdio for chip BCM4345/6
>>> [ 1131.458687] irq 66: nobody cared (try booting with the "irqpoll"
>>> option)
>>> [ 1131.458714] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W
>>> 6.10.0-rc3-g7fd4227d1bd5-dirty #49
>>> [ 1131.458734] Hardware name: BCM2835
>>> [ 1131.458744] Call trace:
>> [...]
>>> [ 1131.458877] note_interrupt from handle_irq_event+0x88/0x8c
>>> [ 1131.458900] handle_irq_event from handle_level_irq+0xb4/0x1ac
>>> [ 1131.458923] handle_level_irq from
>>> generic_handle_domain_irq+0x24/0x34
>>> [ 1131.458957] generic_handle_domain_irq from
>>> bcm2836_chained_handle_irq+0x24/0x28
>>> [ 1131.458992] bcm2836_chained_handle_irq from
>>> generic_handle_domain_irq+0x24/0x34
>>> [ 1131.459024] generic_handle_domain_irq from
>>> generic_handle_arch_irq+0x34/0x44
>>> [ 1131.459056] generic_handle_arch_irq from __irq_svc+0x88/0xb0
>>> [ 1131.459079] Exception stack(0xc1b01f20 to 0xc1b01f68)
>>> [ 1131.459142] __irq_svc from default_idle_call+0x1c/0xb0
>>> [ 1131.459167] default_idle_call from do_idle+0x21c/0x284
>>> [ 1131.459202] do_idle from cpu_startup_entry+0x28/0x2c
>>> [ 1131.459239] cpu_startup_entry from kernel_init+0x0/0x12c
>>> [ 1131.459271] handlers:
>>> [ 1131.459279] [<f539e0f4>] dwc2_handle_common_intr
>>> [ 1131.459308] [<75cd278b>] usb_hcd_irq
>>> [ 1131.459329] Disabling IRQ #66
>> [...]
>>> An ideas what causing this issue?
>> Interrupts are re-enabled after the resume_noirq phase.=C2=A0 Looks lik=
e
>> the chip signals an interrupt right afterwards but the two hardirq
>> handlers do not feel responsible.
>>
>> The only option might be to add a few printk() in
>> dwc2_handle_common_intr(),
>> usb_hcd_irq() and dwc2_handle_hcd_intr() (called from usb_hcd_irq())
>> to see why they're all returning IRQ_NONE without clearing the source
>> of the interrupt.=C2=A0 The chip just keeps signaling interrupts becaus=
e
>> the driver doesn't handle them, hence the IRQ storm which the IRQ core
>> eventually stops by outright disabling the interrupt.
> thanks for your suggestion. Unfortunately placing printk in those busy
> interrupt handler is futile, so i switched to debugfs. This issue
> would be much easier in case the interrupt wouldn't be shared. But
> first let me share some outputs before i start to extend debugfs further=
:
>
> 1. No hub connected to Rpi 3 A+
>
> root@raspberrypi:/sys/kernel/debug/usb/3f980000.usb# cat state
> DCFG=3D0x00000000, DCTL=3D0x00000000, DSTS=3D0x0007ff02
> DIEPMSK=3D0x00000000, DOEPMASK=3D0x00000000
> GINTMSK=3D0xf3000806, GINTSTS=3D0x04000023
> DAINTMSK=3D0x00000000, DAINT=3D0x00000000
> GNPTXSTS=3D0x00080100, GRXSTSR=3D3f83bbfe
>
> 2. Hub connected before suspend / irq issue
>
> DCFG=3D0x00000000, DCTL=3D0x00000000, DSTS=3D0x0007a202
> DIEPMSK=3D0x00000000, DOEPMASK=3D0x00000000
> GINTMSK=3D0xf300080e, GINTSTS=3D0x04000023
> DAINTMSK=3D0x00000000, DAINT=3D0x00000000
> GNPTXSTS=3D0x08080100, GRXSTSR=3D789a460a
>
> 3. Hub connected after suspend / irq issue
>
> DCFG=3D0x00000000, DCTL=3D0x00000000, DSTS=3D0x0007ff02
> DIEPMSK=3D0x00000000, DOEPMASK=3D0x00000000
> GINTMSK=3D0xf1000806, GINTSTS=3D0x0500002b
> DAINTMSK=3D0x000000ff, DAINT=3D0x00000000
> GNPTXSTS=3D0x29080100, GRXSTSR=3Dbefdf595
>
> Based on my limited knowledge and observations the issue seems related
> to GINTMSK/GINTSTS and a outstanding GINTSTS_PRTINT.
i narrowed this a little bit further. At least i know the reason for the
"nobody cared". It's clear that the issue is triggered by
GINTSTS_PRTINT. The DWC2 controller is in host mode so
dwc2_handle_common_intr() ignores the interrupt and returns IRQ_NONE.
But usb_hcd_irq() also cannot handle it because HCD_FLAG_HW_ACCESSIBLE
is still clear, so the handler also returns IRQ_NONE :-(

Is disabling the IRQ via the upper layers an expected behavior instead
of letting the DWC2 controller driver resolve the situation?

But back to the root cause. I followed the suspend/resume path, why the
HCD_FLAG_HW_ACCESSIBLE is not cleared.

Suspend path:

The power down is DWC2_POWER_DOWN_PARAM_NONE so the
HCD_FLAG_HW_ACCESSIBLE is cleared (
https://elixir.bootlin.com/linux/v6.10-rc3/source/drivers/usb/dwc2/hcd.c#L=
4385
).

Resume path:

During resume the HPRT0_CONNSTS flag is set, so the
HCD_FLAG_HW_ACCESSIBLE is not set (
https://elixir.bootlin.com/linux/v6.10-rc3/source/drivers/usb/dwc2/hcd.c#L=
4435
).

Is the reason for this behavior the lack of clock gating support on
BCM283x or is it a driver bug?

How can i figure out clock gating is supported?

Regards

>
> Regards


