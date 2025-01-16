Return-Path: <linux-usb+bounces-19427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 533F9A1424C
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 20:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6BD27A3952
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 19:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3072522D4C3;
	Thu, 16 Jan 2025 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXJQZwt5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2483E22D4D6
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 19:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737055866; cv=none; b=kvEG2Z7swaCtroHIdOu5GrTin9mJVVnQJPJ5upwC4BvFXIuWk2Qf+CEHs7QVplNughhKxTRgwGgboKOP6mdz6G0U/J9MIAZl0DfktxZy1Yw5n+ejHiDy66fUc8dFxm5PsswsVmcyvgjtQt6j7SBbPDoRM9MRL8/J+rc9YA9whiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737055866; c=relaxed/simple;
	bh=1+rgxPKUqRlTG+Y9zg1A7XN5a4oLNbilwuPXG8NmHJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCAyXFKMbCe3Bqe5fHnKUjxW+thuFu0PaHCKhWLBcEObeVxkmp3FcU+g3yvlb6EClWYgzEN1dj1sqb3lmRq2DJXqr6jkZRH8kRW32IlS9p4uQrjsP8hPnMOPuWfth/XdZ2LV4UOUxsxdmkh6GekvJXt+CUk7yVrrZLZ9u+6o1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXJQZwt5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEK2mZ005706
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 19:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=; b=MXJQZwt5zFu72kpv
	RCn27+pG1vgqfm1+XSm4qU6C1/n2lf0zo8jeOY2xQ8jHveJ83l4BqhAgMkXFr+nF
	e/9CAjpd9GGjd5cXO/TLxq+pr9WRn007Pwq17aFm8yCyiHKGeuceKZdeDjyPstkC
	o2ne3SEcT/X1Jfdp6mVbpiawhx0UJtFA7a4fUHgsT0mWmp//uHPYl1AOn5szZF37
	oq6Fxka8W4IL7KhkDuNd1Vmx96slz9T8ASJBl3uU3SArVYIq4lBZf5Hjc1exmBSX
	/3aO33DY+ZEL9VaLwl1J4xpt0FKi2WDa1v+/fLPpbSfc/1/c0lw51N2Li6l4oAsK
	FKKnSg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473sfrs45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 19:31:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e18596ce32so3335266d6.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2025 11:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737055863; x=1737660663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2oCQTDyFtzOd9uDuk0k/6IADn8jCTnEtRWIODY/B3s=;
        b=hbeY7foH/noMO79b+6iNiIqIW1ThHy86kZyWSCiFvS0mHaD7gnWhhFU+QACz1ktPOy
         JMftxZuvJy0saWeSVMUiDQnwC9eaUsZd9yEtzaHbvF6pPBZUDO00/bMq+gCKOIvvoR9H
         NETF7YDl7TQST3Hz+yDm/3gZbzQtAIxx2Dj4ThbWWzzabhBkCWCSQHGAyssCsOX/wfOo
         cb4aPHMylefPPvj5GdPAr80jFydoMKo7VD4xi6Iw/0eLhOc4jBrwsSWVYCSZXrxQ9MOa
         KJvxIg8ktC3HnIqQxAMP4EjNUqkVtwWCzsnZ1KdTkyKWTzy4rDdkJopgUO1/ZAOF5pnV
         JvcA==
X-Forwarded-Encrypted: i=1; AJvYcCV7KDoI8uoWOGMa9QQT4V5c2dH3YpJzdFvd8b6wfARihFdaNkGFIHgDTcrlzG25IE34aCIOa9uEsiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKI5fQVF4zZluXuIom5ltWPXqfAgIgW/KzY/IsHHrCDr6rTm7
	2RJv7mcLftqqH2BZaRUF7XQEN+CYBdgc1E2s7cubYjC+aNAM/eobLo+VMpJgJImipX2I23qBkcO
	KCUlJehb6ZUUsPrGm6L0lUVikWyPGzvwbGs7mWmsTZQAeDN3mSoijGTmJe3s=
X-Gm-Gg: ASbGncuG8/NhYiAbiVRQhvOIisVy23IGBkcwLvrkJJSLht0Pja+Cl1xPPH4deKjjyaR
	qq5gPSRchuA7JYHl5stAeXJg2HTuJ2BmKUeuKGU7oRyDmHaYC9Kf8Z76/ezaduqVapaddqR9s2u
	RKh0WheKmJqpmjajiDYg5eaJdmJoDg/UPuKTbxlvSV4yeJwCzJpVw3QEQp7rKOzVSsJ6oMqWyMF
	eE0qh5mKzpcnX4GLjwsBAxGUx3HW4JcYGgfwZzsaePZU4uXx5FcgCHpnz3i4vRQHx1LWmGjgLxT
	ZF/MzRBfFlecOliNFCO1KDlbAmoHYyscr9I=
X-Received: by 2002:a05:6214:3016:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e1b21f207cmr237296d6.8.1737055863121;
        Thu, 16 Jan 2025 11:31:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoEvs3dPfn98G/nJY/KiQsPoGomSjcKF4fvgXzqrXcQPhHh0k0bJ4l0NVlAcPX0Z3NeGEoWQ==
X-Received: by 2002:a05:6214:3016:b0:6d4:1f85:3975 with SMTP id 6a1803df08f44-6e1b21f207cmr237046d6.8.1737055862745;
        Thu, 16 Jan 2025 11:31:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86265sm37902466b.130.2025.01.16.11.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 11:31:01 -0800 (PST)
Message-ID: <e08535c5-33e4-4f9e-a234-deae4f179371@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 20:30:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OO4uxXzl2alXjlNxL4hU3-DENTGpSlhI
X-Proofpoint-ORIG-GUID: OO4uxXzl2alXjlNxL4hU3-DENTGpSlhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_08,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=649 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160144

On 13.01.2025 10:52 PM, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]


BCR>;
> +
> +        #phy-cells = <0>;
> +
> +        vdd-supply = <&vreg_l2d_0p88>;
> +        vdda12-supply = <&vreg_l3g_1p2>;
> +

stray newline

Konrad

> +    };
> 

