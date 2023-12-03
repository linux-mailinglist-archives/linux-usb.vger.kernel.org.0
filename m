Return-Path: <linux-usb+bounces-3620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8998025CA
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 17:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C4F1C20942
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 16:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BA31643D;
	Sun,  3 Dec 2023 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="PYnJoJyK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EF6F3;
	Sun,  3 Dec 2023 08:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701622586; x=1702227386; i=wahrenst@gmx.net;
	bh=tRP6BrTRk1GtQs78xeszswu5cMfOHdwOWb4VV2A2ZF4=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=PYnJoJyKn/Fx7cAR3W6cqm36Xt73h6neV74U40fuVqzinQSWSpjcoOdEJZdSDe0/
	 CZYux+p255r/n3VjAPYm0K6nyw6h3kR/aaI+KaZJfKwDO/1z77g84EmjtrfN2/UQ/
	 9rCIvAxGFCIWXOMGwq0nHxuRl0nPOzyeTX4YXT5Q764JCxW9khCkTSOr2X1YLt7iC
	 r4I01RiotM5Y7Wa/IUVpL+zf76FWBe3Pg8kYrsc/eDtZZ0pRwmVmLtgNj26n6QVrq
	 CftAgJBnzgguAJOh1ppg07Je7FXLtzEfPHeTwMfSvz6Zb7hRclmUdhFo8YmqMro3g
	 4brIBRWqQlxlvMV2QA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.130] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1qh0Mv29p1-00UWz1; Sun, 03
 Dec 2023 17:56:26 +0100
Message-ID: <7dd529a0-ebee-4f3b-879b-c7b1033cfdb9@gmx.net>
Date: Sun, 3 Dec 2023 17:56:24 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] dt-bindings: usb: xhci: add support for BCM2711
To: Conor Dooley <conor@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Justin Chen <justin.chen@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231203-traffic-aide-cb03afdb3546@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:57ZWdztn7nG7UVMkRZWPzK3rBPm+idGw8u9SpKKyRVp7WZYzhLo
 CSrw0j41kIsjnAz3msQiVvGXbZlIggtk4H6iEoR4F//kMzLvbCOVpvO0jxyZNuQjZOw8vVq
 S7mAVWwaY9svt65fcRPWi0z4zrZDTNgmUQIWIK+G60DvvFWrhLDeVdmST38q6626CPVPR9x
 R5I9O0tuPQBJXKwi5MhvA==
UI-OutboundReport: notjunk:1;M01:P0:iBWZ4jTwWqo=;L993cU8qd6epOofaELofyPBIFZv
 orTbsIH0fK6e+nDi9zAdX0ZGDm7MRlllz7VYTBYIwgzxp1ytVs8WcaG/UxpITlTagM0EBd/Vz
 /c9FU7wUTHjMgLzDk3qjXQ4RD3KTJ7AcgStkITUIPgIywi3e4yShTVhUaDSbVzegujHsx5VAC
 4iO+PBksdEV/TwJuwx72t9J8PYz1NH138uEz1pdnejB5oByniVBJmmnUm5L+mIY1Cb3fVZcfo
 h9u3reLM2N6VLxhze4QY3iED+vTi0So98rBDF0MnEojMzreXD9l/oAAqlfKQ27yYSHhxalBZa
 6pOLxhNk50b/sWXI80D7aj6whTITbG8bvQij9ALp40XvKSbkQ/WVYH3LAo8qx9BKGzqbAusU/
 VIxENOt6N4dVodTa+aFj5ywk7TBOzFL1RP5TiCnqHsmrq7fDHmjNCeiVU9ZYfxsNMqr70s/Jp
 3azE5meCaIaw6bAfuCfNpdAP2/XKL2hyVBJg0JFPtS2Fn0m2YRLsBdK6PeiHfAIeUYHCmI+pc
 SOW3Pw5aJJU/oxhDi70R1dwHjwtUeg1JDeMWlgGBv9Itrnj7jd0mqu6vldSlUNPCN0i3tyQLV
 N4zXk2sATj4RRwSANDr5s7FXoVFYrovIvrUCUtbgOAfRt6qLRnZBkblD4V09IfWPLKvFvetkM
 G/QIgVXL15DaspeKiwm9mqhBZiIT07CEkDxfpRmbOKds41DwyObemYpXp3kFg5T03sSIeptRt
 tNThas2Am/OMrj5w4bgSU6l6OkBFNXrxFxUqNT+jAvMaMLCaLQ3wFG9cKS9YX0qbBzc//XjMG
 g3KkGO25BzgsVUU8/Fo2gi7wv1NXFBsCje6q0C0hqNKe03C6nXQqmkIvfnEDIjMJlVDB0IGSj
 zEY2ZVFUMOImvDsSlcIZcBJK5XCMNGGNmIxY7wM+MLor5mmNahnADYLisbTxcZLTMAgW4FzEj
 TdjPpZkggFL1CGOHqEsNLpiZGGA=

Hi,

Am 03.12.23 um 12:11 schrieb Conor Dooley:
> On Sun, Dec 03, 2023 at 11:06:43AM +0000, Conor Dooley wrote:
>> On Sun, Dec 03, 2023 at 12:22:15AM +0100, Stefan Wahren wrote:
>>> The xHCI IP on the BCM2711 SoC is compatible to "brcm,xhci-brcm-v2",
>>> but also requires a power domain.
> Hmm
> This & the driver change makes it look like your compatible setup should
> be `compatible =3D "brcm,bcm2711-xhci", "brcm,xhci-brcm-v2";.
i don't have insight into the hardware, but the fact that the other
Broadcom SoC didn't require a power domain before let me think we
shouldn't do this. Otherwise this binding was broken before. But Justin
and Florian could clarify this.
> If the pattern in this patch was repeated, we'd have to modify the
> driver like your 2nd patch does for each and new broadcom system that
> needs the power domain.
 From my understanding the DT compatible should be specific as possible.
This is what i did, especially because the Raspberry Pi boards tends to
needs some quirks.

Best regards
>
>
>>> So introduce a new compatible
>>> and the specific constraints. Since the key allOf can only occur
>>> once, merge the reference below.
>>>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Cheers,
>> Conor.
>>
>>> ---
>>>   .../devicetree/bindings/usb/generic-xhci.yaml | 21 ++++++++++++++++-=
--
>>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b=
/Documentation/devicetree/bindings/usb/generic-xhci.yaml
>>> index 594ebb3ee432..b6e10b0a3c24 100644
>>> --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
>>> @@ -9,9 +9,6 @@ title: USB xHCI Controller
>>>   maintainers:
>>>     - Mathias Nyman <mathias.nyman@intel.com>
>>>
>>> -allOf:
>>> -  - $ref: usb-xhci.yaml#
>>> -
>>>   properties:
>>>     compatible:
>>>       oneOf:
>>> @@ -28,6 +25,7 @@ properties:
>>>         - description: Broadcom STB SoCs with xHCI
>>>           enum:
>>>             - brcm,xhci-brcm-v2
>>> +          - brcm,bcm2711-xhci
>>>             - brcm,bcm7445-xhci
>>>         - description: Generic xHCI device
>>>           const: xhci-platform
>>> @@ -49,6 +47,9 @@ properties:
>>>         - const: core
>>>         - const: reg
>>>
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>>   unevaluatedProperties: false
>>>
>>>   required:
>>> @@ -56,6 +57,20 @@ required:
>>>     - reg
>>>     - interrupts
>>>
>>> +allOf:
>>> +  - $ref: usb-xhci.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: brcm,bcm2711-xhci
>>> +    then:
>>> +      required:
>>> +        - power-domains
>>> +    else:
>>> +      properties:
>>> +        power-domains: false
>>> +
>>>   examples:
>>>     - |
>>>       usb@f0931000 {
>>> --
>>> 2.34.1
>>>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


