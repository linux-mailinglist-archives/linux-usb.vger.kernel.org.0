Return-Path: <linux-usb+bounces-3355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562137F9F99
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 13:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 113862815E1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272BD1DFF2;
	Mon, 27 Nov 2023 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZNHpEhlJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2D4135;
	Mon, 27 Nov 2023 04:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701088400; x=1701693200; i=wahrenst@gmx.net;
	bh=nxlyVf/kBLvAr9KUBeBeC3yNs6JtXqImub1VWLvYG8o=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=ZNHpEhlJAW94QYR/sVO82BhbvcZNdewE6Ed+Qmmo5cg74JyDm9SnHeSPyijBoXEE
	 CBpLSqNmtROmN99zvfDvxUiCIcuSw++tf0eYEA5Ip+tefx2tdYUISj/CfQR65ACo2
	 OcBX39UIoMIsNKsKOU3FyNPfYLU/I2HvGgJ5yizKAcAmqPMSPq7jpeEUMe4S77K94
	 OS8r1oc91R/UUIln7GoyIuU7/l/q386Ys5wcJ1HJVt4NGK99OqaMtFg71SqO0/NOB
	 7ugaGoDRbYUSSew8UJgzFlkDXFSLEmYlm1PugoMTRJFymawva6AGBUjrDoklmlhaJ
	 gOyflmI15ItNA94u2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1r4KcO1zga-00GdMp; Mon, 27
 Nov 2023 13:33:20 +0100
Message-ID: <624b79b1-f2dc-4f2e-a225-d1623d905b19@gmx.net>
Date: Mon, 27 Nov 2023 13:33:18 +0100
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
 <a78f9ba5-ad34-4af2-9817-eeb7dd9d02ef@gmx.net>
 <CAMEGJJ3PpEgD_davgTn9e+re4hosunU+uj_i5sdKMFNLFR5hBA@mail.gmail.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAMEGJJ3PpEgD_davgTn9e+re4hosunU+uj_i5sdKMFNLFR5hBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tQO5FM+1X6vOvoNaL1rMeBrgfEEmIOTmByWDEVozrxnx4+A9LVV
 WNJJMXGBE4xZqEr5k3hOCkXc+GC5EWltyOtQMI5sbnoxkJwexGj4nfsIg4yjP5Wx1P2ur5x
 tb9NnqrSNBkJQ+LbwYSEUnoC16wZ9PY9D4vY/zgKZg9RRkFqKjfqvBgNllP3+pbk61Jq8v5
 TSC6km3BaxjkVkIRIkkCg==
UI-OutboundReport: notjunk:1;M01:P0:7pgJlwopdF4=;PJ9V0QnSTifn5hmUIi7nBBsNC0R
 adL1nkFKsi+H39m6mg7U+XtVuwzCh2sgB+qXrFWX/izMBAtTZgwtsPg4FmWd8DTXHIFTMxQPn
 TEQTHMMGUu8gz5lNokhZ89GhBRrmeV6Uswk7e8SPA3MfqrRwHZP8EWY1jo7pCKB+77oTMmMbX
 Gb1YG9uVGEjTaLGvwrLuNoIElG5f6qbpfFiwOfwyZS4KiXs41oGgqQLtAnlz9PYippsO0Nz/D
 h8ngijKjKHywjP1b1Ud+Pt/NtjZ+mX9F4SsnsZY8K2/1ZJe8O2aaml+bluuadUHnApyqQmwey
 IMZZn8ADv6XA2HRPlYETWRpeGZjapmT6g2FR5+UZNu4lhyoTiINvvvq8P0I/Os3bNYCeH2D7X
 5RvgsyEsTrDDlJuEUZnAMeXFggSmaSYWCUI3DJEP3seGcl7OEtez1RofraBAlG3kr9m3sHyN4
 OPSmb9E0D//T9XFYwdj03pjDwhuc1ATWM8Vz4M6moAz3sWgNjdhxl7IGlM7BNNcBe7iB49M+D
 KvuAUsDpkzaVoi10CpVOYwWy7hV60LLUjOwjuIE9Pq7DQ6p0wFEmiqTNMBKLcG6J636GJ7qvj
 0Hkfs5L7soeMYQO1tzdALTPV/y5UpIPvP8VRPT0Xtdw90rfNK0a9rKhL7wPWI6KEl2P7/Ny/Q
 1MV1iG4oeoIOj7dcKAQP0dGNogjzP3aX75eICUK5FkvUuMi7O2ELOqyL2fSrbsryRkhT6Y2+p
 mi2qYV/FKP2q6GqzJKtcaJiUYMbHr/l6SdP3O1h4TNMJcHJb+ClBAtISlvt2eA+Cj3mdeBriK
 vIRXeQUe4pljg4sVWekpguHypkkZw8v3/6/Uq3/sbKQ8Fhz8KHdgvl8O1hu1pXdEwg8Sl526E
 WE3L/OAjhIiRiN9LW6zGQxiZqzxwjpI7oIJXuqCZgYx0Zk0Xn/24C/FEUFGy4akkPctyilgcO
 6UAORFkc3Hne4jaVXLNasKkkb9E=

Hi Phil,

>>>> Hi Justin,
>>>>
>>>> [add Phil]
>>>>
>>>> Am 27.11.23 um 07:02 schrieb Justin Chen:
>>>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
>>>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO b=
oard
>>>>>> does not have a VL805 USB 3.0 host controller, which is connected v=
ia
>>>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the built=
-in
>>>>>> xHCI.
>>>>>>
>>>>> Does this work? I maintain this built-in xHCI controller internally.=
 I
>>>>> wasn't aware the Compute Module uses this block.
>>>> i successful tested this with a CM4 (arm 32 bit,
>>>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB device=
s
>>>> (mouse, keyboard) connected to the host interface didn't work. After
>>>> comparing vendor DTS with mainline i noticed the missing xHCI block [=
1].
>>>> Unfortunately i wasn't able to get further information from the publi=
c
>>>> datasheets. I don't know if the VideoCore does some magic tricks on t=
he
>>>> xHCI or i missed some downstream xHCI changes.
>>>>
>>>>> This block is held in reset and needs a bit toggled to get things
>>>>> going. Florian, just to confirm, this is our "brcm,xhci-brcm-v2" blo=
ck
>>>>> correct?
>>>>>
>>>>> Justin
>>>> [1]  -
>>>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts=
/bcm2711-rpi-ds.dtsi#L119
>>> What's the question here? Does the XHCI block present in the
>>> raspberrypi/linux dtsi file really exist? Yes it does.
>> since i don't have any documentation about the xHCI block, i assumed th=
e
>> compatible generic-xhci is correct. But Justin seems to suggest that th=
e
>> xHCI block needs some special treatment and we need a specific compatib=
le.
>>
>> Did i missed some xHCI driver changes?
>> Does the VC firmware something to the xHCI especially on CM4?
> The firmware switches the on-board USB pins from DWC-OTG to XHCI if
> otg_mode=3D1 is set in config.txt, or if booting over USB MSD.
is this pinctrl/pinmux available from ARM via 0x7e200000 or a different
IO address?

Thanks
> This also
> triggers the enabling of the node with the label or alias "xhci".
>
> CM4 is not handled any differently to the other 2711-based devices in
> this regard.
>
> Phil


