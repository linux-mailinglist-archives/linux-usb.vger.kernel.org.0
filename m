Return-Path: <linux-usb+bounces-15657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1BA98EDFF
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 13:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3965DB23BE5
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 11:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E44D152166;
	Thu,  3 Oct 2024 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="DQ8ZXzub"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CFF13D25E
	for <linux-usb@vger.kernel.org>; Thu,  3 Oct 2024 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954536; cv=none; b=dGsieGtQZG3RtvCQDAkgDLjPXApc11l/JJQRKnSXbUnOKzFpuMxcsm0ekK3trdcQrN9XzBvvFaK8xIU6XLIbtWkv7gomfgM9fiWkiHUDYZkbZGm2gvMj2U1am1CAqRiEr5rboTMOpu2HNs6jK+lzeapAwDu5nfU+CHhNHkPnHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954536; c=relaxed/simple;
	bh=xyFRk2u3FB1vanhTrrJPTi7kAt8YUFVYSaoeCZ9Eoyw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=et06f2SUpNJ6h3Fk490Bk2jIrQmEdAXcpiC6Z/82Znmu+yx5lRIECikJHEOzbHWGFfQVEPM3fQDuakrrBOePBgKwZsbbHHQyTXl4iBlX/wCd/hEUBHeIDtpaj6yR1MEWZ+DSPCklfjr/aD6GDQKn8VxJw7Fk8VAOIq33L2vRPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=DQ8ZXzub; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1727954510; x=1728559310; i=wahrenst@gmx.net;
	bh=xyFRk2u3FB1vanhTrrJPTi7kAt8YUFVYSaoeCZ9Eoyw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DQ8ZXzubKetDeWYLkBzBfIzf+wmK4ErsUypfZ0o4jA77oW+zwEg/T/rpA2KYQ3I+
	 n8VB4QxEnWa0cZtuevGFuo4f25wNRSxdZ9sQhI5pO7TjQeI6UFD5V3gxfzgt5kKgJ
	 cEHE509KvLdwWj0kwyZo5O5/z3pMze9ZIeHtAu7U2EHzbk/sD6ZBT9u0ilTrhSYMR
	 sqHQ8Ns+WnAWYV0bo4CBzLlTwzlXZ+IStJ6364I8lLzC0GbcrmT8o+2eBAyJG2F1G
	 iwnz4YupPHPwL/x4R4KDadHR19wReUxi1gdZ76vclr+NVVr1vR+vMhs+x3W8cMLcl
	 Q9eA0MkYwec4tua2qw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O6e-1ssSHY3Jmw-007tNv; Thu, 03
 Oct 2024 13:21:50 +0200
Message-ID: <2c9b6e0c-cb7d-4ab2-9d7a-e2f90e642bd1@gmx.net>
Date: Thu, 3 Oct 2024 13:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dwc2: Raspberry Pi 3 B Plus stuck in lx_state DWC2_L2 since Linux
 6.12-rc1
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Marek <tomas.marek@elrest.cz>, Shawn Shao
 <shawn.shao@jaguarmicro.com>, Douglas Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <a4cb3fe4-3d0f-4bf9-a2b1-7f422ba277c8@gmx.net>
Content-Language: en-US
In-Reply-To: <a4cb3fe4-3d0f-4bf9-a2b1-7f422ba277c8@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IttnAT8gBvwoVXhNN4E0l10SQO8IY6lY/c7bjmI6SyrMnDsd0r1
 kkl2ijp14qj2RZTkD/xW05NABLaiiLXqxhDzVON9hrsqfEKNiYebZyKoO6ed2A74qeEOyYR
 HT10pFlD5xCbfysnLCr/tdVbr+P2B2s0vXO7MPq5nA35qCzQ2sgcV+14UJCXMIvkpBgGjHa
 q8i2ZXnzEdlLaRCr5rAfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IsrkLFNdlSc=;PJt6/FGn5C2S/ALolIG3oNdBu+a
 viv5sO2GQkhnPFzMFbYnWRupHnxwttWXXTDyMYuvuEAKzEvJjyHIGTPZNrjTpuQ2iq9X0o+uq
 rU8W6j8T8a4NlAgxVnKHuKgpOTd6ju+1QvK9cqg2X35HVFvQIPNrpCBNp9kAajhxAGzjPvlMx
 fOskJhIPFdqv1VGKmIMS7HIW4/nQtM8agnBivZ0NlUFXx1olX6x/kJi2/oKnvL2pQwi13bfAM
 W/f7dvaX5tOQQFVn1hU0bYGx4E4Gh9NrifDNxBBOyMWer+n0W7RLYpxAgyZY7rHRdzChkNoiA
 IOMF4CarOCHo76zQAShg+r+hJJrGfZLtQb1FfpOUaX1psWnRL2+UCCVHdh8JIfRoK99WVXyk+
 9TFsYCiDSwdMfMvzzn1Gc5dZcFW0SxDP/C5n/ccMKgZscamAfhdDXtqFptlR3jrwiuk+yr4xh
 oEi11FO2HG0kRQI3qS2QW3409GDlsZ47kDngzEikdMer9cfsh6wbK65exVUafVWqf8UKjSngA
 jh/dmgZ9HTmJU466z6DHzCU360Qcx34ydjFmyxZAbCC6ED6PUIix4ICWNftph5Uo/5TqJ//vO
 GLWQK5OD46pDv93IUr0RNRz0mXhxDn0IT7LH4GNY//Vr5yaXptU3PPpOxjprUuBdQl55z3lbb
 aB5PLXg+JVDlUEfIDf5i69+0gNUt0FkAp2LkK0TWmu8pV51v1AJ4FNp8FqGFgNE6BFOiYr1CY
 EeneiFVPtwhRe7kzUr46OUoG9QolnueJez0EG097mxAusPlf4iGhqs/J0pmlMWYZNPfltQzrE
 Spsj9N03YxMpwtZc8M4Gu0Bg==

Am 30.09.24 um 08:27 schrieb Stefan Wahren:
> Hi,
>
> recently i submitted the commit d483f034f032 ("usb: dwc2: Skip clock
> gating on Broadcom SoCs") in order to fix an issue with suspend
> handling. But this change reveals another issue at least on Raspberry
> Pi 3 B (arm64/defconfig) for the following scenario:
>
> 1. Power off and Disconnect all external USB from Raspberry Pi 3 B Plus
> 2. Power on Raspberry Pi
> 3. Wait until successfully booted
> 4. Connect USB devices like keyboard
>
> The expected behavior would be that all devices are enumerated, but
> this doesn't happend. Instead i observe that the DWC2 stays in
> lx_state DWC2_L2 forever (bad case):
>
> [=C2=A0=C2=A0=C2=A0 2.334366] dwc2 3f980000.usb: supply vusb_d not found=
, using dummy
> regulator
> [=C2=A0=C2=A0=C2=A0 2.341892] dwc2 3f980000.usb: supply vusb_a not found=
, using dummy
> regulator
> [=C2=A0=C2=A0=C2=A0 2.400027] dwc2 3f980000.usb: DWC OTG Controller
> [=C2=A0=C2=A0=C2=A0 2.404868] dwc2 3f980000.usb: new USB bus registered,=
 assigned bus
> number 1
> [=C2=A0=C2=A0=C2=A0 2.412087] dwc2 3f980000.usb: irq 51, io mem 0x3f9800=
00
> [=C2=A0=C2=A0=C2=A0 2.711826] usb 1-1: new high-speed USB device number =
2 using dwc2
> [=C2=A0=C2=A0=C2=A0 3.195838] usb 1-1.1: new high-speed USB device numbe=
r 3 using dwc2
> [=C2=A0=C2=A0=C2=A0 3.435829] dwc2 3f980000.usb: dwc2_port_suspend
> [=C2=A0=C2=A0=C2=A0 3.459914] dwc2 3f980000.usb: _dwc2_hcd_suspend
> [=C2=A0=C2=A0=C2=A0 9.009743] dwc2 3f980000.usb: _dwc2_hcd_resume
> [=C2=A0=C2=A0=C2=A0 9.030667] dwc2 3f980000.usb: dwc2_port_suspend
> [=C2=A0=C2=A0=C2=A0 9.044137] dwc2 3f980000.usb: _dwc2_hcd_suspend
> [=C2=A0=C2=A0=C2=A0 9.044222] dwc2 3f980000.usb: _dwc2_hcd_resume
> [=C2=A0=C2=A0=C2=A0 9.354370] usb 1-1.1: new high-speed USB device numbe=
r 4 using dwc2
> [=C2=A0=C2=A0=C2=A0 9.584095] dwc2 3f980000.usb: dwc2_port_suspend
> [=C2=A0=C2=A0=C2=A0 9.599997] dwc2 3f980000.usb: _dwc2_hcd_suspend

Now i spend several hours into investigating this issue and gained at
least some insights. The reason why the DWC2 stuck in the suspend state
is because the relevant irq 51 doesn't fire anymore in the bad case. I
didn't figure out what's causing this, but i suspect this is related to
the call of dwc2_port_suspend() by dwc2_hcd_hub_control(). According to
the implementation it looks like that dwc2_hcd_hub_control assumes that
if dwc2_port_suspend() returns 0 the bus is suspended, but for the
corner case (hsotg->params.power_down =3D=3D DWC2_POWER_DOWN_PARAM_NONE &&
hsotg->params.no_clock_gating) the function returns 0 but bus_suspended
stays false. So it seems to me that usb/core and dwc2 becomes async
about their states.

As a hack i made dwc2_port_suspend() to return an error for this corner
case, which prevents this issue but also pm_runtime.

Maybe this is a relevant side node: in the bad case the onboard Ethernet
chip LAN7800 is also not probed after startup (just root and the hubs).
It looks like a race between LAN7800 enumeration and pm_runtime.

Another hint why this seems only happen on the Raspberry Pi is because
there is no PHY or clock control available to Linux.

