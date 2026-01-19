Return-Path: <linux-usb+bounces-32480-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71DD3A027
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 08:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C993E3041A67
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 07:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031B22571B0;
	Mon, 19 Jan 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtdQcObv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAN9OGbs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD727991E
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808201; cv=none; b=Vd+SJpA2zhXm+wAQOhDeutt/D/YxtIJu+5GPS5VzC5cOFPT7eTb2KO0iV07vnz1mPMB3AzUZ2FYTWqq4IB73v7WgH0IB0OIWZW9KiiW6EZcFJ8cYVaT2ep+bKXrlMq9nl+yI0f9fpUqXddHKxZ2dx7RFttbglrO/DfRP30HxMX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808201; c=relaxed/simple;
	bh=rjH9EBJjnsTLG6mQj5j5983rfdayM3mJk1uhIwBlYyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hx6AVGRJg5h3D+xSbQaJn+jPARk9y3xssgKeDFqGDqUe8sRXtvM/CzGVQajuS3UtvuZ9M0Y7qchwLXxTpy1Hld7uSG9Uyaa/FCb3q07MrTlGy8bN47/kb2SDxUj/o/lRfIDPuljv1KF1NnmjadQry3ogexwHH+xGfs7hKRnvytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtdQcObv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAN9OGbs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IMvNud274591
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 07:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niXb+Ms2tUibq0tveFSnX+rpPdxCeIikMFq3shCx9m8=; b=JtdQcObv4ZXv2HG7
	m8K+6qpHZFv64b7I4wn1aZ5gFNhWqnndG4ErEKrNt2BTkHAwcuf33nCPT+atiyUi
	aUiVL654zESJdmDJP2oekkugJMZnqkFOnze7mosYaTi51uwpReWDkeZNRhZiv1EJ
	FUOH9TqQ0czrYOTza2lqVcvhKAJchtOVz9prYsdCrJkRGY0/dfFCTxQttf53Jr2v
	GEKd1KF71xktwYAxUR6codMV1yTo0gQE/YUBGeIy9nv0nFREc0s/Rya0SFAsRdHw
	qt4yUuf7z3/rCQsmt+7Vcl8RKsLkJki26gOZFKTrASv3m0rxfQc3efH8OvRb6SVw
	grbJTA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dc404-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 07:36:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b6be90b6d1so3958803eec.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Jan 2026 23:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768808197; x=1769412997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niXb+Ms2tUibq0tveFSnX+rpPdxCeIikMFq3shCx9m8=;
        b=YAN9OGbsdGijDGMQmltjvObcbCtpOSYVBMrU4Amth23MVVxgTEbTjZNmwtDstnGeHC
         +lRdZmB4+sasXLX4u2qXaAoyhgp1xl5BFEvFy/2b/6DUWiJoamPPIvTt8riAJA6koT5U
         3j6cEwBHali2UjCk7DjF+iSOBaV+rLCgrIHtZW882sRLMZqlrfPGv2ZvfKngt9qGW4B9
         bsP2KCUtBWNWQH/FArLIh6c/wdoIu6U3xBUFlDA7qmZRXsA3IXe4eaeR9yUaHJDMmoe/
         Lv0QuVPUxiSW1qXu0zcFINkWMF9mK1SNdCfBV969ygJCWeAl7U3R3ptRyYEFGG7gSCL2
         D/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808197; x=1769412997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niXb+Ms2tUibq0tveFSnX+rpPdxCeIikMFq3shCx9m8=;
        b=vXCFg4ZJvNrGaZzyROY1v1iPQ2xNmIiZN9gG3y0D4lCIdwrMDBwF5zsSm39y60WibM
         wgG5kU3fZ6iHuUg5WqUgEqOc74VR20bQrFDxbgo5u0lirthrHccx1DO9EbtX9IQSX57F
         +feB3sIV5zP6AY31jyZp+Sbggj69AobHQjF7ZHpPQcPwEjojvuAmr4slUheKxxWakjtz
         WqEf1V0g4boal+hPGELdN5JlE4mSn7WFiypfgPeDNbK1C5G4J0g+clUzYXk2xRTgNuti
         Tb61rwHGMdOIRaWY+w/PoDNyVJp10sqwfqiEi2CFfn6z6KXmdJg3Oom+ij4mzGFVN6hU
         FmjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmaJXEXPI3Ew1WbpX1fplrcSVGmm0sebRewZRvvr2wjwJums+myUqNtGPggg/+grIGC7RPoEuNA5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkphRTVx2xnECh/sTQfTrA8djDLuJrY32PYjNxiWQGS9uwaid
	8OIQ6KBekjTK0tyG3cNd1bggiQ/d7sCzmiaUoF1Fl6RaAA1kb9gqjW0Mm7RNguSTzv7Es2ZkICu
	L/nkaxB/BxMS3zd9A1W/2KGwruXooSCzl1gDfucgeB82YM7+keziCmeU4NP6h/7k=
X-Gm-Gg: AY/fxX6dTdZagbzCR290V2o/ZnOk3ZSavAT7lcjp3rc+Rebof9msu8/IzAUnsfh0b4w
	wHm/fPjvrae3kBYn09AFCXq7NZWeqwp44F1zyKws+qXsEwg/VgrnYK4A4sEapadYpjueSd3ZhUB
	OaIBEcNmT0KDIDz5UZ2FCk3KhDQNXDF4Uqw/xy4OwWPURnu+7uMebbxTwBewVkE7HiKdxY7wZK6
	5xeqVvxhEpRL1qADW9Am3yVYYR9tOAaBnQN4Rn41LOzWoNNcQK7y8BtxDVCBP/tyVKX/CvLMAcU
	vYgo3fugjCHwme9I+lXUuEksd8/QSrCbdSYqZK3T6msb+hqGnm4FpdwomTFPnsnJN0aFfR7FVuB
	GDorN019wrDj2WLWWXJF4T96NXYQi2Wclru3OpzWOlIB/QA==
X-Received: by 2002:a05:7301:d8f:b0:2ae:5a73:23d6 with SMTP id 5a478bee46e88-2b6b4053d20mr8038999eec.19.1768808197245;
        Sun, 18 Jan 2026 23:36:37 -0800 (PST)
X-Received: by 2002:a05:7301:d8f:b0:2ae:5a73:23d6 with SMTP id 5a478bee46e88-2b6b4053d20mr8038964eec.19.1768808196649;
        Sun, 18 Jan 2026 23:36:36 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3682540sm11721042eec.34.2026.01.18.23.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 23:36:35 -0800 (PST)
Message-ID: <f2a9a7f5-f406-439e-8d86-94e98b2e18e9@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 13:06:28 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin
 <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
 <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
 <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
 <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
 <zkvwy56jkya6eogwqlmbhoo64zlzatxsdtkhy4hqfudoqtfbkg@fwiy46l3c337>
 <CAHz4bYuE6LS=+3272x2qat7EyjgVuODC7Otz_f4zP78ZQ=BWDA@mail.gmail.com>
 <53dojwu2xfshqaii3dzmglhjsne75jyf5r6ycerbr32w4v3rlf@umkbjczudotn>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <53dojwu2xfshqaii3dzmglhjsne75jyf5r6ycerbr32w4v3rlf@umkbjczudotn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2MSBTYWx0ZWRfX6f6r+7LUIBqU
 3s0yjcUhFc/eASEzXi1Lx6GDVOKn503y+SlNGDMDjo7YIFdLodbUaJyLLk+M3ft51TDdYxdya4Z
 rvH+Rijk54pxulVeWUsJsUUTWStVljvwvD1oMnW3oQbv5+srWdWS0XvtljUIiRB4iGdcpJQ2cnc
 t3/lOLZGcabULet1dhMh6FqB5BlSJ/2/H7UrN6I7I25j78iSdnwoofH3rypeyKAHYevIKywjnMi
 X6rcutTVlH9szU2Cwp8WacPbHr/1z/A8M4bUVqSlTd6gnKPJ7R84LLjbGKOzzhCajgEufq2Jc1h
 gEIc9cf8nK6ox+D8MOKYqRzWeeLa+2U0xtCdqAqec7XuskpM9dKzPwLtxNv5Oatwqcx29H/GJiD
 mdyz1dy1fOgG0LZ/pKYfmCvn8zilqWLjTT0Jbq7nAhjz4yCbi3Ng37TYHCxotyU+P+Xfw+MS6zo
 BqI/FIaRI3SKDGGcpMg==
X-Proofpoint-GUID: RUX-w5flejXCPr0d4k_l-NECSFNmeJZs
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696ddf06 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zYNpofc-SOyKt3YyfrMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: RUX-w5flejXCPr0d4k_l-NECSFNmeJZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190061



On 1/19/2026 12:01 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 09:42:03AM +0530, Swati Agarwal wrote:
>> On Wed, Jan 14, 2026 at 11:39 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Wed, Jan 14, 2026 at 11:10:26AM +0530, Swati Agarwal wrote:
>>>> On Tue, Jan 13, 2026 at 4:59 PM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
>>>>>> On Sat, Dec 20, 2025 at 9:47 PM Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
>>>>>>>> Enable secondary USB controller in host mode on lemans EVK Platform.
>>>>>>>>
>>>>>>>> For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
>>>>>>>> ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
>>>>>>>> lines run from the SoC through the hub to the Port controller. Mark the
>>>>>>>> second USB controller as host only capable.
>>>>>>>>
>>>>>>>> Add HD3SS3220 Type-C port controller along with Type-c connector for
>>>>>>>> controlling vbus supply.
>>>>>>>>
>>>>>>>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>>>>>>>> ---

[...]

>>>>>>>> +&usb_1 {
>>>>>>>> +     dr_mode = "host";
>>>>>>>> +
>>>>>>>> +     #address-cells = <1>;
>>>>>>>> +     #size-cells = <0>;
>>>>>>>> +
>>>>>>>> +     status = "okay";
>>>>>>>> +
>>>>>>>> +     usb_hub_2_x: hub@1 {
>>>>>>>> +             compatible = "usb5e3,610";
>>>>>>>> +             reg = <1>;
>>>>>>>> +             peer-hub = <&usb_hub_3_x>;
>>>>>>>> +             #address-cells = <1>;
>>>>>>>> +             #size-cells = <0>;
>>>>>>>> +
>>>>>>>> +             ports {
>>>>>>>> +                     #address-cells = <1>;
>>>>>>>> +                     #size-cells = <0>;
>>>>>>>> +
>>>>>>>> +                     port@1 {
>>>>>>>> +                             reg = <1>;
>>>>>>>> +
>>>>>>>> +                             usb_hub_2_1: endpoint {
>>>>>>>> +                                     remote-endpoint = <&usb1_hs_in>;
>>>>>>>> +                             };
>>>>>>>
>>>>>>> Are all other ports disconnected? If so, why do we need a hub?
>>>>>> Hi Dmitry,
>>>>>> I didn't understand your query, can you give more context to it?
>>>>>
>>>>> You have described one port of the hub. How are other ports routed? Are
>>>>> they connected to outer ports? To some other devices? Unconnected?
>>>> Hi Dmitry,
>>>> I would like to put it this way, USB HUB has 4 ports but only one port
>>>> of the hub is used between SOC and Type-C controller.
>>>> Remaining 3 ports are used by other devices.
>>>
>>> Which devices?
>> Hi Dmitry,
>>
>> For Lemans EVK standalone corekit board, there are 4 ports as follows:-
>>
>> 1) p1 is connected to type c port controller.
>> 2) p4 is used for the m.2 E key (NFA765 Bluetooth) on corekit. This
>> isn't used on a standard core kit, only if we optionally replace the
>> wifi card with the NFA765 which uses USB for BT. standard kits all use
>> UART for BT.
> 
> Nice. Hopefully Mani patches will be landed soon and we can describe
> this one properly.
> 
>>
>> Remaining 2 ports will become functional when the interface plus
>> mezzanine is stacked on top of corekit.
>>
>> 3) p2 is connected to another hub which is present on the mezz through
>> which 4 type-A ports are connected.
>> 4) p3 is used for the m.2 B key for a 5G card when the mezz is connected.
> 
> Please add a comment for these two, e.g. routed to the connector ABCDEF.
> 

Hi Dmitry,

  Thanks for the review. Can we send v4 with the following changes:

  Add 4 ports each to hs and ss hub nodes and link the first port to 
Type-C connector and add comments for the other 3 ports. When M.2 E 
conncetor comes up, we can link the second port to it in a different patch.

  Let me know if the above is reasonable.

Regards,
Krishna,

