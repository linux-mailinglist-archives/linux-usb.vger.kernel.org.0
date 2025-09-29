Return-Path: <linux-usb+bounces-28758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E1BA80CC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 08:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE6D216C398
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 06:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD908238C3A;
	Mon, 29 Sep 2025 06:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvCqcVRQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB59919D087
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 06:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125763; cv=none; b=Ea2awVLQvGO5q8yBtbrKa6fNa9HAaFzRLs/Ak9/3M6829sgXXT3tBNtbA/x3+KGMo+JT5SemcS+jcevQ7ba0K1JlVH0ga3cxjyJwwlMt6sdT/w37o8OwY/a+v2nira0bO44ntY0bwbkrg7zoaaZflJ8SZgKgNH4qVCIQk+zam0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125763; c=relaxed/simple;
	bh=EVwKZ9ffdaADDxMp/oxfmX/duyCcrAcbHorH6J6Cjhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMUkFerFFm/Vn2VL85/13lhw8jNbR0/8/e1J1PPg8TElVEgI0lbUE2EtmhCDFQ/PZHBFUETW9vZnNj4rmZE4HAYdD49Wvz+siBhKsga9p6o+Mh2JugFbpWQZAtItSvbM06vcMgLdUHj0duOJQFQN95RnpAk2+LU6boNVmoDZX3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvCqcVRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMeV1f012945
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 06:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c84sJy294lRAsvdayLiR1jZLIpH9uaxLIGDdgwQe68o=; b=QvCqcVRQzLPsbawx
	s58RDUfGswe4txwaxDvqG8Rr0YstVhEvzpYtaw18yl+ljSv2A9AFa+gnvXerbPVS
	ogWP0HXpP7HPbpUieUNh6Fr4CpTbyPcOCEuFz9yaBW4x4p8QZkOIZ3koQlXRHJ5l
	GL5Du2iVZS81Q83/tq3gTb750URX8G/4dBtel4uNq4cCcU1aQMYq0GxPZ4oVqLgX
	ALSGbfLHApjQdhNXVCwzfiqgeFjX7OPYH/a3gIYtz6m4cfWVNQrdEtJeoIicJac3
	eY/HKQ0sUMxNTXEbjEYnCkGBpA6EFKdigFb3vR//5y6WNkOnLEYuOEXkW2avFOiT
	HDiHwA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxm18x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 06:02:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2698b5fbe5bso64747365ad.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Sep 2025 23:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125759; x=1759730559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c84sJy294lRAsvdayLiR1jZLIpH9uaxLIGDdgwQe68o=;
        b=TJOJbS7PcFNMFIhE9zmQhEkAndRWLwUTN5MbFydvv0sXXeJWZAFPogYXS/Jsku6RJp
         N9xrYzgQ5GLfFZvHeiZp2i9Zt5lzMSXKxNjzII7CfPY5YgYU+91tOIf4JJBh6YAtU+m3
         Ro3TyZN1Hjr529xfMUD4wGTYzih7yRYyYvRKYYrJoHECvIBF9cpSTPjyEP9Q9Wkg7o7y
         hq2VtG1z6SaeCyfF4LOWiUsamHWgY0yS0BQkD0hxOFwPeBAHxKuWXzY63RQwn+xmNXr7
         ObGWMgPN+rIqwYzSTW+eWFgWfOpzu7BSLWDn3R/N86PHToV+cupDwrEgRj+FEmessECC
         YhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe4ZuMbhPtU8RXGZs/myjtQpIeF3dAbrcxWKXOfUiMSq5HXcHuaCVfEfTcO/pqB3ncrR5V2YCCL7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFj6mPyupsE9eVOFxPJ2aPqfrUxKcMsaI6lcmCPzvJ2IILXt9t
	lW5Y/242vHg3OzTn1/9PYapBhUJomLlTiegDtmNkhNKXu88MxY8wVGOyX9YA/ommXR9JYuCiEY0
	gwlVYTFQmfz7gA0yv3mQ7SQN42rCPjUHZLX/sW3rC3sNSy51wdMQl035JYdLzIdwu/uaP1lM7IQ
	==
X-Gm-Gg: ASbGncvDrvGf8eukHKxY4cwyOip9VRzP0q5CcsD/vZKcu40JKCYUGnOqIMRKESembmu
	yu5OkGoCE5bhuW5Dq/OI2sBo7E9PrGiOsfzkzBehFdR+7LfcoSwmjOWVqxmXq4bDVcE4hXzyPG1
	81wrU9aTGhLP0yOtcI68/Uq6vNg5As78/Dwq0+04GoSjsdjV5iUzJIClSTLY68s8J7n4vTY/Dhr
	ppuJ0+TE/u8NZAmyjNrYK89GfL4fjKWJ/11jZgZ1QGI1ns2XwQgHPY0JFW6wN0y9alCD4pQ0g1v
	5V3fK6YXqBQaVGHYZj9Tk9IdBPRrLkRQqEmcNnrnxoCML+/ltVu48sigjE9MLP/hGAMUm5ZPVPP
	A67f2TMiSRhAFqL7Qhdom/vgGPXRZvrlNwGU=
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr165732275ad.61.1759125759076;
        Sun, 28 Sep 2025 23:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ70u453/jxOUh+G0kG8uuIYknKfil7i8PuspUU15QgIdesSV8W24AVurbFTeHJcYwjL3wwA==
X-Received: by 2002:a17:903:38cd:b0:27e:d4a8:56ad with SMTP id d9443c01a7336-27ed4a85a82mr165732105ad.61.1759125758595;
        Sun, 28 Sep 2025 23:02:38 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882133sm120557875ad.89.2025.09.28.23.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:02:38 -0700 (PDT)
Message-ID: <7f4bcb3e-2469-41d0-b3a7-392ffcbba515@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:02:33 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Kaanapali
To: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
 <20250924-knp-usb-v1-2-48bf9fbcc546@oss.qualcomm.com>
 <CAJKOXPfVhixCk0_Xh=9XokjHObM=P+SP=itaXHv7xTr69pc3_Q@mail.gmail.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <CAJKOXPfVhixCk0_Xh=9XokjHObM=P+SP=itaXHv7xTr69pc3_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: htihLwdOPxby8B9YdaVBMMhrFreKj9Sg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX+d+kteGDDfnJ
 88jLVx49+FEPR8xlRLFHkOUXltl5dd712xfP6vlAF+aNPfgfaokBDu27epNJIvgskNEU5U9f1m3
 ZaF98kl5eRC9ECn//wKhC1eSNAh26lh87CNzfOGyCF8VXVvNztsotYXbXzjx1V6oa9eYIkyUYTk
 k3kaxquRPYUKSsGS/RoKEpOfijQEIqsoQy7q6WseE9z2hP35kS6undCurv/mDl0fiaRHJGsgwDq
 0d17EhW33PNkBaR4FXi10NOfxba8Fl2yLSEwKdYUrmliJSdj3UOSXoPnx7V+zAw81IILa3Iskn1
 9b9ped5cMuVuPA84aP+ymlcpk6u9DIs5PLW1ZUgOFSFOAz7t8HcQbT5tuZ/wCs/MG0BSH9sdVCQ
 It9/jGYGpoyv28dCwCS4TKigSrpXQA==
X-Proofpoint-GUID: htihLwdOPxby8B9YdaVBMMhrFreKj9Sg
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68da2100 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nQufxc_MvbZzznxDM0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025



On 9/25/2025 9:46 AM, Krzysztof Kozłowski wrote:
> On Thu, 25 Sept 2025 at 08:35, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> 
>>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> index c84c62d0e8cb..ab1cdedac05c 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
>> @@ -15,7 +15,11 @@ description:
>>
>>  properties:
>>    compatible:
>> -    items:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-m31-eusb2-phy
>> +          - const: qcom,sm8750-m31-eusb2-phy
> 
> This time maybe without HTML:
> 
> There's no such code AFAIK, because original work was never resent and
> never merged
> 
> You create some convoluted big dependency chain and I suggest first to
> finish upstreaming previous project, because otherwise it's difficult
> to review and impossible to apply.

The SM8750 USB support was partly merged,
The qcom,sm8750-m31-eusb2-phy binding was merged in commit 1166a2ca0900beafbe5b6d1bb357bc26a87490f1,
Link: https://lore.kernel.org/r/20250527-sm8750_usb_master-v6-2-d58de3b41d34@oss.qualcomm.com

Thanks,
Jingyi


