Return-Path: <linux-usb+bounces-25206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA03AEC3DD
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 03:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8A261C47381
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 01:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7851C8611;
	Sat, 28 Jun 2025 01:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4kgszJ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78611262BE
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075012; cv=none; b=SDo6UqkfOf/LzdBG0jW46ucINIy1gqzc26GPZA67flV2oWdgprbGF3UZHP5Vp344YpqLYE9LaG/C2iQPeF7f/xOZAJNJHEqfh0kTuXiigWapgj7oBH/AolWHu5uMXH8XMUng00z4T7GA0x82RwKZ8kbkUe//zJ6bA4Resr+JTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075012; c=relaxed/simple;
	bh=byPxwcuJPoGX6uXFrvE/DVF8d7bfifTJUQZ2WPptPJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ED4CTmtv2VdXhwf5uVWkXhjGnfwc20CAeg1/tAGkH4Zo+9yDtFpuPM2B0HHRiMCVzzWAfvr85o4UlT/S4VTDgLZDHTT/g7vWUnp/juCWYlkPIdOope5+v5zAA2HRFgqkV+dH1OSYk7ngYRxy8hsDyd23zb/xgus4aH4cn14IYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4kgszJ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DHNj032451
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wh/dZc5IiMksLAxdfWYRv4Ue
	PwbYz6fwoGBPsXxcxQc=; b=f4kgszJ51ks60RvGloJlaEMKNQj7mirLq2s7ownS
	9JvRxj8LIjcix6I9yl3b9jszXqb5z5mZIKmzpNd8YtkeuhyUFoDNeSS4xnT8RVKs
	4ONRgyAYBaBJWN6taUFrVg5CciQ071wg43jZDbwxGf0eZCU+e2C8xPEDzz97jd72
	Tls7CNQ2WXE6jf8t3qPN00fKnQnJhKUvhfVSLCZWTknGaxTqrQoNVjX3A2nwkw9y
	OjNiBrSMZP0LZ4QTcQF01LG45CaPhEu9q8Vte/YPZBGMQnUR+MVqq9drdcqKhPBy
	hpxY6+hTO2YZLp/pMQBBTVJFmyz7k4Mol/Gpg2jxdcy8eQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fj2yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 01:43:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so716069085a.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 18:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075008; x=1751679808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wh/dZc5IiMksLAxdfWYRv4UePwbYz6fwoGBPsXxcxQc=;
        b=YfEERSiDbBlDDvppOgh/OefsHSixR9Yvbj951+A2Khb+8TdvVMU1jtD9PvtKYRNa8N
         6YrwjwyYn3jZWt/hGsfwmqmVpZRS82Peiy2QNXBxQVHqb03FXhKqJb9ETGhvH3npNsT0
         ugIEBkTZ0hKlIWKa3bTfmclBbiqATt88BAKaVR7UJ/gDOZxELCc6M64LIjkMn3n8aksA
         KFJ5z3oSnFhribrrmc0kaIxbCEFA0G/bwq69vlljO+3IiDZqmvnysdI8NkQoPkt5DYo5
         Fh571IkbP3YVg5EACx/jvA/h41PEYCkc87WgOm7l3jwpRuzyav4haNM5VwKV5ctzu+7b
         Pyjw==
X-Gm-Message-State: AOJu0Yxot26cH4vt1ehnH4bmfimihyaerKqvDihwWy/E17wqfkXCBPf5
	VdUHRgW7a1XjLyZEaT4VanVmmWExkNCW+oPNl2K82U9rVPrzdyJNOO6R4aEL8osh7/aqXmBhaEh
	v7N/esjGYa0K0qgJV173+ROn90avLA5UUAM9GVYrBbdlyW9+t3BZtS7QZNV/jaH4=
X-Gm-Gg: ASbGnctNyJ4n//AkT+5/M1CtrZIBQ1owW8FjIb56oZjfaBtaI7wphE1Kb6D/pYVHmdG
	bXSve9zz4jNUWCneDsXYotMgy9XdkhWk9uR35aAkZCFvFZP/eyg3rPFFcqAcP6SPhCIYF0y/0Kq
	wRhmIi5WZw9U8g74tMM8gmziX6ySHosFuO9c3aVm8sd0iCJYS9WXs6Lexs8odKyX+ESnR06TzWT
	aVgEojHT3mWCJFJfYSV7onnBT2+Vf27iwtiAnh686NL0hNkcnH9TP3M54UzU18s47sdVk7AnQyF
	66hyCH1qMUfb1yqvAuuJ5QX8eHxJ96iE8x5MHu/+5UcUWskCA2SRK/sluamc8svcKz25xO5Vn5y
	ghkJJXfnPles+wnoXkTy3BXZUySs+f7vooTI=
X-Received: by 2002:a05:620a:3727:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d443936ec7mr889664685a.14.1751075008009;
        Fri, 27 Jun 2025 18:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdwi2WtITH1hB9QUuG+hXRKAmbYJQ31Zax7eE3ZAoGQcKXi6oC7IPN486T4LmWZbC7pSWEPQ==
X-Received: by 2002:a05:620a:3727:b0:7c3:c9f4:522 with SMTP id af79cd13be357-7d443936ec7mr889662685a.14.1751075007631;
        Fri, 27 Jun 2025 18:43:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d578esm639989e87.195.2025.06.27.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:43:26 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:43:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: Enable debugfs for message_out
 data structure
Message-ID: <vnurzwywa3whe6twctj4q3vadq3sc5ssyolkrk7tjllz6p72xl@3hcblsjulnma>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <d43e738a9ffecc22f82b8e214f28ce0958f204d4.1751042810.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d43e738a9ffecc22f82b8e214f28ce0958f204d4.1751042810.git.pooja.katiyar@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMSBTYWx0ZWRfX0/cyU84bDYAA
 VPf4fF7LSiHPPcCj/UqZBxTE7ltrux4pB3D+kIqCmIa7MYd+Z0VrmX+ptByQt18X9u9vD0MUZRC
 8ycz5k/3RgwGdutaN8UqnZVpKubd1tPZ0BHt/nXRn9Kd8lo3Wd94R4Ojqm681jCFy/sGp4zPKni
 HXC3BYaqD0mz0Pv0PZ0Cv9VAxLI9SwFADONTyvPA3KWsNt+TgBTVerbCMSDNl+4j/rjl3m5Fmca
 6CquL7ojsDVvoQshK/I6suE45ubRYedUwIkdONKhazIH833C6n0nf7c1FsQ0zpeco7Pzs/w/NKj
 vMM+QmFTNISaDIn2sLoeDn8BT8LOvfU5Ymerd+Kn1lwNbgDNc9v0mwaC/PnZfTxOPA39Db7FQSx
 W4xha5FIpP02cV2HGFzKGO0T2TwGHio3LRr/a504hmZg4JVqW6Y38hTNuVRsMCN+KM+3kiWH
X-Proofpoint-ORIG-GUID: MCcF3zcpBEVPoH7_qrpEs12JnEq6G_kQ
X-Proofpoint-GUID: MCcF3zcpBEVPoH7_qrpEs12JnEq6G_kQ
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685f48c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=J5_UMwdI7J-lToC5ZwwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280011

On Fri, Jun 27, 2025 at 11:10:11AM -0700, Pooja Katiyar wrote:
> Add debugfs entry for writing message_out data structure to handle
> UCSI 2.1 and 3.0 commands through debugfs interface.
> 
> Users writing to the message_out debugfs file should ensure the input
> data adheres to the following format:
> 1. Input must be a non-empty valid hexadecimal string.
> 2. Input length of hexadecimal string must not exceed 256 bytes of
>    length to be in alignment with the message out data structure size
>    as per the UCSI specification v2.1.
> 3. If the input string length is odd, then user needs to prepend a
>    '0' to the first character for proper hex conversion.
> 
> Below are examples of valid hex strings. Note that these values are
> just examples. The exact values depend on specific command use case.
> 
> 	#echo 1A2B3C4D > message_out
> 	#echo 01234567 > message_out
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
>  drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h    |  3 +++
>  2 files changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

