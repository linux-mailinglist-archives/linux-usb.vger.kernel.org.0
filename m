Return-Path: <linux-usb+bounces-3352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D367F9EC1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:38:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 274B6B210A7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6191C1A705;
	Mon, 27 Nov 2023 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="tHjDDjIf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C42B8;
	Mon, 27 Nov 2023 03:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701085104; x=1701689904; i=wahrenst@gmx.net;
	bh=SFIH2xcNlah3YTHeM1h2ULCAXeOmNtEhny0Q2XMb7Kk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=tHjDDjIfaM0cX2L3Qs1V/lT7EhT84reVpLuPO5hYgnw612geui5Ds1hfEHyChnsr
	 8lvTYT7vxj+wwh1KVquAHwLt4nmOhJM4XoepjbmqVSDfwLZzgwlMCUf6HDugQNv4V
	 bOfR5JEijhPdcPyT7UjB8nR8rzRcNqE3jf0ZfFVGJ5UvKw4WnhdU+yIYqfIOFG5Vi
	 j4KrJn2nsYwliBWvDQOJ+TCHm7yF0dd4LLXfTpaZWDtQ7l4vMHvnKkPcJg7PgI7Mq
	 IpxH3lpYOd4XOp4A4qxgIpuagqn4A8kN7bCCYTg7VMCajDDnOLP+6/FB8fjCkon0B
	 CEW6IvHYAfM0G1LmWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mz9Ux-1rURyl2mCx-00wBBy; Mon, 27
 Nov 2023 12:38:24 +0100
Message-ID: <a78f9ba5-ad34-4af2-9817-eeb7dd9d02ef@gmx.net>
Date: Mon, 27 Nov 2023 12:38:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Content-Language: en-US
To: Phil Elwell <phil@raspberrypi.com>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, Cyril Brulebois <kibi@debian.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
 <46320840-09ab-4c86-90c9-bee7b75f248a@gmx.net>
 <CAMEGJJ3SXHSnasqoMJnshf5Wu92NVi8+NoMdxmMsJH7WH2WjWg@mail.gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAMEGJJ3SXHSnasqoMJnshf5Wu92NVi8+NoMdxmMsJH7WH2WjWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5xpmIlJ03s0Oj6NYZwycFK0MHCRodpFkZf5S/GcU6pugugr56+0
 beBZvRvneVnp2hkEj6nniiwUD+ZfddsRem7zH61uvOHkhY7lgaVQW2Mz2XArvdaDDz0cVmk
 AJeU6PeF+uBB0NxaZ7xrerXfLxzibFDJKv1h4s3HzDfcTcpRjqtqOwVFmX94Ha0M4/HJ50V
 2Yzl35Q6b3YKW/bGE+EtA==
UI-OutboundReport: notjunk:1;M01:P0:uV74jL5nR4E=;gYKDyL+02UWZtwx/DABCpUPJ/Iq
 pPQNtObT+2mO+1oSyB4NJFP0b1+fmHbtEtPlOWDo2uzn/hsNdWqD0P5kIluT47X10ycN5XoZn
 EqCqOk3crez+PzaHUntX0e9NWVbk6VGDUiIC7Qg0qnU/3and6pM8dW5yHJN8wzid8czWAKwPp
 qgndN8DlUFI6Qoum5u6Ggjpq7p04xUgfLSStiEWz3nkn+mCraEEKoHyUInQUDe/pm8BijMSYJ
 /wsJW+QMpkvues8+EB6AZVCXCfHlyhjRfC6nndFYEJ2Ae0v5Y5mpxtQIA0ZAJveJRSW56wXd1
 gh+a3dXWWqVHMzp6xRiZ+ru5JoJ2H5GJcml02nTqsau/dg7FUdycL+PueSDxgBWrcVyn2P9Nx
 fe9lAC0RFaWaUmU72zgwiFDgI/Ad1dmGeuCYZv7RKEg2tzXvqqFgpOIfzm4zUWbBfuAfsT6D6
 jy/DNqOFU8W6Yo3IPhZLX2Y/ZWdna6eBLgK5pRT/DGXn6lAFXxGThaxXYhkRL/WWhJfSqUIEa
 2MSqLREOz+2d/YnQoKJIE9lwgtmw3EE0AvSu8x98reang7qI2iCI9XvII5JcXV7poYIYMkVew
 3v96iFl7DQJD40/2het2lwe0ifxlABThzXKW/YFIptv10hxe1clEvLKns5KjflmulgaJsndER
 2PeFNyIz/z2a/UCEvdzWa1OPEDrur+/+hKygTgmAPcNHxHt7DSPwEiVOBRPLRiAr7OU7SJsU2
 pCHvm3qFZsFeqa1IDqneXgGUQ3rk4wjF1Msz5lwVb13IT+J4FfVQ88VhE5FD8zXxUjtaWIejq
 t4RaK1U1TX1yoCJq9JGdpgBuWaomP4OOiazR5E2/2/GeTy/IuaHuYp6v8Q1eeSA/269cMRQcm
 KRiAQUOPDaAaPV9tRL2DEBQTvGa1RKTlZ3FgWqYuuqstAAnH3bpsYfEjAY+lcKSs3ulVtyld8
 iugNrw==

Hi Phil,

Am 27.11.23 um 12:22 schrieb Phil Elwell:
> On Mon, 27 Nov 2023 at 11:08, Stefan Wahren <wahrenst@gmx.net> wrote:
>> Hi Justin,
>>
>> [add Phil]
>>
>> Am 27.11.23 um 07:02 schrieb Justin Chen:
>>>
>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO boa=
rd
>>>> does not have a VL805 USB 3.0 host controller, which is connected via
>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the built-i=
n
>>>> xHCI.
>>>>
>>> Does this work? I maintain this built-in xHCI controller internally. I
>>> wasn't aware the Compute Module uses this block.
>> i successful tested this with a CM4 (arm 32 bit,
>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB devices
>> (mouse, keyboard) connected to the host interface didn't work. After
>> comparing vendor DTS with mainline i noticed the missing xHCI block [1]=
.
>> Unfortunately i wasn't able to get further information from the public
>> datasheets. I don't know if the VideoCore does some magic tricks on the
>> xHCI or i missed some downstream xHCI changes.
>>
>>> This block is held in reset and needs a bit toggled to get things
>>> going. Florian, just to confirm, this is our "brcm,xhci-brcm-v2" block
>>> correct?
>>>
>>> Justin
>> [1]  -
>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/b=
cm2711-rpi-ds.dtsi#L119
> What's the question here? Does the XHCI block present in the
> raspberrypi/linux dtsi file really exist? Yes it does.
since i don't have any documentation about the xHCI block, i assumed the
compatible generic-xhci is correct. But Justin seems to suggest that the
xHCI block needs some special treatment and we need a specific compatible.

Did i missed some xHCI driver changes?
Does the VC firmware something to the xHCI especially on CM4?

Thanks
>
> Phil


