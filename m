Return-Path: <linux-usb+bounces-3342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC467F9E27
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 590AF1C20D6F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762DD18E28;
	Mon, 27 Nov 2023 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="rM3/Rr/a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5851093;
	Mon, 27 Nov 2023 03:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701083327; x=1701688127; i=wahrenst@gmx.net;
	bh=XY4niUA2BLlbUEpgZEcLc0jhmNTnqITIi8toHsOZdCg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=rM3/Rr/a8YixD9HXl4DXaT1wkaZm8im8dS4J2yZxu7ZKs/c2AtR3bWjeZNyTqtiR
	 bR/BbZB4pvdiTosZjlnWKcDRjItaCoURB4Lb8/w+JYuXyUeXyUCVUfQQF7Q5ypZkl
	 5/VBHzLVY6Ff69mfucIfugDIrh24mR8eVwSJ5TmehcsX4duARhPkkQ4l6wM0LCI2W
	 RB0ov9QIt/s1u8EZz+VLEYWUSUZ7x7zJvCjmXooTl74f5z2Fn9+xdWVZ0Bs9xNej3
	 TRS17aWp9m+H5aX9T9vmJWcq4hpYCUrTizmgE+0oO4SUwe1jWxXoe2mt7eq8ZWppp
	 wOmuj1VJG9YxqEPF8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQeU-1qyC4n1AbG-00AWwL; Mon, 27
 Nov 2023 12:08:47 +0100
Message-ID: <46320840-09ab-4c86-90c9-bee7b75f248a@gmx.net>
Date: Mon, 27 Nov 2023 12:08:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Content-Language: en-US
To: Justin Chen <justin.chen@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Phil Elwell <phil@raspberrypi.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Cyril Brulebois <kibi@debian.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <53e1f6e6-a28e-45af-991e-75b283a21b34@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ivVir0qMd19/dKE5WNKScnFzNG3A7JKKY35vT0/MJVxf1rrEOQS
 iV0+y+I4bnXE+mVqLKpMpMA8DlBEw3UcQ0znE8PF57Fj8HlZDozAJqd1mhRee7EYOICYm7t
 iZW6EGxx31bnFgCIVs2iUsDtH8j29qSYqGC3joDxyRjcG4Dgm29zctGl8A26fu9wS5UCA/r
 jwk9eLlY9Sq/iRYwp1qOQ==
UI-OutboundReport: notjunk:1;M01:P0:PCriccJkO5o=;tXcHVchL5nKoZjE7wfC0CZ/txrj
 VSHmpmOQddMYVALc/BJx883D8xvUJ6zTlEcM39Az/5V3tH4hXCxpJLcDaSj6kjIsS96qVHaPD
 p+iLfgfuj+VLRZcxEUienLZdBe3m9v2AmkrwyJgsuvDamUSgsCO9JRIikzomH9gNF+Q9jakbq
 QY0PS06sd6xE7oIrsHDfleJu3yf06z7GViD6+U5HYHzd1cjKnCiaQAvF9vIC9Lu+7onuoES9b
 bF/xJjUJilIM/7BZHDADTCi1FBFY0q39l+U18ePpCbSxwvBUXIXiZpuFOnS6Og7NbHMqVbCoM
 Od1gTUi9do1a/qFsKrrWhoHrY8loEd9qj+rXMo0ZFQzUrQRykhokhkJxtJaRLQnx1Ks/druq5
 xCyA7e8GVG6fT1mObmD5fbTS8xd894F5Krl/jKGD7RskaftGvB7ZYh8Kq921ybuee9iJ23M0I
 DH5my3wA/WhgUGKAF5X6HLndvI+AjNhcsM/7DwzZfBW2O6RqqQx7FTaPzZDsYLUwCSLnhWaxA
 OvvVH4ZVczC8vjFZhu2kYGbyeyBS5CE1GYe1tzwSsXwBq6z7jDV6GGddU/aOoecA7BEUbsHbK
 aZamKIr6PvtaVvTJUS8hKugGs/qts+6DeHRrt9jRZnno6qlt7tD+ETPZj9zYR1Leg3uay2V4E
 +Z/+GVo2q8zBakKUMkCawwfwGqkZ5aSsHW2Cr0zfjLF5rsLX3gw0sPzD13L9lqWXi9MTHvk9w
 Cw72lqdEq5EOjuboEEcM9VuaOIH6Kwu7mBp6440PW08Fq9VIvqPYkFfqvkz9+xZ9/Jkm2ENXn
 Fry66X3rLaotbniEmx9kUvKCu0z51SdxGvMLc0Tz7Z/e/nl6WJ2FBHbHVFhhFzUjG9EjRO6p3
 YSXDpcXN4EWzP1B6bwY483aK5YA/jDHC1vhcLFMVe57H8DR2WNWNSbyDEa/Ie8WdyfcixWVLZ
 lk5lxMrDEPQBIO6J/nJko9T1woQ=

Hi Justin,

[add Phil]

Am 27.11.23 um 07:02 schrieb Justin Chen:
>
>
> On 11/25/23 6:56 PM, Stefan Wahren wrote:
>> In contrast to the Raspberry Pi 4, the Compute Module 4 or the IO board
>> does not have a VL805 USB 3.0 host controller, which is connected via
>> PCIe. Instead, the BCM2711 on the Compute Module provides the built-in
>> xHCI.
>>
>
> Does this work? I maintain this built-in xHCI controller internally. I
> wasn't aware the Compute Module uses this block.
i successful tested this with a CM4 (arm 32 bit,
multi_v7_lpae_defconfig) with eMMC. Before this series the USB devices
(mouse, keyboard) connected to the host interface didn't work. After
comparing vendor DTS with mainline i noticed the missing xHCI block [1].
Unfortunately i wasn't able to get further information from the public
datasheets. I don't know if the VideoCore does some magic tricks on the
xHCI or i missed some downstream xHCI changes.

> This block is held in reset and needs a bit toggled to get things
> going. Florian, just to confirm, this is our "brcm,xhci-brcm-v2" block
> correct?
>
> Justin

[1]=C2=A0 -
https://github.com/raspberrypi/linux/blob/rpi-6.1.y/arch/arm/boot/dts/bcm2=
711-rpi-ds.dtsi#L119

