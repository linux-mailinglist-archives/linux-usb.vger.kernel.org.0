Return-Path: <linux-usb+bounces-28643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8044BB9D053
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 03:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE4203831DB
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEABD1EA7CF;
	Thu, 25 Sep 2025 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIVS/4Yl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A11C8631
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763823; cv=none; b=muuuHeBKpkX2/JuF1wJAelM7WtXGszvnQOxftS2iRVUY2vnyuZSgOQL/FU3Ly3Uuqc7j9bn8Fr6iobSRI3ntq2x8KF69DSF2K8VPc2gTeRwfyRRtWRfyDMlWhYuS3n0YjiMq/Ll9GjB7Fx2c/6zRSjoKTu90u9TE8/rana7UxBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763823; c=relaxed/simple;
	bh=DH4aJWPTM7pVDINdGI0khQskFrk+rsjXqGHqx2g/shQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ft4b5U2yThg6CKRCY4TEt7Tj19BkQ0sGiVaeRJ1CxExq/8vZv6r7hLMp4TakLbBv3vfEAjML5XuNIRv7nh9TCROMBzaoqvCZeh6Uj72tsszuVgI5IT9nCO2JwS76Deg/NynBm5DkG5CziPSjhxsiTTMXp+elXJ2qGGqq416JYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIVS/4Yl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1EbPh021502
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7mUyHQNj70Gz7bixQgpoodM4
	fSwBQ4FeRDzfYe3Kgjg=; b=bIVS/4YlSjx/k9zYtxSjYonLhSq5UZNZ6xUK91sJ
	fhbv9Q0+vEAV3bPjX/RSDh7p+0e+n2yW/UQcwS4wHX/UA+krksvwppcUbWplp958
	r4sgttbm5d8miPC5YgzHeWcZDbZkjDNLo+M66r02rXGCCUWCTA2pnHoKcnD7dxaq
	U0Zrl8+u6skEi89VyGT/F3IRasF7SDXVTe6OMQYkBYjX7T3XhL8Jh+/bZE8EjLTD
	3m6ugBeqEuT3ou7zlJF+s4M2Zf/Ej8fqzpYh9F6LU7bh8oXMxkpm0xwiPTV9l0Iz
	RKj2w9D48e+5YSTSNiWarYEQmquPh2fYeK0c/fsdpNwayg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budaduqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 01:30:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d374dd29d1so12047691cf.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 18:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758763820; x=1759368620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mUyHQNj70Gz7bixQgpoodM4fSwBQ4FeRDzfYe3Kgjg=;
        b=I7mtuxxuqIFD+xJYlPH4O1lh66iMoZVIwruBu5UowX3ZPARyHceK9dVm2AgIrc0+Bs
         YvtQHpqwAsTy0zBAQvkt+bqRzd55DJZHtU9if8eS4rHe1X0BJHZpka10Xa9D0rYj0+sF
         EjXtNDkAhimMm1aTS2IfS+flhkGp98i+m2QgqTchQOVv2iAZgHfOOmsVbqFoAaYzFUyp
         1Pv/XjHZZI70TtijvnBmYupt67xQnQBR1/ntWbN04eQ4zXSW7tF9SU8sjeYCsYL7CRy+
         tAc7pdlEcgjs8p+R9BLoOCbREZ+9cO46i+95rNxcxAKqJhnhB4zy1GtF+qoChG9ehktq
         ReHg==
X-Forwarded-Encrypted: i=1; AJvYcCXTWHmYI/DWD4JZz/kwAQMAgrc4u8IOFSI18xJh6vHNdLj0Rc9Ev6PndU0bf1dbETXg0CbCfEbrENw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuKROKI+xQnJU6wsZM15vSM/mIz80tV1ClCeB3zP9g8JkU72rY
	oV4UUTgS11zwydmUE1gX3KsDIwhc7Ub0pR8RLuM8rsTgl5Fff5qOvloSS+Nak0ZS1TnzLby3fGv
	XwiT4KbiymhHfPF9+fvlW1i5c8tGrsoegN9T2rSDwsrqf8oXd4VpiJs6CXNjb3R8=
X-Gm-Gg: ASbGncv4iszypUhCAcUXgX/e+0+MtyIiTapTqCqjY5oUDFupZdq3J1qpnYlq6LlY4/R
	vO6PEu8kkEn2fTwPtxyzOiqLsNW0XR8vUH2Ko/3I1267SpaEdFtLp8uWtctEsRVbM34TwG+MifY
	C/yvJEjJ0HszxicfP355gqN2l0WVYI4aesNIBDRLSaa+luZ6Nlum2oJLUbAB4mi9IAfuZ2xTlgb
	7CM2fF3LypXprDEv/usWDC12rJvOYy6QaSx2KTjFdVg4bahMOECcHMdSImWQDcmIUrQAYbLFppw
	oGzd+Q1W4PPJZOXxGYFl1qow6rSROCMxOwGZD4Le7Xhpaoic1LX73EWkVWf5W8mWkDdXKcHxmJO
	0mcs2AdDT1zVtUFMPJLVYr0oVqpFsKfh3KFqiJKywffYm1Qo40kHp
X-Received: by 2002:ac8:5856:0:b0:4d9:440c:2992 with SMTP id d75a77b69052e-4da4bfbe724mr22592171cf.58.1758763819783;
        Wed, 24 Sep 2025 18:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF456x3zpn/m71a91HI86r+v93v861E9jEgmFun7cueAn6yXuEgN6HFNgHqzD1nVz/Bp3jCWg==
X-Received: by 2002:ac8:5856:0:b0:4d9:440c:2992 with SMTP id d75a77b69052e-4da4bfbe724mr22591811cf.58.1758763819256;
        Wed, 24 Sep 2025 18:30:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fb04dsm211238e87.44.2025.09.24.18.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 18:30:17 -0700 (PDT)
Date: Thu, 25 Sep 2025 04:30:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <un3pulyn7tv3qihdnqmktsctped32am2eglxzfpwyz3u3tqspf@fnieck3i67j2>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
 <20250925005228.4035927-8-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925005228.4035927-8-wesley.cheng@oss.qualcomm.com>
X-Proofpoint-GUID: vlmk8s8jjZ50pB-UYkyyzGb-93Pwvkfx
X-Proofpoint-ORIG-GUID: vlmk8s8jjZ50pB-UYkyyzGb-93Pwvkfx
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d49b2c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gzIeawRUdsEZb0YUvHYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX+nvH4WYXsFss
 rQ9K8C6vElhALDH6bf+3h+cjGRi5uIfIksbo3wHmZijw8miCcFxHszZQQWxNKR7khpE/MvpCltY
 NteWg9lVo0ufyD1UB3AM05f+OswWInhGiGO1tNq36aYLHhfZDdr4epUQvrcPvUDUDvNOMU4B5Oy
 AbesZUqNTa8V4jJ/6FBVxhkZmEItBb+qHGs3fAb9tJIdSJD6anCH9OWu6nNWeWeZFYn2uJCgdhR
 WYJfbTWAzHPZhYgp6oYyu2svx8SbYP50ZXiI1UEZ2XMOPzcjcBNAsOurn1yNFIVFaqI4kDNCinF
 R8EWAjbBH0QHSDYiQ8RAp+xekaXnlK++zZxGH6lLToCyUzpkJyFWFpXK/kCupKENED1tYRWyETI
 hI6GvlXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

On Wed, Sep 24, 2025 at 05:52:25PM -0700, Wesley Cheng wrote:
> For SuperSpeed USB to work properly, there is a set of HW settings that
> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> these settings follow the latest settings mentioned in the HW programming
> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> new ways to define certain registers, such as the replacement of TXA/RXA
> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> There are also some PHY init updates to modify the PCS MISC register space.
> Without these, the QMP PHY PLL locking fails.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 311 ++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h    |  12 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h    |  17 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h   |  12 +
>  .../qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h   | 639 ++++++++++++++++++
>  .../phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h  |  33 +
>  .../phy-qcom-qmp-usb43-qserdes-com-v8.h       | 224 ++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +

I think yo've squashed too many changes here. V5 and V6 headers should
be a part of the previous patch.

>  8 files changed, 1251 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v6.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v5.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h
> 
-- 
With best wishes
Dmitry

