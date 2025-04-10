Return-Path: <linux-usb+bounces-22870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074AA8372E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 05:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 242BF465B8E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 03:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780061F09A3;
	Thu, 10 Apr 2025 03:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I5p11Y35"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C651EF0AA
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255381; cv=none; b=SzPhvrEsr3Anx1Oqh9QYC8TkBig/IHQPKtEofeapyTcBTbUzVhTE7Vp1gNE5RSE9wEYEMneA4dtT3y/jlKfXsrsJZ2ti14hxPm7VU1MMgrfIWcSsZTnY4HP0uVthBefYtBi4H+1dN7+dBQM3aRpq/zFzCz6LzNA/cQEnheQfQck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255381; c=relaxed/simple;
	bh=qPeh0Ja4yEU1rTr9eUKX8gtlUq67HRNq5YbB4fNpeqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KaOMlB83d63b78oQKi/441Z5O8WlTnDwjcC/s5VR6/Bk1+etDAIAw87/ZedbwKfyNwsJaaZBtYt8Yf+6oFIXTSA8fNrguE67TQI/IwcHSzmBOeJm9vUeKRXjKt5hvLEXxfv1StDABfuBxRZP8ZhSSeQmukba9vSXHwND9jR3xa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I5p11Y35; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HE1CX005921
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 03:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pfANK38r2/Y0veNUeTUAv/nE
	G8v1dA3z5o6Mox8qnqo=; b=I5p11Y35E3uk4R+AslEb/sZe87E9qPzIOb9grMUy
	Q9vDG4rbEC6+ZZGjaVVMvUg5QdTvkpP4qsX9g9GMymYOJ5AO45WLI50Sgqj+it0G
	kr/imzKJHfVmBDD/9qSyTjASDo4UyanuKPW9QhmzKO6XZLvhUuWjm6lOiwD+Ecid
	YwdWQYEK6deJBbafAp2j1gotiX+NUdNYbS68TyLByWCLS6bE/vtACHIRPuNaJqCX
	ikEC9NU9/N2+i3kfMxvZqD8MW3nMeFwNrGCRhWUVUKwmoPVe/EklmrToEI695tvJ
	OMXLjeYxeZuVyPGXRqggt0aWzyT0wpJC69b7+5Jaj2RIPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb5jb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 03:22:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so83262885a.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 20:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255377; x=1744860177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfANK38r2/Y0veNUeTUAv/nEG8v1dA3z5o6Mox8qnqo=;
        b=e2a8oN/fTgfEFs9+U7+OP+4v6aqLskgwRRzhnipry14mWXFCcI7IAqAG+r4I0BLaQg
         1BfekfYTVseeX0nGRmkRcZy9flBN3KqJkxab7JLo+kiGIk5aMnaoMv+lzqzhKbe1xb+R
         d3u6yyTcmDt7CXd1JhCDZdOFR2kTpXNcqxfQXEOlluWmed7YwIzLFBx7f8Ggr41KC2dE
         VzxGI8eqBAGyA7heDHdXzanNiUPblrVk0LpcBPZJhl1laSP7WXdX2vVMGuoYAarwr3Ks
         L0DktMIbpx7MSInzMFJI8RcX2LpLWYgOVD9hGhPCp0PjWk4tCV27fDpv+T3RT8+RuOjF
         JYYg==
X-Forwarded-Encrypted: i=1; AJvYcCVGydG7Ljl53iaawseYUb6bgU+klLrTa7Zcy8UXvPF2Rduu7suOgIr3v824RpCaFlUVw65zG60brAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy35oYbgN4cE5FxoyfmGpK6IKnPAZdy6rfB9nlMDdecN10UDdzt
	b9BALlGbCyZcErCBhc3CjHelKb7xIIoc6TRf/ERq5KjPatsmSzPYzAaJK4S9s8Aux1WMBHyFuWP
	ovudZdZo1eIJ66m+RpIs9Vq/LvNyyH5TwcjZSL4YyPh4xuImMX/z/RWf7rhU=
X-Gm-Gg: ASbGnctsFD5sxcZYDVjTGwF53p4a3MNU7/gXFSJsf+wXreHKGDidwsiuikXxiihV9yU
	j7eLClHmAS1HdF+f7dqdlKk4YxqjzNwed8eHlpPQMRW97FU1Oczy6gFwmsYAJmrNLRSoha/iTJ4
	Ai0HpdLi7AKI1cTlm+monzJG9WUNOP/tag6D0Pg/jacIPHLsjPGS02jvJOoyPk1BWxlpHea0to/
	EDU6gjf0T7Vr9ozeT0snvrSjCT5gkDz4CEgjKcR41Hhxm0drtn1svc+Ijk+JizhAuRAO+JDy9NJ
	/TK6eDJZAIecG0R9Uf3QXIS7/Vsa+qye/AH6RK8MphC3apaQmLUYd/IZQrRF8eDflHmGLJ7O43A
	=
X-Received: by 2002:a05:620a:4011:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7a81b6b63mr131507885a.37.1744255377675;
        Wed, 09 Apr 2025 20:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvdPKTSB3sqkRdmy4+rKmOaEHDNl9nfoJyk2DFMvWHYvIaySZUI2uhQyy+e3BTNZL0wgeEFg==
X-Received: by 2002:a05:620a:4011:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c7a81b6b63mr131496485a.37.1744255375618;
        Wed, 09 Apr 2025 20:22:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ebbsm3476721fa.73.2025.04.09.20.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:22:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:22:53 +0300
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
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <fvbfsvx4ibixnvdh7ujt3kaybjqj3fdla4k5sx6lguegepxipg@ci5nmq36irpr>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-GUID: msUtbMb18lwHik25xhrbUhztQplHzyb9
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f73992 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RKJlQbLL0f_VtHaaO3gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: msUtbMb18lwHik25xhrbUhztQplHzyb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=459 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023

On Wed, Apr 09, 2025 at 10:48:17AM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 325 ++++++++++++++++++++++++++++++
>  3 files changed, 336 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

