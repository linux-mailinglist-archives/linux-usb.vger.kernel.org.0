Return-Path: <linux-usb+bounces-28664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16037B9D3ED
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 04:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA59189DAA8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3962E6112;
	Thu, 25 Sep 2025 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8AzB8Mu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A092E62AF
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768939; cv=none; b=Ga+h/QYwHJLbiPOq31rsLBGiF/PNUU8EJd8T2R1AmlxHSUQYcjiCFSBrTXO845WGj9KmxjwgpM6qheKoQ2wJZ1N/FkwhfEXmvdMq+lUrwI2nGsoLPomypnTeXhQh7N5x5eaqjGatlvoQgQssjnJnQzmjJ+Af5XoUXekgZxWhSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768939; c=relaxed/simple;
	bh=H3KAcTmwmORg8SJ/xG7H5u+L0tAoDnAnaELg5U+7sqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBXtdG3tRCYsvIHzExWmjJTa98h5cfkwoWk13/4u62JACC5Hr5TaMo+3cI0WErSA1jEsYcdGB1uTvXRsYd5hJtk++wfDRp05Jig7+27rsP6nRzkpcur0fssMZqgnR70bXnoL0x+51dJihPrGHYL5iRQlpu8vHheU51Pk5WFsLyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8AzB8Mu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1Gpm9018069
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lbAXN6mA77BRJN0uV3xHHBfz
	VOSuZFy9BYewzxG21Rg=; b=f8AzB8MuyP8nEoEpNuzCVS+vA1YYt3oDHjnpirqc
	Zm+6RCDvbDbmCgdTRc8loA4vgKo9Rvat4uKr9MfR3JrN82i6sBgHX+cyIFZt+Cu9
	0ay654UXCApI5NfFcnSmZRCsn4W5zKeSgrD/R9na4y1Q3maZT8U7TvVcBOYO6CCg
	C42D9F5+R8sWM6vAhGHS3PkzM2lDZFyWW/XJNuZyj7eloXKa8+Axv6DTJtCHOTEX
	OwJQNhXOkEjFSNMPnLqjdKc3ZfklAKvYGK4OagWljoNiyve88/Ot5tkVOUqAYjE4
	1zHnxqcWuyRgMEUDhVH4pteqU52Psq3BvcLGKZKoihCESQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkafsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 02:55:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4cce66e91e3so16128321cf.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 19:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768936; x=1759373736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbAXN6mA77BRJN0uV3xHHBfzVOSuZFy9BYewzxG21Rg=;
        b=RbEWxVlMSGbZvYGdTm/V01f7jE8QC7+gdWDTFPnRTh+IxQbwg4mcUE06sZC9V21mJh
         0X63k2WytRe+J2Fa7lXKVaUfjK5zini1gEKN28B2u3HvWVdYv9NrEw7mXpXgULJ7/HH1
         7fP12T3ZwkpiWKuSI0f1xc33tCXRL6/G8Aero6epJ1x/4bp+NVVUW6xen1qQ2yXjmHYr
         XLhKfXHlgIcjjYMiQpZATMjC5Pc1/MziPMsCmnCo1AUmEzliidoCF9IOxxTdbq3P/ogP
         uwAwo/XUv/lOuk6wpwxrN55O5cqqpYyoOueozk9OsyfGEmJRarJtbK2Gx5e3+AiMIBYy
         2fNA==
X-Forwarded-Encrypted: i=1; AJvYcCUcSA6ZDzdV4Tb+ClYlQJNDOcF6M90hImWOw4aSDOEUwfo8MnF2k0UoC4TIX4Sr734jUmgDKf23wbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1vL84tueUu/5yuURr3f9EKMFzJWum7x+JKSMtG52ANNIgzfn
	yZ358y8NMKw7spZVqwDZ5qQ6bKVnvm6BsJE0OYDtXyzMHcdEI5KzNkAmTTxcslbmeyQJEnwL3Nf
	HBxBws4xLJFJB6gCKNEZkuQwwFaJ7bSAl5iAU0GouUZsXcML12V44zD3Cz5rXhxQ=
X-Gm-Gg: ASbGncsLg1wqYYlbqIsTjKq0/cgsNs7qeSB8L2t6hNBjjyqkzieXnCAtsbTr4C0S4WJ
	uC5fpQy5sfwdL/BVjLtDSaW3Vsfz0fzldLVXNH+Xidvf2u7yjjiOouOSWv3gv3UinnHtObr5r39
	3tXtVr+UXLzqIX8Z6oYziB0xJNrNHEzUdpAK9zHpqFRxl65BF8ZN7WsuUD/Pz3ofYn+IlxACuC5
	V6ORUf66qs6IBhEVgyv//r2VPMLv4trgqs+5rhbJ4E9lYFecqI1rZ2K+Bq4y1bfsRUy7/plPhpn
	SLuT4ddpQqrzoUKhIRQBdkC2RX9pTXpU5gSlYIo+wynUxBbJCXSUa26kccA/vXjxT4cZfOlpHLT
	o/4NyfldnTyKr20qnVBvl4Xz4xbo5zXuRQ1PYkZtTPBKAuK3yrja9
X-Received: by 2002:a05:622a:13d3:b0:4d7:e9f2:efb8 with SMTP id d75a77b69052e-4da4cd45987mr26133021cf.58.1758768936455;
        Wed, 24 Sep 2025 19:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcOH8M6DYCRGbeJRkW/0/SS5z3YW3oZHH0vkC9OBNOaylp5NhxGGlOrhD3KELtaAzAefxGg==
X-Received: by 2002:a05:622a:13d3:b0:4d7:e9f2:efb8 with SMTP id d75a77b69052e-4da4cd45987mr26132861cf.58.1758768935931;
        Wed, 24 Sep 2025 19:55:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313fc1921sm266870e87.62.2025.09.24.19.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:55:35 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] phy: qualcomm: qmp-usb: Add support for Glymur
 USB UNI PHY
Message-ID: <xunzckmlj2gn7zxvklpwop2v32vmlvr2ri3wnykj45dufqrnzh@hvcuggj55lkf>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-9-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925022850.4133013-9-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: byAywl7Hv8PZAPabyvh4bBMSyux-JcsP
X-Proofpoint-ORIG-GUID: byAywl7Hv8PZAPabyvh4bBMSyux-JcsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX54Gc1MjYDcuB
 Tt9QhZbRioTwYZHgmi0nvtugcdCySI7LZ5XAsxlSuK2sXMsbwbcnT0+QryNnbl4Y1gjAp/VV99X
 XmeCdIxRW6JzneAW17UljfybZhjvKUeyd0eoqstE3ahsb2zPfsEwKgizxKATx9m0LLhfYwkTTE1
 Jqhrqd7Drf6jW+hP7HCV+XIGec6ORXmFWC83PqsTZS7+oJ6jPZerTmuiW9gwyICOxnRoSqEfsU6
 S8TU/fF42xCuE7Bb1khpMS2jR5WqAd+xBHZDaBFu8o3jv32dCPnx5bxrU8Zgton7SC86ZVmk3ym
 ntQHl9RO7uLnJsl3ARtb4vhvIzMcaWze11v0AInqPVpLZRZaSgI3xErbguFlPhhuNAE3nx0XmIH
 rA2rMqv+
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4af29 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Es_qMKvyyIjXqoqR7w4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Wed, Sep 24, 2025 at 07:28:48PM -0700, Wesley Cheng wrote:
> Glymur contains a USB multiport controller which supports a QMP UNI PHY.
> These ports do not have typeC capability, so it needs to be differentiated
> in this manner.  Update the QMP PHY sequence required to bring up the UNI
> PHY for Glymur.  The UNI PHY follows mostly the same register field
> definitions as previous SoCs.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 163 ++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

