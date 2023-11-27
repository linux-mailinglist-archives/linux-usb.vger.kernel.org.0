Return-Path: <linux-usb+bounces-3362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D407FA43B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FECEB21218
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 15:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B568531A7F;
	Mon, 27 Nov 2023 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Mzn2l2x+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E845AA;
	Mon, 27 Nov 2023 07:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701098201; x=1701703001; i=wahrenst@gmx.net;
	bh=uKHkG9+U47RYHsud2aL+arN6vGOO0g0Agwwf3Wi2AkI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=Mzn2l2x+c6ZyZLyWIoYyljmPPba9NLq2y6sgEPrMA3UNWP0VRAFoDDByYvxUfn+G
	 2A6MJd/fpDeOmQR21zy+mkb/RpR+05xyOfqrJO471aZ7HXR5npacQ556OXOxs72HF
	 29u+1HlA/mKMMETPo0XQjDmzJu8PJwQwqqJeYDywqVncTZIFbeZEtCro08XgcgQE8
	 064bRQLooOoFR8WNQoBKo3oEmwwcq9U+0HiCp9KhD6hGRFqySv5UVQ96C55FTIAxL
	 TVCXTUvvvfmDvJiL6CqhsKhlEz3M6GxOux7cNCE2U9C5t+7QEOeQlU6IGOGbw75N6
	 LOOgiQ6xXz7Ca86J+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1qulIG1xh3-00MKLB; Mon, 27
 Nov 2023 16:16:41 +0100
Message-ID: <91488944-64e2-4715-baaa-ff5c18d46840@gmx.net>
Date: Mon, 27 Nov 2023 16:16:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
To: Cyril Brulebois <kibi@debian.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
 <20231127115538.npv23hhn7jfrk3fc@mraw.org>
 <892c2e2f-3187-491b-b464-56d099b6fd49@gmx.net>
 <20231127130225.lyk2jngfru5lw6sd@mraw.org>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231127130225.lyk2jngfru5lw6sd@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z1I3XJZGqSHwV2wlk4Op4Opz52HPOPJnSUJgR9jfPR+DgUYNCv8
 Fk2ZVaVfTwW9+nM5EVzpNaLJvXuPZDD+JTP5HGQRG/dXZEBRB2BkaoShkrn//i0eLvn9+YT
 8UFNs78XOCf4cTWG7mUs4lq704i0oJ7ZGeVziVHJYGmmt6ROVkNPBfhS1UiDPX8wzXH82Bd
 sdZ++l2hvgKg6Sf6OK2Eg==
UI-OutboundReport: notjunk:1;M01:P0:eF3XxoYewsw=;OxmxbOEhmmsNtFOX1lmtKKIqcOF
 pvZRTMpyXUQZ8afCb0NdcKjrb9OxU65SRH7UO2mdaVERykcGrwS5qx8U8tryyzYL5aCv7IEnK
 sBonKenQ6ibbYEQbCtfXSCQRHAKb86AyYmBsJRiD/QCvnFr5D78yXdGI4ZQ5oOG79ASqwjxrX
 nGkzjYof+B29Md+8wdk8fNektjXBY+ehdZQ8jdvo23D5AfHR/qL8NJKvL1HGUpTklxwbNHK9Q
 QwjBv+1iS7tIz06EkAMz4MPtLZi5nOS43lu9Tv8H1P2awmOE6pZrKKjBqgRPwPy/O1iwZUeNL
 7HrlwhxPuct/zasL+/roj1JCBArFKHkv2HzUWy6sB0CrInVonIK0zMcIVlWCwwPYz/dAFMhGh
 CePwb/3S+brnvOSF8kk4E99W9AL35Dv5shFlqsQbV2momvLlc4lALPLfKx6xR+gieVOGlXmbu
 4Kt0i0qiLIOgjIOFzuPJdXv0zh22cS1tgErKxiKsMbv94lZTljSe3Oj/iYa36oXAV11WRgT3l
 7Fd85WD2RI19zJ7pUck3ikIo5dExg7XHQ9aNh4EHlsHaT/2IVphQ3vvtOLeL621UjO1rfJN7I
 G97EFneJCQ9nGH2d038Ctd/cF7n72tk7NYM6+l8k2Jd5AyPwE9bXLElR36ukmEPA/ksFuzaHE
 bBykkGxJts0MUaF/WqyTJgNCl0W9zvxZHk+wEcRBb/ZHe28ZOej0tI2mulbgRMR9QVnRXrORp
 lR1PWoDrE0l4N0KSqStMPNp1XEXk3EwFCLtaGjbvwwWU1pj2Xq1x5ifuKX07KLxexuf6adW+p
 ivrKombmGjf77GlE2ntAYjj2g2mYNetJnVDcYdOQMrhXNzlYE7fbBMQrqTiEJbtwKYhPKl7fP
 hsLj64Y0yJ7yRxYbDfghgxBxcpTx7k1xrINpgmKzWJu5RDHDQd8J44ywe7eSnCjTnIkJtupaD
 kla38xBu+e6i4J9n8OUeSTrYoKQ=

Hi Cyril,

Am 27.11.23 um 14:02 schrieb Cyril Brulebois:
> Stefan Wahren <wahrenst@gmx.net> (2023-11-27):
>> Could you please provide the following information:
>>
>> - settings of config.txt
> Here you go:
>
>      arm_64bit=3D1
>      enable_uart=3D1
>      upstream_kernel=3D1
>
>      kernel=3Dvmlinuz-6.6.0+
>      initramfs initrd.img-6.6.0+
>
>      enable_jtag_gpio=3D1
>      force_turbo=3D1
>
>> - VC firmware version
> This is pieeprom-2023-01-11.bin
>
> I know there's pieeprom-2023-05-11.bin as well, but I've been keeping
> the former as a constant throughout the PCIe patch series testing once
> I realized how critical it was (old beta EEPROM versions found in some
> CM4s made everything much harder initially).

Sorry, i was a little bit unspecific. This the first level bootloader
stored in the EEPROM. I meant the VC firmware version from the SD card
which is logged in dmesg:

raspberrypi-firmware soc:firmware: Attached to firmware from ...

> In case the config matters:
>
>      [all]
>      BOOT_UART=3D0
>      WAKE_ON_GPIO=3D1
>      POWER_OFF_ON_HALT=3D0
>      BOOT_ORDER=3D0xf25641
>      ENABLE_SELF_UPDATE=3D1
>
>> - did you use arm64/defconfig or something special?
> I'm using a =E2=80=9Cdistribution config=E2=80=9D, starting from the lat=
est arm64 config
> found in Debian unstable (6.5.10-1), and applying `make oldconfig`.
>
> You'll find it attached.
Thanks
>
>
> Cheers,
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


