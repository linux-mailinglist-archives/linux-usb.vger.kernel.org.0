Return-Path: <linux-usb+bounces-22868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9187A83728
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 05:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9CE1B629E8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 03:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C061F098F;
	Thu, 10 Apr 2025 03:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Haax56Ep"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58A27468
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 03:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255313; cv=none; b=bSJGXh9Xj1ktqOU4Kst6+91xymYVBFlvwPnx/hrQOjbSYJkRjmu7jiyCl3S6A0wBlKSCVQTQp8Z6pRdhceuN5NkT199DiFTwvI5Kg8xUl7uvkteik+jVhRmaHqgfZgvFM2eqeA2vf6tHGbp9De/YSYSehbbyA7BG/PLLPHcky5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255313; c=relaxed/simple;
	bh=cqgG21zRk8VNKBxL2wmyw7+NAbVkESWSkpXKgp7RZDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKQU0YWGf7etj8enDI6dFywQh6fS5bVQ3SyfAWZGAwehRIl1qgyM9PI2PPKtAGRhPKve6xBDmK7EtV61LtHhhSX3louPpohDgpTpyr+di/G2WtduMBaMmeGq+SLO+qycbK7z1AhJSr2bn5xrVdiRIVsGQXM1nc4XSYiUkk1aB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Haax56Ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HET0i014995
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 03:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BM6/NjkfUI/1vA52IvXfXFtW
	Pqd6Fba8LY2OaYR/Rto=; b=Haax56Epy5hm1YbDbfEKLQDm3mqExVRkZE6GyJcd
	q/TO79XMedlAbmsd+6FPXwVqdHusbWJN2N/xaQNMPwj019tqFrBRTLuCXNFHb/Yk
	iGW8buMSyBfh7arI9p5RWr6p2vhuKbfY2POgyAZvgDy2upy7FfjQpvcVSiufVrY6
	PZwPiJLa0JyyxdxEyuhXD6oBI8d9jpKfSL5DVEqDOFXXMO2yxIVWoGSqSAbkjldk
	1e7Qx8pDXc1ulYo9aojMhDj6nsmQckfh+44ZBgdPdqK0ajwhP6w8sSVD49FUozqD
	eeYmGLtJFYdzhiQq6K1H3+Tm6m/UKSQP/LvjVSiLN72S6g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbunfw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 03:21:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so7205006d6.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 20:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255309; x=1744860109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM6/NjkfUI/1vA52IvXfXFtWPqd6Fba8LY2OaYR/Rto=;
        b=tOPpWWL1RLYO4QpBxsT3AScIOseIsNFEdUBZBVNkiEcIHlpFih4YgRRC6SQzA5sYFC
         alggPB/1BUZlzZanSDz7/TvhqjYMcjFFBhem70wUdcA8T4KxMyy6L3rKkLaIRGeOoB8z
         VW+3k7tDWr8CJVrCO7mta7zj4eQ4A3DQZ/mhvYA58gQkFaubjvByy9JbBpKjxrhKoEnl
         hHkVCGuAsiXU2IKyD4gX44zVkKf5J8YcfI7Pi49fyDfE7EfHcMHTGYGz3+KAGDQuPJWU
         jk+1s2uGH70HLnBpv+B4qwlmhnLdCKPwXL9lgMUCREAqiNDkhglGixocLZOCzOJAh7IK
         yeXg==
X-Forwarded-Encrypted: i=1; AJvYcCWRsYiUHCipmB0xFjoD9Xesmmviq2hqgyz9j7UB2OnwYCr0ZsgGpnLMIgGe9aB2Mmg/sQKG1m7fyQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVP1e9ldafMW0EoCUG0vuS8bUQg6HXZ94RYVlCxvffMljlyIa
	QGfVLt0qISVUzoiIXuD+6hkxvGYPEDhqtdrZfQ1PWY6ZKYZ9lNeLXabsz61kaHvchFPluhgDwyP
	+WkM/eKRUrAS/RwmN8fJe4sdGqh7vJHQGjqoSSm15dh0/B0OSLk/5nfZ+jeU=
X-Gm-Gg: ASbGncsGCciFVYkWGYYaGeDEEcVu5GfA5EmLLGBMH3bjPn2CBi8eolGKJitwL506Edv
	9InoFlMQmGdJr6FBtYcf/8VJgzC5iRpmE1mCC5iqcFlg+eF6xN2pqxGY65mRJxwDOcXTBCvB/ym
	xj/sVeGO6RBIZMuBrOxZ5/50wJR4WpaIqtc6oVKgirLLlLJbK4ERXOoHu7QWUqLztYpIiFk9KX1
	HaQC7vxXpihlcGkUJRgBIb0/3/0PgJjMsLbPETFmMnCJWZJHYo3f5ZgD6f0wCtjYswAu4jLfV8W
	VsYdNkKwXdVcJoYUa9N3cn4RyYmT2J3a3x5TPDQ+D+/8qy++bNPe20zCBkqaCgnnEqzBG9qDBkc
	=
X-Received: by 2002:a05:6214:2687:b0:6e8:f0fc:d6c4 with SMTP id 6a1803df08f44-6f0e75fc07emr6848736d6.6.1744255309678;
        Wed, 09 Apr 2025 20:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYIqjaenrrYWCNqFjWK4JuegWJuudSnIunDlsPqtfRTCxjlrwo2zihuMXwTVE6JJddNv1Etg==
X-Received: by 2002:a05:6214:2687:b0:6e8:f0fc:d6c4 with SMTP id 6a1803df08f44-6f0e75fc07emr6848576d6.6.1744255309329;
        Wed, 09 Apr 2025 20:21:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d23casm3432091fa.79.2025.04.09.20.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:21:48 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:21:46 +0300
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
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <o3ixtpmvueravt7uwpp7cu7fmucia5lonor2jmfepee5bramhp@uhnxvywjqvz3>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-4-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-4-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-GUID: ivFrQhN3GZz7mY-5klrPARJXl6OC2_B6
X-Proofpoint-ORIG-GUID: ivFrQhN3GZz7mY-5klrPARJXl6OC2_B6
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f7394e cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dtmsXWtYh8RDwc6_VsYA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=872 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100023

On Wed, Apr 09, 2025 at 10:48:15AM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 223 ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 429 insertions(+), 1 deletion(-)

> @@ -1739,7 +1895,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>  
>  /* list of clocks required by phy */
>  static const char * const qmp_combo_phy_clk_l[] = {
> -	"aux", "cfg_ahb", "ref", "com_aux",
> +	"aux", "cfg_ahb", "ref", "com_aux", "refclk_src",

This clock isn't described in bindings and isn't used in the DT.

>  };
>  
>  /* list of resets */

-- 
With best wishes
Dmitry

