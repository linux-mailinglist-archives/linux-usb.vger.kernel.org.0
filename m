Return-Path: <linux-usb+bounces-13080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03A9475ED
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 09:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F9AA1C20C2F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 07:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826521494C4;
	Mon,  5 Aug 2024 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrfMdLxb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B314D8B6;
	Mon,  5 Aug 2024 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722842548; cv=none; b=roFQsObWhg8k53BXQo9VlSD0jzkEFjWZXfhjDPEZ7y2IQ8wYUIlTl310DlDIRyXrvTb+OBGXxqVc3/uV5ZSsJ3cNds5KNnL+93KRE6B4YQZ+RaVeeOcXanPMGhiQDZ7C5r4sfkJ9q9+osbnlsf/dVwjrd2Yl/a37FAUOx+V1m7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722842548; c=relaxed/simple;
	bh=gkzU71gwV9NOWBEDhdykWzyAwPSJx6HCNBlYUDmMQ4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLSMM6VQVIG9F5hkBhhbfOEokkhxqhV7dTQBKxGdBUXtDeY7TireclW0crmbXaA/5R9UttqqgziMMzxfk29bv83csj8dGcQKB6gf7CaV/K1xvfiNWLutZ7AokzK2w85rpHnElcqrGLjVEQyY+V+fCtmDG9UpbxrcCibHZ2/ROhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrfMdLxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BECC4AF0D;
	Mon,  5 Aug 2024 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722842547;
	bh=gkzU71gwV9NOWBEDhdykWzyAwPSJx6HCNBlYUDmMQ4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GrfMdLxbUWEzrOxUZrAMduOAYLiUS+Q95Ab9qziw+lcD+cidKYOCo+lowJyBx70T9
	 KAehLRGEYjZM9d6vS0p6JKS3m82oi/wvdnya/Z4XinGd8Hc4UKut2f32j1HSvDzXrd
	 +hO8ZAg9/t8rkFLhlMvFhO9apl9X5b2Pezs+o34xTWD+CJzRcT3xLjfz6NTDKek/eU
	 sVbYieHAiHSOp9eXnhB4IYmaJ4TUnh1DUv/k+jFzm7vZdi1vvwxDS/9ppuRDV9Dlhb
	 jeOPNFmV0sgYpYWP/a51srYgnaZmvGX8b7OMfnF0kR8qywamk+3N9g1o/CjChhwGEl
	 tqD5Faf6E1dXA==
Message-ID: <0e1b0f11-152e-402c-97ea-788c7830267f@kernel.org>
Date: Mon, 5 Aug 2024 09:22:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org,
 Frank.Li@nxp.com, jun.li@nxp.com, l.stach@pengutronix.de,
 aford173@gmail.com, hongxing.zhu@nxp.com, alexander.stein@ew.tq-group.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <21557eac-44f0-451d-a194-c5d545cacbee@kernel.org>
 <20240805070429.rqykjd3ap5swd5vl@hippo>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240805070429.rqykjd3ap5swd5vl@hippo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2024 09:04, Xu Yang wrote:
> On Sun, Aug 04, 2024 at 04:16:34PM +0200, Krzysztof Kozlowski wrote:
>> On 02/08/2024 11:16, Xu Yang wrote:
>>> The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
>>> compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
>>> to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
>>> block. Since i.MX95 usb phy is able to switch SS lanes, this will also
>>> add orientation-switch and port property to the file.
>>>
>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>> ---
>>>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 40 +++++++++++++++++--
>>>  1 file changed, 36 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
>>> index dc3a3f709fea..b0a614a9556d 100644
>>> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
>>> @@ -11,12 +11,17 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    enum:
>>> -      - fsl,imx8mq-usb-phy
>>> -      - fsl,imx8mp-usb-phy
>>> +    oneOf:
>>> +      - enum:
>>> +          - fsl,imx8mq-usb-phy
>>> +          - fsl,imx8mp-usb-phy
>>> +      - items:
>>> +          - const: fsl,imx95-usb-phy
>>> +          - const: fsl,imx8mp-usb-phy
>>>  
>>>    reg:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 2
>>>  
>>>    "#phy-cells":
>>>      const: 0
>>> @@ -28,6 +33,17 @@ properties:
>>>      items:
>>>        - const: phy
>>>  
>>> +  orientation-switch:
>>> +    description:
>>> +      Flag the PHY as possible handler of USB Type-C orientation switching
>>
>> No need to duplicate definitions of properties.
> 
> I replace it with "orientation-switch: true".
> 
>>
>>> +    type: boolean
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description:
>>> +      A port node to link the PHY to a TypeC controller for the purpose of
>>> +      handling orientation switching.
>>
>> Same here. You probably miss reference to usb-switch.
> 
> How about port? Should I replace it with "port: true" or
> 
> "port:"
> "  $ref: /schemas/usb/usb-switch.yaml#/properties/port"

You can drop both if you add ref to usb-switch and use
unevaluatedProperties.

Best regards,
Krzysztof


