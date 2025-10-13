Return-Path: <linux-usb+bounces-29185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E3BD11A0
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 03:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C6924E33DC
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 01:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EF1265CAD;
	Mon, 13 Oct 2025 01:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeZsKP7a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65FB1F419B
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760319320; cv=none; b=ReaGIskOhLQnVOh1/y4eOOuS4hMPBiZNj/SvUPt6JQUjgfcW9UbYO5sTW/RSdDUQTPYt+JB49BhtwslZTPtfSxlZhsJzCc1qS5NRSxMb+77L+S6pBfNHOxnkD3JkhPrDNSDf6UoNpu3GxYoCVNzh0Nj6xHkakuqT8+83Sbjzt78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760319320; c=relaxed/simple;
	bh=TLIifmYXZsoUZDQIMzAr9TVJTrPPzSLPCVver0Z+1XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lt1R1DWG/h/23brFKnRfkHMPjyOBXqryTJBQiEKV/yANW46CdErlbEOy2mXNzwGuwCVgo59yXFLf7gUGdflmWaYgykxMhIa8u8n0cBtXupbTqLOl+uAeRovuXYSp+oWUmNQmKs0XZqgByR7lY+6wVrnG70Nv/3iLEff/BdRc0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeZsKP7a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CN703Q013412
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvRZtGa1EAqu/s2cU1tyWSgB4EnX39XSZObMDz+e5Ig=; b=oeZsKP7aV7qBxP6N
	7BXiJMdcvYgsw5degXI71w8R1X2FFb/0EDYMkCjMXjUNwxhgQH0/Q8tcxBmjJc2n
	BDyiXpmtHZucJpK+ysWtMN9q1PRWseYCuwyYBj9ZfXWpmz9a8vb5B4OwQpqw6JrV
	YbLYQAE/UNvfw/9h5S5s9rimPRBaJMO3p51X6hXmYyFEeiL3xw1IHwpQ1Cv0TxSQ
	RRdlKaIRA1AIcz5lzvZHXZY63YmaLZnpan0NG7QNjC6Skuuwjq6lNMFTrEnFeZ18
	RfXvAaQEuj8u9T23Qtew2FaKEAyfksNmviKFjqrCyYbh26qJX8gatk+YlnU1aNMp
	jM9fBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs2vdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:35:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f9cc532bso6078997b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 18:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760319315; x=1760924115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvRZtGa1EAqu/s2cU1tyWSgB4EnX39XSZObMDz+e5Ig=;
        b=EegHmZRS7hGoN7bVpfR3vrM11FvBkRB7sxvtrFMpvo7U1TNzlvqzK85DdN87/hD/jY
         2+FW0b6ST0rgO1JWTh+2UERuOmH9ByJ4Kh8WbQ6TgWWJu4ga1LQYX6Gkl+chH/LOs+6b
         k5ffZ0EvhGD6xGM5FeWI0+GYc2G0+5ABhT12JJjdGhonHuRakGyQraJRwIDojlVCl2it
         9sKPtHuugiotZov/Ep/sWVQTbmLthtg9cVlfPlJ+tbK9i1A4jQLb95cUER+prNnVnvYh
         V8BSJu6dnQvab2r8SrkVzy8itDCqOOz6CJem2OczFIAa1tMrQWe337s+Ko5y0wNjZhY8
         9I0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsLWQlT6jRmPeSLUTaRzFIyjv46Qxm1IgcnELnl8TxcHXztdixlrgDUOrJ7D2tjW9h8z0aH5u14MI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJexJxaznEV3eFftYwAePfYDCAZxgOYc9wk0J3q0cDCsDjCTc
	jOJueFb8aHGRpLvrX/l71owE9JQJKS1UJSYou+5ktVIcriCe7ILmqgi7v+NLjsC3xkKvdCg9CNa
	nqv6Fr1Ruhtf+DPsotmAInx3hIrAJnq2Mi/gCoqio5QejmwVvm8y/ByAUhOdJ65Q=
X-Gm-Gg: ASbGnctxUqqtZ6xDCjZqvt4BSfB1pLRVHWKCWFpfgZVuYSGqnU640oOsUiFgrfjXqWs
	bcH9IygNxKcHjK1fC/WoWy2BnGvS854gAzFQSThH7aZjXsTxFOQx1JYVwxr45tCdIFy1cPnLvcm
	M2A11ZzEnqplpgKuk//EioSypshNpbflK0rFDh6xi5z9wMh0Gtf+IZZKre94OGcfeXl9NQWilIU
	1U0bziqXDPWmWHp/io3YR4Q0e54dTdmDrC8D4EVYOfF9KPlRO9aiQyYsRhGfmXuYvxsG7/OsmQF
	+QSvFJOS5URhuMoZKaDiYobN+mmPTX2urHilp8lNNxXqdqrzAHnkoeCij6qme3QYRG5txgyCcWo
	/
X-Received: by 2002:a05:6a00:3998:b0:770:4753:b984 with SMTP id d2e1a72fcca58-793998483b7mr24733198b3a.16.1760319315166;
        Sun, 12 Oct 2025 18:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH9hfoH8Q4uLbRfuw74qI/5V0wKxXaXaZlksargHLpNt/wRLK8+zJYUZKvoOuGl9lpjVTwsA==
X-Received: by 2002:a05:6a00:3998:b0:770:4753:b984 with SMTP id d2e1a72fcca58-793998483b7mr24733171b3a.16.1760319314749;
        Sun, 12 Oct 2025 18:35:14 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.228.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm9522670b3a.73.2025.10.12.18.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 18:35:14 -0700 (PDT)
Message-ID: <f1b5caae-8544-4027-9669-7c92a33f7c61@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 07:05:08 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix bindings for
 X1E80100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20251013011357.732151-1-krishna.kurapati@oss.qualcomm.com>
 <b9befe47-b0c8-4536-83c0-311dd16f2e83@kernel.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <b9befe47-b0c8-4536-83c0-311dd16f2e83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7/ijCFUCS//I
 uEyncR7st5e2L828rcwyEkBQVtD9NFb4oqC8A3UD193PU/jk9zqznJK+G7V557buxbyIfbFDXYB
 U6oQ7LgIdi4Os4teDbgRm16hyDmPC3vhUCQvpBUF1atMJ3QCMg1KhPsNvzTjH0zpNSIyJljeniJ
 E7e/kT/PUjwquuOBFNQ9Q5N8L/wlLY9ou9t1TjLj2HADNl4TgtYj06298vPrZ+zhs0VspRipZCI
 C8WNRFcwFL8u5hvbjR4tmevtTxnt8hVzflciRmQmwmCvfxGK0hEnTb8uSubkElL0I6ryAD3n4x8
 ZZlKPpBTU4Wrlc5xyo3RbYcxwgV4WR3N4Xj3JmPV6hqQITdFhTS0fVEidtPL9mCohMedtCBauq1
 qyURXp9bIeiKVDDMlXKLsY8GctLoEg==
X-Proofpoint-ORIG-GUID: AJSLsek_rMJBqDl1HxD5B59hho0a7YeP
X-Proofpoint-GUID: AJSLsek_rMJBqDl1HxD5B59hho0a7YeP
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ec5755 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=8YinarrYfdS0Dhyguhy4yQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=snNKEbK5PTu-mnxKcGYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018



On 10/13/2025 6:49 AM, Krzysztof Kozlowski wrote:
> On 13/10/2025 03:13, Krishna Kurapati wrote:
>> Add the missing multiport controller binding to target list.
>>
>> Fix minItems for interrupt-names to avoid the following error on High
>> Speed controller:
>>
>> usb@a200000: interrupt-names: ['dwc_usb3', 'pwr_event',
>> 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> 
> Don't wrap error messages.
> 
>>
> 
> Missing Fixes tag.
> 
> 

Thanks for the review Krzysztof. Will update and send v2.

Regards,
Krishna,

