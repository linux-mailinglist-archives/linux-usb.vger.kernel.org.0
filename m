Return-Path: <linux-usb+bounces-24507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC1ACE9CA
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 08:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF1E3AB391
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 06:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7FA1F3BAC;
	Thu,  5 Jun 2025 06:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdpBg1Eg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B803D1FC8
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103719; cv=none; b=feKeJaKViJPYXLVihIR8y8f7igHJYTSBd2DOfj1Ij+o4pmiPLWGH0GkpsAw4yar9jxjbavR0B8iJFN34SLldGaTUv77PirLRRg4MZQa6WKKvqu3m2M7LSAC4cQ44zbKPdgcXjq5Z0AtTEwZUyEr3Hv90qZNluyEvgNdqdrUG4Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103719; c=relaxed/simple;
	bh=obxsLj+ybBp5DKxbHvEzq7j6OJDIdAWkKYrH0UW56Ek=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gQmS+J5HjVrSvWpdamSGZ/PzjobfNMaLiZhX/eb56w8keiRRmG0MmtiZz+tvzB91HoYJYS05LfvE63vDGUPNj6X8bR9SoZMaEh3IMJpFlXCTBKqbci7ryPR8EimNk0u61Z67B6cbG63OqiU2TSrwEjlNfYA0QFE1CAQYaTQw5Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdpBg1Eg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554GIfJR032286
	for <linux-usb@vger.kernel.org>; Thu, 5 Jun 2025 06:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuUom1uLViLFA95wFkHWrXsNJPx+f0un14vZ3UUQFxc=; b=HdpBg1EgCCkGTopG
	1I6U3YnyLIXjqCHAHCBALdMKIhi8SopUDmIeIrQRUDIlNqP9gNDdxrqobDV/RjWW
	GXlFKNG5UzrcO53a99nd2WxgUG29iPXdcEyyvmSziUAWk5M4GEzWi9xR8GIvWNU7
	8t0I85Jp6GxzSkFaOFBV9kmZM7YMhNAVArJQceNfI1mwv65iqGNgWKaGkkKJJSx8
	9VbwXsa6txAajJXK5xxvdm7wZ1qckie+8Y8bNIEeMOpy936Aureydwovn0fA158j
	7syJ8SvibACynGseQowcg3acKMUPn2mIU7jTMIdcz1Gb8EUIjN3viw4J5ONyTSeB
	0uAFmA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfuy41b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 06:08:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso570422b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 23:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749103715; x=1749708515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuUom1uLViLFA95wFkHWrXsNJPx+f0un14vZ3UUQFxc=;
        b=UxMGfCEQAROGBfJqrjUu5Lqcu0dlOHYXCcVgu2RYfqBsNHkw76oL4rehjWdh30moJM
         zpQRwiVVCcpItOs95iGUnGxhg6dKa2IkzSlrUqaRjYsjx2+DvbKLqcWb/hxs2Bfi+H1t
         E7wIT0HMmFSrbcvt5Tkmj/Jpqn/ELjUp5Tf3f9PX/5DnJBOH3qXm/1itubSIkFo+BTQx
         a1479+hU+BT4WF7oo5K+VCYirekvv/1OptubN505+PxpjisscJSV0eFSVLDDH5G+Iu9v
         B8IAUNAVJ0O/LpOS1OigkHzD4qDeTwBtpGEHkheTmGBJetk8WuAQwfzFE9TEO0sTHYaf
         nmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTS+vI6oe2Gly4U+2MnjovYs3HzHvsDgMKAsPPIVoheZbi+EI43yfHo92hi1jnu8Hsa7k9aJhoEpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEeeBSlQTXvB/jYE66xip1hBmZANUiXJ0qHkWVpcAr8piJAnK
	jJmYDUKjBk6fB9lm7SqkEkHY076v/v2T64r4iQ4qJrIPQvYZKNST0IF1eBVmBlbp8EcYQdeEa7R
	KAM00ObMYF6tSvwwOUwtoHbJdd50PrELO2VOknhr1anNYONktjMEic4a1U19IGk0=
X-Gm-Gg: ASbGncuK2QIu6ufrgFre0Q6YuTOle8n6LtsotFYlK/EogLeETO4z1SzubNRoejsbik3
	EysJl82JpC1GwtlAIN2JmZ539ALKbM6xU0oGWjwM6/UPRkLLmGQqarI3jULAO+8Snlw4SXIr5ZE
	rOUc2zvYBj5rQVip4bZWXP4t+W/eZknGKbFjfNGyRPcUFBMdoAyDDZJ+nN25h3jLNaKizxjdANe
	nz2WzWMSfFk4f/048bOkz45f4rg+/kx9Nz0upBmljnVO7AkUg4urmJOKYn/5OagrvgFoKDf26Tw
	khmhGn6m7Ij4Yy/I2x911+R/bkz95aRvhLvJ1fA7jRd8HQJLP9Q96ZMflfCGqkMPAqtt02Vevsu
	u
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr7791376637.4.1749103714900;
        Wed, 04 Jun 2025 23:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu82MVDHVKpp8Ta6NIo45ITXBkJKjQdLSDIXVXjZuHMYFztmtVjRfZs6jpP6ebX+etviRsgA==
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr7791349637.4.1749103714526;
        Wed, 04 Jun 2025 23:08:34 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa64sm12497732b3a.93.2025.06.04.23.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:08:33 -0700 (PDT)
Message-ID: <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 14:08:30 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
 <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
Content-Language: en-US
In-Reply-To: <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68413464 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ocYFPldkPzyi_qN8VkkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: JFtWytzkWcLp1v48mvTiITEzTHblSbRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA1MiBTYWx0ZWRfX9Z9mjPM9jvjn
 mO7IAAB8E+uHwahasJyvn7oWOzH8+qnbHHk3Xw7XXog9173pIybqlQXknY+GvN9JlVbMkcuURfO
 jw33a31adGjJUfxVadgSgYOW4ppRSq75WQWIsjiMhmI2ysVKULiT5+iV4vQFTGRCXHTXrtJKEBx
 dKXi4HvfiXzkdmUMMNVTYavbzN86sPS3bkNQ92wBIdp3HbzvWKSsfI9cTyEJetvykOHlt8RvwJh
 9pjjFJi4Q4wfUxzval+hjU/TbK3sIq75Lhyd/FjbUEq9XjeXq2LBMHgZg13JQKQeLgTvsX+iOdY
 j9nlab8KIF6OaDkLpun5ceojuensFyOZX4NVckzDjqyTmPsIbOACYvH5+7yW9+yu2/HHfi2isne
 NCx0l73RwAy4YO12KOKnRIjRq1Sj8dAuWTsvCwacjhBoPZZ46njEbBdzz+psVz+nXfJ+pzLs
X-Proofpoint-GUID: JFtWytzkWcLp1v48mvTiITEzTHblSbRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050052


On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
>>>> +What:		/sys/class/power_supply/<supply_name>/state_of_health
>>>> +Date:		May 2025
>>>> +Contact:	linux-arm-msm@vger.kernel.org
>>>> +Description:
>>>> +		Reports battery power supply state of health in percentage.
>>>> +
>>>> +		Access: Read
>>>> +
>>>> +		Valid values: 0 - 100 (percent)
>>> What does it mean that battery has 77% of health?
>> I will update this to explain it better:
>>
>> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
> Which basically means that we don't need it in the first place, as we
> can read capacity_full and capacity_full_design (or energy_full /
> energy_full_design) and divide one onto another.

Hmm, it is true in general to quantify how the battery performance has 
degraded over time. However, estimating and calculating for battery 
state of health is much more complicated I think. I am not an expert, 
but as far as I know, different battery management systems might have 
different algorithms to calculate the battery health and report it in as 
percentage. For example, in Qcom battery management firmware, a "soh" 
parameter is provided as the battery health percentage based on the 
real-time calculations from learning capacity, resistance estimation, etc.

