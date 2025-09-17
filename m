Return-Path: <linux-usb+bounces-28179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C3B7EDBF
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1172152320B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 02:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778A42F60AC;
	Wed, 17 Sep 2025 02:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJEr8WnF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E02A2F547F
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 02:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758075839; cv=none; b=KkJIVsMwzr3d0NnEAtiFB2vEj3Oi75+gqHTvw5DDkEJSofJ/kv17wkgUkTBcle2GMIRqYlS0HwOBC8ASp7lsVMA1M4IybzV0o7v43hkIaSIhQeX4f8zgQvQyCRHFjDo0Ppw9aNWRdGgrv47r5b5nbd4q9zlmJpDLmNzN8rfBu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758075839; c=relaxed/simple;
	bh=JDu703gJi4SNHr8MEaA7gFNcyg73bIGejUOowGwFSGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcubz+oSfg3QIjEUE5JQHa5OnkYB0wXN/pljMaJovrcWY4yUzvqZR3XWDFCR5tFcO9oCJS2CkyK+sxUr2ez7x9JuYQRMvLPYHzYPEhnO643oG8jK7Lp8rLamGXDJSewgp6Fm6r15Siqr/UIgQwh7o89HVmWcdIKMyqxiORasILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJEr8WnF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLZlqP005591
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 02:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h24NHOjh9CfAGdrmNIBn0f+X6SHiD7K8dLr4j2/9Zz8=; b=cJEr8WnF+WSbXdio
	QIU8SqkLnYn56mqq5S5lBq5auaKMHJLd3OjAEEWVtFVM4X7O6u3KAgqtrBLUAS/H
	SdVPx+FTZzyjGpJnWzZ/BFnayQnD4fPwzFnDHv5agx/k8q2tIjuVivzzbUtQOuO6
	/IKGXFXGDoPRPmITk/oQJN88lzzU36Q2WJB38H+1FFxmP7xr/TQW9FvvRunSgmA6
	nKQobfDbgZ2tEcKsUZ0CrCTO4kwj9bhq1GcL8i0OKnFcIkoLHxKBZwdOfI78NB36
	FejrhZIU8YaAuP+Ng+R0rnvjjEWF/HebvhMG6AodjZcpzxPpDQsWcvmEEZLmKGbB
	pOt0OQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu0k00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 02:23:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5242b0f450so4260999a12.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 19:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758075830; x=1758680630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h24NHOjh9CfAGdrmNIBn0f+X6SHiD7K8dLr4j2/9Zz8=;
        b=p8Z0KXmVuAp5uo0qsT7AcmHWaruT3kdSPT5FwZv9wdndKgPrqrCqnIQy30hEI7YOio
         FaXViWnb+z0wOY7V9pWChrpOZNBYFAR6rkyB5LriCD9yiHQw2qJZ8mP12SkOaxbeaeHx
         ySIhEg9lYlBHo87C84jQzhyJx/mdHHXNgOoDchlyv5ZutoCMHT0iI6vkWFxbX/Ht1woo
         1ILy0IcBmgyEyr6P2jdplqjUkPhSOfQs+JToGk+eqImpOj6qrxQ5Av0i09sa83HP+9gM
         cDH+jftoq0cO7TvTna6VvjyJHSC7bAatZr0veTD+SXy7z/xO9c+K5OPTSYfHydpcj5i2
         6JNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA2vhRTHlVCaUSPiRXE8hQRaKI3fdmQ6W8bK7oyMH3EaNWuroMjXNQWhXu/A4UTZzxT3qtQTYdVaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwecuAxSdgVyKZXMqnAHmPMdBqHMVRR7N2jCNqM1HHXy/NjPls1
	frwrbwpig0798fIlqR7TP+BhUUM4Ttbta625ed8UXpnCuOowtmuW5Kjwrj3ps85fvTGWpWgfBS1
	T0M2HPeItOmtOlYM4Lxp7W2mbFEXtMzbCE3XcxAky3wvkdLVJ3qHlYbe+ZTGZngA=
X-Gm-Gg: ASbGnctPBlGO+Wf6YivAhC0uPIxouwV1pw6AXQvc975ZAmmvzQeWz78uHbR+YCQPH8L
	v8Gt8EgXqUGvnUWDQY7NuLrgqXP0QZmOZAYT3d59DbOrb2mhSBEVZ1Y42D3GQotQS3dwoUOlBz1
	DDVH54C9ojT6+qDKPIZQkBeorKN8rgHIoGuGlA9zxtwjnGhkj7ZZu0tPtkbksYk5c746VCueHsN
	PeOcaJXIA7gHLIc4fuTFIt/zTEbFt7KT9LYvV4jDTLxAlJUmFyhEmyIwoH6CGSFbr33NCwGwzyv
	6jFxIi1p3/QkPmMElnN/k4LB0hdQDVF80JPSn0Bxs4EyazxNDkDBnj2BVw0wXLnAuFSnceUjJeP
	vXq2M0GTDDJWj0uLQayIUWrQbMXm679Zvmg==
X-Received: by 2002:a17:90b:35ce:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-32ee3e77a22mr630837a91.3.1758075830555;
        Tue, 16 Sep 2025 19:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY1YBqTy1MRBizc/p+yW2rG4Z6RYxx1hlDxK/FRXmTIxiFlffsuMnGhMwgW8FYwvbTxyKbcQ==
X-Received: by 2002:a17:90b:35ce:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-32ee3e77a22mr630811a91.3.1758075830045;
        Tue, 16 Sep 2025 19:23:50 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26a6ce6sm906637a91.16.2025.09.16.19.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:23:49 -0700 (PDT)
Message-ID: <3d2e8600-fee4-41ab-b8a2-9940a2acd389@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:23:42 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] power: supply: Add several features support in
 qcom-battmgr driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <r65idyc4of5obo6untebw4iqfj2zteiggnnzabrqtlcinvtddx@xc4aig5abesu>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <r65idyc4of5obo6untebw4iqfj2zteiggnnzabrqtlcinvtddx@xc4aig5abesu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyuLsGUeezbjr
 Pun5gtKz0GM5mDp16f8HWJM9tmZVaUCmaEDUCIIg6r7Uwz/UzkV4QHb1pK4eKjlMLT7iUSR2JeZ
 GQ8iyYkKMaZhqDRjcXWqJT/niONVuqdJKFqXFauHVjXfRNZpFqhCfXiubAZFr37YI5tgbKNAb9q
 ezpKvqv7OhZIbmNAvb5dZ86nQZBYqbF3LomnNtL7KA9VKvDtv7LxtswaZlmdE0cZnsjnRNQHfDw
 hb5OCY9EqBNR+3swVR/v2WScTv+3lV05f5hn6d7DFGkrdWmiJOK1kOYsxg4R+w4iPipsd+GtYlQ
 xmAn70Cqmtd6zuBqWnCsFJzosPq9FBzAlFPKtK4J2l3wTU+7aq4Wh5c/r2pg+/ptwXj8M8g2AbZ
 3kd7nDD1
X-Proofpoint-ORIG-GUID: a2BHh7siczHECz9iSinQiN9g1LTkj6Uy
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68ca1bb7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fapJcwKh2RYohvRb9XYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: a2BHh7siczHECz9iSinQiN9g1LTkj6Uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/17/2025 3:35 AM, Sebastian Reichel wrote:
> Hi,
>
> On Mon, Sep 15, 2025 at 04:49:52PM +0800, Fenglin Wu via B4 Relay wrote:
>> Add following features in qcom-battmgr drivers as the battery management
>> firmware has provided such capabilities:
>>   - Add resistance power supply property in core driver and qcom-battmgr
>>     driver to get battery resistance
>>   - Add state_of_health power supply property in core driver and
>>     qcom-battmgr driver to get battery health percentage
>>   - Add charge control start/end threshold control by using
>>     charge_control_start_threshold and charge_control_end_threshold power
>>     supply properties
>>
>> The changes have been tested on QRD8650 and X1E80100-CRD devices based on
>> qcom/linux.git for-next commit a679f3f6931cdb0c2ef5dc0c26f895ae3f6c1ddc.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
> Unrelated to this series specifically, but can you look into fixing
> the following errors (appearing at least on X1E based Thinkpad T14s)?
>
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x283
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x283
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x483
> qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: unknown notification: 0x83
>
> Thanks,
>
> -- Sebastian

Sure.

I will look into this and fix them if I can see the same on my X1E80100 
CRD device.


