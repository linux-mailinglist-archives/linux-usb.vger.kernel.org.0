Return-Path: <linux-usb+bounces-28684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F0BA1E92
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 01:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1315623562
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 23:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299D92EC55F;
	Thu, 25 Sep 2025 23:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGbwZ7eQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4246D38DDB
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758841408; cv=none; b=jE3fh5ZmoIHxmxvlkMV69VuAE3kR5vMKLfQxA1C1AMdTzJYXnZmrg6EnHwXgBDd9ulZbGCcEiFhDN1eh9xkLSBlftziil90pAnY8nY16x4+ROq4sY9hB7mPBneVjSbmV1vTEhWbr1X5sHrg0hkSveAC+hCRp0j/SZ95OVMdHYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758841408; c=relaxed/simple;
	bh=Re6vJcgbqIa0a2Z8s/dyJr+80qdfjB5ADuATqHo7/iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1KW/6wjirDWzhyYhY9ir6z/Npwp9aUu9DIy+/t2yQgRCdktpguov2joqIB5ooTr4lpWmWGZmWd9PZ8qmfgxSJTG9fF3ev4HK8h1JXqjw5x2iQ/7f04srT9e+iTUDY5KzOXg3n5AnWbYPjUY0j7tofHrPVCEtnvbPtV9x8d8NAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGbwZ7eQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPlkg027784
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 23:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfzKhTLo4L9EzNBCoQA/Ic/EtRob2BTZ1wUdjds434Q=; b=aGbwZ7eQaktzZUWg
	TtevFKgN97y9vQBzP88J7XVt/wMNzOmew8z97fNrK1c5Kh2V3DhUBDjDi1g2VtPR
	8S1/M8Mz4j/Aubuz5cnHf7znpl2VPnxpIto7IyLMvnz8L+zZKHFm3Bf552x1nkme
	QE5/wnQACNH4COg6qdHBk1bv+A2TT7IilVu+WTNsIxRaoJiatdxhwx+iRP/ynafO
	XY3VlPlhJNPTTILXWRujMJOaTM9uiv7PoSzfa/69EeO8IxIazJwE+bIxOj9jvcWE
	10mhHmmmvp47afkRDWXwUtV7QjOQNxbQXd0/4P6XN+0bE+hciNoUtr7n1ovtHVt/
	EVSN3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0mjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 23:03:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26985173d8eso28607925ad.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 16:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758841405; x=1759446205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfzKhTLo4L9EzNBCoQA/Ic/EtRob2BTZ1wUdjds434Q=;
        b=BHtLfRNHlNpYY9H+WsvTBfBldmyhRfaonG57u4QoV4LZEoTXNsWhULN0zNDOfG3+GA
         +LJte5jpaY75qmdWuZz5XvWvAuinkUIY2YpssyeRoxi4JChd8nINBd8VFZV1RtMnqwPi
         SggPwA4RU9ZdyZJg22XWtiAwxCzFan/MyiDPPZYpSCr9/xGNU5EwTNPxR6bLQyDtrL+f
         JaYqEvtgUxoM6xYClM8gIXc/w1BwkC62L0cNW5beA0F0yO6NVZ5/+nrfF2LhCQCD/ShD
         qV5dc9Q5jLKvfNiA7tYveoIkFOJE/e8J3iKPG+2YlD5aDuEaCONMpIXHE3cfGMyy7YYf
         QFAg==
X-Forwarded-Encrypted: i=1; AJvYcCU25Bgtjhx6T+OTtNSIdmS6PFm58PJAxPcgk1Dp0rCivH3VK7caK7cL9cPO36TLqeQNIxKAOUV5YJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3IHa/7Tc8cbfuVibOOKsmqt6wpu+a2eKPp7V8kFQ6JtQaUxD
	dN5IWL3iWm+QXZSX+1MfwSdryyIK+Fur2MafIfu/u0bLNZXZa89kaK3X9fTmuNi/vRkbgjvAJzf
	snddlguMZ8dCUgkwv8V/eYyuLDfvAcbyM43vBOL/Qtq4Wwl+jWmLh1wqAwSHmKXQ=
X-Gm-Gg: ASbGncu1BO+f6OfQOE8dLjepjby2lFYctuSFiLyEmlzJsUGdDEudKATxbRZ1VVanjvy
	nM3fxjl0JPqU/2v8O0FpmjSWe3yMtagAnnqXQuSIr793XqjXENLuJQlO+hJB1/iX4rNvlI5i03u
	CUmM5jBTRT1l4PfjkNl1rdsT4L24gl2yg/6Ihbso6LYuADvsfF5jDk0Nv4rQyy0fb6LvOCWHLeL
	0wv5vZjYPXe8MeEVdz7fgkMFIfXFiuxzBI4YRZSfwZY3C5L+R7CdASirpB2rvPmDWl+wSfrg1so
	Fo9RAVdyPcLgH8BIkSyhSJt8bFP7xgHjJeGE/AdtDaGoZhuGSYvzb6ELC9D2QneysGJx+HQCTmn
	xeAfTLp0=
X-Received: by 2002:a17:903:2ac7:b0:24b:270e:56c7 with SMTP id d9443c01a7336-27ed49c771emr61707265ad.7.1758841405501;
        Thu, 25 Sep 2025 16:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHOJqmjzO+AnKfT1eW43G4SzpCox+5vXEEMV2sxZr+rbaIyUa/gbfX30AzcLSCvAvNAzb4yA==
X-Received: by 2002:a17:903:2ac7:b0:24b:270e:56c7 with SMTP id d9443c01a7336-27ed49c771emr61706895ad.7.1758841405047;
        Thu, 25 Sep 2025 16:03:25 -0700 (PDT)
Received: from [10.73.53.199] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1d45sm35260175ad.141.2025.09.25.16.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 16:03:24 -0700 (PDT)
Message-ID: <297ee4ab-73f3-60d5-8e16-8830135603f1@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 16:03:22 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
 <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/rhf9+wkzdPU
 9Kejj4CcdCga0m5yozKcPkpHg1/4HVDPTBXtV14ujBnmmgdGitOoEtPrIgJDZhx5wLykwkUavDn
 92uoNaGZQDy1YB7BRVyxGuxgBi1T78PaYWodzpkWpsVUk/WglX2qOnB9fHxTM6W3oRPhNi1AjE4
 OVeL3HocRM+aRPfUxPjzz5WyQXlEm9WJhl8ppBEMzJjDr+z+ngIo3OGH545G2hAQxswImuyZWKX
 zBG03mB8THP+sniySlNxvoFtgVoHt3xxn7zu/oANIGpl3DW7jxOx8/4+yHLNszWN2jcNWRFHoDR
 qjOFjDT2aa6EEyN++brH4j0Q/hpssgwAsAThJ9ePzumL4NYmHfehv3JxxJoreo3mTK9CNRks6dX
 HA0XZua+o10G4P/ZJDZBW/YSBQEREg==
X-Proofpoint-GUID: hS6G-OdYWDPtLFYcf0KmIAfndcebaWa_
X-Proofpoint-ORIG-GUID: hS6G-OdYWDPtLFYcf0KmIAfndcebaWa_
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5ca3e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=R8zOBIxM2Q8kPqU31PkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 3:43 AM, Konrad Dybcio wrote:
> On 9/25/25 4:28 AM, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> [...]
> 
>> +	/* override hardware control for reset of qmp phy */
>> +	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
>> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> 
> Clearing this field is going to prevent the PHY from ever going offline
> 
> The HPG says this should only be necessary for keeping the phy active
> during MX retention (and the listed usecases are USB4 wakeup clock
> generation via a respective _USB4 register and/or USB3 autonomous mode
> operation), both of which are currently unsupported.
> 
> Are you sure it's necessary / desired?
> 

Hi Konrad,

At least on the PHY HSR, its mentioned as required, and if I remember 
correctly, if this wasn't done, I'd see QMP PHY init timeout.

Thanks
Wesley Cheng

