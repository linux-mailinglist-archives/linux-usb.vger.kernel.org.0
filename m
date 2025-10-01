Return-Path: <linux-usb+bounces-28837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62901BAFE60
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 11:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D5416CA5C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 09:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC71F23C8C7;
	Wed,  1 Oct 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4Byabdp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE62D978B
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311689; cv=none; b=bYIAl2XdAQV3KNwawSnEAZFGnFGRkc0kbauz1qlZcWsDVmqAa1N8K7FXCSTqbQMTXGAO81xV5HILWVOgzHpWYJTM+ERJ/ZbEVcmRPV8qzJatOgqNMM+blxZOPwLoNIcGzgwNw6y+uf6wTbbUXB3v+klSqv4RLE8wPTJOhu2AnCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311689; c=relaxed/simple;
	bh=3J/3C9/qAuc3jy5xtNGYDipuOtbWzZ9YafcLRq0pjfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLjww72bv+1YuZNSYb1Xs2yCBhCAGSf1jcxSCWh7/clh0j+WxxvQr/etoH1D3qgDfOm3AiHqoACMzG67Y21/YTzzJBwP5SYj64RwFO9vCBk1kN4RsuZCfzpC/0QU8L8sGppy1ZQDdLfDs8SeRkAI4BkIo5VLExbBkxwkqdi7lxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4Byabdp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918DwRG020484
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 09:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMACI507iNq+HH50Spkbf83wGYWWaPzjK+BT3qk0pyA=; b=l4ByabdpJrErpzYr
	fBw8oGJHql7bQRmgvqOqrwLDmhXaZWCeL44ZfTN6uNWKsXOj6sb8FLIZrT1Wd1Kn
	HGKhkzno1McspJUDOKRiL/6Wg7KYGerScJboDgZ8dVpHXwfKqV4urBEX9Mq60v7s
	LS24IpgBqsM6LTcg+oV9AUuWKA0NpsfiPP6UBj5ILzqQ9Xz2U6yqrTyYLI0Y8zN5
	Ohu5EUxat1ZbfV6TM3lu71knywb6xzV+oqTfJA5gFXohXnxBowz4Njn5hnyqUlmH
	YFBJtaQ5OcppjFvR+HvSikO1TqCX9J5s8nQW/oM2qLZs4nfgNIWoqcpYNYuyC51j
	rQNdxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5v6f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 09:41:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-850553dfef2so4739266d6.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 02:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311686; x=1759916486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMACI507iNq+HH50Spkbf83wGYWWaPzjK+BT3qk0pyA=;
        b=HmTOazTZ6F1EBm1Jx0I1JcdrJbSg0tze88zh940NvuDzbu/k5YugLUASEG5aGJyjUH
         nM1HeeLhNs0B5nXmY/MW4dg8TcdR+5KY7IBN4M0Eo4q18ns+I5pA9tNnOEvvPLRtuoQc
         aw47AgRJ1Pp3KctldCnDVew1g35D25YaoIrhZ7fkd2PlTXqG4rpcMd7mtoP4RaVjzbms
         bsoZeA5I3WA1G/Fhz8mTn4wO9bTwAP4kBrzaY4dXU3xjceGHsnJElW2hvJT3x0uobsEs
         adbl6z3SspVHLMRJgu3R2u5s+NHyAJwGUSIQdxoDRMlbq3r3eFaEX60F+6P4jjRi8TKQ
         4QWA==
X-Forwarded-Encrypted: i=1; AJvYcCUKG4qZu46OHdXhyxhG2pwwJ5QqL1wD+8SiM2XRdD70eWpoelH3gryV1qlfXUBg8IBH36Fhpx7gHDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZDjDf3t3ZbNZTOrK1c/VOw2/CTspb0NqmSS2UwJ0HXDtPBOb
	cTyFDo/qz+TS1fVQbInfZWJ8RwX5UDS/yIzxQ9MQfXGbC9UPvogOkEMnJpZkSyLXrY2zFfsBvU+
	82K8zSwAaCEkkUmwDSKPdsQf/U7P53gl31VHdrcGz3zm+F9fwaySyvDPzDn76L8M=
X-Gm-Gg: ASbGncsLdIb7s4WamxAl/Sdtvaxma8foLQlCfb1qV4oZI2mxk5PrD3JUXmWxVl11QVz
	HUaEr/77ORp6xZL+63CNZVZX3/79calxr3mzci6grlZnnRDF1hjsDIB34mtd6tC/LSEdDJkYAZr
	e3lg4eFB/4OpQHhkcvBuv6Jv6AFOpTA+AJzQ0sMTmiuZiIOWmhi/3SSOcsyrq8JdWvnFk4ppmQH
	Lq38Oa6ssBue0iUtXRVzYRH41vnOzlpKxMs9Dy586wU8INR6CVZ+VMHGl2nZV7dvme7R8idDNCU
	HPXfsWi8zfT/wgfWGMNUU66fvy3EN0x7g3aZYIMpuJm1Kada60X134qp4o08iFp/MkQV7GEBNAP
	EukBQgfBsiZq9SDaD7QLNwlStL0o=
X-Received: by 2002:a05:6214:5901:b0:876:2e1a:e77b with SMTP id 6a1803df08f44-8762e1aea08mr9576026d6.7.1759311685688;
        Wed, 01 Oct 2025 02:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH91KYJMcHd4nXItFYbdscjiAMA6CT2dkzCKpFdliLag2sdxHLuQD82pLNUht/6WuFnNRwYMw==
X-Received: by 2002:a05:6214:5901:b0:876:2e1a:e77b with SMTP id 6a1803df08f44-8762e1aea08mr9575846d6.7.1759311685090;
        Wed, 01 Oct 2025 02:41:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634d8beedf1sm8022837a12.26.2025.10.01.02.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:41:23 -0700 (PDT)
Message-ID: <45d20c2d-aba3-4822-8965-a7a05096860c@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 11:41:21 +0200
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
 <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
 <297ee4ab-73f3-60d5-8e16-8830135603f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <297ee4ab-73f3-60d5-8e16-8830135603f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nfxDRaAUQuSdx7CPivh1Gc8-YZPnYC-U
X-Proofpoint-ORIG-GUID: nfxDRaAUQuSdx7CPivh1Gc8-YZPnYC-U
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dcf746 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=fy7xcfgtcmc-wzi9Pt0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX3yeEiYxGH9Bp
 kSYLuQyza2KXo+S7EoDw1+UX71TMBFR3R5CWqzUtsljRFRBp29GRGCCB8Ej4EZbMWlzOB5Bkxh6
 02wzv4S3abqmtblK0wyON6rpuVy8H4pTHnbCxrFyGuVvWtzURZta5OxsDztaALY7exHPnYfWP9R
 SRv7XzKd7+HBLN7BuIlyIjZEkenARzM3p4GVmwf9nYL6oXBGsGJsjXptfSCvGYtxf27Z55C7Fbp
 YTFsju1PxFG06iRZ7tW1naXfgyA0y8HowYxzB9LQoRPM3cnKtIWV5Sc7U3tKCvtrzosP2TZjLNe
 aRn/pPfZv3P/Z9ElH8G/opEI7uxN04o3nDUafq+ZNMkIRfDtRH+yyrDP8DnHtv28VGxoFb5of51
 cXR4OrT8K1HGfHRJMEzoifD/E/WxmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On 9/26/25 1:03 AM, Wesley Cheng wrote:
> 
> 
> On 9/25/2025 3:43 AM, Konrad Dybcio wrote:
>> On 9/25/25 4:28 AM, Wesley Cheng wrote:
>>> For SuperSpeed USB to work properly, there is a set of HW settings that
>>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>>> these settings follow the latest settings mentioned in the HW programming
>>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>>> new ways to define certain registers, such as the replacement of TXA/RXA
>>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>
>> [...]
>>
>>> +    /* override hardware control for reset of qmp phy */
>>> +    if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
>>> +        qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
>>
>> Clearing this field is going to prevent the PHY from ever going offline
>>
>> The HPG says this should only be necessary for keeping the phy active
>> during MX retention (and the listed usecases are USB4 wakeup clock
>> generation via a respective _USB4 register and/or USB3 autonomous mode
>> operation), both of which are currently unsupported.
>>
>> Are you sure it's necessary / desired?
>>
> 
> Hi Konrad,
> 
> At least on the PHY HSR, its mentioned as required, and if I remember correctly, if this wasn't done, I'd see QMP PHY init timeout.

Hm, the wording in the docs is a little ambiguous to whether
this is really needed, but let's roll with it for now

Konrad

