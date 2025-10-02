Return-Path: <linux-usb+bounces-28866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA662BB2AB3
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 09:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804583AEB36
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 07:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D24428F935;
	Thu,  2 Oct 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0cTGpVk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B1239E81
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389285; cv=none; b=r4uvVO3yZjwSRnraTsY+l4SYLBzH7kKnIP9rHpSBA+IzRBc/fyzfS8yj8FVPHZ1Cz2yZnkd9Wf27pbsJJKZ2/fVGNiIzuEOd16B/xLeBTLUPQUaw8lNM64/gtvOVz83CExQEYazZKK8dfSxkIvaVV+l8Htztppu5ubdMx3+MkGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389285; c=relaxed/simple;
	bh=h5CrAYIynZVv2O7NpU57ZuvsG4aarAwdD45iSeTC3eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcoMZz4FAo1GGmgNFO1lpLygNVDqaTEA9ytuAaPecanzBEb/NUIa4soZLUl5YAjLbi2Vn1jB7lisUVzzwBdLOZnMkl1UJ+JG9TFO9/fiKPltdoVHgH3mxky3i1xVvOZA1CtZk/J3Xh3IDvg3qXo7MYgztZonca5rKwavFTeCopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0cTGpVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbwHf031243
	for <linux-usb@vger.kernel.org>; Thu, 2 Oct 2025 07:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsrDpj5hUw4YEIy6N4WOTSRjb0/flPiO/cgRAbN+m0U=; b=T0cTGpVkUSK/3Zx/
	w+TJQr4hv4y+243iJyTp4LqSp2ohJ/i4HGZVrMXTEP+nYl3jvG027aNh7YBHzGsb
	/SXP5cyk6AnZ+12zvbXidUjOgNif0mSMtDgKmWJ/zYUpzGrZw9eTdQBmyigv6c0V
	pRhRk7aLnwYa3whwOSvviELvLkdNn0917Rzb/O9HRvm/A42k4kVG3oItY3EeMu3p
	CQmjPiA3weTgP9MsTSNDvRti4254wuTxREynUHA1bht8XaxYZLB9lItZXchoDnGi
	3RInFliwhqgU5Mauu+i9VCWwQJ2avP1jMkJgptqHzFR44TsI6FaxwojynxRyHFNr
	Ct9G0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr71n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 07:14:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso7925285ad.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 00:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759389281; x=1759994081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsrDpj5hUw4YEIy6N4WOTSRjb0/flPiO/cgRAbN+m0U=;
        b=XD9Q7iGOUf4p1OtO75xWFB0ZsZiDYBWQ44TcuvWsWfj6vEF3Uyc1sPSZQ4yaRwEKZK
         EFici753LCqlj61g/JLJqy8mGkmSv8rE2X2txaQNubHoMHQJekOYQhp7NyjDvJpzTHYs
         cGojkofki+G0+IR995SZBemKbbVLAiSFMLAZDmxuFAYyZhvvZrOOrqbXKbdlaQQg+Nzr
         ahpaOG36kPLZ9Vbs8AgVzTHPMXg617behVM4fuSsgWOOzmlTBaRvZ9L0j4vcLuAPQclD
         qB0Qkp4tjBQsg5QDGOoLAqmi1b4Bv9A3Pf5LlGeCEvnUBO82kPO/IM5bExRwucd2Sfb1
         683A==
X-Forwarded-Encrypted: i=1; AJvYcCXOxtrRy0zoed6c3NgQUi/DuS6o5KdJle4t1dd65yBCHTwxyPBKjYmaQbCV4DRcomu90aM60ay1+u0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxavj3inZgt8BM/zpa1BVO4iYEtbAd6U1T5NbVcDf5MdVY34DnR
	m9i04rWWP4R0zRJGrKzXZdrq7+Qls+hSY9FZtO4XzCGMscQ/3gKhHDt01VJnxs5lYLsB/FJVerO
	gsG4mQp9+YxcExWTt3coxdvpBtKOumljYNSkVBaTWCqjL+4Z8xL3Fdg4kgV1xki8=
X-Gm-Gg: ASbGncuFTxlYpuDUpOG/d10x8ft7BVVfnIyGxyPSoIXclYsikY4pY5ts3HnoEvZdwAQ
	049CXGI9Dra1GN56MogYRJE2zQYhv76cyI3MT+zFfYEC7oAnzMwkVb0e/oMLbJFZjz0YT52z+9v
	ZtxrDlEkPrT8Jzkdc7YsezvhqPvRJsfzR0/6Q5qR7rOhTcGhRSD+cZQFfKNnTsUyTarLg3OVlN2
	usfTgIT+3n7wc/MRpC9DOVpwt8s+GayjN2FmNQRWr1CvOP4HMx2EEqY3YS6oLZJIVGBsIIRednG
	vDzBBTWHYJScAfS3I3B36ArxIKstqaAUnHC1d15fXpmRwPVzvwrqvbcwiM4NdYZt0IObOjcgpMi
	I8sdxEe2EqVyY2XR8Mhv/k5bNBPH4X5dI5yJO
X-Received: by 2002:a17:902:ce0f:b0:27e:f16f:618b with SMTP id d9443c01a7336-28e7f2a6437mr75646225ad.24.1759389280944;
        Thu, 02 Oct 2025 00:14:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBqcQoIzfkxTOkZwP9SZ5axnu1siGWGEzipZSpgfQ+MGK5IUYqzt2bTf5JM9Q+kuHEuFeBsQ==
X-Received: by 2002:a17:902:ce0f:b0:27e:f16f:618b with SMTP id d9443c01a7336-28e7f2a6437mr75645935ad.24.1759389280423;
        Thu, 02 Oct 2025 00:14:40 -0700 (PDT)
Received: from [192.168.1.239] (syn-075-080-180-230.res.spectrum.com. [75.80.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d5680sm15167845ad.96.2025.10.02.00.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 00:14:39 -0700 (PDT)
Message-ID: <8996bd96-0660-70ba-63f4-51111219d146@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 00:14:37 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
 <20251001220534.3166401-8-wesley.cheng@oss.qualcomm.com>
 <ra3bq7guxunk2n7mbrjlefxvxu45clmwzp74vq7bqd2xvp2fv5@z5skxjxs4yxp>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <ra3bq7guxunk2n7mbrjlefxvxu45clmwzp74vq7bqd2xvp2fv5@z5skxjxs4yxp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rp3hLvUKP7Mo1ttaM_2Ns9SbIIsylW9V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX7LrD0kY60qR0
 czdsTN/WC6ai9RSiNtev42YIziloCGWiSdJTGPllzpAWzZ8jzkAqd8luBji0QjTyeMHwcV0U/jE
 O/2XatUulAsAHt+Ul3z6KFxH/v7nVc1TptTeZznMwCEp0/vFYNhANRqugSladxxf1WebMGYfWtO
 K2i4Np7FHpEXDrarsJpyxAxmbyz2KXQah3mFkZvJDvwBbFhT6cGdLOErl3wDVldQDydLgFaYjWv
 N9kERKzZKGzGQF7hnUGRh1b2y7okmuxzZCJgkuj3/9SvIXYYgeqUVxfgb5OLG7rGYGImFwgQTt1
 r1N9W+RpkQv2mdQkWAPwuBh17nVwbqEbOKV+JJKkmfljVvPsF9goqubq9uGTBD4Md67Rt7JPyam
 AMYIvPCn8T7hUkb+5hnge4S9a0ZoQw==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68de2661 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=INxguLwuHvTa_v7rZvUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: rp3hLvUKP7Mo1ttaM_2Ns9SbIIsylW9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017



On 10/1/2025 5:58 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 01, 2025 at 03:05:31PM -0700, Wesley Cheng wrote:
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
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 312 ++++++++-
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>>   .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h   |  12 +
>>   .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>>   .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
>>   7 files changed, 1240 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
>> index da2a7ad2cdcc..7211c71fe68c 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
>> @@ -32,7 +32,9 @@
>>   #include "phy-qcom-qmp-qserdes-txrx-v7.h"
>>   
>>   #include "phy-qcom-qmp-qserdes-com-v8.h"
>> +#include "phy-qcom-qmp-usb43-qserdes-com-v8.h"
>>   #include "phy-qcom-qmp-qserdes-txrx-v8.h"
>> +#include "phy-qcom-qmp-qserdes-lalb-v8.h"
>>   
>>   #include "phy-qcom-qmp-qserdes-pll.h"
>>   
>> @@ -60,6 +62,8 @@
>>   
>>   #include "phy-qcom-qmp-pcs-v8_50.h"
>>   
>> +#include "phy-qcom-qmp-usb43-pcs-v8.h"
> 
> Let's not include USB-specific header into the generic header.

Hi Dmitry,

This is actually referring to the QMP PCS register set for the USB43 
based PHYs.  Even though it is a QMP PHY v8 (ie phy-qcom-qmp-pcs-v8), 
there are some offset differences between the existing one and the one 
being added.  In that case, should we still have it in the USB specific 
QMP combo driver?  I guess it might make sense to have it there, as 
technically the usb43 based phy is only really going to be there for 
USB4 capable cores, and I don't think there's much that is common 
between usb43 and other HW that utilize/share the QMP PHY.

Thanks
Wesley Cheng

> 
> With that fixed:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 
>> +
>>   /* QPHY_SW_RESET bit */
>>   #define SW_RESET				BIT(0)
>>   /* QPHY_POWER_DOWN_CONTROL */
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

