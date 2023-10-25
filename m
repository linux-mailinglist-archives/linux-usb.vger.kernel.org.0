Return-Path: <linux-usb+bounces-2162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F57D64B6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 10:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90A33B211AE
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 08:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03A81CA8A;
	Wed, 25 Oct 2023 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XLM6bWM2"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980F1C6B1;
	Wed, 25 Oct 2023 08:16:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477A8DD;
	Wed, 25 Oct 2023 01:16:00 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39P6F4Dc027874;
	Wed, 25 Oct 2023 08:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EEqzyOptjImbT88zXN8SiE8fZ8q6jfB/XGZTzKAcqzw=;
 b=XLM6bWM20lkaVcTE42J8Typ/gYgsPdowl/0P7DHk4MHqY3LpJdMtj1C39fL9QCEeOeVL
 TmdTFlnUbeTim+wX/Qe74yYtpYF4Fe1ClRGKBklequqhxaIbgRVDNHGnmM65NwBNpGkS
 bVji2XBGFRnXvC4q6Fa9osQIp7LyLmvN5afm+LIhee9ai/nC3jPooVtgv7+IJzGVtDOV
 uSrror4O5qGDn9ig/mkw6SF3v6InUle27tM82kNrX94AsTSFhnwkORM1QoB0EeQxfZXb
 sDtbVCT+Gcyx4uRxLmcpPmr+kZqQU0YN5DpiekqAd/6pnAhPO1eGqEqLQdKKH0qo5c9z XQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3txpj5gvs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 08:15:55 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39P8FsMq003388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 08:15:54 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 25 Oct
 2023 01:15:49 -0700
Message-ID: <5726b2d1-e130-d84f-4a2a-30db3095d215@quicinc.com>
Date: Wed, 25 Oct 2023 13:45:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: document the SM8560
 SuperSpeed DWC3 USB controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231025-topic-sm8650-upstream-bindings-dwc3-v1-1-fdd447e99865@linaro.org>
 <a2b5a0df-e3dc-4a95-8517-ff92dc9a500f@linaro.org>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <a2b5a0df-e3dc-4a95-8517-ff92dc9a500f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xsAVkvVw19twBw2oM92kuiwK6FidMIKK
X-Proofpoint-GUID: xsAVkvVw19twBw2oM92kuiwK6FidMIKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310250070



On 10/25/2023 1:37 PM, Krzysztof Kozlowski wrote:
> On 25/10/2023 09:25, Neil Armstrong wrote:
>> Document the SuperSpeed DWC3 USB controller on the SM8650 Platform.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Typo here as well, sm8650.

>> ---
>> For convenience, a regularly refreshed linux-next based git tree containing
>> all the SM8650 related work is available at:
>> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
>> ---
>>   Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> index e889158ca205..ea2c663ddc52 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>> @@ -46,6 +46,7 @@ properties:
>>             - qcom,sm8350-dwc3
>>             - qcom,sm8450-dwc3
>>             - qcom,sm8550-dwc3
>> +          - qcom,sm8650-dwc3
>>         - const: qcom,dwc3
> 
> I think you miss two dedicated entries in allOf:if:then for clocks and
> interrupts.
> 
> Best regards,
> Krzysztof
> 

