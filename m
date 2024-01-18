Return-Path: <linux-usb+bounces-5214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199F831850
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 12:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B28DDB251AE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 11:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE9F2377B;
	Thu, 18 Jan 2024 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNV7ofWx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB9423768
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705576636; cv=none; b=GFpkdt+9Ah+88OZtaIwTUcXFes8oezfMzrgcpMXgMoE23qX+j18xyxaNq9w+Pe/7KycrAcU42T3Bcy3zWfQc65r3DF06BSa2P5MAWCgHry0RWLVRra8vrZtJRBJYDqKLVv3rwPNPegkOUYWs48G44aYOVV8oG2/Yu7FIuefKdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705576636; c=relaxed/simple;
	bh=HGyZZTY2+T2Jl48jVHvo9QD1buSy5boaGqX0+XFUl4A=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=SAUuUvbFmCCoRZo9xqv6b+6EZtZlII1fCH2pXjceRbb6ckkHxZlzqlQtTtCpwr5HH6pk5Tnos6Qa2l8UFtrOzaScilOU0NkGS2MkbHL6efVIKPvkj5CGmK4DYwm5SWk0mgrmWoePSztRpy1PcKE56uXEEmYfdlhgnBVBC+aVnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNV7ofWx; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e7c6e3c63so12921792e87.3
        for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 03:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705576633; x=1706181433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUL3sesdhKnyLaiqDC4I4Y1yB3YN5zh6ABKurybZAU4=;
        b=CNV7ofWxwccR5s8yhua+JscO4P2B4Htx6k1g6ABenRhWuP13VwUtLYeFEkGjaYjawl
         C47M1nUm7rgW4nlpctdZ3RYDr1ezsiBC1lMNMYRMvoaBfiKX5VZPjJfDaMzRWPKPft8+
         vk1/YROw5utRXzt0bZusiFZtkAWu7V5oOoCtFHtwhu+e5B7YUpeYuJzB492w+o2PEwSP
         lQbxV8CwLYsTsbPk2KgvpqfqND3rNY68acv74WSdI/wJu69w8d0kTNtLAGhjRskkDFB1
         hKHs6Q4vWt8B9YsBx0u93HFSOOFbCjHBbND6cjFmtMJIvBOdMghOMl3a3jYKJRI8o56v
         fXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576633; x=1706181433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUL3sesdhKnyLaiqDC4I4Y1yB3YN5zh6ABKurybZAU4=;
        b=X0Bh8OPJCM+TfYS/Jiz9HDYms46BgSsTqNeQxnfvsAjDJE6dKyDqtOnLV5P3YZBOoV
         s0b7MPLTTd6Oq0VPqfuwSSUHVOkWmewRNRYgJe7FrSJ+D/s+lL5oNWC9PqpZvW8mpJc2
         ZR6jXUsT6/BzEFtPtWbkIFBZtFeLn4X9tNvN6+UgIP07JH/e23M94hvh/UvFp5F+dP9S
         /TznXRz91PuHFprRB7T410yNF35W2mxxX+SDdO4iN9VcEXc0y+WeB2dC8dRLKHWOe4kX
         s7oroUUEDL974bkwzV/23zCww6ZzcVmK3UgCcZiaA1rYY/3n9oueyoKBGMJKQt42gxvn
         7g3w==
X-Gm-Message-State: AOJu0YyUnWieUp1ePW4dwM4UB4I8cXSCULp+qe28Nvo2/3bmEkkqfGec
	DoExvTK+U3KnpCWWtkVTyZVAREN7s+xvxsYj1D1tFztEpR2eKqHruI78VP3jlS8=
X-Google-Smtp-Source: AGHT+IHyjyHsdaxcownnkWnzu46PpTlmkcbrxP0tzLEpsy/pqHnDn8XLUf47GEZUEuK2qUNpp9DjQg==
X-Received: by 2002:ac2:4e95:0:b0:50e:285f:3a8 with SMTP id o21-20020ac24e95000000b0050e285f03a8mr188522lfr.108.1705576632600;
        Thu, 18 Jan 2024 03:17:12 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u24-20020a196a18000000b0050ec4839e23sm594538lfu.195.2024.01.18.03.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:17:12 -0800 (PST)
Message-ID: <9a24a065-b649-4431-b8fb-78c733c07671@linaro.org>
Date: Thu, 18 Jan 2024 12:17:08 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org>
 <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
 <20240117220153.GA649327@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117220153.GA649327@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 23:01, Bjorn Andersson wrote:
> On Mon, Jan 15, 2024 at 11:00:53AM +0100, Konrad Dybcio wrote:
>> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
>>> Define VBUS regulator and the Type-C handling block as present on the
>>> Quacomm PMI632 PMIC.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
>>>   1 file changed, 30 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>> index 4eb79e0ce40a..d6832f0b7b80 100644
>>> --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
>>> @@ -45,6 +45,36 @@ pmic@2 {
>>>   		#address-cells = <1>;
>>>   		#size-cells = <0>;
>>>   
>>> +		pmi632_vbus: usb-vbus-regulator@1100 {
>>> +			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
>>> +			reg = <0x1100>;
>>> +			status = "disabled";
>>> +		};
>>> +
>>> +		pmi632_typec: typec@1500 {
>>> +			compatible = "qcom,pmi632-typec";
>>> +			reg = <0x1500>;
>>> +			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
>>> +				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
>>> +				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
>>> +				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
>>> +				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
>>> +				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
>>> +				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
>>> +				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
>> This differs from the downstream irq types:
>>
>> <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
>> <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
>> <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
>> <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
>> <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;
>>
> 
> Interrupt 1, 3, and 6 are level interrupts for which it's reasonable to
> act on both edges. Interrupt 0, 2, 4, 5, and 7 are "pulse interrupts",
> for which it seems reasonable to act on only one of the edges.
> 
> To me, Dmitry's proposed version makes more sense than downstream.

Thanks a lot for crosschecking!

Konrad

