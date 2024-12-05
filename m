Return-Path: <linux-usb+bounces-18151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C319E4F29
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 09:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3E5167B02
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 08:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40741CEE90;
	Thu,  5 Dec 2024 08:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ocVCW4fa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954EE1B4138
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385765; cv=none; b=rH8FIHLzU1v/k08WcZsTTURPlyOtjetAs9fkr3uBXxjcKJX7XfvUx3cimBwghh9bZWDUzHeW4p75vvSkoCwNCvA6ATpjy3UdobI6UfSMlCexDhgbL6XonWAdhHsPQLxn5pzLpkPZ2PaopTB7umIiF7XYMjHFtTgQsQE46udMTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385765; c=relaxed/simple;
	bh=XwrjnNkQ4knvmDC7/9/Z1Nk8C/X91nId4SNN1HJvRLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlmLO47W36Ls4Eu8FBcqhirXt3zWQMB8do+dHJMgYafT3qEy+J4G+kDIEr+I7fG3/knCr01RldcvD7qLXj04a5nyzFmJsBfJ08AOelpbS8yPrBCJ9OW1rU7giNn8z7E8Ail0/dvnRhfI2JplEJmACTPwWlxZMLiWiYETdYtanHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ocVCW4fa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4IHinQ006044
	for <linux-usb@vger.kernel.org>; Thu, 5 Dec 2024 08:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=; b=ocVCW4fa/Q1LgQWQ
	bdgwCfPTS0t6awWhQu+TRKU6UgdPcDCIKYZJOgk7klFa0diIGbp5PXqQI45DRTgZ
	sUiE8NZU3LPNUWMlSRNjtzVu5ieuZy5FxJqMumDFC3iN+jcVZ0kOTnz/XDIkQyPa
	xcEiLlfxLj1iXnK7ECN+laP6mYq4RKwgqHfOupENK0LtGgZkWbrC3Y8C4xXXKH8O
	HpW0nrAp3/QCn7kAQp1I/MMBW9WBtoadx9PCPFrRj9AoblbXRWnGBemDMi8Y1Ok5
	mNtCXJQFFq/KY73YzNp/Ho55jvbdoyIanohg+c09hYupoVj8RynxEs30B6RB64lV
	X8rJEQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3epsbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2024 08:02:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7f72112de23so502662a12.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2024 00:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733385756; x=1733990556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqbqqcJulAmbWewF5le6MsZzz4kokdCOT6f67ZVo8NM=;
        b=VF3L6pevlHjwpJDQo6nNY5ommq045nh23ZRGhh9pGUCIDmq9xRzAHomBZyyAdj85If
         P9jahNmID3BxK+85a1ZUDSSC1ta2c1KJCtH0rzgDPzpQNvQWYXVSRKeZldeIrkJ/lnAc
         AqQkkqrETCJM30MPzz+p+cXlamMzyOkvQMFd6k85XpVdV2uHXJ+8xQXfPQp8oXM9h2+1
         uvsFR/NAD8sDn0KUIN4iyQyRW4DURzcELTJLFkEIVUMAVvDenyUCpDY/tysdT5RP1OPG
         I26TtkGom0OUuf8sy0ddHn2TsHFohEJjNcRn93XCcQ8Dc5AcPdM+crjR0+TabnL1dueS
         /zsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjpMenSaGnSJKQAHN0LaTL6NkAXML7L6oe4sOQ5uDTghmlNf2Hfd0rPSNb6Sjy5Otk9iaeQVNYOF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0PcvjMLuugsLSpBvIQLVmkmvMi5njzl68xF93en3p5QqS0+sv
	mqAqEmm1+lngDMV65I2OqfnZ2cjztTo1X7agilS2TqYGlRfPC18FZNcIhLhWSM25a4QY+9dBU0i
	cZU77ViZ77TSJmqcktT0VcXaRU6QdLA8B4KQAe349Qa5wcc2tad3+KA82Grw=
X-Gm-Gg: ASbGncu5vI9F6vTv7Jc/RPHpHjoaiPNgt/7Lk9fahR5H6Jvw/Tm7v+ozZYIx6Ae0TV2
	48qdu4+S0f/tCPS6ZG+5hKmqs1X8NTyYi+UV1zgzV6zqDX/hg6zcBetSTLPzJ4Rq60iL/GXgeXF
	Ea1+y94dzdM+3GxNGT4khO7cOXB0g7lI/PudyevnW13D3DznvsqzA6qG7rkgODY57eZRysPidWS
	Mg1ARdENlphAG9rjLTgicRPW+hMRcAWv86qrXnBFk338JJcwpZq0aRaKbvQtAD1Ej3JpEO1SdB+
	uA6t0A==
X-Received: by 2002:a05:6a21:3941:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e165438833mr16445335637.46.1733385756365;
        Thu, 05 Dec 2024 00:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFerYsbdp1Pj/tRpDFeOsFzKZusCyeQcW368bYmYk17ZSI8YNxJAIjpZrugnZOIdSlvtWUTQQ==
X-Received: by 2002:a05:6a21:3941:b0:1d9:3acf:8bdc with SMTP id adf61e73a8af0-1e165438833mr16445278637.46.1733385755960;
        Thu, 05 Dec 2024 00:02:35 -0800 (PST)
Received: from [10.92.169.167] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd157b229csm735543a12.52.2024.12.05.00.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:02:35 -0800 (PST)
Message-ID: <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 13:32:29 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Johan Hovold <johan@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x_9DZ-sIyn8Xgzqb14PrLVipiDCEUPxB
X-Proofpoint-ORIG-GUID: x_9DZ-sIyn8Xgzqb14PrLVipiDCEUPxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050058



On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
> 
> 
> On 12/3/2024 3:50 PM, Johan Hovold wrote:
>> [ +CC: Krishna, Thinh and the USB list ]
>>
>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
>>> The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
>>> multiport controller on eUSB6. All other ports (including USB 
>>> super-speed
>>> pins) are unused.
>>>
>>> Set it up in the device tree together with the NXP PTN3222 repeater.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 
>>> +++++++++++++++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts 
>>> b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> index 39f9d9cdc10d..44942931c18f 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>>> @@ -735,6 +735,26 @@ keyboard@3a {
>>>       };
>>>   };
>>> +&i2c5 {
>>> +    clock-frequency = <400000>;
>>> +
>>> +    status = "okay";
>>> +
>>> +    eusb6_repeater: redriver@4f {
>>> +        compatible = "nxp,ptn3222";
>>> +        reg = <0x4f>;
>>
>> The driver does not currently check that there's actually anything at
>> this address. Did you verify that this is the correct address?
>>
>> (Abel is adding a check to the driver as we speak to catch any such
>> mistakes going forward).
>>
>>> +        #phy-cells = <0>;
>>
>> nit: I'd put provider properties like this one last.
>>
>>> +        vdd3v3-supply = <&vreg_l13b_3p0>;
>>> +        vdd1v8-supply = <&vreg_l4b_1p8>;
>>
>> Sort by supply name?
>>
>>> +        reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>>> +
>>> +        pinctrl-0 = <&eusb6_reset_n>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +};
>>> +
>>>   &i2c8 {
>>>       clock-frequency = <400000>;
>>> @@ -1047,6 +1067,14 @@ edp_reg_en: edp-reg-en-state {
>>>           bias-disable;
>>>       };
>>> +    eusb6_reset_n: eusb6-reset-n-state {
>>> +        pins = "gpio184";
>>> +        function = "gpio";
>>> +        drive-strength = <2>;
>>> +        bias-disable;
>>> +        output-low;
>>
>> I don't think the pin config should assert reset, that should be up to
>> the driver to control.
>>
>>> +    };
>>> +
>>>       hall_int_n_default: hall-int-n-state {
>>>           pins = "gpio92";
>>>           function = "gpio";
>>> @@ -1260,3 +1288,23 @@ &usb_1_ss2_dwc3_hs {
>>>   &usb_1_ss2_qmpphy_out {
>>>       remote-endpoint = <&pmic_glink_ss2_ss_in>;
>>>   };
>>> +
>>> +&usb_mp {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&usb_mp_dwc3 {
>>> +    /* Limit to USB 2.0 and single port */
>>> +    maximum-speed = "high-speed";
>>> +    phys = <&usb_mp_hsphy1>;
>>> +    phy-names = "usb2-1";
>>> +};
>>
>> The dwc3 driver determines (and acts on) the number of ports based on
>> the port interrupts in DT and controller capabilities.
>>
>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>> that would still be there in the SoC (possibly initialised by the boot
>> firmware).
>>
> 
> The DWC3 core driver identifies number of ports based on xHCI registers. 
> The QC Wrapper reads this number via interrupts. But these two values 
> are independent of each other. The core driver uses these values to 
> identify and manipulate phys. Even if only one HS is given in multiport 
> it would be sufficient if the name is "usb2-1". If the others are 
> missing, those phys would be read by driver as NULL and any ops to phys 
> would be NOP.
> 

However do we need to reduce the number of interrupts used in DTS ?
We don't need to give all interrupts as there is only one port present.
We don't want to enable all interrupts when ports are not exposed.

Regards,
Krishna,

