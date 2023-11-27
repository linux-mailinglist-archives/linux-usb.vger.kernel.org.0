Return-Path: <linux-usb+bounces-3379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD37FAA28
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 20:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57EFDB21186
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 19:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BF63EA83;
	Mon, 27 Nov 2023 19:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JOIJtPE2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62856D63;
	Mon, 27 Nov 2023 11:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701112966; x=1701717766; i=wahrenst@gmx.net;
	bh=4bz8S+SPuo0ElywPc/Te413kcUpBIGf3VS26j8jaio0=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=JOIJtPE2sk6N84MNR6qfNcb+ypmpjh2nuZxoqEivJ8L8Y6seRCIQuohXvyYRCyVF
	 XbDaBMdYci/MIGxF1bEQgbOKLKyGdRBoUFmOdA+/JWAzSA9V9NaPN8dL1D31aAI0A
	 u2U0G0diyzHO9DAK5o333KswIBdSaQmKAqTbValgwuv4yjCB1b6PxIOMzJ8da3gqc
	 ns0y+SvKbTgjYLG3ZiRpOZZTVzHaLWznWHqx/mUp0metv/bPAAbV14di3WrNntyex
	 CzGQtx0A3oIWOKdtbp6gpmxYzEnUo/FBKomhaU/Dw1f+dCBkSkZaWjGiosaRrkVpx
	 ZZYBixQezq0+BBqYOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5mGH-1rNgtB2KmR-017D07; Mon, 27
 Nov 2023 20:22:46 +0100
Message-ID: <10383aa9-942b-415d-b70e-ade3a7aae6fa@gmx.net>
Date: Mon, 27 Nov 2023 20:22:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Content-Language: en-US
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
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <91ceed68-fe3a-408c-a858-095d5749b4d2@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q2rC1yp6xMX8C9A42htUmiRRGPod1pff40Kvq8kbK7jh+TUe3Ex
 IrtjK+8Yr1bYgLCNJRDOna59Ihc5SX8IYbqEQW1zBymIg1EfUEBSdBa0iAPffgPu3L19ahx
 33Kfi5jBfsiubH6BuCgU0+9J85NROgv7bUv3V0wzQG88M/biMoLo7FxQLzWP4AEi9fHwc/r
 peG4hcZEFUWMGZjoLESVw==
UI-OutboundReport: notjunk:1;M01:P0:kBt2PlGSZHU=;ktOWreB/e8Ta/JCqVzcjNptrKQY
 OVzh3zIR/alNUv2HiDN8ObWIRUH95vBL6gw06uxnDWO2bk8XolIhv83TwUG6RcViiCeh6v0r5
 psNvtjNbNQM20FWUtkHXasjK1nYIGmuAARe7EfgwGaUZeAjOJ9Y1bvoJ3yBAOainxuwCncGiC
 Z/nPSZFEIH57yHZuNK1/Rj+cfx7EP4WZ+ddL1uzfFa0utBFLgQCP0re8dogMrwAtJwhiyOZue
 lTrogxyK+PskU5/sK+Vly+PmfNPzA1wVJgkXxf95TZ0CJ4PZTnvZwvcDc5fjS8EKPX+kVErJl
 n9saSuZgSwv0tZjcRwWE4ESFHIMT1cAcSXxnuhf6oLVP0FQGvHMPgpmBslQtg0EbjV5XpKD95
 J7lKSk6Sl+vzrGz7WGq3xvva/++JBW+uggzd/UtJBJiBNZg8C/hzBCeNHw0gO5sJAN5e/2R3z
 Yp/5r2u7atmRKdaaQGvhqaD4eUOr/oUbFTbwQw0yNOu/3WMqS0w6H/Qpb8h+Wz69wE7km5Jr9
 Y1fIdYdBlbc1FUAPeW6pqtByXx6LxVsORyL+PsBvoH+bJH/TTZ6aOsgpSZzHOEh4Sb7k7lIGm
 F4o1qgajLgxqMryKlSNAHvUM7ZcDaIdjnoJsW/oDu6zrZG8wSpBkMBi40I0KxUZq5jk+kOYWx
 UzVAKfzGYs+OdgAeaAMUFbWnKBoXTk6uv1OU/qa5MBJGjvWbgb046XCMeWFhKN/r9Q+H1pFNF
 ykOsulncQ6f+LqhM/eAbcZEUo07vhRYsj3JV/FRxYo8EGgNZZeoi/DnfMN9GhfZnm1Ht0WhS9
 oZ5hKekjcTWNeYEcmSCfq1fIVZvcoyZC7x1ehvf3ufHFd5CUCkFLD7pFcDbIBE/YPaeKefMFK
 AU04JBcCsczon/SAdmF+hC9hWMllEzqbAQ00cs5yFu9RP3K7yPEWkIGo8LoLM4Igx/PdJMi1S
 sQxHtA==

Hi,

Am 27.11.23 um 19:41 schrieb Florian Fainelli:
> On 11/27/23 09:44, Justin Chen wrote:
>>
>>
>> On 11/27/23 8:28 AM, Phil Elwell wrote:
>>> On Mon, 27 Nov 2023 at 12:39, Stefan Wahren <wahrenst@gmx.net> wrote:
>>>>
>>>> Hi Phil,
>>>>
>>>>>>>> Hi Justin,
>>>>>>>>
>>>>>>>> [add Phil]
>>>>>>>>
>>>>>>>> Am 27.11.23 um 07:02 schrieb Justin Chen:
>>>>>>>>> On 11/25/23 6:56 PM, Stefan Wahren wrote:
>>>>>>>>>> In contrast to the Raspberry Pi 4, the Compute Module 4 or
>>>>>>>>>> the IO board
>>>>>>>>>> does not have a VL805 USB 3.0 host controller, which is
>>>>>>>>>> connected via
>>>>>>>>>> PCIe. Instead, the BCM2711 on the Compute Module provides the
>>>>>>>>>> built-in
>>>>>>>>>> xHCI.
>>>>>>>>>>
>>>>>>>>> Does this work? I maintain this built-in xHCI controller
>>>>>>>>> internally. I
>>>>>>>>> wasn't aware the Compute Module uses this block.
>>>>>>>> i successful tested this with a CM4 (arm 32 bit,
>>>>>>>> multi_v7_lpae_defconfig) with eMMC. Before this series the USB
>>>>>>>> devices
>>>>>>>> (mouse, keyboard) connected to the host interface didn't work.
>>>>>>>> After
>>>>>>>> comparing vendor DTS with mainline i noticed the missing xHCI
>>>>>>>> block [1].
>>>>>>>> Unfortunately i wasn't able to get further information from the
>>>>>>>> public
>>>>>>>> datasheets. I don't know if the VideoCore does some magic
>>>>>>>> tricks on the
>>>>>>>> xHCI or i missed some downstream xHCI changes.
>>>>>>>>
>>>>>>>>> This block is held in reset and needs a bit toggled to get thing=
s
>>>>>>>>> going. Florian, just to confirm, this is our
>>>>>>>>> "brcm,xhci-brcm-v2" block
>>>>>>>>> correct?
>>>>>>>>>
>>>>>>>>> Justin
>>>>>>>> [1]=C2=A0 -
>>>>>>>> https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot=
/dts/bcm2711-rpi-ds.dtsi#L119
>>>>>>>>
>>>>>>> What's the question here? Does the XHCI block present in the
>>>>>>> raspberrypi/linux dtsi file really exist? Yes it does.
>>>>>> since i don't have any documentation about the xHCI block, i
>>>>>> assumed the
>>>>>> compatible generic-xhci is correct. But Justin seems to suggest
>>>>>> that the
>>>>>> xHCI block needs some special treatment and we need a specific
>>>>>> compatible.
>>>>>>
>>>>>> Did i missed some xHCI driver changes?
>>>>>> Does the VC firmware something to the xHCI especially on CM4?
>>>>> The firmware switches the on-board USB pins from DWC-OTG to XHCI if
>>>>> otg_mode=3D1 is set in config.txt, or if booting over USB MSD.
>>>> is this pinctrl/pinmux available from ARM via 0x7e200000 or a
>>>> different
>>>> IO address?
>>>
>>> It's in a different, undocumented block.
>>>
>>> Phil
>>
>> Well if it works, then maybe I am misunderstanding something here.
>> Maybe its time for me to pick up a CM4 board.
> There is one on my desk that you are welcome to use, or remote into if
> you prefer.
>
> To answer your earlier question, yes this is the same block as the one
> present in 72112 for which we use the "brcm,xhci-brcm-v2" compatible
> string, it would be preferable to have it backed by that compatible
> string in case we happen to support suspend/resume on the Pi 4B one
> day, if nothing else.
>
> I did confirm that after applying Stefan's patches plus changing my
> config.txt to have otg_mode=3D1, USB continues to be fully functional.
> This is the case with using both "generic-xhci" or "brcm,xhci-brcm-v2"
> so with the minor request to update the compatible to
> "brcm,xhci-brcm-v2", this is:
>
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
>
> Stefan, I am getting a deadlock on boot if I leave your changes in and
> uncomment dwc_otg=3D1 in config.txt, is there an alias or something that
> the boot loader should be patching?

sorry but i'm unable reproduce those deadlocks, neither in arm or arm64,
with eMMC or without eMMC, xhci builtin or module. If i uncomment this
in config.txt, USB host is just disabled.

I'm using the following firmware:

raspberrypi-firmware soc:firmware: Attached to firmware from
2023-03-17T10:50:39

Is this DTS difference a problem?

upstream=C2=A0=C2=A0 -> xhci: usb@7e9c0000
downstream -> xhci: xhci@7e9c0000

