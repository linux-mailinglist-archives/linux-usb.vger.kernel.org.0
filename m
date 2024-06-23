Return-Path: <linux-usb+bounces-11568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EDF913AD2
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jun 2024 15:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFFF21F2188B
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jun 2024 13:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC6518132C;
	Sun, 23 Jun 2024 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PbKY8Dfs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B835D268
	for <linux-usb@vger.kernel.org>; Sun, 23 Jun 2024 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719149255; cv=none; b=BxvSG/eu5FcocTh/75YsTsR/42ZNPQC24joSjJ7yAP+9wFHmn4WUj+qsH8ZTSrimEtZ1GGqfLSBfMlLuQGwqBqspYdfPy74YgevDRo9kpoETfIsqvZh+MiRH0uhQUYbIaxDgrIIYhlSM0MqtkFd7/7xLKUFDEASU9UiRYi5Ke5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719149255; c=relaxed/simple;
	bh=XZnYZiD7wzWyZWTLnIj9lV6GcB8MYQcMis/umczXQwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H35GQsNrm6TONV9ujcMrXuVcvE3rp4FGhS9fVo6PTTSTyQ5vAg11P1iAdmABLFDytVidoY4ERv3IxCZo9UYJ612Fxb+9t2+sxlF5vyPkgWdpsvA6LiCqVo1XYDrVHJ8P4nmFxJ1n/15Ozj8GmyvKEaMq9dlA8PasKm+XUP4hqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=PbKY8Dfs; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719149225; x=1719754025; i=wahrenst@gmx.net;
	bh=8SQQswEKYBD31C3P6GFs7QXvRbVnU438NN6jkdWJfaE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PbKY8DfsEUWN4VnoAec8uZcZoEwyZ7JgPoCnnFXZ2P1rMq6w2vdP4F256d8RRY/+
	 QfWLl25lqL/AlD2bVME8MIFwJAYoyjmDIAnTZA+TKo/lAD3NbBzFbcBjYTKzfan+n
	 up1XGljVqLlkdRjfO+QlL3dq+dUbQM1g5PMGFYl9ixzfBb1iJYXBzZ/lMArAnXnmD
	 0v7aCAuavAFkjjDppTzeqhW0KkBgPuLaxU9eOQte8GtcTmWkwHnlEURa54lxFGwm3
	 ZEksgu2OcngsDF/BVzbHEqv36nuaRCc6tsveAyMeHHpMoiJigcm0KeHd9akHf6ie/
	 +2cku1lFBKXHCbdgvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1s47Vg0MKH-00KULo; Sun, 23
 Jun 2024 15:27:05 +0200
Message-ID: <eb4a0b47-b382-4ca9-8008-94feb1a34c03@gmx.net>
Date: Sun, 23 Jun 2024 15:27:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dwc2: irq 66: nobody cared triggered on resume
To: Lukas Wunner <lukas@wunner.de>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Zyngier <maz@kernel.org>
References: <2bcf7fac-8e8f-4d7a-a837-08805a0076e3@gmx.net>
 <ZnccVLINb_xQcmZG@wunner.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZnccVLINb_xQcmZG@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bd9+/wHAU0uQ9P+3mYih3Eb1TH6A0pql19YjZNb30557tffkyAs
 TmyUHY4QIb2zMf0rSxL/hoNAJygGdcqYvF7ISXiSJAGABBpU+rldMJpFurnpZV7znKO3PGN
 f8ZDsxT52USyqBkNWc0iBxk1T+eXVllXyaPIa+3cIXeHQK0MZ28oCUA+lMl8FZC9dsLBJXg
 sI+hnp1t2vOJ8+tgGprUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3C764Lyrsyw=;pCKo+pXxkBXmMw7bIKbDUPlDPuT
 LDVEk5BkZM6V1a3iouiruHZPSZVTm8/VbGM78U0Y3od0jJInk/sMD1nZuPxcAXAEGpGCxB74B
 Na2b20yjm3Gia2c3m+rNooJK8f2jliOXzCsHUPsXJ8axM5PwN6dyN0bRGgsNeJsx2mkjmug7l
 jfUPgEpFwtvqoAmq8WpBzoIgygUWj8aPiAnxqnEyxVqZQTErIwNCbwbzVNA8gD+jqXc49zycx
 KS6ELkYbpjOT6emW1K7V2AAMhq5+Z0Vo8DXXpy5zjvTsRjD3XYjfgNw87JisRvveaulO99ySE
 Ni9cQ/0WmKynwl2eOMPMA9dwZY+pURSltGVnGEMI18/sFnUg781VMKKY+MOHShpJb6UqlBntn
 w2JbekRSg1JT/yAd/jIDyxf7YF+3EMZmxT1vlFvKD3l9aTzDyuvLCdXmV0g8OCx4EKVsfktCl
 NeJjTjJDw+uIL208T5OQxdINF8GHvNfrs+zWrhT6lyoiNIyU03vkpkw7xv+TE6yBViOsYqbky
 qBR81WSdoFq5/FV5whKqsoMTmQUctMM7URgZgZCPuE/dJflDZTTNQKDRoUzowC2TtY2PxtbOz
 3Jj21Z4iL0YGkSTrBLODKuT+PLCyF2QhTswl/kPKMGjEoZ8zH8sNcAua9Wv+gaXPYG0C39Hdt
 8sNEtpz+MFBZgti6ZAtmA+yNpEq6I9y2FP3BnGi2O0dMGjcYFpxAlv8wsWC5x2CsDUeWV6Rw5
 n6mcEnPKZXI1xpEPF2MzW2OpU3qX9qejlZjprWAT6YRicbBBDw2iCK4BzAzicjk63Pkcwk5MU
 2QqxnWHODHOFFLBspQtZTBAf8tE65I7PVhnUYEqgsj7Hk=

Hello Lukas,

Am 22.06.24 um 20:47 schrieb Lukas Wunner:
> On Sat, Jun 22, 2024 at 02:23:33PM +0200, Stefan Wahren wrote:
>> i currently experiment with suspend to idle on the Raspberry Pi 3 A+.
>> Supend & resume works expected as long as no USB device is connected to
>> the board. If i connect a USB hub to the Pi, the resume phase is
>> significantly delayed and the kernel disabled IRQ 66 which belongs to D=
WC2.
> [...]
>> [ 1131.109996] PM: noirq resume of devices complete after 1.273 msecs
>> [ 1131.111208] PM: early resume of devices complete after 1.051 msecs
>> [ 1131.230277] brcmfmac: brcmf_fw_alloc_request: using
>> brcm/brcmfmac43455-sdio for chip BCM4345/6
>> [ 1131.458687] irq 66: nobody cared (try booting with the "irqpoll" opt=
ion)
>> [ 1131.458714] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W 6.10.0-rc3-g7=
fd4227d1bd5-dirty #49
>> [ 1131.458734] Hardware name: BCM2835
>> [ 1131.458744] Call trace:
> [...]
>> [ 1131.458877] note_interrupt from handle_irq_event+0x88/0x8c
>> [ 1131.458900] handle_irq_event from handle_level_irq+0xb4/0x1ac
>> [ 1131.458923] handle_level_irq from generic_handle_domain_irq+0x24/0x3=
4
>> [ 1131.458957] generic_handle_domain_irq from bcm2836_chained_handle_ir=
q+0x24/0x28
>> [ 1131.458992] bcm2836_chained_handle_irq from generic_handle_domain_ir=
q+0x24/0x34
>> [ 1131.459024] generic_handle_domain_irq from generic_handle_arch_irq+0=
x34/0x44
>> [ 1131.459056] generic_handle_arch_irq from __irq_svc+0x88/0xb0
>> [ 1131.459079] Exception stack(0xc1b01f20 to 0xc1b01f68)
>> [ 1131.459142] __irq_svc from default_idle_call+0x1c/0xb0
>> [ 1131.459167] default_idle_call from do_idle+0x21c/0x284
>> [ 1131.459202] do_idle from cpu_startup_entry+0x28/0x2c
>> [ 1131.459239] cpu_startup_entry from kernel_init+0x0/0x12c
>> [ 1131.459271] handlers:
>> [ 1131.459279] [<f539e0f4>] dwc2_handle_common_intr
>> [ 1131.459308] [<75cd278b>] usb_hcd_irq
>> [ 1131.459329] Disabling IRQ #66
> [...]
>> An ideas what causing this issue?
> Interrupts are re-enabled after the resume_noirq phase.  Looks like
> the chip signals an interrupt right afterwards but the two hardirq
> handlers do not feel responsible.
>
> The only option might be to add a few printk() in dwc2_handle_common_int=
r(),
> usb_hcd_irq() and dwc2_handle_hcd_intr() (called from usb_hcd_irq())
> to see why they're all returning IRQ_NONE without clearing the source
> of the interrupt.  The chip just keeps signaling interrupts because
> the driver doesn't handle them, hence the IRQ storm which the IRQ core
> eventually stops by outright disabling the interrupt.
thanks for your suggestion. Unfortunately placing printk in those busy
interrupt handler is futile, so i switched to debugfs. This issue would
be much easier in case the interrupt wouldn't be shared. But first let
me share some outputs before i start to extend debugfs further:

1. No hub connected to Rpi 3 A+

root@raspberrypi:/sys/kernel/debug/usb/3f980000.usb# cat state
DCFG=3D0x00000000, DCTL=3D0x00000000, DSTS=3D0x0007ff02
DIEPMSK=3D0x00000000, DOEPMASK=3D0x00000000
GINTMSK=3D0xf3000806, GINTSTS=3D0x04000023
DAINTMSK=3D0x00000000, DAINT=3D0x00000000
GNPTXSTS=3D0x00080100, GRXSTSR=3D3f83bbfe

2. Hub connected before suspend / irq issue

DCFG=3D0x00000000, DCTL=3D0x00000000, DSTS=3D0x0007a202
DIEPMSK=3D0x00000000, DOEPMASK=3D0x00000000
GINTMSK=3D0xf300080e, GINTSTS=3D0x04000023
DAINTMSK=3D0x00000000, DAINT=3D0x00000000
GNPTXSTS=3D0x08080100, GRXSTSR=3D789a460a

3. Hub connected after suspend / irq issue

DCFG=3D0x00000000, DCTL=3D0x00000000, DSTS=3D0x0007ff02
DIEPMSK=3D0x00000000, DOEPMASK=3D0x00000000
GINTMSK=3D0xf1000806, GINTSTS=3D0x0500002b
DAINTMSK=3D0x000000ff, DAINT=3D0x00000000
GNPTXSTS=3D0x29080100, GRXSTSR=3Dbefdf595

Based on my limited knowledge and observations the issue seems related
to GINTMSK/GINTSTS and a outstanding GINTSTS_PRTINT.

Regards

