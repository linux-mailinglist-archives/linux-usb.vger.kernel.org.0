Return-Path: <linux-usb+bounces-24439-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81686ACBFB9
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 07:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00527A1783
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 05:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61751F8690;
	Tue,  3 Jun 2025 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMMeDjDY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231551D5AB5
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 05:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929699; cv=none; b=gzSGQvFCZZfYVjUeUHFZojg+ioJBiZurMZzi3k3MRd1pNsbmlff2U/o+94OlyCB9XT79lc+mSPM4dN0MaJ+S4etBesVsHxhp8IMcc1X8rUPVfFsR+/7UnSD1M7eyKQrDalOxn03Ph0PcDCn/8B9V6Qpxg9izRqUjP9r9Q8/041A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929699; c=relaxed/simple;
	bh=aKj4GZ6PPp/Nz5rkizthBgyRPAg8m37h2Nts/v5Lkpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEHJmKl8eL2z1xolId2J56b2+TSNkB/2SOJDPlZcadRtXpsmcpQ0twCZe08BmRW3YMa3nLiNm5GBrkrCLsvcYSNM6TTaRoepv10npIKFlmasC1gFa7B9sDgJIFk5H0bNte2zWwgJrR+ErfKFXPmTWI1eK2UtFiVZ2EDU4NHM3P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMMeDjDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJrpS026921
	for <linux-usb@vger.kernel.org>; Tue, 3 Jun 2025 05:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x60maCMmz6HZ7Ug8+bGFKM1JZXBpI0KP2xH2KVmpU+w=; b=PMMeDjDY3puQMxys
	t1Ii+iOdBbmKvmXBEdyK7nxAO1FI5EEy1lEK5F7d/3S+HNBMYgjxlJjGGW2XLnid
	mFtD4lobaqq2j8un3/a3hsdtZcZmOpkdkLNJKInyHbOdqilKPbZztW5sbfgqxE3h
	uhyo0uxCRH1yn6tnRcWn85vPhRklBwxGZWBsoFkymbgg++MVFN7D5qdaR1TbNC9z
	P/GtNcVK5v3p9XnxdpLILzQ4NkTKWqpgLt0nk5hScwd1TLpzB8BtCdMU5OwBt4GV
	nA5tT/7lcEtvzYQYo9xQnGX1IhGTryeCjD5F4jXfN7IVThU8qsKZcvoGH+0e8FQI
	2bUDfA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rseup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Jun 2025 05:48:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747ddba7c90so1719162b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Jun 2025 22:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748929696; x=1749534496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x60maCMmz6HZ7Ug8+bGFKM1JZXBpI0KP2xH2KVmpU+w=;
        b=OS/pS+6aIhdeb6+DQ2TOI/IscprBuPIS+NBbVL8YEhKCKLWiQC62UfCxmh3Al9FzR7
         tK7V6PPAP6YAiR7HE3JtQaokh1Hg13SxfiVZN1HGep8V2Id7Z/svFlP1MA7dxVdS4qqh
         LrtabUCzYP4VdU9yRTETrKS5xa4MJUk8N/C/YoiISCucZ7E8/sQO9GxWOzhXAuieqoFh
         unb5zg9B5RHmaUCjlLJCTHwyTnJrvCvaVIxTX0NCs7G4KI1RMrNMQUAJu0wIzTxrRfv3
         qbVSQPq5Ulmv5kO9ODzEnq8tr4TBNUwzawbpTnTCrWAaunZyvB0lftQvOh4ikHDRvU4V
         lRaw==
X-Forwarded-Encrypted: i=1; AJvYcCUMCfnU3m5HJf3UTg6KWSlGmBdyotQM7VWQVptbVSaL3YqhicQHqFfwfVaeLGUXxvpGn14a6WrK3cU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQus2pShoNQELh9TPm/Gs27Uxc/nAAf8DPvMIjExgs1r50/sI
	0nFdqe89L4Wh3ixBO1UAPLp7KMX1fXIpxcGk/XypUvgDNX8BOdEyj7cMcDR8vNCARoWwbUwkg2y
	jZ6/8sdV6mkTPYPUiNcsNYTKtVhjOrDuRUJ3GOF+m5ZeIi+emh1xwcPhZGSlhIvo=
X-Gm-Gg: ASbGncu9Oroq0PM/y7rley6r16MMjK8Gc6EO3F8q8vY8k53eL4gqkdfj3kCiRsDqqAn
	kN4dwb3eI2j/OagE7mkJOKnqC5qIowodAKIyFt3RxtX1WQS9qKu2KvCBZ8KdwrixBPTa1f05ktx
	+apY6G5EhmSW4HCFZ8KsDn/e/BwMIcbVfcwYhqZMcPoQolF1feYUl1IjOBSsMZLfQ7Zr6wIl2pM
	21NirXUFDAfjCbe1yKlkrhWkOswft7M65TvQ5jWMyu721WKt3Xja6VmZzhzijZmi9IxkoYf78BX
	ee2flj7V1ANlkWrjahy9aULdbhiCFy7/xe6lQriFMyv0DmBiA3KU5SCrThdo5VUWzS0hOkx1UCv
	1
X-Received: by 2002:a05:6a21:164e:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-21ae00ce7bdmr25596971637.40.1748929696379;
        Mon, 02 Jun 2025 22:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAtEPb0qgjBapOIIc/FVtRuoOheBabfhP2QQGPgPqaMfCZMRqkfWJocE5Xr1V3SkSH42ofug==
X-Received: by 2002:a05:6a21:164e:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-21ae00ce7bdmr25596940637.40.1748929696012;
        Mon, 02 Jun 2025 22:48:16 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff7464sm8636060b3a.180.2025.06.02.22.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 22:48:15 -0700 (PDT)
Message-ID: <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 13:48:11 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6TV8Xx5931vUSxvATgjHdb5w5sdTnFxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA0NyBTYWx0ZWRfX1XokqhJfSphh
 PE2A5i7NwEACnjQwEmEdY0iF74PjT641KNNMsWVfo9lkUW2a2l+ylRbk56xDiuEpk84sAAYXIZQ
 ov8rZE84pxakobFuNIFT9yJF2JSF5HRV8fAEgtjWxp+51QKmLRJP09F1LvhIrF97Mddbu0N56vV
 nsCcLiJZJtYgJb0iKNz6RK56UUDbfPPqgQJNRleGDwO5hsCjXP2Wtj8sKQ7UtMjGuRoz2YLbfun
 5UqUjGlMa3eC3004jdw952Rsywwh6M2Z0IwqQe0zED19zm9BfjLo1dFo1gCqOCn7noD3rJGC3AF
 e/TSqXIoNRLoa5UVsA+YG1cDo1cgGaTa+foppI5FbklHyZCEauBlc3cJiEGQvvln5JyJ9nTwvjR
 2L16YsOQVTrKUTWUkQJjeU1VzbZwHNBlHnPJhA9uy+adzAjz/W+kf56+D3OP9WQmac1f/UkV
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683e8ca1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=g1VTAUynFBCLE_zrBTUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 6TV8Xx5931vUSxvATgjHdb5w5sdTnFxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=615 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030047


On 5/31/2025 6:36 PM, György Kurucz wrote:
>> Add charge control support for SM8550 and X1E80100.
>
> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting 
> works well, I finally don't have to worry about leaving my laptop 
> plugged in for too long.
>
> One small thing I noticed is that after setting the sysfs values and 
> rebooting, they report 0 again. The limiting appears to stay in effect 
> though, so it seems that the firmware does keep the values, but Linux 
> does not read them back. Indeed, looking at the code, it seems that 
> actually reading back the values is only implemented for the SM8550.

Right.

Based on offline information, X1E80100 doesn't support reading back 
those threshold values in battery management firmware, so I can only use 
the cached values for sysfs read.

>
> Anyway, this is just a small nitpick, this does not really affect the 
> functionality, and I would support merging this series regardless of 
> whether the read back values are always correct.
>
> György

