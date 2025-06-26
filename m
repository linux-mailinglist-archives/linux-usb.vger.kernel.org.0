Return-Path: <linux-usb+bounces-25114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C818EAE9616
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 08:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523493BE387
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 06:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB16E2343AE;
	Thu, 26 Jun 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7QYsI0j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2E1A0BF1
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918995; cv=none; b=OD3+V9h1PPDgsXgfyp8VzsOz24Yn1e47jq2MgX5otIsdc8Jmxz9d7HM+EcIbIsihBCYtBZVXuw8hg3FtKj9zAk2FXnvfZCXT+0sLsjPu5vlTtUiK/+TQpMQZM9J1yhtLUDHE4H5aMKi4fNtA9tavZYCMq9ijvKM90NDLwIJsyWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918995; c=relaxed/simple;
	bh=GBMZ20+Dx521eudEWEJS5G6reVV23iA7Cl0uMWTkqCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ty8SVOHAJZOGVZvjhC6nxwOBWJJzgjLOeRY+agcSsiC5Y+Wusp5GFCKt12fLXfAapNJ3zuy7CAZtzK55ZabCTf8OxlpdahH6serZEmU4VxR/ge7qF/xH+23UQsZ3qbv9QHOqJ9j65AwseegZzt6ystZG2w/D2ru+rRFG8mbzqPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7QYsI0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DtZ3029535
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSPp3x1ZRhdbBSvE6qtd0GrLv5iuaB817ClElVTDfa0=; b=i7QYsI0jqXY5ICIh
	MjhKUgo+deZ7nGds3kDxAzLhazFjZ2jmOCWw0kJmB+qcEd0ftB+dn/6D73/So3Y0
	kpj56Hq+YX2FOjwRKeyq00azJ24uFswmBXCCx/pLteNZ4n7cBRFtchh4ebyB4GSt
	baP0MCr+5bFukgTyVrhbQ4NrdsfiMvKdM2yUxwIv34562+Jm/SyOoAfJtfrJcUlQ
	xE1V1dpJtJs9FaEdZ3/DKlt5i7a7KuucKWULAvdLQhrm+e2fHdkV3UP1PgGOOSY7
	JG7bQdNzU8I0RrlbitPFVBl9mNMVMgiTcvWokMdugHa3VYtFxZGbKz2LYe8KN+j5
	sgeGTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4ue99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:23:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce66d7cso11087165ad.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 23:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918991; x=1751523791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSPp3x1ZRhdbBSvE6qtd0GrLv5iuaB817ClElVTDfa0=;
        b=qfiHWEMWCIBuFD8X5O5xyW1MpmeH5dbqSYXDWqjOnNoTG19edYbFCLCFA2icyLon8V
         NMKzFAeJdW0jHKkJMoZgslrSvYSHr//CQ+yzfSpcNWWwkJaqlDvYfHFU+9rVITb7uXy/
         sF3qAPsqzlzb8sizj+lfOy8JcAQx7u70b0MupNIPQkHvt05DV6/NrEB0ehCeVCvDGxjQ
         AJ0RCpfgQCpCejWINqd0ylJJIi5DQQuPvASUX79BkD8SbFoHpYRrq31be9mJNSoHn/bb
         +lhU971fN4z8nctp2dA3Y2qns7EnF9OMwl2dG/CRIz4iXfwcL2IspwLjCc9qJvurI0oQ
         feZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMTJw3v4PIcHcuIv5uw4SOz3q0HvaqTGmgS3OfT3oE03bD3pKw3T1+hsQ3r+R+5fuuk1Aspa9vztk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkZR2W+gRnKVPZ325WvHjegzXx/7z3y57WKajzhha/5LmogJ+m
	SHe6DZGw2Xasf5Ti5CebF2fzuHwdGPCTPKwCMQvgfcTiVOFRgO2zi2xpa5Fnwf1v3H4GRcj1dDo
	PM9i9vFDdVBvLn9j3BiQsrCaRscELMIo2KXSB0mSrxyMClV5JXN7v+7wZMm34B+w=
X-Gm-Gg: ASbGncvOTBZw1B1gjw4FcxRNwwqxQvx3m8wR/xjnl14EGFuRjc+YSnW4pGenE56sSAO
	vicFHqF+/9q/ue/ev7GeNqCkkSA8t57/6sDFcLUVnXit9Ip5ip83mv9PseofWigx5ZkdQ7/17ZL
	b1tT3QNFKzps/4CCSC8O6Ls5VIj+BVqb8yolz4pmMpQQoM4I//0FZnJVuz7/D7skTsd2KSfWZKF
	bw1PZ+7jqyhw8gmSDO/60IdT0EALm8F+owL8ws1z8Vt4fgpQ2/tcx4zaNbdFZJkZAOayWuqeVGq
	1FU4UXHifvxu1N1sRX2yCbP30v8zzof89D+ryunLR4F2OoaTRSQ=
X-Received: by 2002:a17:902:e546:b0:234:c549:da10 with SMTP id d9443c01a7336-2382408fa5amr88572945ad.47.1750918990969;
        Wed, 25 Jun 2025 23:23:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER407T8JX75ySM0Lw9z0XE+rIFx1Ls7SaSTA+7leEyGkIE6L8/SALvv6z5XbFaMGqM97xPBg==
X-Received: by 2002:a17:902:e546:b0:234:c549:da10 with SMTP id d9443c01a7336-2382408fa5amr88572625ad.47.1750918990576;
        Wed, 25 Jun 2025 23:23:10 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86c5a7dsm150270925ad.201.2025.06.25.23.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 23:23:09 -0700 (PDT)
Message-ID: <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:53:05 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: u_serial: remove some dead code
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lianqin Hu <hulianqin@vivo.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ce74f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xcl-ZwCfIxIsq7HH9cIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: yw-P4fL2xBzula1e-enL2XKBGY0WEh2y
X-Proofpoint-ORIG-GUID: yw-P4fL2xBzula1e-enL2XKBGY0WEh2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA1MCBTYWx0ZWRfX0pUxaufNc8op
 LyrzYZ17ugeAgjbY+KXOCteWM7Wzb5xIvX0h9I5ONck/nu3jislEeCSWe2KISV/hwi1gbporhRk
 Vkc4TJjIrQ1dltUX+B1MfC6bB4/Ac5oQflNJAvLstGCZzabsoS/dPcxCxni5HGdP8NtTyLHMD4O
 1ndIUw8Zm3opR3wmO88UkQUJrSeELclZU20MgUgFbvFdOVmLvX+SQ7Fv4KAIoLcoKLoQCrIonud
 VFLAuEQ4jLhv8n8vnn3JEZbf3FmGRHhZ1AAoDzO9bM3P5SLV2vfDUIenvwdMOvfZs0T5hcLTpzk
 765rQHiMjTgNaFWHKOXRJnhFL+7CbiWuuM02uofi+QA3I3pJEcG6NLSfu40VnCGEk8YI7EOhsx5
 g6THvsBF/QyuISeurt3IV5D90qgbk6FH8Md2owFSykvHNkZtgIEDrB/y8ZwL2eKz1mVlQrCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=911
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260050



On 6/25/2025 8:51 PM, Dan Carpenter wrote:
> There is no need to check if "port" is NULL.  We already verified that it
> is non-NULL.  It's a stack variable and can't be modified by a different
> thread.  Delete this dead code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Perhaps you could add Closes and Fixes tag, but its up to you.

Reviewed-by: Prashanth K <prashanth.k@oss.qualcomm.com>

>  drivers/usb/gadget/function/u_serial.c | 7 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
> index ab544f6824be..96756a489d6a 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -1501,13 +1501,7 @@ void gserial_suspend(struct gserial *gser)
>  		spin_unlock_irqrestore(&serial_port_lock, flags);
>  		if (!gserial_wakeup_host(gser))
>  			return;
> -
> -		/* Check if port is valid after acquiring lock back */
>  		spin_lock_irqsave(&serial_port_lock, flags);
> -		if (!port) {
> -			spin_unlock_irqrestore(&serial_port_lock, flags);
> -			return;
> -		}
>  	}
>  
>  	spin_lock(&port->port_lock);

