Return-Path: <linux-usb+bounces-2469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B9F7DF83D
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 18:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B22FE281C71
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 17:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCB51DDEE;
	Thu,  2 Nov 2023 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N7AWHaRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E31DA2B;
	Thu,  2 Nov 2023 17:02:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2112813A;
	Thu,  2 Nov 2023 10:02:42 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A2FeGWX010878;
	Thu, 2 Nov 2023 17:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gsBsQo9gDD9IOvVzS0FvwfEweq3C/58AnmRRuIg7BgA=;
 b=N7AWHaRg++8Gvzgi9jihUmtiBNZG16Ot0L4GM0xJPkEW63H7jAqRBy+vExWW0ylh5cMu
 ysUrwnLxltIK/4hEfsAI0hFKseKlu1B0xiv3VEy5mEw80X+HLJOOGglpsu5swXV4cEdb
 MfI32w+nWFmcwggwk27Kws0WSVI7KVjX3Hcf1g6YojeAe2QVafb/lyCsoZuwV4HQOpXN
 XQeECkZZz7v/hpeDENL5A14ipxvp8H5A5GQj53R4SH2H5MboQ63W+KcZJOvLcSmK8wxT
 pwYioUakoVqO+zov13Rvd6T+gS9+F941TOrmnHwLhIdD2jeFdFCyixYp3UeXSrYkVOwu RA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u3s6pat68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Nov 2023 17:02:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A2H2PYT031717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Nov 2023 17:02:25 GMT
Received: from [10.249.8.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 2 Nov
 2023 10:02:19 -0700
Message-ID: <960101cc-78c0-49cf-ab62-90614eeb9ee2@quicinc.com>
Date: Thu, 2 Nov 2023 22:32:14 +0530
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
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <272a9764-1cae-4d86-88b1-00175de83333@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f2rf_tH3m84_VVWOfJQ8fUhn7B2RrSGj
X-Proofpoint-ORIG-GUID: f2rf_tH3m84_VVWOfJQ8fUhn7B2RrSGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-02_07,2023-11-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0 mlxlogscore=818
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311020139



On 11/2/2023 10:03 PM, Caleb Connolly wrote:
> 
> 
> On 17/10/2023 14:18, Krishna Kurapati wrote:
>> Add enable-rt binding to let the device register vendor hooks to
>> core and facilitate runtime suspend and resume.
> 
> Hi Krishna,
> 
>  From reading through these patches, it's not clear to me why this 
> behaviour should be conditional on a new devicetree property. Are there 
> some platforms where this behaviour would be undesirable? And if so then 
> would it be possible to determine this based on the QSCRATCH registers?
>>

Hi Caleb,

   There are two types of platforms, some use extcon and some use 
role-switch to deliver vbus/id notifications. Extcon targets already 
have this qscratch modifications present today in vbus and id handlers. 
But for role-switch based targets we don't have any way to get this 
notification to dwc3-qcom. In this implementation, I wanted to get those 
notications from core to glue and for this we implenented vendor hooks.

The property added has been used to do two things:

1. Register glue's vendor hooks to core driver
2. Do runtime_allow for glue (and by default for core as the dt is not 
flattened)

In case of extcon, we don't want to register vendor hooks as 
notifications are not necessary.

For xhci, we opted to enable runtime from userspace.

>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml 
>> b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> index cb50261c6a36..788d9c510abc 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> @@ -151,6 +151,11 @@ properties:
>>         HS/FS/LS modes are supported.
>>       type: boolean
>> +  qcom,enable-rt:
>> +    description:
>> +      If present, register vendor hooks to facilitate runtime 
>> suspend/resume
>> +    type: boolean
> 
> A Krzysztof pointed out, properties should define the hardware 
> behaviour, not tot the implementation details. For this case the 
> hardware isn't wired up to vbus, so maybe something like "qcom,no-vbus"?
>> +

On all targets, vbus is not routed to hardware. This vbus toggle 
indication is given to controller via qscratch only.

Regards,
Krishna,

