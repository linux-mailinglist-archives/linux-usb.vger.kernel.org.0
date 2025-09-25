Return-Path: <linux-usb+bounces-28645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C005B9D077
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5449A19C6F32
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F39B2DEA70;
	Thu, 25 Sep 2025 01:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSAtxuGL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAE31E98EF
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758764007; cv=none; b=XGpxznh1ssHlQho58yOfWKo0NShGWdvqwt75k6ZIFdAq55yYrvYlrp183PRZsv2Ecq6WONmTcTuTrlqBYqYNHfchPp/64DxVj8RK98GaCdSMQBPxnsJFSdTAxkSg8s9DeU98U6JPuuPw0af/XcDQ+fhCAaeeL3N5aMqVMJSxtFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758764007; c=relaxed/simple;
	bh=zrfzjVYTZ8zVuUra+29CM12pAOhebaaVlpFBa7gsymU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd+Pvvc75F7bpxe5MAaUzOYeDHNPvCPGEn+qF7AIsvHk4/GJqnx3/B+RBK5IRbrdGDa23kWRuBGiI7yA9Gxv+q/UDbIQ8xpv98DsbKjM0yVplNBeh1IpG5Pn/qFfoWS7qCtUJtvXbxuZ7VGlEym2LLy+lpjYBkLzBtHEWgtiUwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSAtxuGL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0M9d4017424
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MAYOf+6wYe+77ArDzx9rSs0N
	PotguJku+fDW8OMKmmk=; b=aSAtxuGLrpxX4/FkwXLjKtpeP6nxmRmZjYqlLCEQ
	DEWF2ykZsnrp3lqedxOXHet9wjFmLvQsNsyHtctKafMTDlab7bTd47JFlZ2IKnFZ
	4sjaU9AjuxLFtylpwKhUFskjzR57jyJC+3vc6exiUhNua6D/6YfFLxhTIF3jb450
	zY0SX2MDFlSrXYVJq+hqnfHctr7wpk46b27P6qVkHqejZDorOoaXaJnZaV+lhUIp
	a871jpI1IpoNXW9LVF1GlKGn8Umtr3gSJiG+MAmg2rOjeLHW1XA7KPwAtgZciEWE
	Foc+gef2tYqIgGHrFGaMhsVich91UyfDByKbjUSdZul1LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjymw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:33:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b47b4d296eso10470511cf.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 18:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758764003; x=1759368803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAYOf+6wYe+77ArDzx9rSs0NPotguJku+fDW8OMKmmk=;
        b=Lswa5lqjigyF5SgilaXS64SIuuVZD6aBNhhJsp+TPVRfFYR+ZfvbDFuDAQvY5jw/L0
         AdwTsxnQ0SzGZpAAQdgfcdJUL0IVIwlCpk5ALx0zVPw32ZwOhoQpkCR9wvqjOxRLlzrj
         ZccKfQEGZe9FohN4v2+k/rhX1/SR8puIQAVPO/LbqVTbK4Vj7QEtbOE3mtiioSZ03Eif
         tupJ1ov5+vAeZvzD8o0KHneuME2ZgStapQesWUrj1yD5nUNwrNZ9Y2BtHGPZseYKwugH
         p27aPkuUC6aWZGhk1j0UqTF4Wz0I6z4KOQf/VV1KF1caodZRo8b2ihLWRMFU7Z/dTLEd
         4hvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsTUM/gMVPolRjDOxTD3UVJBlqbi7zOoKNE8ChZris3XdIFsi0sPEFbVvH1TG8Xi/Xw1LAsQV+UOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YybczzUcfgkHau4S7nDX8r8XRw+lZVkVvmnDB9rG9cVCxyx2T4Z
	f97OeoT1AUVesSFcp6epXXVkaJS/u3sPDwbZ6bRDvdpLkvcumlhAZkQhZv25SS6zbL6PDZagQJv
	EqqvY9b+icwxGxOKl0dK6vwiGXiPikDeqGpdCuSXS+Q72vcbVnUZNDCqvZPhbt0k=
X-Gm-Gg: ASbGnct4ymmGUBDVSt17WLj0qGjVV617VliWqDRy2yjtGyFiUiccwTIGzzq3Y3BYIhM
	iOR1bELEe2nsmFJ4tezZMGY3iySm5SN1YwBZJNgDOEtkmxLltSdDju+20pSAsPY2XMIu0k0WxmP
	xE6WUdj7MWmf0USb90GnfB3UEZW8sFnmvSEiANxwFw9PCLE5RzAitX5DX85Djgj7cW2zMTH56j9
	7CxQ3l8BqkdrwsEqIi04IQHjAqFCgc6IDKfb4LJq3IxfuSnvI90jwdlucM+D9GQsVPPLfOZ6hVo
	8OfwoPMgKhXvB5+5s5bwve6be1K5IcwCpAALr+sPGCke4wtlfYVVFssSZMf2XPZwh+9xZlpJrW+
	kT1k6bN1fL6gGOOKGGVVT/kVWdsPDF5GPAAGNmPbVf9J0OuwMnYAQ
X-Received: by 2002:a05:622a:5a92:b0:4d9:6e55:5e3 with SMTP id d75a77b69052e-4da4c58ce0fmr26416421cf.54.1758764003203;
        Wed, 24 Sep 2025 18:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs/buRc3wA7t9IKg8r3YHQpd1WKRsDmuKuJqSv26mWEzgo1bfg3M6RxBFT657MdZqpPgLz6g==
X-Received: by 2002:a05:622a:5a92:b0:4d9:6e55:5e3 with SMTP id d75a77b69052e-4da4c58ce0fmr26416231cf.54.1758764002749;
        Wed, 24 Sep 2025 18:33:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff59basm199254e87.130.2025.09.24.18.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:33:20 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:33:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370
 eUSB2 repeater support
Message-ID: <tij2dtgkb67f7b4nvyirnvocu6yqlityooatg3prxbqhfoagog@5r7izeeaid75>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-11-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-11-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uGUaWmIPW8JJIxpBiuzIWES3SswbGf_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX95/nwUytgXjR
 x65OJ36oaAvF0kZ0C/i2DUXy80vzsa2B556sqPD0FJRe2YjZrw3txQ9rwA1YYOCg32p1FZQo7of
 WIdTQG3d5QGhDXq8nEmuge0nBfYbzdLTJUJTyoyXsrTIowu9YgbbF28SCx3wpBXg+1Em/+htVDv
 2EUH7tgApNn8U5UlFFsRwTQOXw+hkDn+1ZPGGUshjh2H/YKRnEwZk1GEzPVFiWJEY90h0HML1XQ
 WH65wdWNgABW2zN7iHhckHnvy6OQqT1EbKtyffryF/N1PL0ZJ9E2vbl63AMOrplH6s/g91oRUyO
 5YRfeEnFX5eOVsOtNxxZ8bMfxHVGH0CrJ9fvdJ0YaJF/jhOy5SiUnHrdjPFeZeted4CdO+M4Rdd
 AeKodmkS
X-Proofpoint-GUID: uGUaWmIPW8JJIxpBiuzIWES3SswbGf_f
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d49be5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E9wxpCBlzucncV4SwdQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 05:52:28PM -0700, Wesley Cheng wrote:
> Introduce support for the SMB2370 based eUSB2 repeater.  Configure the
> proper repeater tuning settings, as if this is not done correctly, it
> can lead to instability on the USB2 link, which leads to USB2
> enumeration failures, or random disconnects.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

