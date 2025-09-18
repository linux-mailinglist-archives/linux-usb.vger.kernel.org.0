Return-Path: <linux-usb+bounces-28294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751DB85BA0
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 17:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19DE6486851
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 15:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB9230FC30;
	Thu, 18 Sep 2025 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rIoZHP8L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B33009D2
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210112; cv=none; b=Dy98fvOGZb3Bx7n03NC50VHE31BM4q+l7tm3ACie7GlfUfO794HRXAiTqTH4+KQnHEqu4kHsaNu4qt7I2fKC0SRtbkTon7W/L5xOWevMaJhsWA64szj5tKSfVdeHxbaiyM9JgZlFtD+HqBEoNqWjpCT9d0cWxr1EsEYLuPENf1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210112; c=relaxed/simple;
	bh=fd95esevktCabeowpK7SIpWtOxa90Kbt3jXoBuP1p2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZjcN/j3AJX40g2xjDYuZwWea4IZONBh/42BTtgj4rgPZ1PfjtVJRe1EW23xJlqmL/1mJzD30dDT+eBptYRQMBfR+SSyTnivFM0LY5WuJiuSHRKNvoK30hvt/SAPIrtW6zEg4LpM4G9gtDiQL48tf02sPtBQdICHmPo4IhvHn5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rIoZHP8L; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8DD6C003C9;
	Thu, 18 Sep 2025 15:41:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F33F6062C;
	Thu, 18 Sep 2025 15:41:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AF39102F1C44;
	Thu, 18 Sep 2025 17:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758210107; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VQiszZGVuAs0oZbXv/4s2SgbVwg892wQte7tWhfccl0=;
	b=rIoZHP8LlZeTv4a7z2uYa39C19QktmC7WquVKXWEukNm9RPCC3v+2RXXtmITBHZgDNEm93
	TKssKv5B7DkzJAj0XiDbwIA1KZiQ20V+PTeMsw9fNrT2jp+AgivDelczVrky/Bh+Gm7mJM
	FLwKdJh7waixEWb2/3+5GuidrQjZGzP95DVCBIyPUoqvg3sJgw1HSh9a78rPiEO6G5ACN6
	GxY58EnY1vZGsCcovXAIp8syWoFWRWHqXUKe8l7CF+FkRRVRrsuQrwX6EWEQBXqIgBjc7y
	HzMDkYhCaZ+1vu57SmfknkDZIQkp3lm42L7AuCyssHhgbPawHg/GKf8Q5PHy/w==
Message-ID: <a4ec438d-b563-4d5d-ade6-92d216bee9f5@bootlin.com>
Date: Thu, 18 Sep 2025 17:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb/ti,am62-usb.yaml: Add
 ti,lane-reverse property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Aswath Govindraju <a-govindraju@ti.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250908162052.355341-1-richard.genoud@bootlin.com>
 <20250908162052.355341-2-richard.genoud@bootlin.com>
 <20250909-curvy-happy-pug-eeffda@kuoka>
 <464f5995-be7d-41f6-8e95-7d724e2b5308@bootlin.com>
 <674b78ca-e4eb-4921-9564-a4490e7ddbca@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <674b78ca-e4eb-4921-9564-a4490e7ddbca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,
Le 14/09/2025 à 16:55, Krzysztof Kozlowski a écrit :
> On 09/09/2025 11:11, Richard GENOUD wrote:
>>>> diff --git a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
>>>> index f6e6d084d1c5..ba894d610af0 100644
>>>> --- a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
>>>> @@ -36,6 +36,11 @@ properties:
>>>>        items:
>>>>          - const: ref
>>>>    
>>>> +  ti,lane-reverse:
>>>> +    description:
>>>> +      Should be present if D+ and D- lanes have to be swapped.
>>>> +    type: boolean
>>>
>>> What is not working with existing data-lanes property?
>> Hum, indeed. data-lanes could definitely be used here.
>>
>>>
>>> Plus, lanes are swapped per port, not for entire device, no?
>> I'm not sure to get what you mean here.
>> The use case I'm trying to address is:
>> pin AD10(USB1_DM) of the AM625 is routed to USB_DP pin of an USB connector.
>> And pin AE9(USB1_DP) of the AM625 is routed to USB_DM pin of an USB
> 
> I understand what you are trying to achieve and my comment was exactly
> about it. You want to change properties of specific connection, high
> speed in that case, right? So this belongs to specific port. Just do the
> homework and run `git grep data-lanes`.
I'm ok with data-lanes, I'm not arguing on that part.

I'm being confused by using it on the port, it doesn't seem to fit the 
hardware.
Let me show the example with the dts k3-am62-main.dtsi:
	usbss0: dwc3-usb@f900000 {
		compatible = "ti,am62-usb";
		reg = <0x00 0x0f900000 0x00 0x800>,
		      <0x00 0x0f908000 0x00 0x400>;
		clocks = <&k3_clks 161 3>;
		clock-names = "ref";
		ti,syscon-phy-pll-refclk = <&usb0_phy_ctrl 0x0>;
		#address-cells = <2>;
		#size-cells = <2>;
		power-domains = <&k3_pds 178 TI_SCI_PD_EXCLUSIVE>;
		ranges;
		status = "disabled";

		usb0: usb@31000000 {
			compatible = "snps,dwc3";
			reg = <0x00 0x31000000 0x00 0x50000>;
			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names = "host", "peripheral";
			maximum-speed = "high-speed";
			dr_mode = "otg";
			snps,usb2-gadget-lpm-disable;
			snps,usb2-lpm-disable;
		};
	};
The bit used to swap data lanes is in MMR_USB2SS_CFG_PHY_CONFIG Register 
at address 0x0F900008, so it should be in usbss0 node to match the 
hardware right?

(I've checked on all ti,am62-usb devices, they have only one port)

Thanks for your inputs,
Regards,
Richard

[ Source: https://www.ti.com/lit/pdf/spruiv7 p12003 ]

> 
> 
> Best regards,
> Krzysztof


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

