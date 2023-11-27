Return-Path: <linux-usb+bounces-3340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 244667F9E01
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A77B3B20ED9
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 10:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2799B18C29;
	Mon, 27 Nov 2023 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="DEnGZ8mG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B5F111;
	Mon, 27 Nov 2023 02:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701082627; x=1701687427; i=wahrenst@gmx.net;
	bh=wuAXr7a3zbDnbtVJU7CNeO6mV9KsemSbkPnViW/x+N8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=DEnGZ8mG6EOaZOBsRJrpHLWDcYOIsDOFzdBdPL3NJGafNmlIzCadaoIFr1pNGkOH
	 Js0D1+16IEuSTB6AxN5Ay2FAtoF0WoTQj4y9PRAo/UPYuAXnF7rBS65oiMVuJM3Dz
	 uxny4padUrkduA4s9XsaQuk2tFeY41bZcY5ikxJ+U/PV4QGDe8JCM9B93w+PL4AZf
	 v3Y4OIyXGGhVwC6fDLZpawSRCAEae7Jyx2NvaBs9PUX1HtuIhjXKXJM+Xx6kbjQ9h
	 bt4jXVQ8X+92MR7H4dADfC036BiOO0B8XvRSpQl6MInF8GvrnGssCeWUisYrY99HN
	 9T5+9dgFYqSDb1Mdbg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGNC-1qpLQT1458-00JHjr; Mon, 27
 Nov 2023 11:57:07 +0100
Message-ID: <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
Date: Mon, 27 Nov 2023 11:57:05 +0100
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231127003432.7aztwjxper2a3o33@mraw.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pqpo7ZuF10VhdzjMtTTqHOJho1s81dHreoX1FQSyLixwL39Wkig
 dXTqpVokUOAlwpSJz9QvEllkvU2AG4Fiop5KdUjfCZX77hd34bxG0oEBJY7CiUxiydiDHY/
 S6OABtKkS1+qCp9v4/UlNsuX5rD3t53EcFFl9udNmzrBJeVHQT0HFBJXgKnzK0w96/pRTOD
 mrEUloCrZqD5lV2/hE+oQ==
UI-OutboundReport: notjunk:1;M01:P0:M0Gnxm6/rVM=;dM5isbqdCnPfzcgJ71lKO32FqYL
 VrVKTR89qdVFaecEN/0Ix1RYK6tR/93IdhpKIufSkr8LawgxDFsxBRUnkp7MTT0RK7D3otNqs
 gsXPX19THSDYkcOMU+L6RXnQbY4Z0E8YqoPuAzULvf80NxuGR/0AvjxDEmzx513hM08kwxwG0
 aIQs2++VPr6TNJ2OJ+KKCfiPatXfSjeKdcEvXatZ4rmc0gfBfnyJVTsOTW1kLM7nCg5lsxJzR
 17UFB+Ob1f7vPHLG56OgLGFDLrZlCRO6UuknZ4TJH+KJUhtqcI08RYKzs3Bi4XAyLqEAzZuSp
 HBqX2IXt7h9Mfw655nUX6WJ7bU7oOllhCZFtr9CLl/3uIoNkO+wyv+p4VDWnYlqWLP4J2OSBs
 wlWaIdVG6FRUqIYH+nRoCNM9/LsPf60GQekqK+haDOlRREkkM1ahh6Po2/ZYUfCN0Dwt31KQx
 +fv6+0CoFOSyrh/c6biL/TReel5CE7xxJj8k1vn54eWnvdmSRbBLX7h2VrJfJY5Ia5HhHfrid
 hNCFqQlr9ZXuMqfBLKwPbt4LE4ioirpPZoMSCkMPr9q8R42vDJrf0luhQaL8R+oH4boI7SQDv
 mxHVnjROgyX2LtCDLmJ7qVXK8SRkWoiHhDhGqxn7e5edmGaRcCQaE54TnxSSfiQxPPzANimcS
 bY8wjZsbyQxPTAF+ITUKHWUhOwZdkHTNRMVJvW+Y0dugDOcJppOKWD2HEyq4TuEkiMB4uukna
 eBTPZqRLSIL+LB7fmuMXu3MQeY9u9vWlL9ok5XJRG3Mb0ZdGJqZarO20dbMEikT3YbVUiiqVI
 zxNCNlVqzJn9nUY/2V/kPc6IjCadaZoF1C4A/wlrTQ3ERHancB3/iGgK+gbNCrKefAE4X4IYW
 /yHhyRlseTdblfbrx5QRrALepl6I1fUiQ4uI/3mmFmiwmN6PAE4hHynSD0Nw9Qpz3Kj1Hnmxg
 QuLgvnOXm+GgbicER80N8IoH52s=

Hi Cyril,

Am 27.11.23 um 01:34 schrieb Cyril Brulebois:
> Hi Stefan,
>
> Stefan Wahren <wahrenst@gmx.net> (2023-11-26):
>> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
>> does not have a VL805 USB 3.0 host controller, which is connected via
>> PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
>> xHCI.
>>
>> Stefan Wahren (3):
>>    dt-bindings: usb: xhci: Add optional power-domains
>>    ARM: dts: bcm2711: Add generic xHCI
>>    ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
>>
>>   Documentation/devicetree/bindings/usb/generic-xhci.yaml | 3 +++
>>   arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts       | 9 ++++++++-
>>   arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi             | 5 +++++
>>   arch/arm/boot/dts/broadcom/bcm2711.dtsi                 | 9 +++++++++
>>   4 files changed, 25 insertions(+), 1 deletion(-)
> I've tried applying this series on top of v6.6-15365-g305230142ae0 (the
> base commit for Jim's v8 patch series regarding PCIe/clkreq[1]), since I
> know the unpatched kernel is working fine with a CM4 Lite if there's no
> PCIe hardware plugged in.
>
>   1. https://lore.kernel.org/all/20231113185607.1756-1-james.quinlan@bro=
adcom.com/
>
> With those patches applied, on the following hardware setup:
>   - CM4 Lite (and SD card)
>   - CM4 IO Board
>   - Ethernet
>   - HDMI
>   - Serial console
>
> (But neither USB storage or USB keyboard.)
>
> I'm seeing various failure modes, but basically the system no longer
> boots. I'm a little short on time right now, but if the following
> excerpts aren't sufficient I can adjust logging to capture a full
> trace for one or more of those.
>
> This seems like a showstopper on its own, but if you'd like me to try
> with an eMMC-equipped CM4, I can do that as well.
...
>
>      [    3.118407] xhci-hcd fe9c0000.usb: xHCI Host Controller
>      [    3.123745] xhci-hcd fe9c0000.usb: new USB bus registered, assig=
ned bus number 1
>      [    4.172083] ------------[ cut here ]------------
>      [    4.176768] Firmware transaction timeout
>      [    4.176825] WARNING: CPU: 2 PID: 143 at drivers/firmware/raspber=
rypi.c:64 rpi_firmware_property_list+0x250/0x270
>      [    4.191121] Modules linked in: xhci_plat_hcd(+) xhci_hcd genet(+=
) mdio_bcm_unimac crct10dif_ce reset_raspberrypi crct10dif_common of_mdio =
usbcore i2c_bcm2835 sdhci_iproc fixed_phy fwnode_mdio usb_common sdhci_plt=
fm libphy fixed gpio_regulator sdhci phy_generic
>      [    4.214527] CPU: 2 PID: 143 Comm: kworker/2:2 Not tainted 6.6.0+=
 #1
>      [    4.220880] Hardware name: Raspberry Pi Compute Module 4 Rev 1.0=
 (DT)

thanks for testing. Are you absolutely sure that you are using
bcm2711-rpi-cm4-io.dtb from the mainline tree?

I would expect the following hardware name: Raspberry Pi Compute Module
4 IO Board

Be aware the arm files has been moved into a broadcom subdirectory.


