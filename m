Return-Path: <linux-usb+bounces-24364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D9AC6985
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 14:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CA9E9E6B73
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 12:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9572857D1;
	Wed, 28 May 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aN5i82Yz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4D283C92
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435882; cv=none; b=vDHk4MBqRMG6v3qNZ7pv8tWKxoKpqVXR5glqfBLFxRLJZSD4qDsXGz3j+6mngl4fN1M69hW1WisLHN+SF+RJChwhYYE/I616NoVHjlSEaw7dkNbUSSxJdCF9PpUAKlvv3lzQUL2W57Fn4gX3deheqjrRIrJeNB8b+SQ5RyBfe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435882; c=relaxed/simple;
	bh=sqONk/oAqQaksWZ2ArNRDlag/xuhtIBC0jRT4lXblFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZNadiYcf5hVJGIpBiFAS4xF9e2roHo3gEZK/+B7m38o4p39b9YgceQGVR96ow5H1rC+ptqMx62d6AK6hv9YM5B9ZSltKCaKBOmJVOicNPn8s30tbc7vT5n2dkqP/e1Ux5w5EHsZ6oboRRnMBbW+QHZtCH1xe1QA/WZEYOyVvGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aN5i82Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9Q9CB022082
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LnTOhc1LJtROB/kjrDGcE/rf
	8BNOgI+khnoo3xpI+II=; b=aN5i82Yzl4Ju2K4fPRuXGArnnnjQ0DBL/U89Uyzg
	YEusB0lLkN497fDAn7DxqHzIj70kAMhEW5GON70OU06rh6P3qKlC0Np0tUkIuSJ0
	kcIje/EoAeRrNKOUOYwwZBMg7Ft/3atT3jK1RVuY5HQaYzOuUSQlKpRq3ex8bvSV
	yuB1qeoxTR3SOLJHIHktc3MH40k7HVJFHJ+Pz9+a+tWaBnfbZHhMrilhxBcj7fGL
	r4rmWyA0Yc1dIlKMGXhbe7646KGbXaG7coCM3gWhd0TqpiYcegRTOXGN8T329k0S
	rCZVS6kYetIjbeZS4gKgB6I5yNZgTCGOU5ywJGe2kr0fJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcxn2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:37:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa53cbc74so62233856d6.0
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435879; x=1749040679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnTOhc1LJtROB/kjrDGcE/rf8BNOgI+khnoo3xpI+II=;
        b=bRsp6dyAZR9bVbnLWF7VO/mNCZxipDu329i3TWRTR3nBEODZdi0JaewSGzlW79ivwR
         SCaQfUc54wW9C9bxTtgYMXdxPhuc9nhP1oOFyuJOcwhd4mt12VNzeVYulrrQaR49fbAN
         8yJLi2iVn/ykplSg47WIyDV4ewBtlHJ+gaah1xdYf/JzooJbsPxy/ZBL3rhhWJqqokPh
         JBL0tyAARyEOE5CmUSDWYX9CJh0DuEl9ShX5HE4aiCmr/nySxJ5Pbekzydn0kTbAke7I
         mxnILug48Dv0ZtOiBtT49aP26hg5DvlRF/XTuFMhPz7eo3UkFkx0OHL3Awl4NlNC+1Bw
         6whQ==
X-Forwarded-Encrypted: i=1; AJvYcCU89TXurSnX8pxXN5HpU+NWAurSVSeBUhX+R1P45SKDn2ydSSd/HryinZMwoXQFwDH8Szxw2RC06mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzScdzKujVcWHr1oKPitbh+9W7xAkRA/JWsNX8r6B377r92ViLe
	9WFczD2Fx85OBNY6or7bz70YXXN7n1YWZFQ7o7VSwqLpo/EV4Sr7fm+sm3MpbQOZtAX9RDj9deo
	gQTsfZ7iOjv2tI4VSjgDj+7kCV5+pGxB0pnhuRxkMOckfWviQiqkIjyEhjFQQf6U=
X-Gm-Gg: ASbGncv8BBX20JWaXG5ltTRBLzTbzkObBSgywf0ovw6rZitUU2IGod50luQIFV0h5uq
	w4CAYFT881tqVybd4Cx3UTJ6tqxW0qbjdERKSBbqyz9gb5ubcOd9G3alGhu5xdoEMo5QrvJ2EEa
	3aWuKRcl09454EI031zjfZYtmCdj6sqoMVaqsTOPXfRASaHihB025ICwZfPu9nnXGPo4I0JjKiA
	jChPxcJOeq/7G1lIG93CsVa84s72PhEz+aLgkaAetsQvF1F6PmHcp//H/H49MbG3qazBTuNTram
	s993Vq+QIHLaXXRT1CwWZtlpQhHhTk5BJAEGz2h/l10fXKs1jvmqgFgJPYe82npVb8fyFscj3r4
	=
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256233286d6.29.1748435879073;
        Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf/wgeitoAgxxj9Q2ekKkeVrKgLV9879XWXLjEkhNeRx4XpQkYYovwYdM7CGYXKyMxm7vwPg==
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256232646d6.29.1748435878664;
        Wed, 28 May 2025 05:37:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a4easm265991e87.154.2025.05.28.05.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:37:57 -0700 (PDT)
Date: Wed, 28 May 2025 15:37:56 +0300
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
Subject: Re: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <zybi7fyii72vm3dljqw2en76d4n2rmdicz7jgm5xdv6netpwrb@xwihqutyfa3w>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ycswqPa3GZhWyeewGpB4tBLZiWc6SR7S
X-Proofpoint-GUID: ycswqPa3GZhWyeewGpB4tBLZiWc6SR7S
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=683703a7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J22MhVpkVBW5EiQ_9csA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfX3akfsdtAFN2j
 ejXI6GD0e9Tbv9LmgdR+t0Xt1Xlwhh87XUaUWCpLiY/Yt/iEA/qHkEO1fz9yY71hGmn9Wr4mykt
 7o/Ou9IG/I+XJBqb+v0j9QYZ9XazFq2S0vF5/juLAP2+uxit1Wu3ONkKt41DSMYxzYDvTUk9bIh
 pjc1Q7WsgXXFmbWgUGN70/JXa1V8qRhdVMZEhgCoVz36zigJ8oUMQ/fhtGenfmaukhKRspnO0Yt
 FZrq+6M0XiqEVd2CSDIQcWX+KJTqFKb5nTHFaIJdVUp9erVNtWDjyGz0gA/zKbYnhIgnVL9H3Dn
 xLxI/TTLEJVUwz4U5iMubLm6iiqah0T6s0zYmWCe+ykoRNLnkjSq9oC6uHIXtfIy2BVQsNxcTas
 mLsCTNik2UgcRd8MSyY4j5MOyhfnk9tC1TOZ6uWyol2yy/n5xucLAZsDirF8Gwq0z8cWLbPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=573 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280110

On Tue, May 27, 2025 at 02:04:46PM -0700, Melody Olvera wrote:
> The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
> already existing M31 USB driver because it requires a connection
> to an eUSB2 repeater. Thus, for USB to probe and work properly on
> the Qualcomm SM8750 SoCs, enable the additional driver.

Nit: in defconfig messages we usually talk about particular boards, not
about the SoCs.

Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

