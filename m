Return-Path: <linux-usb+bounces-23401-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4DCA9A899
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 11:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECE631B857F2
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 09:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2AA20C02A;
	Thu, 24 Apr 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoW2u4ci"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1921CA0A
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487374; cv=none; b=mryzL5Ab4oeBijLBi24FyT5aafm5uyrizKJWK4Iuh8CqUXtI5LzaAu8Nanc1ZwyxI20TNqK8+Yh3EJ1u1Q5Yb+D8z0HMd1f53D6x4CUvc3M/ausN+1w5NxZpMSlD4n9UMn+LTd/o2eD5Pj72qztPamFVuUm6DdbJHw9xoJXR9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487374; c=relaxed/simple;
	bh=oD/+NuKhlsyZZ5I1Sx7aCzJ6/bahEhBp9YFkWTPs/G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2PHPtGGerQ7mOLnAKo3SbO8hwkGkXGxHRvi8kS2+iFCShEBv5oZaDi3vQat7wkV7YNm30BBUJxkPSvDM8LqzdWdVr+Fc71wktn0TK8oHsPuMFvR3r2ve9cx2pyraIlHTHt0y31ATG4e6AILXW7qtRSu0v97xc47T2HaXLj33F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoW2u4ci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FCxl000748
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ki0WMJZKSmFmQy9e7rjeB45X
	grpCTsnp8UNMzxotgak=; b=ZoW2u4ciuCgGFbFUggKAC4FR9QHdfrqdT7adpV0H
	oQ3a7gUMOG5EvWREIOcQ+B/1LpXMwIw97yuw6lqFdE2BQPs6z+fagMsRGn1T7jjB
	6nAccwXImbAz/kgD1xdqjAlkzM++ojkAyY1el+WIt13tL0d50x4nSuxsj97/8CLV
	i3deGLaAnaHo8m0HCrvG2cjqgz12urviY+Kp1t9Te1P4CR0r7zcDefn/+QoMbEXR
	DpQQmkvBXnQXuWq1DI3LLVQHW35DFtBhHrWEXMgJks7nSO3vVuXrqOqtBaPzOYzq
	bJZ6u3+vqjOsoLJTK3zt8TS4zF6oBcsqRVhtQMF3ODcmAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3d01r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:36:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e7922a1so162695885a.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 02:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487370; x=1746092170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki0WMJZKSmFmQy9e7rjeB45XgrpCTsnp8UNMzxotgak=;
        b=aQswdzI24stwU1Vy3HtiH7pThFuIGmm1St0GySrfGB7GnqpIpViyE82+J+z5kF7UZu
         hNbwmhMjrBAmW8Lq78zlHUH8b/j+Tv+MVpHHLE7tUOCs3yOqdoBS6gMBb/HCg6ZIQ52O
         HhGYNNwAfEbAxE+PMX0+zgnELOs5VjH5tyaQc09uI1rvzIaNsuo7nbha4O7I+KFTsESq
         NnfmGOwH1BLyw7t0SVaS/qsD9X/JqWBW74sObvzIAIObkO0mojbfEs9nsvwqESjsTqsX
         iTW3qSlBm6MQGCYIYn9VGoKOweBt+M2Qc3eQ8iEZc468mlzifDV6XpLTbFrU9nWDMaSa
         8rhg==
X-Forwarded-Encrypted: i=1; AJvYcCXeJ7zLwgXhw89QTu1cgXZfM9qHlzwQPhqJZuSZjd7AeRnkMr4KJmghl7apzWK3dwzbzzbNuYIbRME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU6hUg9OtvrGqAm2b8Ou3h2rYw0mSps+1Tit3+YLin6Nrf68zU
	WBPfAi5k0A+pW8fZyVmVrbW/chFca8Sjwh7vL8LE+bdrQgVenx6/4mnleba2NwVPN9kVFy+9LuV
	5jFo5z0cTl9lsSv4/qC5CS7Z626HQwwnBLBnTpczbYs771sZG9puxCE4639s=
X-Gm-Gg: ASbGncu3qT3DQMFuU1YDIaapNN1IUvf7hBmJdTO8TxeFxgpc8DLBYblQOCW36pTNV59
	IS0rFbwUQny31ROpR7eoRvvwsRwUsaR9d2tkbBHs1fEyCUcWnOAty10dU4+kaFV8Fhvze/y2HoE
	gsDTQ5eDm7oGQiS1czdO9eynK5U22cH7KzBEcFqEf3s10Lk0ZjUxVJJNsUcrnlFy+jqyqx+U5wD
	wMzpqOzpck24JXnefKEXBAqTAQoJ5yRAISfSh9TeZHeJ9fT0Db/aAwXCAI+pwmq/dwF0eeeNvbr
	D/9+z63TAgXeUz/1WbRNsl5eqztkq6cm64M82yI3Eun77jUvfHRvA8fA8YsSQHLJKmsT4EnzC08
	=
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286192685a.11.1745487370267;
        Thu, 24 Apr 2025 02:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3XpknWBRjJVyY9U395kjM4TMXYtQ89RY/LCEXTfiRyw5qhDQDDxCNr+1yx1C+oNIUZPNCw==
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286188885a.11.1745487369953;
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8387sm164282e87.244.2025.04.24.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:36:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
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
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/10] phy: qcom: Introduce USB support for SM8750
Message-ID: <kpub5pyyqb36aajcu2qchcjq7ypqvx4zywxusuvvlq7e7hr32k@ytbygrzwlfqs>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX1Isw1wdrGsgC KC93SoBs0r+k4YbRthn+qxqAT76ltwp4KxNFxYHDoAfhBp16qIWlbcftrY5gGHy62BohAUB1mAB GVQL4zlYKLcUQ88795MQhYUAZLk/GIsVj8PciudeRLOB+aniiHupn2+vgBXnemrW7n0sAVhhltl
 XIgr7yXu8M0frOtKOddJK+ybavoND/q1VxbBZGhSIhliHNArYjNyXHkCiZ67aLK6na8gWA8PqFj Dxq35GKPOypgLfWS0lg1he2hZ5S9bMxN0sDWG7rDNLwEmj61muELG9QRZVRFJJebN6xlrxdCgcj zG/ODfFsIBInqxJa+onCsCJy3AbrZo+BaEVSd435j2JzdeO8ZLD9ygLgw6USvAHbO2OmkT+qvYJ
 lNlR80wXmhWUXdXjh015jdoxLGTGc4A5dLht+y6mLmQc2n7Prf9/KkRmYhms/y5Bv9+tpN7p
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680a060b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=spWr5J_MtH7HAiET_ysA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zHBMzmP2vPI0oVkXT2cjdyFTs4nk9mbU
X-Proofpoint-GUID: zHBMzmP2vPI0oVkXT2cjdyFTs4nk9mbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=533 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:07PM -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v5:
> - Removed refclk_src from the QMP PHY driver as that is no longer used.
> - The decision to move the TCSR clkref property from controller --> phy
> node was made in v4, and the refclk_src was a lingering change that was
> meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
> clk will be voted for as well.
> - Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
> to take into account the change in clock list.
> - Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com
> 
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver

Which fixups?

> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 

-- 
With best wishes
Dmitry

