Return-Path: <linux-usb+bounces-3710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B60803F4C
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 21:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A28A1C20B4D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 20:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B4B35EE6;
	Mon,  4 Dec 2023 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MOpaONUy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF437B2;
	Mon,  4 Dec 2023 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701721675; x=1702326475; i=wahrenst@gmx.net;
	bh=fTRwEfLfDHF5KVvDI7QHlDWTuFTPls3sfEh3mRjjyq8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=MOpaONUykkpzlXFzc744rJFvGSEwxKZldhuSdeQyjEzYeLBqpcobMekGNqxaRK3M
	 EV3OCJ0EbA15A0OmZCOMSY5/JJaF+8LS1+syagEdub8yEeBT+7kUll72o6/2kw9Qv
	 EjHx9GVTXfJQ39wYHJfLxKPMzdBPXA8yV+X58XwP+fADJlLwaWTvqzcZ6C2o9SC3R
	 QrTgR8xrUtbQLftcbAhtzK23BGQwMkty9q9tLrpYxKQEOr1ZPfChOZUvBdaiKFAoS
	 Z1nJ9pdO+eP3m6Htkqrk3dN9/YrlW9jaTG8sdEgsrSj5F5NXfaTt8b6xakf9YknUI
	 SnoRYuvJv3E1C3+qag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1rUmVR30j8-00x2Hs; Mon, 04
 Dec 2023 21:27:55 +0100
Message-ID: <c26b1792-567a-4156-8907-df3472f843eb@gmx.net>
Date: Mon, 4 Dec 2023 21:27:54 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-bindings: usb: xhci: add support for BCM2711
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Conor Dooley <conor@kernel.org>
Cc: Justin Chen <justin.chen@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 bcm-kernel-feedback-list@broadcom.com, Cyril Brulebois <kibi@debian.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231202232217.89652-1-wahrenst@gmx.net>
 <20231202232217.89652-2-wahrenst@gmx.net>
 <20231203-chair-zen-afb8b280ca2f@spud>
 <20231203-traffic-aide-cb03afdb3546@spud>
 <7dd529a0-ebee-4f3b-879b-c7b1033cfdb9@gmx.net>
 <20231204-sevenfold-slashing-bb7ea3419c92@spud>
 <0f7fa9f1-2337-428f-8a76-a5b4cac30677@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <0f7fa9f1-2337-428f-8a76-a5b4cac30677@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NuJfc8/4ZJr56Gh+x1L5tCZvXqvdAozgpHTPFfaIghiNwgcoqkV
 5G743pp7+Tf2volcqIVqJpVdfUsmZiQ40tndGq01lIV2zvBxeIoaTXJzsYerhtC4ANFAlDM
 DutbY7dCPLtRc8IMHJVlwJWkRP43CFQiBp5cu7RCQjNmhqbi7KOAKu/T1oGXExTwOTuZgCf
 FQIlRBVaY/ck0C9rL1Mvg==
UI-OutboundReport: notjunk:1;M01:P0:1keIyLSkN2Y=;OWCga5yjftaRDMqVrAbJb0vAL2Z
 8vBJ0JLmvNV5Esa9OA4JcuVXKfZPH9n+A/OGnyvqpM1sCSlb+6xl0tjoXZo+ndmMIvS0zsSG1
 orzXKZFQidAE7f8Ik1iRPSgALvJ9PknQ1yyvOpV1DrFFCNUYpJBPdRvQAW57Ys60/b6MHUlmy
 jYpZmc5MINISWaRvgiWG28ZIZqdcPnSyTroPfeS73KQEtXs9thvQY+Rp0+nGAHAQz390ErjLg
 17UJG6Ob9vLFJQ8OxM+WxI7vxQUF3YxTbh5nsvMSxQu7b9APkogk6nGwrzjzPSbXL/ISJZo2B
 X9imtQ4xYRl6PECjlU59tFHUZ/1/oBZfBOShnfUiifyKcT51k7OpzIdhh7yJy9XzxbLMJWC9p
 AO5uCB0/u2Nd8Xh440snT4bQnPSlyg/tuOh40uXB+6SGKHbQ/rQiAIXZFt1BXQsUXe87VXAZY
 48bId6vu7+/UDz7PzMLk9BbDmybT0M0kX04yfmJUXujGjotM7GM5vSrYmywYul9qJtL77zoa+
 QsnQiHsSpqKsGPpR7xyE+09q4azBbVnf0W3x6hjSQMScoGxkI/VwrBdpxkmeYndHhrIpXBmkA
 VYlB7iGKBAjcysHxsLJaPkdxpaTCJEwjDxFoA+8wdy2/gsD41YolOCRk3SrnH71ch5Ddj5dNt
 B+IDMugiaMN8hHMu/RHLHSkgRB6A+W3qeZ+8QAz+T80VD+FM2QVxXSiBF6iMGGO+oxqzdbu8d
 e8psDFTovwaSUhLK+WootHTCi4teAgQpCsvhMHygTaDDsvuPoqPWVqXZ+lmv/Z1KQ4F+j11Z4
 o66cL+kF8QyM75CtkOw/Ot9SdVVyjOHqewI2LP3758MP6bE8CSnsjgz6FfpVE0WEVvdWFVmkK
 7arfmqnzHFok4vdTqU3wU43bCED575Q6ASuYRL22LiYXfk3OylS56xOniQh+uqqhaUVn7l2TO
 h3LwXqqiVxPuFqweWHMAR2Vqaog=

Hi,

Am 04.12.23 um 18:49 schrieb Florian Fainelli:
> On 12/4/23 09:04, Conor Dooley wrote:
>> On Sun, Dec 03, 2023 at 05:56:24PM +0100, Stefan Wahren wrote:
>>> Hi,
>>>
>>> Am 03.12.23 um 12:11 schrieb Conor Dooley:
>>>> On Sun, Dec 03, 2023 at 11:06:43AM +0000, Conor Dooley wrote:
>>>>> On Sun, Dec 03, 2023 at 12:22:15AM +0100, Stefan Wahren wrote:
>>>>>> The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2"=
,
>>>>>> but also requires a power domain.
>>>> Hmm
>>>> This & the driver change makes it look like your compatible setup
>>>> should
>>>> be `compatible =3D "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";.
>>> i don't have insight into the hardware, but the fact that the other
>>> Broadcom SoC didn't require a power domain before let me think we
>>> shouldn't do this. Otherwise this binding was broken before. But Justi=
n
>>> and Florian could clarify this.
>
> That seems to me like the right approach, the XHCI controller in 2711
> is tied to a power domain, however that is not the case for other
> Broadcom STB SoCs.
before i send just another trial and error version of this series, this
what i understand:

diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
index 594ebb3ee432..6f8744d1ace7 100644
=2D-- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -9,9 +9,6 @@ title: USB xHCI Controller
 =C2=A0maintainers:
 =C2=A0=C2=A0 - Mathias Nyman <mathias.nyman@intel.com>

-allOf:
-=C2=A0 - $ref: usb-xhci.yaml#
-
 =C2=A0properties:
 =C2=A0=C2=A0 compatible:
 =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
@@ -25,6 +22,11 @@ properties:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - marvell,armada-380-xhci
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - marvell,armada-8k-xhci
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: gen=
eric-xhci
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Broadcom BCM2711 SoC
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - brcm,bcm2711-xhci
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: brcm,xhci=
-brcm-v2
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Broadcom STB SoCs wit=
h xHCI
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,xhci-=
brcm-v2
@@ -49,6 +51,9 @@ properties:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: core
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: reg

+=C2=A0 power-domains:
+=C2=A0=C2=A0=C2=A0 maxItems: 1
+
 =C2=A0unevaluatedProperties: false

 =C2=A0required:
@@ -56,6 +61,20 @@ required:
 =C2=A0=C2=A0 - reg
 =C2=A0=C2=A0 - interrupts

+allOf:
+=C2=A0 - $ref: usb-xhci.yaml#
+=C2=A0 - if:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const:=
 brcm,bcm2711-xhci
+=C2=A0=C2=A0=C2=A0 then:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - power-domains
+=C2=A0=C2=A0=C2=A0 else:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains: false
+
 =C2=A0examples:
 =C2=A0=C2=A0 - |
 =C2=A0=C2=A0=C2=A0=C2=A0 usb@f0931000 {



