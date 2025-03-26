Return-Path: <linux-usb+bounces-22176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6557FA718AB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 15:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD7318962FC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 14:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C5F1F2360;
	Wed, 26 Mar 2025 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoGaHWXD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D051DDC2C
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742999669; cv=none; b=rjbgef9AIUj0Tg3ajP6yF4IGf+rfpl3GpFpiqs2al44Si4eurMeyLH0AmMQ+kuMdZKrwQbd44uxe5ZeOuUG/3zzHIoeTmvpIHCbQdNDOZgrNYNpcnH5M/jcg1hjx5BHkUFo9ipsFS6MSszi8Rf91y5kWE5v3c+N79nofuhCQqPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742999669; c=relaxed/simple;
	bh=bGdSlf9iC5TjW33KKOqByec7ahm5IZSgwgZbmR3p2Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFeyUcDlm2H4Z8EbOAmXL7sQg3Ala5qiPXrMAUtbjzKiYThXa6N5dkLhWmAEvDhdQiQ5PfZydixhSjXZvtOCJ3/O6SDjCP7sKC+LE41F4mbzb/0MchU8sJ+SD73oSLQswVOduYlykGRLxN/lQej/0cBNVjOrlP6Ux9hHlz+TEVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoGaHWXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q739kV024572
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 14:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RY0WQaB9X6ZreP0NVetrV9wA
	t2tqT58NwwimdxdQF20=; b=NoGaHWXDU+LVn7AtakWhD0dYjqhRxg19LcJnyWot
	M/3wJQ88MXpKvUmtVT0OZ7pDfosQbmfvVDvA2VlMiKKAUgk8p03yDTe633zFmNyw
	gnKRUaH4ngrb+70yFCr5ihb5jJKMuE/c7jZ6Z7J2CSFA+vtWRhNynmx3Ah5F3yld
	HbIar1xIAdoM1xcaqNhtdKV4b8IBmlTqByep1i3f5uQogALygQmMpu6eNteXZQKr
	s5LwbUUEbgCDtTNbmOgGqEn17IuH2ORrZ5cksGaiOLfkTfLfHKnOXGGKR9Wb4skG
	spaqFv87QtX/1bB49QeRtKJNOTDOdov98QopXiTB75gBnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd357ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 14:34:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e6f5so203567885a.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999666; x=1743604466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY0WQaB9X6ZreP0NVetrV9wAt2tqT58NwwimdxdQF20=;
        b=L0EcYReuKjgHYMJ+i5e53xy0nlZAyos30AplL56vOa646wtOI+E2Z1lqqinhm+xEaW
         5ZzULimyuNKgp2uCmZUJx3psP2syZOn3m9TrtvLf7lCQykJeUWm0kpq2CoyNComalp8r
         euCivKoafEAzSEMSaduTS/Bg8eGXQ2Kg/IE5zIls9fxnxfnULo6ACYN3t8BrgmmOgvA3
         EjsD2Lcm9mImLKMWxf4PsMywUVDwLwqYLjwqtm1hk8ZVBajKNOcWs+QElZAiAsrhT68U
         n7y7Yfiq7c2w5rCtqkijtXw09Rb1SK14V+KCQ3tKiBFhtvwkHv9svONJftGi+fiPF0/A
         ZiZw==
X-Forwarded-Encrypted: i=1; AJvYcCXdU9PA/tp6i8VOr3/ZWSHl4kj4Lr18IBh+krX7VfLBwsBm7iH2v/TpfYNQ5ywXXzrhK03x1ci1SVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxslvRtT3OsAxF+UepIynXSjIR9kAeGURBHYXDLUk2KxxV7snRi
	t7IJcK+TFypNcjS565gtu6cUKzTbq0Fh2T/Fsi/RCPdNCp6hyGJiM4MO/KgNJdwUkdcTCwUBIgo
	DvDoTTPhL7pWWv8AMvN66RZ+zMhx7MOYfvKgHc1xaJjkumCK4rcQJa9pOMU4=
X-Gm-Gg: ASbGncvhCY0aNVatEjzmEeZwRMFUWeQjs2kG4j6jENGPorcs5iwNyg4rkJkhQnx3yxH
	0nDi2vbj5QSoGjKfSqHS85YyrEkmZxH0giSvwdAprzyiGdKn0M1aCjIJaFFU0wjQzlqJJ6kQp+Z
	ScudWRpDSBbCJsU4bqYFrVdpuDxPnfNbcX3QgOyUDaIxBmgsIKzDHFBv0FGSUJvXmulYDX9ybKF
	RG7LSazMcmQUQDYFmNzRUAnBi+wAbpjfD94v66UsSpkc4WEi3/wQvhKcmnZSp003BPs4iP17xp3
	S65ldA43vyl1Md6EI7GwBqiIAkPSfU9b+BZoD0bjezLnwWu1P+TZS0/6RORA5Y/cFf53OFAv/U8
	SLyk=
X-Received: by 2002:a05:620a:4588:b0:7c5:4d22:2149 with SMTP id af79cd13be357-7c5ba18febamr3269039585a.30.1742999665692;
        Wed, 26 Mar 2025 07:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECnr4KG/OEqDIRPkCO6WNP3n/KkReiXPV8GoopXIeN6jC6CBHU7czD9VyoO4qTAXKU2p3ZKg==
X-Received: by 2002:a05:620a:4588:b0:7c5:4d22:2149 with SMTP id af79cd13be357-7c5ba18febamr3269034685a.30.1742999665204;
        Wed, 26 Mar 2025 07:34:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508252sm1818881e87.179.2025.03.26.07.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:34:24 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:34:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/10] arm64: defconfig: Add M31 eUSB2 PHY config for
 SM8750
Message-ID: <bsbv6isa4dprmirm66keduxdshm4h5spl4q5xptcuduo6jyux7@35axuo7mze5b>
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
 <20250324-sm8750_usb_master-v3-10-13e096dc88fd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm8750_usb_master-v3-10-13e096dc88fd@quicinc.com>
X-Proofpoint-GUID: aLX87TGSSfN6k01Y28VUcWRsZUVhN2jQ
X-Proofpoint-ORIG-GUID: aLX87TGSSfN6k01Y28VUcWRsZUVhN2jQ
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e41073 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xq4t1jtuFps5bkffva0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 phishscore=0 mlxlogscore=427 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260088

On Mon, Mar 24, 2025 at 01:18:38PM -0700, Melody Olvera wrote:
> The SM8750 SoCs use an eUSB2 PHY driver different from the
> already existing M31 USB driver because it requires a connection
> to an eUSB2 repeater. Thus, for USB to probe and work properly on
> SM8750, enable the additional driver.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

