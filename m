Return-Path: <linux-usb+bounces-2504-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A57E0810
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 19:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 578A0B21465
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 18:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0E7224C0;
	Fri,  3 Nov 2023 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LTd6P5L/"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259621102;
	Fri,  3 Nov 2023 18:25:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA91FCF;
	Fri,  3 Nov 2023 11:24:59 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3Dm83J004645;
	Fri, 3 Nov 2023 18:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Q4A1/ShYumvFEKJwseEisL4WJre6JGG+MXAB1DSfkCM=;
 b=LTd6P5L/52RMaij4t6W3kKSwp6G300cKxSV5Euc6Kd5hISCTHHNlAsaKFPcyLp29yVtk
 9C9sckItG0A0yfRvYZGfYGnL58D0mJsDYogGjO/ebvDulDHFh1HvJIS/3cFnljWVl6MO
 qWpZwDjuaZSbUxLgyggxeP1FZTkfn3aP9ySZI+QDQs34hBW3rECFLfvpimn1Vinr33ON
 dB/V2R1pvyfFInjPgEVYiiHK4YkpO13NOOe22BmuVE04030gu52N9DzevWrJslfXLTRL
 zc7FhF6ujtWeQx43HzUT45e8n5f8hNTlUzBBeTJ38FZOCVVyXCbbWuxZ9RJNiMw6tCcS Rg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4wmjh95a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 18:24:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3IOTqx008092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 18:24:29 GMT
Received: from [10.249.21.155] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 11:24:22 -0700
Message-ID: <29752cbf-9fe4-48ce-bf21-0bb3daf7d691@quicinc.com>
Date: Fri, 3 Nov 2023 23:54:16 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/8] dt-bindings: usb: qcom,dwc3: Add bindings to enable
 runtime
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <quic_wcheng@quicinc.com>, <linux-usb@vger.kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20231017131851.8299-1-quic_kriskura@quicinc.com>
 <20231017131851.8299-2-quic_kriskura@quicinc.com>
 <272a9764-1cae-4d86-88b1-00175de83333@linaro.org>
 <960101cc-78c0-49cf-ab62-90614eeb9ee2@quicinc.com>
 <dbf4a48e-c808-4611-96b1-563ece1e451a@linaro.org>
 <f0820464-16d6-47fd-90bc-cf80b5d76058@quicinc.com>
 <96b3ebe5-781a-432a-9a73-2217a2a674f4@linaro.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <96b3ebe5-781a-432a-9a73-2217a2a674f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LFkoDZoWy75NbMtvUKFsJCg-alEyYpK7
X-Proofpoint-GUID: LFkoDZoWy75NbMtvUKFsJCg-alEyYpK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_17,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=582 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030153



On 11/3/2023 8:26 PM, Caleb Connolly wrote:
> 
> 
> On 03/11/2023 05:34, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 11/3/2023 12:10 AM, Caleb Connolly wrote:
>>>> Hi Caleb,
>>>>
>>>>     There are two types of platforms, some use extcon and some use
>>>> role-switch to deliver vbus/id notifications. Extcon targets already
>>>> have this qscratch modifications present today in vbus and id
>>>> handlers. But for role-switch based targets we don't have any way to
>>>> get this notification to dwc3-qcom. In this implementation, I wanted
>>>> to get those notications from core to glue and for this we
>>>> implenented vendor hooks.
>>>>
>>>> The property added has been used to do two things:
>>>>
>>>> 1. Register glue's vendor hooks to core driver
>>>> 2. Do runtime_allow for glue (and by default for core as the dt is
>>>> not flattened)
>>>>
>>>> In case of extcon, we don't want to register vendor hooks as
>>>> notifications are not necessary.
>>>
>>> Could it just be enabled when role_switch is present then?
>>>>
>>
>> So we would register vendor hooks when usb-role-switch is present but
>> don't do runtime allow, and leave that option to user space right ?
>> I think it would work and we can do away with the binding completely.
> 
> Can we still enable runtime suspend? Maybe someone else wants to chime
> in here, but I'd guess that it's preferable to have it enabled by
> default, particularly for devices like phones. Or are there side effects
> from this?
>>

AFAIK, I don't see any side effects whether we enable runtime from user 
space or do runtime_allow() here in kernel itself and leave qscratch 
config to vendor hooks.

But leaving it enabled by default, we do this for almost all targets in 
downstream today. So I guess there would be no side effects.

Regards,
Krishna,

