Return-Path: <linux-usb+bounces-13183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F894A18C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 09:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0DFD1F26B26
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 07:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247CF1C68B4;
	Wed,  7 Aug 2024 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQIUC97A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934851C6891;
	Wed,  7 Aug 2024 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723015221; cv=none; b=p8eS82yKiY4cxtWRA+EKSxEUULZBWRRZZOfhcKdcaRibXsfiUnwFzKJYpBgOYK7atc/W2nO1tFe4QTwbiXrIVlNxRscV9LQkFoBzBxUosQkl7ru0Nh3NO9pDVbG/AGyKK8j3KgY5iaOMkMMK3yOt6SlAlAM8UXG+M2Mkj8tlhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723015221; c=relaxed/simple;
	bh=bbnuzLz9A5UR1BFr7SjqKnblNq1aFKi3wf/G3ok/5xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbH9KmE4HfWQ7el8UzRYCHwJAuqIq1IW93PyYaaEK/kBNxhCqszWLQtsGsCU/gJFMqU+KdE/OAh90/AivAmOG0DognEjK8lyXMbvfVPeFHU85gUIyyp0ZxDZ9r4PVMbyRpZ0ig11xYbg+ul/xnYNgXd3W6Qi+M6lTr2dlWr+s9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQIUC97A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDEBC32782;
	Wed,  7 Aug 2024 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723015221;
	bh=bbnuzLz9A5UR1BFr7SjqKnblNq1aFKi3wf/G3ok/5xE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bQIUC97AH6ZqyRUpetm9wrxXjkfDCHiOOqj888NdqT9C56N9Y6SA8GSI5z8bPufeg
	 Kwlr6k7/Oxcs5a79fJjnP7O2kCJQW3YFPYfe8uMqiXq1sRUrPqAK6PA3NfAYBIvuUS
	 kxbF5Qj0mBQE8MfL96RK+dpCqa79eWgFi5UdnSV5BLzEYjKoZynLCn7gbUs1K68Lkj
	 DLn1S/gED4oJZcHDRt5Xfuf65T84pjZN52LrJgG9ORXHvOytVDxdeqIgTtq8nlUViK
	 dNIOGHcvFlMGJAimIbGPxSJc1LEWLicO1QkTePPaY8qf2t1rdJKsY+riRuRS8yhngS
	 r/LDgeA3eyVFA==
Message-ID: <f85de847-3476-4b6c-ae45-bb625061db94@kernel.org>
Date: Wed, 7 Aug 2024 09:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: imx8mq-usb: add compatible
 "fsl,imx95-usb-phy"
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
 l.stach@pengutronix.de, aford173@gmail.com, hongxing.zhu@nxp.com,
 alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <20240806050639.1013152-1-xu.yang_2@nxp.com>
 <160dd5fc-83ba-4311-a173-44521342a3d8@kernel.org>
 <ZrJLS37GFmvkQpml@lizhi-Precision-Tower-5810>
 <bfe6430c-a022-4e8f-ab7f-8d8e8cb10fca@kernel.org>
 <20240807055701.o7fo43efvv3jxlhv@hippo>
 <9127e97e-64ad-47df-aa4f-03feafafdbb1@kernel.org>
 <20240807071143.6njojidi75xsjkxr@hippo>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240807071143.6njojidi75xsjkxr@hippo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 09:11, Xu Yang wrote:
> On Wed, Aug 07, 2024 at 07:59:02AM +0200, Krzysztof Kozlowski wrote:
>> On 07/08/2024 07:57, Xu Yang wrote:
>>> On Wed, Aug 07, 2024 at 07:48:43AM +0200, Krzysztof Kozlowski wrote:
>>>> On 06/08/2024 18:11, Frank Li wrote:
>>>>> On Tue, Aug 06, 2024 at 10:29:47AM +0200, Krzysztof Kozlowski wrote:
>>>>>> On 06/08/2024 07:06, Xu Yang wrote:
>>>>>>> The usb phy in i.MX95 is compatible with i.MX8MP's, this will add a
>>>>>>> compatible "fsl,imx95-usb-phy" for i.MX95. Also change reg maxItems
>>>>>>> to 2 since i.MX95 needs another regmap to control Type-C Assist (TCA)
>>>>>>> block. Since i.MX95 usb phy is able to switch SS lanes, this will also
>>>>>>> add orientation-switch and port property to the file.
>>>>>>>
>>>>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>>>>>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>>  - replace minItems with description in reg property
>>>>>>>  - remove orientation-switch and port
>>>>>>>  - refer to usb-switch.yaml
>>>>>>>  - use unevaluatedProperties
>>>>>>>
> [...]
>>>>>>
>>>>>> ref should be rather in top-level. You can always disallow certain
>>>>>> properties for devices, if they are really not applicable.
>>>>>
>>>>> There are some "required" in usb-switch.yaml,
>>>>>
>>>>> oneOf:
>>>>>   - required:
>>>>>       - port
>>>>>   - required:
>>>>>       - ports
>>>>>
>>>>> If put on the top, it may cause DTB check warning for other compatible
>>>>> strings, which have not support usb-switch.
>>>>
>>>> Hm, indeed, that's unusual case to have such different devices in one
>>>> schema. Did you test that above $ref in if: actually works?
>>>
>>> Yes, it works and this yaml pass dt_binding_check and dtbs_check. 
>>
>> I know it passes, I am asking whether it actually works. Is the $ref
>> actually effective? Is it properly applied?
> 
> If imx95 usb phy node doesn't contain "orientation-switch" and "port", dtb check will
> show below error:
> 
> usb/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> 
> Do you want other test results?

Thank you for confirmation, it's enough.

Best regards,
Krzysztof


