Return-Path: <linux-usb+bounces-23403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F7A9A8B2
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 11:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2B81885912
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716F1242D73;
	Thu, 24 Apr 2025 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8a1newR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C81222561
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487543; cv=none; b=sHcIPFjc1JPsmWwXPOMLnHRkE1SYfcJaL2zhuuefyYTQ91MIbTS0uMsqpq/VU8554vr8nAX4kvC5IsuhULExmTWXQ1KjU23P8ro/j8ouD0NrHRxCF1UZ5BkjG5oYmHmmdxNk0IYALA0zkBIWt78nBhGo2msqZy28w0AS52vbUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487543; c=relaxed/simple;
	bh=2o94boNKwWycSx1zjXKauuQvyUDTL1W583B318Hd2lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtN1nwyWmA4a+dmMhrB0oDKMOGsEesQZfdAPDyJyTwS3TcCXdxW92IF65FQHnhvbKBMgV+C9Dx+nxugBY7v98c1pu4hM7S9ZQR9z85/yl+ggC4FX1LpOblJ5RGMuYERHvB2O7Ck9vktnmhDVF3npj8gHEl0keqMQSjGHsulVbs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8a1newR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7Ek013259
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2f3dK7+MKJ/z1loG9CU/AAII
	V64HRI5KTaq4hfss28E=; b=U8a1newRJEdS9P6IAa18vzlihzo2D9BcXOdX5yOJ
	Oa4bDNC3lgOmphXitQm4leabcGaZDhhlNzJl9KhHxDTKGiliBt58f4p+ZiX5y/Fc
	HFqmdOOHc4yXGvsNx2kWMnpj8IGnoxW24Im1ZkxZFykXbRWmjt2K34atY+Z6STWf
	Z5zU/4rlDMrOGtRiG2dbL4MAJQ5MUAyC7YbQPvoQKvfVIzOicN264g1THBFin/xW
	WKSOuTeu5IUxqn/gNk78m5HtLVbVsx+CJZq8zMjBJTb+P4Jc9VyvR/pazAHoljvX
	PU+FTpYnToVVBWwDfWS9azPHsXRkF7YqnR5IMTSOYndiMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2d144-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 09:39:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso170909985a.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 02:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487539; x=1746092339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f3dK7+MKJ/z1loG9CU/AAIIV64HRI5KTaq4hfss28E=;
        b=Z1g7QYsZ3RCsNjiDfXCfv0PzltnsMzJzYoSoKAmwGPJpP72F82rj5mz7jF9ZP4mKVG
         eg+1C9Ij+dq+MqSvm7xCYeffCgaIZJKjHXSs6w3c0ZSK96tj5S14q7oEH4qLfkuNj6xO
         31jJ/4KyOvcm9qZy/jpTXb7eQbzht2O/H5OnOL1lMM2OjwDDzogOrFlvdWWFlt1HS52u
         I+6iQfy8Vw2nrWQqSA5gylfmn8jKN+KfwLobJ3WAnGorYvLMAUPmD87bvdWddvQSp3ea
         HeW+OJ4lfjTrvzwMFBSXxDVkKTqSZ+IduaxU0SnEwQIBD0qPU9BgCJOAivorXcAOpFSP
         tYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQqkzSzM19V+UjrCCuw+H+rF3weW8bpvuDda8Re3oq7hMK9ZYBurZaS8DlxgxpTCxIsbxWFteYqxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYGqLnVHS94y+PT+8gE/d0SLLBq9t5VLXwy5f6G4jwkcksuok
	S1PVA4YhTuFDu6H0uwaqP4MyCrbQaXMXCU+U0O23LlXEOQJyUrqm3u3AMqOfkS8yDTssPzHQ5b7
	4HRjWviVGxC10mNdDa+NmjT0fDoAHot2oPfD4SzVkDNHuJtaqk87lRrLNVto=
X-Gm-Gg: ASbGncvKR0ZqB7zjDTMfKbOU0xS+r6kVL/Q6FdkZFS3OaelON8FJmHgObDOOQ9PPH7E
	v08QKFLR9acElx/lG1doce1XDlqIzQgPfwg98ZCQ28iIKnIxLaU/T0IYdJ8IPVrGYS63oeHudNv
	aBvZvB8fSH8m4bGFFsqT/6NfKyTy9Kx1yTyAtR073A6oHyFZGhTVdYMK0QeiBvxRwiNx92bpbpK
	7MuO+AspXUasg0Ia3uVeMAs5EVHEypgYwg7zayrnrgsXAeYcLrd0gkHBcmY4Rwzx6dWfySLZRUU
	eEMWYOfGhb6RvuOO/1HbvKhS8MKtPwIzK92aT7rUgIFUg18nDvvXEtG4h9hh0MECVOEHpYownK8
	=
X-Received: by 2002:a05:620a:290c:b0:7c5:9a2a:aac1 with SMTP id af79cd13be357-7c956f281admr276027785a.46.1745487539298;
        Thu, 24 Apr 2025 02:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVpA1BUKeX5X8TebYkgy0ZTMhGuaFRaUuMOgDF2vXdicDx4tCttKkvklxUD+kzOdmlB27N+A==
X-Received: by 2002:a05:620a:290c:b0:7c5:9a2a:aac1 with SMTP id af79cd13be357-7c956f281admr276026285a.46.1745487539012;
        Thu, 24 Apr 2025 02:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7791sm166472e87.211.2025.04.24.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:38:58 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:38:56 +0300
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/10] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <rvjdnmhn5pb4dbhp3jxcmytr2svumafutopjwue7nueu6ymcsh@dbl7kkoipae3>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-7-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-7-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-GUID: aAtXemx5Aie9OHZMI397b2FC5Hk8-yqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX6hKnLcVE5VM4 +DYZ5YtV0OfD6jbW/mD1NpAN9UU9ku56Ld90AeANAfMXhg80+5cSpiWKcyYIj0B5I9b/6V2IPup 3WpgWlr5ylG2LG26IPYhCOLT+2DBEdEsFbo1+N5cihgg3cfu7V3T0Q6HS1Q2wPZCb6AJo/db8qJ
 vWf9SbtZlbh6dgeK/TnWMgygZR0O+uBESK4fY6NRes/Jhl/79D1Nu5mG3AfVhJKEyrHjgTTxmVZ 3JCL6YWsAFtOuGWG9bSNszHipDT1R1mW7oDKKNQts7Eb9tBIVnZ1TGWaaDMlVEd0Qxs5XznhrHP 7znls9boluogGMosk3A9IAu/NGyBVQQc7kvcDNXnxI9iBJDXsI/pj04bVQ1j5Vy6Ej4EN/ubdlM
 QpiO0Llb7FJYG7CliqE+kPkjKfYYfWdNxxfkb1MMfHtYIgnUeI7BJYNGfwMzfovIL1p4LmYh
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a06b4 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=oz0Rim8_5s926H0KrIoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aAtXemx5Aie9OHZMI397b2FC5Hk8-yqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=471 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:14PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

