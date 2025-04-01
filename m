Return-Path: <linux-usb+bounces-22402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6BA7740B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 07:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF4E16853F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 05:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315D31DE2BD;
	Tue,  1 Apr 2025 05:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1X5uVKE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFC187550
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 05:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486210; cv=none; b=GuimyaWwPF1Hhjr+X3L3E1Nbu4LzeFCSn40KqaCailB/+h+k/4kueyCzD3u19bFCO4o0hHOV0Lw/SONm1IaZGsNRdLc/0ldf8u8rJfUSFLPpvKNVh8PoY6PAkv8o7wW44ZQm6K7hgUG/TOx9tCs2rTxia2xcNU8UR+goNaJxqOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486210; c=relaxed/simple;
	bh=SwnRx78oJ+t+ZIV01o+BoWbkv/UO2URLd3njvMzcoVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1/MhmV3kQRIXZXogWV5639MEBuHFxkHqVJLqvNUJOhr/qe5NTENyv4HFvTTF6q/zcIdLAQ2plY2wJGqcH42/Sb9+/+dukplQjX4A3DiPcfkauFwz/uoik7GbjdGixgKM8z2+I8XMYZIV6yBY+jiOrLN4rR3xK1tKq9KEf1e8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1X5uVKE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCrK0025837
	for <linux-usb@vger.kernel.org>; Tue, 1 Apr 2025 05:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66+D7nE5qKkdJ4daDmuUIadvGENO/tgUBOSj9nZjjGs=; b=l1X5uVKE59j55yHC
	kDxz08QO4e5TMV+i890lIcVqBIt/BNkL7CWOTVunIu9ttb/8Str+fWETuHE6HNNz
	dgpaCPH79SCcbdBM4fLndjEfTNDtp/eEiQyCNz9NYPPG2Dev8ZFfGVb5FCoUD8yS
	HNmMTIdxCtbHCAwqNXK5eakjsAXrbmwUQ5GYuCpU27UV6A/y6Lgg0SFPfk5bNud2
	1FGavuVri6m2tMlOaUjeVOSRPuIvvHBhh+uBGCNFIhSFm6ES6zHbC7ZTkuoIOfIB
	jCBxBL+9qM34A+XOPqkiYkiTf4/AKUm/6qbw2MMAecLaCImae3mnjs9K98stqszL
	8V+C4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhpu1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 05:43:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223f3357064so84794305ad.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 22:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743486207; x=1744091007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66+D7nE5qKkdJ4daDmuUIadvGENO/tgUBOSj9nZjjGs=;
        b=OqQ2UtdYl1mUcx9DKI8ogakBr7V21PH05ve4tcvm00NcdWWtwKYPpiwfKELsFHhEX5
         ou7UgQQvcsZeuzfUU0p36J1b2HwCVpkZM4/LCjACGnOQOGkKRzbr5PEkyIACJuB1cBlu
         uO9Pg4F/0dX+3Hh3xUstjSaTKdiR3smxdDxXiWqO9x25OczUunX9gsBa9Gx6HKvohpoD
         r4YIsTwMAQmJBSY+WBCiN8Bw5ZbDak15Su0M3sdB7h67XV88oK1JRvxa309cZJtVy1Vc
         7Uxbkf21oDobScKoB0I/+19fi9aiQBLlm7rlg+hylBnQY9Vq14fqzYbce+rODX3WE+45
         Y/3g==
X-Forwarded-Encrypted: i=1; AJvYcCWCWzXEIJJ0K0v3rSi0kLvH5MA8bghQ8TwtsnbCBf2GtGCwzWDuSF1KdaUOapi7wOxvmExQ9XCOlJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5M4TJh9reFjHvrXzB3dqjYUSEp3VkmSWfSVXJ6PrXzoYhS54V
	j65smhg52XjnTLu3J6SGzHdO/ZFMWWVvy3luXI/jd/8ANjpydP8FruE6/TauNhtjx2EP8SxJHWC
	/KNoY5AoIrHqXdrQC4pfarD1pVv4SPGHLIDay0mHBh4ugRZA/9TMwiXvNQS4=
X-Gm-Gg: ASbGncum7cMN5+ZNfZZQFwJkHvX4FxilSNkiuMjLR4fTbC4LaJb1FGTZycCk42YRvPz
	DZetLq29pJkm4U3pyZO373v89otO27e7F45JtJLMgeM5ynqS+m7vcnocAbpb4lR+d8kdR7oKi2T
	7jHJjDGKQSbOr12p+Q4efHKcn6fmWoN1FuVjESsyte3vAHg5Ws3SwozA4zWe3t39B9hXd1SsGXn
	oaMAT2qf2868HgI0sffJbLRA84synhT1LmI0YyKfzplJS5qB+7oEMGjseG2HZW48CS1BcgIaum/
	ah+/LUlqIkTDblzbDpYyo/F+kBUPY7Dz5Thz00S8lNozOaU=
X-Received: by 2002:a17:903:1c2:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-2292f974a5bmr185669185ad.24.1743486207247;
        Mon, 31 Mar 2025 22:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBGv2kXUZkjYQVkGex90enEWlxQkgChxhnJNxuI71EPO9S9/XsFTdb1ksSAJUaPYMKS+L1NA==
X-Received: by 2002:a17:903:1c2:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-2292f974a5bmr185668895ad.24.1743486206839;
        Mon, 31 Mar 2025 22:43:26 -0700 (PDT)
Received: from [10.92.176.227] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971090928sm7987817b3a.125.2025.03.31.22.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 22:43:26 -0700 (PDT)
Message-ID: <0767d38d-179a-4c5e-9dfe-fef847d1354d@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 11:13:22 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: gadget: check that event count does not
 exceed event buffer length
To: Frode Isaksen <fisaksen@baylibre.com>, Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Frode Isaksen <frode@meta.com>, stable@vger.kernel.org
References: <20250328104930.2179123-1-fisaksen@baylibre.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250328104930.2179123-1-fisaksen@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _-EgD69qHUVX99vj3S5OrROHMRlygIl-
X-Proofpoint-ORIG-GUID: _-EgD69qHUVX99vj3S5OrROHMRlygIl-
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67eb7d00 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=jIQo8A4GAAAA:8 a=VabnemYjAAAA:8
 a=SHyoynBsh-P7v1gKxDYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=771 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010036



On 3/28/2025 4:14 PM, Frode Isaksen wrote:
> From: Frode Isaksen <frode@meta.com>
> 
> The event count is read from register DWC3_GEVNTCOUNT.
> There is a check for the count being zero, but not for exceeding the
> event buffer length.
> Check that event count does not exceed event buffer length,
> avoiding an out-of-bounds access when memcpy'ing the event.
> Crash log:
> Unable to handle kernel paging request at virtual address ffffffc0129be000
> pc : __memcpy+0x114/0x180
> lr : dwc3_check_event_buf+0xec/0x348
> x3 : 0000000000000030 x2 : 000000000000dfc4
> x1 : ffffffc0129be000 x0 : ffffff87aad60080
> Call trace:
> __memcpy+0x114/0x180
> dwc3_interrupt+0x24/0x34
> 
> Signed-off-by: Frode Isaksen <frode@meta.com>
> Fixes: ebbb2d59398f ("usb: dwc3: gadget: use evt->cache for processing events")
> Cc: stable@vger.kernel.org
> ---
> v1 -> v2: Added Fixes and Cc tag.
> 
> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
> Also tested on T.I. AM62x board.
> 
>   drivers/usb/dwc3/gadget.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 63fef4a1a498..548e112167f3 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -4564,7 +4564,7 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
>   
>   	count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
>   	count &= DWC3_GEVNTCOUNT_MASK;
> -	if (!count)
> +	if (!count || count > evt->length)
>   		return IRQ_NONE;
>   
>   	evt->count = count;


I did see this issue previously ([1] on 5.10) on SAR2130 (upstreamed 
recently). Can you help check if the issue is same on your end if you 
can reproduce it easily. Thinh also provided some debug pointers to 
check suspecting it to be a HW issue.

As per the comments from Thinh, he suggested to add a error log as well 
when this happens [2].

[1]: 
https://lore.kernel.org/all/20230521100330.22478-1-quic_kriskura@quicinc.com/

[2]: 
https://lore.kernel.org/all/20230525001822.ane3zcyyifj2kuwx@synopsys.com/

Regards,
Krishna,

