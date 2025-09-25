Return-Path: <linux-usb+bounces-28650-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55941B9D1C4
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20E964E033B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411F42E1F10;
	Thu, 25 Sep 2025 02:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKhpgsH7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F182DE6E6
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758766487; cv=none; b=feK+W4wkTRi7/Fp//cYnLJQsveYH+eDajsdI94i0miFMnSrlpvClK5HpUT88TNN2Svpjf95XJyqKQXPB4WjsVyruSY09SArDtfEU9aD7y7IzV/I8hkZEyUaYwndTz7HTNtkuvUqy1vVICQ+W/tpl04E6E4MGy40hn0j5J4+X/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758766487; c=relaxed/simple;
	bh=naJzm2+LZbO2Y4ZMy0R9T9gNZ+PyIaodhhZMYTmfbPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duv9DY/vJm5y/OzARNrziRjNz6T9qJI9yoyK183IEZmGpzlAlzgherUD5L0pVD+dbBUXe1rsIMcX6OYfidoRrDXgR1CvB5IF3FMXarQvO6R95+xTR0kB2OCXS3uBWHSGaXw1YjLjj5wTQnNB6PqYmGTT4wS3JoumMKbbWjrWKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKhpgsH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0xV45016659
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYb74ctst0DsXsUARWUIqV3xVpP3o9baTa7sSWce5hQ=; b=kKhpgsH75HlNeOxk
	JJu+Dp6XTSisBBn8B/4goRuEfU7cfMca3PCQCbxShW2KngxSRgOn1b8xjr/XRVeL
	DYS9pW9gt5fIuC33/ewU4hQ8RDGSL0QorY3dFngQDl7GAPtdrj3xq+xrOZf6x0BJ
	+g3iaggg9LQHiyF//c3vWCXNIyX29dOtykoQASiuKOgE8hwdKRYg+wZJeEZdLT5a
	1JUBIwlXZ1MmGhrfn/B/BKDW1/jS7cCpSPB332QXjxCw0m+dNIA9qTw2uEWkgSEw
	Tlis3v3S1c1spkGgUdJqD3tEZhhI1l/XBso6TIPdiLPZxGajhpF0Rx6iIGfZE0fB
	rbezBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyj7r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:14:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so473683a91.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758766484; x=1759371284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYb74ctst0DsXsUARWUIqV3xVpP3o9baTa7sSWce5hQ=;
        b=Qc1bzGrNuCidkH+VQqKkqDhkhQRwBo5QJwC1bsvTzni2UcMIsppCeQna8C7HFWPUCm
         PsESSu478vDUdZcPle/IFPwL2+F1LgdF8SS2UQBA3Blo/R1LWU8iy5jTkMNU0hxd9fZL
         A8/gBptfJD6iF1nBqviXKC1c0rB3OaeStgXnm0LRoksC5Mk9+FLXmj8IG5JEiXSwFIbN
         69YnRVyQ6wPnmlaxpMbGW4/PDIfcjoSnt6QOTH2VVfjj9Olw5+rGL6fO3f7DayqgvRlQ
         Z9+OWG0d4CzL8U2eOB6n942TTuKaa4+06X3HsPNDGNOkPhchQ8QQ+XEcEgf5ifSGS3D2
         74+w==
X-Forwarded-Encrypted: i=1; AJvYcCUlLwUEMt+04aKowqi90Q3D4sQY51H541I8gjNY4Q0j6Mk+0jMp/enfI4Gvk0ceA+ir1aCpG+w2agk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww9LoYSYZ057vrrcbo+V0+CyD68EXw8pJa9q1m30w28jqSgJ4r
	wZdP5vLprI4tR7Ekk5rcrRrlbsuc9V8PFJoyckSE3jB8vvZy1EOJkteZHBLZuhgxdmj0zAprtu7
	AH9myEP4bn1t6rjPziU1Oy4+fUZsuyBKKpKNXeHIckV29tQGipauh+zNEOg2MnUKoX0Ipzv0=
X-Gm-Gg: ASbGncvCl7ph+NHQ8fbghFxChMz2qCRO5b/ieRyA5tGXI+7jmsOQFPxgaajNstqi6II
	08JA1UpV6ubwx0cFbBj7QR115pbCoF1BFKxYBCD0MeBjsqCWWGOFoQz3SCBI2AbOPDnNT26Bkvl
	/VJb4cqdjAfCDACJh8CEdOWctCLYPcKgc3RnJXnogHOP5pCfCqIqNjLb0LCb+gzXn11Ano9FcjU
	FNoOJD5B76ZjxgzvjtRZx764Sc0ONl4tw/VRkptes3q0mBc/K+YcqRK4uHE3dTd44vChmu5ygl2
	jmSJxI2wu9Gf0OGktsSaBgCrQlD8bQ2BuhWA1MQCU31U96oSZwKysfXNBYdvoOyw+lfg/kAgff2
	26cM5dw==
X-Received: by 2002:a17:902:c94d:b0:272:dee1:c137 with SMTP id d9443c01a7336-27ed49d2c42mr16317105ad.13.1758766484490;
        Wed, 24 Sep 2025 19:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyxJuLNtLq/o0cb418AiMSRh+W0XoH4JxAaKBFGhkZ92bPDHbrLdzEVGWl23fcg0V3B8oWOQ==
X-Received: by 2002:a17:902:c94d:b0:272:dee1:c137 with SMTP id d9443c01a7336-27ed49d2c42mr16316785ad.13.1758766484006;
        Wed, 24 Sep 2025 19:14:44 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed688226asm6880855ad.65.2025.09.24.19.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 19:14:42 -0700 (PDT)
Message-ID: <5a6b3a3e-c6f6-ba39-9edf-eab3e1815862@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 19:14:41 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-8-wesley.cheng@oss.qualcomm.com>
 <un3pulyn7tv3qihdnqmktsctped32am2eglxzfpwyz3u3tqspf@fnieck3i67j2>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <un3pulyn7tv3qihdnqmktsctped32am2eglxzfpwyz3u3tqspf@fnieck3i67j2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d4a595 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=GfICSpz_d4rxbVQ3OkEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: WbGDTkXIhkoannFjthyt7UiERmoNAl-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX4AEu4lJVBkaE
 F7APCHu0Zbvyvoy7WyVcOO2hh+9jck0GEPbG2G3YePP0dKJY+sTLkeQFuqcGA/8wVlraY1tyPnF
 1Mpad8scbv1jLAtTSDnNrrr4cFLKOpAKrVDM6uE7kAlCccAFD8+Z8kF6hd+pxNDk4zOAyYCJ678
 6JrymmoXA7DZb0E9VsS9gb1FnSjsZznURGiPJr8waDxLf6dVmV8s4/sB+5iFPIQRruy00laHj58
 unyVHTtIBjPe/SKUaec459cfhXynIge6s9W0NGQk2m399Jm+8VRrQUYbKcQX5ZqsID00ZvPOMCP
 5ukGLMGJKkW7WubT5T7Q3uDdwVbtKVrqBkHJ/xEieanmWGewNso8ETVl6dFgrpvrEMADor9ODHp
 EEmmdKSz
X-Proofpoint-ORIG-GUID: WbGDTkXIhkoannFjthyt7UiERmoNAl-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090



On 9/24/2025 6:30 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:52:25PM -0700, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>
>> There are also some PHY init updates to modify the PCS MISC register space.
>> Without these, the QMP PHY PLL locking fails.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 311 ++++++++-
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
>>   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>>   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
> 
> I think yo've squashed too many changes here. V5 and V6 headers should
> be a part of the previous patch.
> 

Hmm, not sure what went wrong there, but I will fix it shortly and 
submit as v3.

>>   8 files changed, 1251 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
>>

