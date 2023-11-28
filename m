Return-Path: <linux-usb+bounces-3392-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144A7FB20D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 07:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CB9BB211E5
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 06:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0A1D511;
	Tue, 28 Nov 2023 06:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MOcwYO8o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94CD2197;
	Mon, 27 Nov 2023 22:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701153864; x=1701758664; i=wahrenst@gmx.net;
	bh=9p/L+dIs/yOOUpJOeqIgX4V6lS9jUXF4jrKNFp088qM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=MOcwYO8oGqVOwSez+bQ8AUaDwNQyDoIEzmMxUvHuibeCG3r+HZXE+VL3IjVG+Wmx
	 Q2xh1kpW2luPlUN0oY1/ZmDkeOeM2+5D2+xKcmwitC3eL7+6u2h/HRLGwrmQIzfXn
	 RNxqKL7WX5xEGE5TibR5XYFnLRSdoHdEXFy8au8jk/9MtVsi2TV4QeEwQBTKEJ1ll
	 bLEa5wZZDQsaYtQ/8mo0Ralo584JBqBvEx49aR+BPsIsMZ39VyZqrgkhA+ODOloaQ
	 hDFYuoIdyW4+nlGbgapr/z9xEq6QKMf1J2ecyMwo1OLky9hkDwEokqwtohD3bXEDO
	 /A4HDkFm/VMeY8Ws8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1r59ss1tIE-00HBCp; Tue, 28
 Nov 2023 07:44:24 +0100
Message-ID: <ab4b6629-9e30-4385-bf14-c31223e68769@gmx.net>
Date: Tue, 28 Nov 2023 07:44:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Justin Chen <justin.chen@broadcom.com>, Phil Elwell <phil@raspberrypi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, Cyril Brulebois <kibi@debian.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
 <46320840-09ab-4c86-90c9-bee7b75f248a@gmx.net>
 <CAMEGJJ3SXHSnasqoMJnshf5Wu92NVi8+NoMdxmMsJH7WH2WjWg@mail.gmail.com>
 <a78f9ba5-ad34-4af2-9817-eeb7dd9d02ef@gmx.net>
 <CAMEGJJ3PpEgD_davgTn9e+re4hosunU+uj_i5sdKMFNLFR5hBA@mail.gmail.com>
 <624b79b1-f2dc-4f2e-a225-d1623d905b19@gmx.net>
 <CAMEGJJ0aL4VDoq06+JGHz9yx5nVvgbNULNKoT07myzVGNiyCoQ@mail.gmail.com>
 <b8a90433-e0fe-4148-a512-c0e9ace2b4b6@broadcom.com>
 <91ceed68-fe3a-408c-a858-095d5749b4d2@broadcom.com>
 <10383aa9-942b-415d-b70e-ade3a7aae6fa@gmx.net>
 <71e96b4e-a0b4-4145-8174-a18cf1ccd06e@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <71e96b4e-a0b4-4145-8174-a18cf1ccd06e@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CqIwg5/UCbqJkTfCiwIUHNcnS9TAwnk+UW0II9hDbnAJK8qb/Xb
 oSbZZJxEqwn/EC7vvXQlkYfzvMeHTx9pgFkLhflu5XgdVA0iB1TcISE3Lq1wSVKHWl7bRXV
 6gjpmxZquEYll700lLpj3agKkHFdoCYQTYfvgVhcjchKQBFAFw1Sj7B3/uSt5HbiPggAoO4
 lVEDCZra9OoCgjGl651ug==
UI-OutboundReport: notjunk:1;M01:P0:zPIufbtySzk=;XenWx8vAVuUR4HRy1YhTuigUX6F
 tF6hld/NOyKRKrMkjPpJ+AQzziMuM2L6M/adCDRg9mGSKaQIVW9aH0djNx2ZbaCuK2GjjfkDw
 gvwdUfgBOiocN1zoksmE0UiA+MS16roHpF0NwY4EhnI0aBXYV88jfL0eRn9eoIXiK7dbiusUw
 8aMR73BOtENVgtMp1Kf9z4EWCd7+oIeW1gKXT+yI77neJuMShM9Y1aM/6EFMpJLlF1LOxRuBc
 t6vYULd+AT/Fh6Vo/D/b8TY9OQA9c7Vm0o5vQPkyfLSQmJ/BwsLFnaz98IX2f9w+x3fezJ2LK
 iY6cKZPHpr33claxqnWX9aNdP7RUfkRBH883furNEdAMTsYOY7OhW0aUxX1iebMDvAMzPHh1+
 OWmQZuedZun2/rYTBm93lidtNRrOoqjt/uiWHAHyzp2H4BORpbW6dYC6LDKTaB8cblrmApSNC
 uOt3ShKRJ51wI4T4WV4EJBQmM5j1UFWmq/srZke9Tw1UnLHF6Sef0jKdQ2Hni/QkCljQj/+LF
 hZkMHU+YBj1sXUvqcKfeVCVlg9N8QtaNTNxZX6EfdHIi1OwACPKeaiHF1p4BnAtlQQ/0S7mnv
 wo7cb92Xy1yZzowJxUl47C05dYrXD6KMMZshIdJMejAcvm/EFl4QdWQzFgcDjPtUg9TeuZhBF
 FcwCrNpKsD9WDK86Y2mfoRws4dsyY8s9E0QggAzZseqlw2/MW+R4g6ozaWJBecoVvCnLm6kL4
 ql9cpUxxjaARCnNdhSorD/iH4XskynG/6w5cOSTLWynoqGrolDfpwXHA/sO0TH22GrLLTqbMg
 V6a7lD7jMA8NGnX6lyFLKXsK2HcoqmN8QUADL/0xB4+cC3BZHgeEbFPfyvrRw2joAkS8yh73/
 9B3YkX/fSjoICuDTvavhrTv4jBsNOrOAgV+OSJPGSHVKk19llvbWIMo6i7JRirSL4K3FhC8Z0
 ovU84Q==


Am 27.11.23 um 22:49 schrieb Florian Fainelli:
> On 11/27/23 11:22, Stefan Wahren wrote:
>> Hi,
>>
>> Am 27.11.23 um 19:41 schrieb Florian Fainelli:
>>> On 11/27/23 09:44, Justin Chen wrote:
>>>>
>>>>
>>>> On 11/27/23 8:28 AM, Phil Elwell wrote:
>>>>> On Mon, 27 Nov 2023 at 12:39, Stefan Wahren <wahrenst@gmx.net> wrote=
:
>>>>>>
>>>>>> Hi Phil,
>>>>>>
>>>>>>>>>> Hi Justin,
>>>>>>>>>>
>>>>>>>>>> [add Phil]
>>>>>>>>>>
>>>>>>>>>> Am 27.11.23 um 07:02 schrieb Justin Chen:
>>>>>>>>>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
>>>>>>>>>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or
>>>>>>>>>>>> the IO board
>>>>>>>>>>>> does not have a VL805 USB 3.0 host controller, which is
>>>>>>>>>>>> connected via
>>>>>>>>>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the
>>>>>>>>>>>> built-in
>>>>>>>>>>>> xHCI.
>>>>>>>>>>>>
>>>>>>>>>>> Does this work? I maintain this built-in xHCI controller
>>>>>>>>>>> internally. I
>>>>>>>>>>> wasn't aware the Compute Module uses this block.
>>>>>>>>>> i successful tested this with a CM4 (arm 32 bit,
>>>>>>>>>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB
>>>>>>>>>> devices
>>>>>>>>>> (mouse, keyboard) connected to the host interface didn't work.
>>>>>>>>>> After
>>>>>>>>>> comparing vendor DTS with mainline i noticed the missing xHCI
>>>>>>>>>> block [1].
>>>>>>>>>> Unfortunately i wasn't able to get further information from the
>>>>>>>>>> public
>>>>>>>>>> datasheets. I don't know if the VideoCore does some magic
>>>>>>>>>> tricks on the
>>>>>>>>>> xHCI or i missed some downstream xHCI changes.
>>>>>>>>>>
>>>>>>>>>>> This block is held in reset and needs a bit toggled to get
>>>>>>>>>>> things
>>>>>>>>>>> going. Florian, just to confirm, this is our
>>>>>>>>>>> "brcm,xhci-brcm-v2" block
>>>>>>>>>>> correct?
>>>>>>>>>>>
>>>>>>>>>>> Justin
>>>>>>>>>> [1]=C2=A0 -
>>>>>>>>>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/bo=
ot/dts/bcm2711-rpi-ds.dtsi#L119
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> What's the question here? Does the XHCI block present in the
>>>>>>>>> raspberrypi/linux dtsi file really exist? Yes it does.
>>>>>>>> since i don't have any documentation about the xHCI block, i
>>>>>>>> assumed the
>>>>>>>> compatible generic-xhci is correct. But Justin seems to suggest
>>>>>>>> that the
>>>>>>>> xHCI block needs some special treatment and we need a specific
>>>>>>>> compatible.
>>>>>>>>
>>>>>>>> Did i missed some xHCI driver changes?
>>>>>>>> Does the VC firmware something to the xHCI especially on CM4?
>>>>>>> The firmware switches the on-board USB pins from DWC-OTG to XHCI i=
f
>>>>>>> otg_mode=3D1 is set in config.txt, or if booting over USB MSD.
>>>>>> is this pinctrl/pinmux available from ARM via 0x7e200000 or a
>>>>>> different
>>>>>> IO address?
>>>>>
>>>>> It's in a different, undocumented block.
>>>>>
>>>>> Phil
>>>>
>>>> Well if it works, then maybe I am misunderstanding something here.
>>>> Maybe its time for me to pick up a CM4 board.
>>> There is one on my desk that you are welcome to use, or remote into if
>>> you prefer.
>>>
>>> To answer your earlier question, yes this is the same block as the one
>>> present in 72112 for which we use the "brcm,xhci-brcm-v2" compatible
>>> string, it would be preferable to have it backed by that compatible
>>> string in case we happen to support suspend/resume on the Pi 4B one
>>> day, if nothing else.
>>>
>>> I did confirm that after applying Stefan's patches plus changing my
>>> config.txt to have otg_mode=3D1, USB continues to be fully functional.
>>> This is the case with using both "generic-xhci" or "brcm,xhci-brcm-v2"
>>> so with the minor request to update the compatible to
>>> "brcm,xhci-brcm-v2", this is:
>>>
>>> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>
>>> Stefan, I am getting a deadlock on boot if I leave your changes in and
>>> uncomment dwc_otg=3D1 in config.txt, is there an alias or something th=
at
>>> the boot loader should be patching?
>>
>> sorry but i'm unable reproduce those deadlocks, neither in arm or arm64=
,
>> with eMMC or without eMMC, xhci builtin or module. If i uncomment this
>> in config.txt, USB host is just disabled.
>
> Here is my config.txt FWIW:
>
> # A bit too verbose
> uart_2ndstage=3D1
> enable_uart=3D1
> arm_64bit=3D1
> # Custom kernel images
> kernel=3Dkernel8-upstream.img
> #kernel=3Dkernel7l.img
> #device_tree=3Dbcm2711-rpi-4-b-UPSTREAM.dtb
> device_tree=3Dbcm2711-rpi-cm4-io-UPSTREAM.dtb
> force_turbo=3D1
> # DWC-OTG <=3D> XHCI
> #otg_mode=3D1
>
>>
>> I'm using the following firmware:
>>
>> raspberrypi-firmware soc:firmware: Attached to firmware from
>> 2023-03-17T10:50:39
>
> OK, my CM4 is at 2022-07-25T15:10:17, updating to 2023-10-17T15:39:16
> does not really show any difference.
>
>>
>> Is this DTS difference a problem?
>
> It does not appear so, changing the node unit-name does not affect the
> results.
>
>>
>> upstream=C2=A0=C2=A0 -> xhci: usb@7e9c0000
>> downstream -> xhci: xhci@7e9c0000
>
> Side question: does the VPU boot ROM or firmware take care of
> configuring the USB PHY somehow? Should not we also have a Device Tree
> node for it eventually?

Sorry, as the person with the least knowledge about the hardware i
cannot answer this question. But we should avoid those nop-PHY because
they have source of regressions in the past.


