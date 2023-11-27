Return-Path: <linux-usb+bounces-3373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C370F7FA757
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 17:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D63128170B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F398A37144;
	Mon, 27 Nov 2023 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="qSmUDQIf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8294DD41;
	Mon, 27 Nov 2023 08:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701104172; x=1701708972; i=wahrenst@gmx.net;
	bh=7J8fw9qFd+aL6jsUPhgSjlsz86mK9821k5SHNY/HzKs=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=qSmUDQIfuZ2AQzG+5uo/xz0mVMDlWNSG+4vVfy4zPkA0zidFNpXt3e4WgGB9ueJs
	 zJzD4b81BAIwrLcWUamH5NqgNdi85UQw4h+33g9AAN4dK5WIpfsKWzV/9bxI5Wdk5
	 eH9INZCu/lEii+agzbbzwQfYDiia7IKhWrl8Jvv+0FRVvTV4tjGweDSC2i7tdWjD4
	 r/gOBqKg+aOohDrT6KLyZaK0EupJ9nMuHoItGVGWmC9Z0FmzhGc+4bE/4ZmF2KeXt
	 E7Of1hRG18Dc5s0hzFgn1ow4MCZ9KfGcvCTFIslXYkGNpDkL/DZ5zmr3+sZxS2bOl
	 c64AW0TPKHSdEXilZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXUD-1qpig73GH1-00JaOW; Mon, 27
 Nov 2023 17:56:12 +0100
Message-ID: <d22e404b-30e5-4c1f-add0-77c0bb88351d@gmx.net>
Date: Mon, 27 Nov 2023 17:56:11 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
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
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
 <20231127115538.npv23hhn7jfrk3fc@mraw.org>
 <892c2e2f-3187-491b-b464-56d099b6fd49@gmx.net>
 <20231127130225.lyk2jngfru5lw6sd@mraw.org>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231127130225.lyk2jngfru5lw6sd@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gDImf0bBNJTxJNqFf9W7Aq0hzi5e2pcksX2bRzRKqs/8N/diuI3
 p3uyEYU4n5d81B4Cb4oL1+GG79CebiDSP30a0NkYZzAVV3XCxPseSr4GOCmCiyoIQOxk0DU
 BCHBIXwjKbyruetFsMmFDqqQLErAXnovkqjSQ3aiCCP0RElKS/oEqvIQEdGPed60MhpEINp
 0Qvk+C8kuzH943U0UUwDw==
UI-OutboundReport: notjunk:1;M01:P0:xbRHiyJ3/bY=;kaBMsdm3XJDC5w5ByIXeUmgQkXv
 6o+woeuD80ATC35xxJ4UVwI3kMD6Sn8gJd6rIUV4hVXN7+sTk4ZF2M4bgr1+ZUBC44pqAorCX
 sJSnhaFXE7aRsuK7bXQ0eqsEAQoMQ8tLkD/lMFQqF8TB0aiHFdekCzOGLmJXTk2gZtI5Y6poE
 MPIIXR2Z6tcb1+H6PcrFSCtcj5OFgCBU2C5JUJkEHZY6FKDCDijOpAjgAoeyxWtXFGcJiYmpE
 616KORGfXSni+tJiUxMNVoM1QvluBT6wBKGXWb7/BHSHUlYisQEqOBIOrFvOJplAlZzn4S8CM
 PIeRu3wvu9EukiARROburN6wzb5zfIUksNtEO4aY3TGrWOJ2cZC83OF2Le8zMt6M9BoaGTeJI
 7eBpkotWN6qNi+kBuauSkn94IfD0v4ApDX9D0F0zUoAlQtyC4lK9n7/HV/FowwG/qU7iX8nMk
 +c/gcnyhD1dXbCbHCkbS/twnuS1/hfF/0tkquWrBcxf2aDWYPMBBUXPKbxiKbnwCz9c5CuAaG
 yjiKywByTA2cxxO2Q+twzgAcSI9le2DzROaStpLJJG6+2RjyHXWvI2Tp1SX6zkaum4qUGid56
 MLKZAfMZDqF+jtgQFv0bqR8kxYB8X5Wv0MwyOHdeYhnfhHqXpTzh2XC0EtGmdHDONzLbQoara
 lu96xQDcP5t+KDyzxN+ut2JMcjZI/j/05Kwc5e9JnD6mATzojBSnzZYYdOrS1u49cUKJjZUyW
 E8+SlN3bPBNax2IB/BeM7eupgRPMO0r1mEyIPJnaPSxzbq5IP1bjhhZTqqwxSv5o9N9z3C7i5
 ZST+wExlEPmwR0iTOqXCdWRKXuNWoHLpThUeA3RaMpHMMrcqIP+PSWtnfqe6VWyVrmynSVogu
 /PZV/IMrDzzZMX0UI1PJItU0Clezv8Ax1jd+rRQNIZsgDodD47HGXHxxaspz1O6p/GBVZPBHC
 ZvvnJw==

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
can you please check what happens if you add the following to config.txt:

[cm4]
otg_mode=3D1

>
>> - VC firmware version
> This is pieeprom-2023-01-11.bin
>
> I know there's pieeprom-2023-05-11.bin as well, but I've been keeping
> the former as a constant throughout the PCIe patch series testing once
> I realized how critical it was (old beta EEPROM versions found in some
> CM4s made everything much harder initially).
>
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
>
>
> Cheers,


