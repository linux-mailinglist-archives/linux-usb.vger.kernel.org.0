Return-Path: <linux-usb+bounces-28491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38305B93C50
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E873AA1A4
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 01:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535901DE3C7;
	Tue, 23 Sep 2025 01:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lde4wz/T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459E487BE
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589219; cv=none; b=bwRRVt8rM/MSNhmWlVMxpO+SXiYvZsLjfKB+cEtyunhxgXjd0KMLGAPpfE3gWj7sVjQbpBE6Vc19oeJ4p/Z7blF52X/6bocECW38SI0QVhcDLvjZB/N4FdQQZ0QP01RTH7nCwNKPRU4a90zNd1vPVMw8nkiQkVxx1i0F6uP/eE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589219; c=relaxed/simple;
	bh=dlQdFts8UOM21Z7m6BJhEeiMH5cFC4v6+wXAIsrbMlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfL3vOm7PoxOyKXH6eGA8hwKypjK3ozhsnrRJoUOKXH2mCOn/Rc0lTM2RZs/nUZiCXjI1h56AVpDekEFK/J/yRhkF6EWLmwwVcYmZKlaqMj1oeUka5vgqZRFr2lM0MJFhqKpxLj0G9lXFId+gUg2iFv2cc8ywtkuHXazWkgUpM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lde4wz/T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MITfGL029672
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWLc1VvNWjlvWYqGGxKBcg7/p+JOxI4yci5dyPnXzGo=; b=Lde4wz/TlbDmZV/d
	RoQtBSG6l4gjxMIm1vx37YEBU/427uzg/x7fhRLL/SN754dd4f8htIAaWo9oILaz
	UmxWRuJEhTqYSh7OPKE90yVEtwHNGGpY/lXrfpcaMJxBwnh9uhb4o533jeLdV41P
	d82uZrrpCnU0n2U55hH/6tnC+MMcToM+WBbv8a3hoGtKy9oRRNOa2Yx3DFheCQHS
	vfJxozcgNJM7okXNx3cMoXEn4sDHxBoPkzWkUlXbDWzk1en4sqcReln4JH0a7dGt
	l8zI6va5suuJfvrymkyz8mDQurLtM3GVLv3vYMNoM7bVaCXf9A5FH4BX3Co5/qVP
	GbxmMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk2gw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 01:00:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268149e1c28so58195165ad.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 18:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758589208; x=1759194008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWLc1VvNWjlvWYqGGxKBcg7/p+JOxI4yci5dyPnXzGo=;
        b=wHt87wdhcJ8XjCSdxWvcU9LmrJzVH9GDyKuxa0m/37EQ4TATaYSRwvssVwvwVN1IWh
         MyZw5ptL1mbvrkWVTVjYcJm0Xy5J1HS/uQ3ITaQttOxLTikFFw9ZyDv/HQoBxzswxCB7
         WyLiYgSNcMwzSTT4KPNgDE4xf4+1OFFRHWJ5SP1T1sSVB7BKimwIpYbDy+IKacPebHYy
         wIPz0E4dbmIU/6JY7LXKNg1bNpVVGZWklBqpjdo5QHGYqPHaHBQ9UvCZ0PkcEauV8R8d
         XII4SU0p6XY+byFWUajVTtIiUol9Pem/rpus+3RxLVB6BINwtadMk4bSjfLYC0ow7VV+
         2pVg==
X-Forwarded-Encrypted: i=1; AJvYcCVVI98Vw+AEeREW0t5P7BcX9fTF7L7crGIDzK0NCvaLbdX4ou+ljdNokWvZXqH1rbwopiPrM8FgPcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdl2FCFS+i1kkZ2Y5Sfa6rlByXBZonV+J4GjwqBxwnoxujMjPt
	pnJ8qgGUQWn9HBvPoo2V5iDSFfNIllA1fO0lAxJwx8WCdKYeexZVeSkEcUnV53H7EBsdO6/FY/U
	4GiBdXZgmAee3ggxe7ENeCLFK4Kd+OvMN6Z8a4HMDVFkTF5rPwSZB3RZSpSx8PiY=
X-Gm-Gg: ASbGncs9yQULvac/vNvhfRhhPj1JUyNcr9oKkctJvPxf/NhctjdIKHq4mWqqVe10iHa
	h0hPB+M4yc3IVa1gWu3W7GYkxokCvane29A7AP+yUpGGDy9nH3yM/ap18REJdOYbOIjmIDtPt6w
	9dJ4LRygqmAeDwU2EFPZ8LkZ5jQdWAzrDF1PPtrdBze+MfNDmU50S6+e/1T+F0Ajssz3CEfYVw2
	pl6UA74aGXfRPdqbc6kk5lCleD+4kCfndpFw5KP4TELW/NaADWtzR2BkNYXw9+RPeyilaJoNUK7
	3ggDiksAmXBIHZHqmSOkcq3IwAz7LQIMHIWzs96b/y/wVnurNlSPb/+bHKsqOn2xZD/oMGZ268p
	NQ6Lzp5fEVg3htDLPFl9WnyivQIMnytU=
X-Received: by 2002:a17:902:ebcd:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-27cc28b71e4mr8498425ad.23.1758589207344;
        Mon, 22 Sep 2025 18:00:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1/GZAeFp7rCGex6eqi3pw2AUQEj40WLJVjcaoY5Pse3ZDm9IPKaBVgK/AuqXdN1xlZJyImw==
X-Received: by 2002:a17:902:ebcd:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-27cc28b71e4mr8498055ad.23.1758589206880;
        Mon, 22 Sep 2025 18:00:06 -0700 (PDT)
Received: from [192.168.1.239] (syn-075-080-180-230.res.spectrum.com. [75.80.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803661cesm145268935ad.147.2025.09.22.18.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 18:00:06 -0700 (PDT)
Message-ID: <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:00:04 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VapoXYdj0dDivQGBQJvz32P8OmLbrLuR
X-Proofpoint-ORIG-GUID: VapoXYdj0dDivQGBQJvz32P8OmLbrLuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXy7uNA5txBHD1
 SafsBqtxalRSc6XSys/MrzODx8ue0Zq6hnSFCa86c9Q/NiIR4Ls9Db3U0zuHOATrOoE9BUmwsmU
 +j9DkSHIA1bZl7BEMOguv87KTPPBc0CTQhBEGMOAt3ZrQt3DK7fW1Kc9pTm+rIv64n9fIzdr3vG
 +YhvEiXnj8oJeN/BbS3kq2DEySz7P01gldxHjUdES/gV+DsZOhc+eEzs4j/1J7yu3N6wAeY1142
 LPS01DoRXAxxSm2MrK1NixVjIxoE2AaUuWcMHE+NrSdYauQBwjaU5uYMJWRl2R2oitTsIj1IShP
 f6//XUOHAPW3+zHYKSIIi+vf76Jv3n8Wh00KZ8YKHJGT8ltOjaEJ7bjGWqQln87UKlraanmX2Uv
 cdZm2qy9
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d1f120 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=RTc6a8mmi5jc5_0K4gkA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089



On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
>> The Glymur USB subsystem contains a multiport controller, which utilizes
>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> index a1b55168e050..772a727a5462 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> @@ -16,6 +16,7 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,glymur-qmp-usb3-uni-phy
>>         - qcom,ipq5424-qmp-usb3-phy
>>         - qcom,ipq6018-qmp-usb3-phy
>>         - qcom,ipq8074-qmp-usb3-phy
>> @@ -62,6 +63,8 @@ properties:
>>   
>>     vdda-pll-supply: true
>>   
>> +  refgen-supply: true
> 
> You've added it, but it's not referenced as required. Why is it so?
> 

Hi Dmitry,

The refgen clock isn't always required on each and every platform unlike 
the .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only 
really depends on how the refclk/CXO network is built for that 
particular chipset.  The refgen ensures that we're properly voting for 
the supply that is powering our CXO buffer.

>> +
>>     "#clock-cells":
>>       const: 0
>>   
>> @@ -139,6 +142,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-qmp-usb3-uni-phy
>>                 - qcom,sdm845-qmp-usb3-uni-phy
>>       then:
>>         properties:
>> @@ -147,7 +151,7 @@ allOf:
>>           clock-names:
>>             items:
>>               - const: aux
>> -            - const: cfg_ahb
>> +            - enum: [cfg_ahb, clkref]
> 
> Why is it being placed here? Please comment in the commit message.
> 

Main reason if to avoid having to define another IF/THEN block, but I 
can do that as well if using enum here is not preferred.

Thanks
Wesley Cheng

>>               - const: ref
>>               - const: com_aux
>>               - const: pipe
>> @@ -157,6 +161,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - qcom,glymur-qmp-usb3-uni-phy
>>                 - qcom,sa8775p-qmp-usb3-uni-phy
>>                 - qcom,sc8180x-qmp-usb3-uni-phy
>>                 - qcom,sc8280xp-qmp-usb3-uni-phy
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

