Return-Path: <linux-usb+bounces-24564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A7BAD0FA4
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 22:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D82881890EF0
	for <lists+linux-usb@lfdr.de>; Sat,  7 Jun 2025 20:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BB3218E9F;
	Sat,  7 Jun 2025 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7dWBebX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19EC215793
	for <linux-usb@vger.kernel.org>; Sat,  7 Jun 2025 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749326919; cv=none; b=MwER5D14EvHrXyJIE6pOi+5fN+mO684PBXus/wMSPCwykSOUVI6Y2FaGAIsyIO2Gr9yQlLgBA8GazbWztTQ9wOD6nNPfz9oKo+arwoM3VN8o141arXNncfNtg9gUgMOj9kWGHlcnw++D4hTsjKCymP6J0DpI5APIc0Xo/V47+IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749326919; c=relaxed/simple;
	bh=VCmRdOUHHx69BMRY8Zh21+gZfzCtkEfrMaDX1Ai28fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M69qHO/3OTxQU1ZNHJVCcli2TaelvGQl8YSyZ2L+vrO1nZglbkoup2K/h5zTs7koSmGW2k5OUTyLNjLfX2CgVa/v2DJHCyUbJuSFGIUgXTVvJhci6dgJ6XAFyTr67vYFRWuKUeflK0oe2x7TCxo/OxzFk1yWp17+jERz1VFyFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7dWBebX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557CiRxh021645
	for <linux-usb@vger.kernel.org>; Sat, 7 Jun 2025 20:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcGfjI1c42cfgKc7S4/kHbha
	JgN+ngahbXwD1Is9qfk=; b=o7dWBebXGy2Cs22/xuJV35Pxmnsjac75jmvdr0S3
	dtGm9z7kVKJL9nLHnG6beiYIxvRYu+LqzPWTLQzF88i/j7voi9xVL346mIrHCvPI
	CDYTeSpDaA7xAQvzQ6mrZERBuJ4q7yKHxn/2OebdZheO10KrUyS7PSw2Wn77ZGX3
	hVrN2ocOs2yjxgl8pNeQueDxjq8RGxy3cL4lWw035nGiKw2DW1NiXrjL/0CidDCC
	smmHUHqxrA2w36Ku5DWop5gvZAFpEnxTO8g7J4Pp3o5d4XCcpdtybvFq+YCpvwyY
	qyxlp5KeUs8rvM20sdLLnww+iJHURWvT2sJULIOyvjB56A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j16dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 07 Jun 2025 20:08:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so31754185a.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Jun 2025 13:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749326914; x=1749931714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcGfjI1c42cfgKc7S4/kHbhaJgN+ngahbXwD1Is9qfk=;
        b=OUHbzxaZS25g2UYrcPSGsOwRAeli7GFcI1rFk8oXPdes7b3RzRnSVakasTLjNFao/T
         SGi6vOKgEd5rXc3GV6ZhWmUamuPGIc4wComciW3k0GjqgX8PKzJ6CCssbeaQcpJyHvOl
         xqhDppUSkhXHpihWCcNDJslxOLHsOtrdfDE1y1gK5m38hV26wjsbGcmmpw1Esv3ahzdq
         iuO63ey1WBNsh2W+tPGkB2aWIfuYnT8YnCrTt8raqxO6EpVO3br/Ue4FwIAUzgLmf/xZ
         oTJgnDPm4BNslYYs/61ttNIwMTzAUklKqvhxsr1ebSlqy6kzxwJge0BKoz29PmSpHhtb
         r9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9U8OZiGjAif0KZIRwS8U6WkEeIwKrnsNzGassyoAUhlmve+4kVav7AaBwsGXxzYRfIJBeRbn2sI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLvu23mC2G0lkwwN2I7Pg3Iu7a31vFdURiA2kEUEifG3rReae
	rowDxtXcKvaFBlcwbUhvSXkfIWc1OgPgxm/H+x1wkyY36TPY/gIuzBiFKwzd+2E5IqUTBkLB16L
	t437zSiJYVprdezSNg7O1MHt+sm2Hpnq6Co4Zz8Y2MazeEwnwolmU/HTq+VAHuvc=
X-Gm-Gg: ASbGncuieOaijHkZdFnqgM7MjT18O25RAQqwTwKSx3YHE4H2eZsTt+qJ9z30qEJYkeA
	HTv7xU1YiSHYV41jUauDQmE7RmK0Llc6mBs3G3wBugL8GUAHm7YAcgHxdG6KW+h8clWIODnigfN
	Q8jJmSvUDwBiJXVhS3Wez5UH798v6zVsg3cz232JGl1t+WkxUgvwBCDHP0csmHOJzF1COcam9l+
	4pQlP19EIOUotIBAD6jz0uBZA6WAPbDBbZ7IzhjtpuZSOURPwcoy0iWXcdA7rW63HSCzRMFPHAz
	xCVhbW0zKwT2TLkASvT2hzjJeK1DACR6o9XG94tLSCkVUamAL2bKbyFMYX4XiMc5S6102hSxVwE
	U6HavFj2y8Q==
X-Received: by 2002:a05:620a:199f:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d22988e34emr1206537685a.21.1749326914457;
        Sat, 07 Jun 2025 13:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjhcwfKBxBqhK/w/iqBpz8K5IgFSPkf/a8LQCs/4fz1R0yrkN5KXByabTonhsJQyxPWceGJg==
X-Received: by 2002:a05:620a:199f:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d22988e34emr1206534285a.21.1749326914070;
        Sat, 07 Jun 2025 13:08:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731785sm595624e87.216.2025.06.07.13.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:08:33 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:08:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 2/4] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Message-ID: <lx6z62sadq5ijteuww3o5mriti45abty64ucmzig5bdaijumzn@dponhgcugds3>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NiBTYWx0ZWRfX1hUQzC5sYCvU
 7XwPxVC/xfF/4pKHn+k6L3ULadVLIZ/SEZa8kQPenrLLtFytyYI3wVcVY0n42zxyhQRlA4Agnwk
 czE5rkrFHEH96WyuvCo6v6az39oKcz/2/k4G4qd0JXIj8Ctlid1M6/LOLmBMY+iLPynGXXqXTRt
 AIgx15BpVMeAjN+iZWUjUVn9gjGitnDalqiF8c9sg+59NnZ0hPe1DsS8Ko2O+kgwGdIF3VyYkbl
 WmpOmkY9WzLEM1TNwJyXCmkRpv3D2SHN3Dv+5EzWDTqUlue04jRQFpeSaXlGMQVBtko+/d8ZD5u
 GNma68vjNuQcmq8MDry8pqo+AcXcm3Jxb2GqjWAHCgigAFW2J3ERj+4J1k6iuVytBjdCAhlmTrW
 KGwdn7VS5E5DxV7eIKHsvETYZLDcEkViBb/AZ9+VxC11LGpUxCFxwFdsNZeJO0aurB2eDuGC
X-Proofpoint-GUID: UpL4DOV16yJdVCDAu8aa9WfJPgl0xytc
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68449c43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=gIeN6KSkFSykCpat-AUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: UpL4DOV16yJdVCDAu8aa9WfJPgl0xytc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070146

On Sat, Jun 07, 2025 at 09:19:37PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
> usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
> to be controlled for PM.
> 
> Add the support for this device for the power supply.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> @@ -127,6 +134,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8440", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8442", .data = &ti_tusb8041_data, },
> +	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },

The list is sorted, so this should be the last entry.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry

