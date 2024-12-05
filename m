Return-Path: <linux-usb+bounces-18154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A751F9E4F98
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 09:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F17282301
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 08:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E5E1D2F50;
	Thu,  5 Dec 2024 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Te7OWJPZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F071B0F0E
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 08:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386938; cv=none; b=iFMPzU5Q25cOJyekns9L+sJCPP3xVPcpl0kZtx3TkPLYT64+OaJ9KsCQ6wNy5AhDy1PlzO6PbRFw+birorgSV4oJXDB2Nxo/big0KaERmGbAZg7YKf3tKAO2sOBH9O+viJnar2ohpdaMPDiNZIpP7K9wRIb19H8s0/ssqZAHqGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386938; c=relaxed/simple;
	bh=Z+F2W3hNh45ECvBXWOYNZwLYFFwaeFbyUbIMfbSXiCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clNq7lrvS8Ca7FGV46snSsxI6mDRzALS2rbHUQ7WKgdja6q18NQzlHMBsagof5wASHds6yZjmC7WDHYWXNUIUGIGdMGV28PNxrujKsXXMFL5obK3lXurFRep2WUEnHqRjHJa1t7vtMA23JlE7mDQoJVieRJTbuql/PeLXIe8GgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Te7OWJPZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B571T7E027824
	for <linux-usb@vger.kernel.org>; Thu, 5 Dec 2024 08:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWaRHTtVbmK4IJGdoyqpW+GmjdnLJECmOOkFb8wysIg=; b=Te7OWJPZinloN6J0
	uRVTa8Cyn12VLWn/rJaYyDjHZcSRZHYD3R5uZHCBxhWEIAZRVwx6D085g5jPJStB
	DW+SV24X82KPLxesBbz6gcBgxYXjvuUa1tG15zHcE9SZG1HPmSvZXNxWlh+4+0sJ
	1h9vNHtIrltdfh/y33g1vHW+M8opxE+fo+3ymnhBKxrfOE0JAdYP11cjpm/HN3qQ
	WQs5Bn0XiYtFnNG+202Gc+28/lp4Jrpvo4siTFej5opdtbTRBd7uKr+KzZ2rmMD6
	UF2R9Fb/XnvxBl3MuVDkFjw+Dco5fVT55G2L6z6UhJYyLy8x2BTaFDYGyKCkDqlX
	AtQRUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vcepy0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2024 08:22:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2157145fdb7so9594745ad.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2024 00:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733386934; x=1733991734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWaRHTtVbmK4IJGdoyqpW+GmjdnLJECmOOkFb8wysIg=;
        b=rqBKaS4ZorgDgh9y2+iFDiAycYT88lEir/RNGY88SdNxXY5jt9ZGqViFI8G2YNBTIO
         aEdVGhmxPcYac6vNdQ8VnknihQ7fyUUK3SzIhP3FM7bDBNNK+8uMyxHQbzrFFriXTKIr
         4rDLLdkw3M2c9vSAE6kbJNIMyqQZJbkm6fbRTqBeqOVS/lrbB3SJnHE7+JJlyI7tdlTA
         smZiRFZNu/FqLeBlMdkwjDtOdnNNsA/WmP/8dlteUHIkyXV3s7TaZzD7EINhjMOYLlmT
         UDGeABj9qDnnT2t7s8TNdUAs54lGHxiQltn31oWL3EZAjcHiKCZ+aVhUrR9RK4QZib+E
         UnOA==
X-Forwarded-Encrypted: i=1; AJvYcCXXmIobUpQLy6e3a4Nrz9Ty/k7dlw7jpvq9XzOnSYOitgl2wDcXHFgC3Jmtpy+IYU0N+2+q8IZWsLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmLJeD6eY33ZbAMuI5D8+qmYDxJmQf+dqfZ+o2n2qdQhqMpyBM
	YTyJ5r3MNLYkz1uzzMcLvnaNfxtbGMGl+bC0Rz9f9XnQijy0tdoWv3IG4IXKyErn+LcNPBv8itL
	+v1T1BXMYFF0OnyG0eKC6zVNwfCCi1gWih92eC/Y/rIbH/0KP7gkALWIOPlktQXUhM5E=
X-Gm-Gg: ASbGncsMXxdAkvSRpHmAfFXbHX25+U7U4x5rZfemdhBvFstKj0EpanHdoVSp8Qq1/K+
	Bj86ljPbiO1BeR4iSrI7//iggva6cI1f72nhX/HwA7guQ3HhHN/bVJoqVlrhv+zlLPoEfowtHnw
	H6s+qLPOQXE86r8g7lMput1RGddXWrVvguWhZGhmbhcjblAdzh2eCSgZCZCa3UcvpRK7EkSZO2Z
	TPrm8aAJlJXYLN9VSn4GQ9jf5Y7VCWM4qdMkChBMhWFRt7MoAJiT8yYCEgHcA4hVQ6tY++r45x4
	gTMz4k1L7A==
X-Received: by 2002:a17:902:ecca:b0:215:63a0:b58c with SMTP id d9443c01a7336-215bd24bb6fmr127418105ad.46.1733386934483;
        Thu, 05 Dec 2024 00:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcRbCkAcP5idjPLoolO7JpL2Ap2RjFZcB3DOTS1QrZrQiXx+rK9bxRV3fLK3OocETika1fcw==
X-Received: by 2002:a17:902:ecca:b0:215:63a0:b58c with SMTP id d9443c01a7336-215bd24bb6fmr127417835ad.46.1733386934119;
        Thu, 05 Dec 2024 00:22:14 -0800 (PST)
Received: from [10.92.169.167] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9ea6sm7453955ad.141.2024.12.05.00.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:22:13 -0800 (PST)
Message-ID: <e6f60ca6-a4d2-4539-ab9b-dabe95dd2d21@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 13:52:08 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
To: Johan Hovold <johan@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@linaro.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
References: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
 <20241118-x1e80100-crd-fp-v1-1-ec6b553a2e53@linaro.org>
 <Z07bgH5vVk44zuEH@hovoldconsulting.com>
 <d095ae2a-3f9d-464c-9dc8-a3e73eac6598@oss.qualcomm.com>
 <98b2b88b-9690-44a7-9b22-2f23e6606e82@oss.qualcomm.com>
 <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <Z1FhQ3OUI0t3k1_q@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: njg0pPU1ujFZFJJtZLGjxHWCjT8wWMWF
X-Proofpoint-ORIG-GUID: njg0pPU1ujFZFJJtZLGjxHWCjT8wWMWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=570 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050061



On 12/5/2024 1:46 PM, Johan Hovold wrote:
> On Thu, Dec 05, 2024 at 01:32:29PM +0530, Krishna Kurapati wrote:
>> On 12/3/2024 6:45 PM, Krishna Kurapati wrote:
>>> On 12/3/2024 3:50 PM, Johan Hovold wrote:
>>>> On Mon, Nov 18, 2024 at 11:34:29AM +0100, Stephan Gerhold wrote:
> 
>>>>> +&usb_mp_dwc3 {
>>>>> +    /* Limit to USB 2.0 and single port */
>>>>> +    maximum-speed = "high-speed";
>>>>> +    phys = <&usb_mp_hsphy1>;
>>>>> +    phy-names = "usb2-1";
>>>>> +};
>>>>
>>>> The dwc3 driver determines (and acts on) the number of ports based on
>>>> the port interrupts in DT and controller capabilities.
>>>>
>>>> I'm not sure we can (should) just drop the other HS PHY and the SS PHYs
>>>> that would still be there in the SoC (possibly initialised by the boot
>>>> firmware).
>>>
>>> The DWC3 core driver identifies number of ports based on xHCI registers.
>>> The QC Wrapper reads this number via interrupts. But these two values
>>> are independent of each other. The core driver uses these values to
>>> identify and manipulate phys. Even if only one HS is given in multiport
>>> it would be sufficient if the name is "usb2-1". If the others are
>>> missing, those phys would be read by driver as NULL and any ops to phys
>>> would be NOP.
> 
> No, the core driver still acts on these ports (to some extent) even if
> there is no PHY specified (e.g. updates DWC3_GUSB2PHYCFG on suspend).
> 

Yes, since the port count is obtained from xHCI registers, the 
GUSB2PHYCFG/ GUSB3PIPECTL regs are modified regardless we use the PHYs 
or not but this is still fine. It can be considered a NOP AFAIK.

> And IIRC I even had to specify more than just the fingerprint reader PHY
> on the X13s to get it to enumerate. I never had time to fully determine
> why this was the case though.
> 

This might need to be checked. Did you attempt adding each phy 
individually ? Just incase the first PHY is not the one corresponding to 
the fingerprint reader.

Regards,
Krishna,

>> However do we need to reduce the number of interrupts used in DTS ?
>> We don't need to give all interrupts as there is only one port present.
>> We don't want to enable all interrupts when ports are not exposed.
> 
> No, the interrupts are still there, wired up in the SoC, so we should
> not change that.
> 
> With runtime PM eventually enabled and working as it should, the OS
> should be able to power down any unused ports. And we could also
> consider marking some ports as not physically accessible and not
> connected as a further hint to the OS that they can be disabled even
> sooner.
> 
> Johan

