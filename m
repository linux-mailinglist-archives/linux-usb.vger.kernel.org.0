Return-Path: <linux-usb+bounces-4080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2580F668
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 20:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3816AB20DE8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 19:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF7081E3D;
	Tue, 12 Dec 2023 19:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="siTGftYd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D2FE9;
	Tue, 12 Dec 2023 11:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702408604; x=1703013404; i=wahrenst@gmx.net;
	bh=ACbaWNFhI4Cx8ABOfIZf0sedQjo/96CkJf/XFm3gSFw=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=siTGftYdIIfpqLMjfSUMkNoTPDjSwYkv77spcXetPEEqcUIZ/rJCW5AdXdhT2E+/
	 vIDyTST7e9OwWhlxMlm3uOQ/LFyqsxmTa/+ikLL5mNf2EAEIv1PIxFZwSAmt8b2Vt
	 33eVU7lYHDa5peCQMkX3wmHMxTcMcD7REf7FDMk4B58cd8JQrqY7lqINqKC8aJdcM
	 GSVy0RH5twchCmxvXkLfCrF8V+S/oFM9ZhXK90oh2cI3eOM4R/V2rx2b7d6VzcsP8
	 kEirOjqCEot/T4LWwloPdLWR7YfkKotZJR07sgJn3WF+lVsgTHxx5sL/sBDDhUJkM
	 o4Kd/3p/72C4SGx/wQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2aD-1rfHw30WoB-00kAvS; Tue, 12
 Dec 2023 20:16:44 +0100
Message-ID: <6f5ced56-94fb-43dc-859d-42398624cd55@gmx.net>
Date: Tue, 12 Dec 2023 20:16:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 0/3] ARM: dts: bcm2711: Add BCM2711 xHCI support
Content-Language: en-US
To: Cyril Brulebois <kibi@debian.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231205200531.8232-1-wahrenst@gmx.net>
 <20231212190904.igxm2twvftokhdwr@mraw.org>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231212190904.igxm2twvftokhdwr@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZnBG0/z+wh4wy+82FAbvdMniRIaOdEwLDjVTNOM4OeTg0y4mlTi
 L7zC8cls2KR4y8dIcuSFXJtjCUTKFMbP5jKXa/+d0oZ5XuCF6C4HBvXjGgoNkr6rpP8doc/
 AEAk+fApgL7HgbiNV5NLVeeBdPwTgAD6YNEz5KOKFATthEsMJiUKqmQ1O6S7pgGGnvTSIGF
 IWwcoEuwhr8Pz6h4PA1tw==
UI-OutboundReport: notjunk:1;M01:P0:dK5623jq9jw=;und38testhdiz4Hqpq74S1f8GWt
 UnL1HTAtz9q8LfpsKQ9gtC24PG1Jz7eUziKQ3ulr0WhYxLZZhcq93A6cRQ3dljRbRuvCQh1i6
 QPTQ83wX2OBO+8VQ9Pah4PnPB6hgymDk/bz0g7FWRg+5Q4TqxnOobm7JPtH0TW8tPYDH63mGp
 sh5y15qjCZhBkYx/XkGRlIYStx8mFwOQhUOTSpHMTC0a8KZRXB2TC3PlbhJqOi7udehY7GKRk
 sK229Oztdqs2sJtXuX+B53x0RNLy0xd1Kplw2U4SFQp+YuFdFlNRYcPivgCC05BCg5eGJNlq1
 ELf9M65BXeqQBHHb6rE3TXCmVvn1JY6cKWHCSv/HL70dsROYvaBU9Fnwxdl7fmoBL5L8vmGI7
 Ei8pXcFgEOvT5t0B0TByg4AfGOxgsisZSmt5y+QCNmKo8Z1iPFFUdiiXT7fW2FguC8viYkN8H
 U/5Gm2yMeJWWqegJqVZHaw0BQ73n9Yow9GD7upRZpsVxS+vzeL/I+F/0VeA0+7nC01/b8CVen
 ruyDRbSLUpdW9DK4yiaA/TZNluXKe3hugisWdcHVtzk91SydcpL1KHeMaNvU0JFS7ReVShlZx
 /oCT1h0otY4QPTpscKqv2qlNkwwIXs8e5PqtOEB9puhpf+jXvsdiaInlo9e9/WsFrl59RSRip
 2EIXbtWkfhHgDG+TQXDiEbBtp1IF4ZySCdOlubRtA78Kkpu9CAGPr4Krd70+NIsfefsipylot
 fFRzXOlJ//i0Mzbb6fa/pRojBv0HT8V692SkRF34QjvMZQ4eaiDm1sjYdPyEoUfT/4pBuloYk
 9QAZz2/AIcvZKcDwJY9Sj1aYUugg+w0G+nchCyFynUmgTetgg4i36oRIV1Q+qnEUYLHuTuHTw
 zUn8YTvdR57tCjAfiG47BcALP24dxUqMVqbPHxBLwFIGT0VsOPZgu+U404wtZ8tSRPRlqk2e6
 lHFpzg==

Hi Cyril,

Am 12.12.23 um 20:09 schrieb Cyril Brulebois:
> Stefan Wahren <wahrenst@gmx.net> (2023-12-05):
>> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
>> does not have a VL805 USB 3.0 host controller, which is connected via
>> PCIe. Instead, the Compute Module provides the built-in
>> xHCI of the BCM2711 SoC.
>>
>> Changes in V4:
>> - use "brcm,xhci-brcm-v2" as fallback compatible as suggested by
>>    Conor & Florian
>>
>> Changes in V3:
>> - introduce a new compatible for BCM2711 in order to make the
>>    power domain dependency SoC specific, which also results in
>>    a driver change
> This is still:
>
> Tested-by: Cyril Brulebois <cyril@debamax.com>
thank you very much for your efforts. The series has been already
applied by Greg.

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=3Dus=
b-next
>
>
> Again, I'm also applying Jim Quinlan's PCIe patch series v8, to be able
> to fully test what happens with USB devices, onboard and behind PCIe:
>    https://lore.kernel.org/all/20231126201946.ffm3bhg5du2xgztv@mraw.org/
>
> With the following on a CM4 IO Board, with a Samsung flash drive and a
> USB keyboard connected to onboard USB ports:
>   - CM4 Lite Rev 1.0
>   - CM4 8/32 Rev 1.0
>   - CM4 4/32 Rev 1.1
>
> and using one of the three PCIe-to-USB boards referenced previously,
> connecting another Samsung flash drive on one of its USB ports.
>
> Conclusion: I can see and use onboard USB devices alongside behind-PCIe
> USB devices, either with or without adding otg_mode=3D1 to config.txt.
>
> On a CM4-based product that uses both onboard USB ports and PCIe-to-USB
> ports, all USB components still work fine (3 RF adapters, 1 modem), with
> or without otg_mode=3D1.
>
> (All of this is still with a Debian 12 arm64 user space.)
>
>
> Cheers,
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


