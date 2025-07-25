Return-Path: <linux-usb+bounces-26159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B700B119AF
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 10:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0C73B39AC
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 08:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013C32BEC5C;
	Fri, 25 Jul 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFgQGoXV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD94192D97
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431438; cv=none; b=GJfW7pekXgjWyiM31xPn0SGgrKrQYAvrZ6dC9bX4+yDvs/RF3M14X1KzqOJsygqntF0w3fMyWx/nQbkYa50YPUKPPr1YPCdMQTdoZyBb5gqBVuXZcSyP1nZik152q4KQgEIrjkCYQ4X8fb6VnayiQ5z/3h4YOuXuh/yl+KcvuOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431438; c=relaxed/simple;
	bh=GUt9tz6QhKbEM20TY59EPhfaQ3CjaqtAklTBxesc4Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hla9edMoYOB4n9dTFERVyELaNt5i8BRjb1Zbm2mBx4e6GYWkY/KzSk3OFjUGd5a7KOGPIK62fMXQrnx00BLZ/HeDkF268/hkGsssKC09Dl9WvSwFMWeJq28NtG6/E97JJnRNR6mIG1JMT57EoT7HuyBgZO01obG3WRiw3+BIc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFgQGoXV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLrVFq015932
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 08:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2gAp22n0LVqwKU2EKsAkb8mxd9ndCHkEqEltv8yGrA=; b=iFgQGoXV0uN7DDu9
	rZKGekjHt51J194Femx/2/Jkn1FbiI+PSbTQvn3lEaSVWtCGH/mlJ2snM333lZcq
	MvGQwRZvnn5BL/F857Qf0ygn1fUSjlZNID6yf72vlTa4Qx//SQj0RQYsir63f04/
	4E0NA2o+nSpEc0xCXdQ1DCLFuYzxsbO0dtfnt9j4wtpk/G/jr+lKQ/kbRlsSyLl0
	9DZWfe8HtUNIhAFXskmMxfZlk7aWyFFNyJp4AjvoQQuOpsUYbMj4eI5MnVTZJSyV
	7o7tfSvJiCKeIy12KDWu4SF2QNPZreaEfaxSIulfzrwMMrgo344sXvrQJr/03fXX
	29WkAg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w501bn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 08:17:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-756a4884dfcso1968570b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 01:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431434; x=1754036234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2gAp22n0LVqwKU2EKsAkb8mxd9ndCHkEqEltv8yGrA=;
        b=rxaZYR2Nu/2mBGJeX6CUYiLaNCkQm82ftQZOehFMOWvzTj5R/lmSbt3D6DM15o8Pf7
         72qM/3CoKEMcOoVqvnNwojJoadRgc2auV1sDO+p2AJenrNJyxjcFir7lROzCtQLQJly0
         tll+J2vsR248xPCSk7tv/HRrjlVvpRtFf4XK6Bu92vzK5/S1kGNMNjmhFoJm8ToK3OVu
         ki0qDZTZOMqrCawv2JRbCpXRHWDzYshBQcUp25D3aJEJoVcXYAHlkz6JzrNHCC7TZBCa
         VJsxZ/s/QPndgD2Y8j6fT0bH+q/jHuF2fMiwDX2DaQdx98rJYVcSL9iEaNcady0a7r2Y
         7y4A==
X-Forwarded-Encrypted: i=1; AJvYcCWZkIN8R7kMjM+tohA4tu20NCWnPnSh2hb9vn/zsC50o84JNlXWtWpoCF4FDeXWncdKiM0RTPKZXoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAA0E+1iRVlRhjc/18w9SfAHba0h0cgCloKpA1FOVhoBRPCs/q
	DV83wE65p2DunvZBQIeJ71xzM7zVpX4hYdhUhVxEaFvpxsUIcRJv/yiOD09zUSAi62PQqZ7vyyX
	v3A09sdHijmaeoaLH+DqQWgRK8fKfWEdLKWsbi7KkWSNqKTbAHndLQyGVaIqHONY=
X-Gm-Gg: ASbGncvP68it9k1rkeFO3QN5e2DfugNt874+AM2iWM21rZaPs/x8vzxnns7w+xreDRl
	VuRdUPcNmXLj6c72aHUcz8O6AfCSvoQQS3an96BMrBxsSAJj9UTt5QgiOz9D43BSB2jvUtvCf6u
	4o+YlrTnUY5THoA9xwknvhaATJNlfu3PzzVf2g0AidiOf5YyA9VvtxFOqpyuSCYwyeqOLOvmUd9
	0VktGVrjPFwPBl3cmaohW58rPZqMbEVY4oNH4UU320dWXjFLXDTsQTKi/7imqOsp8+jyq77AAqp
	2+NsF0bN75tVWCHF2EvKB10+r+KFEYmQvqfOVL7JdIgVwysCviOYkeB/j/LneyTdzdxn6j0nq98
	Ugq6OJfGBuN6GI10dWCFeXRDTyns=
X-Received: by 2002:a05:6a21:9989:b0:22c:a165:3664 with SMTP id adf61e73a8af0-23d701db921mr1436104637.26.1753431433661;
        Fri, 25 Jul 2025 01:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd2mTB0BmD98J6BIrb5zukkTqEkg9rlDr+yDIHUMb/P94c38M867StKboWi+F5J7N2YvdZ8w==
X-Received: by 2002:a05:6a21:9989:b0:22c:a165:3664 with SMTP id adf61e73a8af0-23d701db921mr1436058637.26.1753431433198;
        Fri, 25 Jul 2025 01:17:13 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae1584bfsm3128624b3a.38.2025.07.25.01.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:17:12 -0700 (PDT)
Message-ID: <d34ff09d-5a55-4c7a-9eb6-fc0a0f4adcfb@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 16:17:08 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
 <3ldf7w5cpv4wt63kvewl2a32abx4uohvir7zgefpqly5rytkcn@p5fslnvpnjn3>
 <4pxg7acm4nuwo7bhiwrtpxdey7v2hanw2tw6vbgp6i6md4q2zx@pxjuymr6ykwr>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4pxg7acm4nuwo7bhiwrtpxdey7v2hanw2tw6vbgp6i6md4q2zx@pxjuymr6ykwr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i6pCq8HPtYOo-qiOgjGFi4DrFuUKCk52
X-Proofpoint-ORIG-GUID: i6pCq8HPtYOo-qiOgjGFi4DrFuUKCk52
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=68833d8b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8
 a=7KI_h5JtWn8X269DZ4AA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA2OSBTYWx0ZWRfX6SVSDpiNnFPu
 KDi4X9FTsip+V8WTADm3VJKAFhPnjIcqvVySy2R8NvMESTnqaSGSrQlZOBU/b35ASbIM5w18/20
 10Qlw+OnV4FiVF49QDur0+N3LB6uVeOTXfIC5S/xdowFj4f/DnVg5nCpcGvG8QGPavtnHhffyPU
 rnNTWGaFjTO59Cxq1JkfgjK4zKZdrmQMlj/IYX6p2N/x+W0FC6/tKVZVgvb+ZHH7kDoVns+nBZD
 QShH8txVd5aQzOCVOP1tOt9suNUFAPzcj3j92BfbyHaVkbc9lvsir1m4xT/Ynyyhe4eWwRRw9eE
 zuoibsjCZTE7eDfrnzBrJxBdWGk+ZuN/tadorQqm8TtHv5MKUY1K+c93dHVRaVOqjnjscNXhiHT
 VxffW5a2cjcnU+HEUITFao4mPr/+vZmKe2zujtX9XlXW9Vqqip6Z2mJQYzd/772WIm/euMMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250069


On 6/22/2025 9:17 AM, Sebastian Reichel wrote:
> Hi,
>
> On Thu, Jun 05, 2025 at 09:34:14AM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jun 05, 2025 at 02:08:30PM +0800, Fenglin Wu wrote:
>>> On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
>>>>>>> +What:		/sys/class/power_supply/<supply_name>/state_of_health
>>>>>>> +Date:		May 2025
>>>>>>> +Contact:	linux-arm-msm@vger.kernel.org
>>>>>>> +Description:
>>>>>>> +		Reports battery power supply state of health in percentage.
>>>>>>> +
>>>>>>> +		Access: Read
>>>>>>> +
>>>>>>> +		Valid values: 0 - 100 (percent)
>>>>>> What does it mean that battery has 77% of health?
>>>>> I will update this to explain it better:
>>>>>
>>>>> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
>>>> Which basically means that we don't need it in the first place, as we
>>>> can read capacity_full and capacity_full_design (or energy_full /
>>>> energy_full_design) and divide one onto another.
>>> Hmm, it is true in general to quantify how the battery performance has
>>> degraded over time. However, estimating and calculating for battery state of
>>> health is much more complicated I think. I am not an expert, but as far as I
>>> know, different battery management systems might have different algorithms
>>> to calculate the battery health and report it in as percentage. For example,
>>> in Qcom battery management firmware, a "soh" parameter is provided as the
>>> battery health percentage based on the real-time calculations from learning
>>> capacity, resistance estimation, etc.
>> Ack, this is more than just full / full_design. Please consider
>> expanding ABI description (though in the vendor-neutral way).
> No, Dmitry was right. It is exactly the same.
>
> Estimating the battery state of health information is indeed tricky
> and complicated. The reason for that is that estimating and
> calculating POWER_SUPPLY_PROP_CHARGE_FULL/POWER_SUPPLY_PROP_ENERGY_FULL
> (i.e. not the *_FULL_DESIGN) is complicated :)
>
> Greetings,
>
> -- Sebastian
Hi Sebastian,

Thanks for the comment.

In the qcom_battmgr driver, both POWER_SUPPLY_PROP_CHARGE_FULL and 
POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN properties are already supported, 
and CHARGE_FULL is used to represent the learned battery capacity 
calculated in Qcom BMS. Additionally, the Qcom BMS calculates a 
comprehensive battery SOH parameter by considering multiple factors, 
such as changes in battery impedance, learned capacity over time, and 
charging/discharging cycles. Such as, for the battery impedance change, 
it is specially important for calculating SOH in scenarios with high 
load or low temperatures, as only part of the CHARGE_FULL capacity may 
be usable due to significant voltage drops, especially in aged batteries.

Hence, we proposed adding "state_of_health" support in power supply ABI 
to expose this parameter provided in Qcom BMS which is different from 
the calculation of charge_full / charge_full_design.

Also, Android battery management code [1] is expecting "state_of_health" 
power supply property and it can use it if it's available.

[1] 
https://android.googlesource.com/platform/system/core/+/refs/heads/main/healthd/BatteryMonitor.cpp#927

Thanks

Fenglin


