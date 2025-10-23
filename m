Return-Path: <linux-usb+bounces-29575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE420C00C54
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 13:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C166189F036
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 11:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71297304BBC;
	Thu, 23 Oct 2025 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJsZoqip"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25D62E0B64
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219301; cv=none; b=FwNdXdPt0KIKHwjKyR1KTMoMnfxLAvFMafuynQLJOGn3f86RXMGvvUENZCv0KXCjygleaIhIOrZh0+Uvo8VHqf7ID6VMrAs+iNgTR/6DzvxX8JqIuf2HOLVaeCQHIQSt7oxIfc94QD7OGupMxPxvjvWH7yYsk8sh/yiSQlGIAzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219301; c=relaxed/simple;
	bh=f+/NnNjzHQpwza0Q5UTb3bp/OkbrnhnjOKHiz2Go468=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD/cxoAyc9fbN/lf688r+dXEvVRoyORG+TTYEZsmVHF0iK7W8hRO8v9ApjUTeBSesY/7p9DKj/zWh75O+fxS6QpTzlLryH9MJ5YiEOqjBvDufZJ9v8aIvb/ZVppKlADLxAJajPPETxA9R07UWt0brPzhh1b/UmXFhaY3msaTYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJsZoqip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7tkXg022116
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 11:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GsmbhgdWrGJ+GimrTjkaExR
	9bUmFkGScu7WoG+LKrE=; b=nJsZoqipaUVAIV7XnpOVhcGP1Rn/u0Zql4bOCl7A
	gtfa1c/6ECJEerPws1u3O3TPsWDk/8c4ynB1qABQlFlcupys0doyDROXbIKAfdaG
	Nx6UDeCTGhP46nzH3J7fPlXXLC7IyrIi4oiZ2BT64rJHK2W7eBDbz8I5RTQUGgGZ
	PU+ANNbTtYwZCUK9WrRvOrIX+UXMc3+9SA6fUCb6GeM8NJ+UX7H/4hGHj1D0i71I
	1guf3/78ZWMCUgOQsv3VNVzPCJWAX+fxZrG5QRov9LN3tYXLInmxymcCm4RLY/Du
	S8v38lDolmoSqbsLMNM9OdrcDvbUSNW4jdvmhVa2LJHukg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qj61f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 11:34:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e895a6ca73so5145091cf.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 04:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219298; x=1761824098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GsmbhgdWrGJ+GimrTjkaExR9bUmFkGScu7WoG+LKrE=;
        b=FIJMULDJpn/4Pwwhpj/mszfhnKfMGBydlB1PXmFz8k61zl1Qs/ETzr7IVLvDXpZPA1
         TFuMqorcLyXEmNWAM5B9v/wuAKhuQzxQZGi1AWeW/EaFJfQL01Jcl9qFzHMKgkGYZK3D
         37HSdKuaKTj2wK4k+xvcy4L0ruf/qZWcGUsNoOP5fFfZUeiv0DgnC11Ly8MjJ06qthBW
         eM80eLc3i5dU7Ogvol2itlnlgGT3pQnmSg7o9G2eoAdD2w+oHkG7HXXUlW68v/7u0raz
         UaVqHEt2j+KmXUIYCRh12wt43GhJdhGviv+56CbNjIOCku6mKEmaco9MW2x9xuQUBGpl
         7wVw==
X-Forwarded-Encrypted: i=1; AJvYcCVOIsuXcLlDcgHIYrKLfRUw9sf78KsSt6cOJNZSgDVC7scsx97OfQVrl5tH3HbQcX4UJb0rUJgvJrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTxqzyHmNaP/veFA5E6l9PhMlQYFYLmBLblOSaXq3WucZk7sn8
	IZhDUMdBqLtnONgjvDReWONE4ss+Av6KDSxSM2c9xusuRFG7I6cu5u3lUhRlbNeW7D8XepLCYZZ
	9hBCZ2DnQEEqDCR6uqmQAgG9rzVcUmSQD3vu1Yfm2Ax1gBRhY6F6BqLFB/xmt5ss=
X-Gm-Gg: ASbGncsMjuM1Ig77dxt+c4j6hldHjnJ7ILlXdcrwwJa2biJ0C/944x/ibCdK9KQL4cT
	CpHHfpI185KnoLzzh3IatXdFzRZGj5ZT1TCP2YrFW87xzcNrUzWTxdqKlZAyC/s7547U+1/szBj
	iaJFIJaRPrUGxQcnTbSRyfJ5YCawG8K9m2sPyqNQOBUvEPUOzGH79Z434KXR6icOJ9kOHf6WYEX
	f8R8D3XUEmitg7dh5VH5heAKrK8hh2LKE+MGbEx7F2So7ts8ZU7J0ddn8BeXJGME/0/+ksb81Az
	GPK74lX+k9tBzOqt+RArasd9ypyJ/WfWubLrrY7N5cDBS3ib/ZwhopiSGr6BxU0iys/efEs2QdF
	FL/4rloFTkpRqBRNnxA9zOhQBApP5hiLVWG6Ypo8WgXSKtms4zF4OplbIT2aTIGMSgz3hlpMwTm
	7Jxzs7tokZ37rC
X-Received: by 2002:a05:622a:1488:b0:4e8:ac66:ee4b with SMTP id d75a77b69052e-4e8ac66f3famr247774591cf.50.1761219297528;
        Thu, 23 Oct 2025 04:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI3toh2FWWacCWixWtLj+UhejuUOALAkx4auCsoA9mdYJd6RmpJFsj+n/JRxq7WMt0HM3+Yg==
X-Received: by 2002:a05:622a:1488:b0:4e8:ac66:ee4b with SMTP id d75a77b69052e-4e8ac66f3famr247774281cf.50.1761219297099;
        Thu, 23 Oct 2025 04:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc592sm3822231fa.45.2025.10.23.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:34:56 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:34:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <f2y4aposu5ddpwgue5gskumo5mjwkrod32ecbvveodgxrysg6u@zsq6ftoy4yqg>
References: <20251022004554.1956729-1-anjelique.melendez@oss.qualcomm.com>
 <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022004554.1956729-3-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX0CkXWCp0p4+I
 KD1EL2v1vNjQxNFdouGliONYr8E112jKy3EOISoV+eejkiIr5cbKe0XoIJ3UvJJemmvWqagUS6h
 NYOwKWvKoGemwoOLWv9Z7rNHX95HRDfwbhaB83n9OspI9WgKH7OIILCM/CKONQKHoB74yhuFxnR
 1Rxmtuiy4yW725P83Vzx4/lJbP/VOfpS9W0g1ZTXJkee7LxyXHdBoivIxt51UX9wPbOlVFzGiut
 WW926ijhhKAPUDXvS9hxhtPfFbGT0z2qLp2nzdESew2B98QF7ti9OrW1nJ9g5G81Ta16YV8liFD
 rP+BRSahlcz4yIIrd3qJhA3T5frBEmKRvWxwur1hl72N62e3Pe6iJB5acV5nRzmSpBkLbo+pzRw
 XKUXHZeOw+D5ZHv47fymaWVkPT29JA==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa12e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WG3W4BPXNB2T8y8KjtgA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qCGbZofSu8kLph-7HXTJTnIMVfs7Xdvd
X-Proofpoint-ORIG-GUID: qCGbZofSu8kLph-7HXTJTnIMVfs7Xdvd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

On Tue, Oct 21, 2025 at 05:45:54PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 80 +++++++++++++++++++++++++----
>  1 file changed, 70 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

