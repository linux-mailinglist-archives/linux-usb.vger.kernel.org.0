Return-Path: <linux-usb+bounces-18397-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA19ECD32
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 14:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43ABA1887E68
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 13:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9A622C351;
	Wed, 11 Dec 2024 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RV4yZDiP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125822C354
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733923789; cv=none; b=XJbxhjxa6QgRoukkUbOrew+OY9gj67otCFC08RTZ+kbeQ6R+eboxh5rm0TbbJjVlHflRT8W1MlaJPs13J5/h6Tvhx1CfCTIfNinpp9I0I+J911aIjTq3FJYHSxKN7SA+2HbuvEGSKm70bCF+f40HzQYttbasjC4UKwmmDxi9ogk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733923789; c=relaxed/simple;
	bh=4YXjyAoD98+cfiKscwgre+GWi+bFfECJxhiIsEr0EBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwrokIgkW7f+9qJ1ZPRQ8D4AP4/QARAogO3hkostK39df8qOUaNJhmnJ/R5sTU/uqfTBUPgcXEfb1kgKw7JkAtpM4gVjpGis47OrN34sON9dHxV83oSekg6sltokBmPz8wEqg8dXPhVB9PP7OtIZaihoa9oID58sjtx0nCAsU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RV4yZDiP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434e69857d9so4212835e9.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 05:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733923784; x=1734528584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAzVPgqaMUfEWjQsC1i4irC02Ex7gL3bmsg03DGegR0=;
        b=RV4yZDiPXoFWF10cXkxm9RGlEXNfHcpyhrKFxRvKvT6TjbrMQUq4nQuoREFKitb0zp
         U+DFbbh6SpJInkP37On80o5w3UQQ1BDOBYkO3I9yB1finZjNyZaHfuUWEVAAKE5M6i0H
         oJRK9QTO34l2i7pj2qnp5tzcgUXorWb1yxWRFyeWgfuGvyDitD+kTQet3Qh7ysFMuHY6
         lMVNuk3QYQc4Ed1UHycztPTmelad6jHdQlAnsKoe7veeeHuaurIQIB5+L1G0k5KCPd0R
         oRLzkRy9/f48r+pimJ3se7LUXf289/EACuQus4hZrFK08mqQZ2wQSo5chXSucG7dgIDd
         9djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923784; x=1734528584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAzVPgqaMUfEWjQsC1i4irC02Ex7gL3bmsg03DGegR0=;
        b=TRDm7HArujQNmF7LqhqPxBUpIDIEjjVhuXpDxyKuMAvqyPmRV/8noIPqgpoKJ3aBul
         OePCDnzVO5HqYIgZDuJ4GQfcaxwZWLfNzo6o1Tb8DpdQR1qWvKAu1ns56PUSigJhfNgV
         ud1b4aWwGqccIvAQCHDS2gxcUyGwz+ame7IVCzaEO5OfNeyouWB12VDSM+7nma0/cR1b
         QLz2XRwDdn6alMY0PyEa5/mKAoFlsV43b6X6IMF961Owmbi9MPYG2viz5WH78Q6xPEeE
         pTXivTUPNxFMZyNCO7lq4HQwlwHoM9O1N1A9oY7NCvwcaFbeoYWYwDFEBoiup3Coji4+
         lY7A==
X-Forwarded-Encrypted: i=1; AJvYcCV/q99IPkdqsyef+fZ/qDekKNcT5pMwzflmbbGxIqHRqLca9TTrNVRw/NqZFuO4gl1uLZnZ73Lt4Xk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8u6DfvIQjjuCCMwAYtHk1knexdDPxtI3TOk9MARPduC+fuIBq
	EgHkspaI97p2NTfhv333EPzTv49zT0mx6cBmqib+MhhZs9419B0GXWEJ5dGjgCg=
X-Gm-Gg: ASbGncv6icYTYxWLrkFU7dVA7RhHgrRbLBUwUQde1vyH1cIjLJxUL28CvdKGXBDp8oP
	4fa6opART5NSdC/m81ZsCPREuZ3ZbruadRsv3bKDJil4wYfd19oG7yY0DtCoQXezir4lnI2vav0
	5wavN1igpHtn0nfajCAspQtt+yC98eBlBkAXiKPHHflA/+ubX1yxgrzI029Z/X8dFBkBvM4ThWa
	ditv1q/TMJ+5xcY2bQ85dtAQhgiD+8M/1J2/fVLqM94IoKdxommwDF1CPTqoi4=
X-Google-Smtp-Source: AGHT+IGcI12gDXybQxwcAzQEejE9ZVyUNB6RappGD5rtEDkW1ikp9QuBYtlqVjXICVCqXZ+/45HwDA==
X-Received: by 2002:a05:600c:8a3:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-4361c5a2ec2mr18849105e9.4.1733923783947;
        Wed, 11 Dec 2024 05:29:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f063357csm141361975e9.22.2024.12.11.05.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:29:43 -0800 (PST)
Message-ID: <5418a6e3-0f90-4922-ac91-c16da9677b32@tuxon.dev>
Date: Wed, 11 Dec 2024 15:29:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Add #renesas,sysc-signal-cells
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, gregkh@linuxfoundation.org,
 yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
 <20241210184542.GA4077820-robh@kernel.org>
 <437b8d13-8ec1-40c7-b95c-ddb836e123d6@tuxon.dev>
 <CAL_Jsq+sdX+3R0USwfYT2yqC9aTGc+LzwyPsQiT770fJ1BgEAw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAL_Jsq+sdX+3R0USwfYT2yqC9aTGc+LzwyPsQiT770fJ1BgEAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11.12.2024 14:46, Rob Herring wrote:
> On Wed, Dec 11, 2024 at 6:23 AM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>
>> Hi, Rob,
>>
>> On 10.12.2024 20:45, Rob Herring wrote:
>>> On Tue, Nov 26, 2024 at 11:20:36AM +0200, Claudiu wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The RZ/G3S system controller (SYSC) has registers to control signals that
>>>> are routed to various IPs. These signals must be controlled during
>>>> configuration of the respective IPs. One such signal is the USB PWRRDY,
>>>> which connects the SYSC and the USB PHY. This signal must to be controlled
>>>> before and after the power to the USB PHY is turned off/on.
>>>>
>>>> Other similar signals include the following (according to the RZ/G3S
>>>> hardware manual):
>>>>
>>>> * PCIe:
>>>> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
>>>> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>>>>   register
>>>> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>>>>
>>>> * SPI:
>>>> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>>>>   register
>>>>
>>>> * I2C/I3C:
>>>> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>>>>   (x=0..3)
>>>> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>>>>
>>>> * Ethernet:
>>>> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>>>>   registers (x=0..1)
>>>>
>>>> Add #renesas,sysc-signal-cells DT property to allow different SYSC signals
>>>> consumers to manage these signals.
>>>>
>>>> The goal is to enable consumers to specify the required access data for
>>>> these signals (through device tree) and let their respective drivers
>>>> control these signals via the syscon regmap provided by the system
>>>> controller driver. For example, the USB PHY will describe this relation
>>>> using the following DT property:
>>>>
>>>> usb2_phy1: usb-phy@11e30200 {
>>>>      // ...
>>>>      renesas,sysc-signal = <&sysc 0xd70 0x1>;
>>>>      // ...
>>>> };
>>>>
>>>> Along with it, add the syscon to the compatible list as it will be
>>>> requested by the consumer drivers. The syscon was added to the rest of
>>>> system controller variants as these are similar with RZ/G3S and can
>>>> benefit from the implementation proposed in this series.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - none; this patch is new
>>>>
>>>>
>>>>  .../soc/renesas/renesas,rzg2l-sysc.yaml       | 23 ++++++++++++++-----
>>>>  1 file changed, 17 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>>>> index 4386b2c3fa4d..90f827e8de3e 100644
>>>> --- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
>>>> @@ -19,11 +19,13 @@ description:
>>>>
>>>>  properties:
>>>>    compatible:
>>>> -    enum:
>>>> -      - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
>>>> -      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
>>>> -      - renesas,r9a07g054-sysc # RZ/V2L
>>>> -      - renesas,r9a08g045-sysc # RZ/G3S
>>>> +    items:
>>>> +      - enum:
>>>> +          - renesas,r9a07g043-sysc # RZ/G2UL and RZ/Five
>>>> +          - renesas,r9a07g044-sysc # RZ/G2{L,LC}
>>>> +          - renesas,r9a07g054-sysc # RZ/V2L
>>>> +          - renesas,r9a08g045-sysc # RZ/G3S
>>>> +      - const: syscon
>>>>
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -42,9 +44,17 @@ properties:
>>>>        - const: cm33stbyr_int
>>>>        - const: ca55_deny
>>>>
>>>> +  "#renesas,sysc-signal-cells":
>>>> +    description:
>>>> +      The number of cells needed to configure a SYSC controlled signal. First
>>>> +      cell specifies the SYSC offset of the configuration register, second cell
>>>> +      specifies the bitmask in register.
>>>> +    const: 2
>>>
>>> If there's only one possible value, then just fix the size in the users.
>>> We don't need #foo-cells until things are really generic. Plus patch
>>> 8 already ignores this based on the schema. And there's implications to
>>> defining them. For example, the pattern is that the consumer property
>>> name is renesas,sysc-signals, not renesas,sysc-signal.
>>
>> OK, I'll fix the size in users.
> 
> You already did for the one in this series.
> 
>>>
>>> Maybe someone wants to create a 'h/w (signal) control' subsystem (and
>>> binding) that is just 'read, assert, or deassert a h/w signal'. Perhaps
>>
>> Until then, is it OK for you to keep it as proposed here?
> 
> Yes.
> 
>>> even the reset subsystem could be morphed into that as I think there
>>> would be a lot of overlap.
>>
>> The USB PWRRDY signal handling has been initially implemented though a
>> reset controller driver but, after discussion with Philipp it has been
>> concluded that it should be handled differently, since it is not a reset
>> signal.
> 
> Every reset is a signal, but every signal is not a reset.
> 
>>> Maybe that would cut down on a lot of these
>>> syscon phandle properties. I would find that a lot more acceptable than
>>> the generic 'syscons' and '#syscon-cells' binding that was proposed at
>>> some point.
>>>
>>>
>>>> +
>>>>  required:
>>>>    - compatible
>>>>    - reg
>>>> +  - "#renesas,sysc-signal-cells"
>>>
>>> New required properties are an ABI break.
>>
>> I've added it as in the old DTs the system-controller node is disabled.
> 
> Ok, so it depends if the consumers treat this node as required or not.

The only current consumer is the the RZ/G3S USB PHY which is added along
with this series.

> Or maybe they are all disabled too.
> 
>> With that, do you consider it OK to keep it?
> 
> No, as we're dropping the property aren't we?

You're right! Stupid question from me, sorry.

Thank you for your review,
Claudiu

> 
> Rob

