Return-Path: <linux-usb+bounces-28672-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B4B9ECB3
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 12:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D37716FB41
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 10:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8082FE587;
	Thu, 25 Sep 2025 10:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1OAnUTZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D361C2EAD18
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797006; cv=none; b=B20tb64YKCl20TH6N6Id6dkCsARclEslYjOpM+0zwd/vW/Baiskb4faYalqSfK97c9l9+0ljOd6v4MHL7CRpe92TrQbNgsQGPZ1ckj6JcWQbGNe3O67pxvyR3rY+5JZdzkY5lqyhYxfcJjPrtXb1xVbRubM+U6xP5eV9M0YJf3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797006; c=relaxed/simple;
	bh=3cn448J5AE0qbdAmfGCuMMOHudJWRnefXkxO54l3c3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kproH6KpCst5uSgeXC1oqM4opypU9KRVS+YvYykMTenIWh/88YfN9nt/AYUnHJ0zfx4jxciLjeBRZdtGg+Itk8kQtyi7QIVfLjQD7P/3g4z1welLF7qdwZ6BCAv1kN2VDtD2ik/LC0zWOdBQaULWe4iaylZEuyT4hnumlIW1pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1OAnUTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9MgaI025133
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 10:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LyNgLzLMWc1Mnqx+dRpZQ1k73x+Ofm4U0A3bsduzpwc=; b=f1OAnUTZA5xmOQeD
	4I9UfW6m5EmZd1fnOykAdpPsmr/Vy/G8wk+ChzR6yz8Xknu4zpaawsnJL+e9GkX+
	7lK8ggPsRfflffJvU4OM5U+KIyJmtdFmYsM2/rqoCE6zRDblUKPQAZ7YqW79jeYu
	FR7psXdcy3PEtrPH58841naMaSLKVkYjj8GZjwy4lzHnjNV2BdkxTwcX+uChkswL
	4bjOWKMwgbqKlgJFPuNapscqf0yjPpUvW13o33uqPzpze40aCUQQzbWj6/CUZUo+
	/iACCAkZDg6azDvoLri0cMdhI0MOcPOAMxHo883uaFLkNtp87n3W/sUZY7R649NT
	sXmIGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv17srp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 10:43:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so1046461cf.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 03:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797003; x=1759401803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyNgLzLMWc1Mnqx+dRpZQ1k73x+Ofm4U0A3bsduzpwc=;
        b=QIUs/EhrwClfXu2TjCmWarJFBjExs6QkYt3uVhtNmzrC9d03PN9JW1zi73BhJVetn2
         hvGOezgrsPmvfbX+HSBJ/c+H/9zQPDEsEVWGv4SQQLq1Q2FIsMze3+uLSZTh58+4mBUt
         bPrKCB47Uvq7SOIxNhBf8CBbooaMlAqPTEr+AEyLlbnlRoTzXv7Dnp1L3yHYMuiL/fzB
         nnW+e6UsAdELCUh/HQmNrz9ffX34r7pi5CquohcVjPBnKIpFnqe+M/wjcMfmx7F0wajV
         ykYo8v7NiUJltPQ/MYia+m2/PqQIAvfvhgogHLhUUHEiM1FYoNU/sZgkuY7ajyO30Lu0
         oCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn2cd1ttBsjgmxHI1JqyPVFE6tkpp7LgUlOcJpZMya9CJT24B2LoLVIQmCWY/UWWs0u3m5fHTe2HY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK5cG6i4k3KR4ao5rkzXLNjJAxioY4mIbatYhQtmptEsUMx36t
	C/JX66bNv/ed/axCKAhbnZ2hftamMWciz68Qibtz1GaWLUjA4CLl3cHGwNOzA61sTyYdvGNyWKM
	ALNVSkuNGbS/KjVQL1AwkNodrYGhoOnuehtE/PG3VGWkF/bazB64BatIlOT6jLhY=
X-Gm-Gg: ASbGncsdkT1PqPjWCUISPwN98QZLCT2h/Ca+A1ouF3crNLAMUURdxiMp9HrU5rZ5vfa
	fVM/VyX6SbyT0h6WbQ+a5eVR75t2aoZ5DoPkvGCe/WgfUPQeowtBo5jUsrzIbQ8BrempQ6aB3wy
	oNSdm0rICUYdJ5hme27I/LBRtnrcb5qRgpROb3cBomeCH+dijzoT8v/CdKCoFc2Rvq8JPB8/wnz
	nzkQHhRg+57h4VIVHFXqcH3HtpNXlY0381W/69xK9omdln4vZVpIhWhS+DhEm8ETC0fCNpVRrEz
	fmaEYH79gZqo6Hb/PvVN1nVGPCDjwEJ0b+rDWDlBwv/A7RwTSGPujvi4/jPSygjaBJ4F8zliw8w
	YJWZPB+QH5u5uqUxVmANixg==
X-Received: by 2002:ac8:5d08:0:b0:4d7:9039:2e87 with SMTP id d75a77b69052e-4da47c063ffmr26594291cf.1.1758797002870;
        Thu, 25 Sep 2025 03:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRYUaRRp+tX2H+EUDkPQlbMlY0IAUeEcDN/SEG0LxWyKM6rOpzeC8AZaqcyLUwx8dK85q7Pw==
X-Received: by 2002:ac8:5d08:0:b0:4d7:9039:2e87 with SMTP id d75a77b69052e-4da47c063ffmr26594041cf.1.1758797002219;
        Thu, 25 Sep 2025 03:43:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a364ffa4sm1010479a12.17.2025.09.25.03.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:43:21 -0700 (PDT)
Message-ID: <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QbQZtlpH2D9wuNVX7EJa2X7-9AM09-Io
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d51ccb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=O8mQQSza-jboQJHTzfMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX9q9/JafBwZin
 NkZjq0zJeRB13RrAYx1TlJ+vk55C8c+0td3A+D7PkYPV59dDRbZhnvJo2a9xh9Qdx67OZLchf+T
 L865E47IS01Mg46zvBtebmMy06c0QpUJ6m0xnghvB9XAycd5RoTlDklzVl0mw80mL5h88Plg6oF
 91BCdV4+aTAsH8RkfvOEpw0bsYLi6Y6FKc379JQi9QF+jY1umEE6wbjLv7ySvl3H6DAd2iPKcHY
 S14G4ao5jGkheJxqS045S9dfy21OBgvDXrrLkuibUmgWE/3EkRC39/m+xHGtbHbQ7LC4EhQFm02
 4OQBzgmi/J3hLjHC086PPL2MPOqzld3yRQgKe4VdGlzr7yaC87nWE5a+/X91oNAbKftQHpwJlE8
 ioZPD1bU
X-Proofpoint-ORIG-GUID: QbQZtlpH2D9wuNVX7EJa2X7-9AM09-Io
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/25/25 4:28 AM, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.

[...]

> +	/* override hardware control for reset of qmp phy */
> +	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);

Clearing this field is going to prevent the PHY from ever going offline

The HPG says this should only be necessary for keeping the phy active
during MX retention (and the listed usecases are USB4 wakeup clock
generation via a respective _USB4 register and/or USB3 autonomous mode
operation), both of which are currently unsupported.

Are you sure it's necessary / desired?

Konrad

