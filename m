Return-Path: <linux-usb+bounces-24272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB2AC2EED
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 12:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D0B1BA5111
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158F6196C7C;
	Sat, 24 May 2025 10:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnSmAJoN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2019D88B
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748082937; cv=none; b=l+Ormo7uMPKQFD4T9sgx59gsJS+hIa3/Fcb6S7xbXiKzvcH8zVHd+kMFl9gCi8kYRN658+a2uYi+bF5Q4Pfnur+jDps/IoJzBvi4PZdcwu/BceR0AhFKVPKN3wCT0Q8y/EG4mzyTyAdRPJoy/UGhIuDp6bkwJhBBoZsKjvlzXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748082937; c=relaxed/simple;
	bh=OZhl91a07hOgsA4p0hKb14Ewboy7ZEblmiWBpURg4R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCiqhuvwM3CIBh3c/8OzA1qDA5CmN3o29eiWjr9xrmGYCzln0D+SEg4BZ96Q3t1H7+4RghBH6CuAY+swttGozyVBhDuiVidpITHemtTON9YRmRNqD6QRiEOtf9kYrsmPSYe+BUHhxBLw91CG1xfAO6iH37yAKE0S1OH7BEugstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnSmAJoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9nit8000895
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s910d4t3uAcCDBtNH1k1u5wo
	FuAjdXlwK36avK/w0QE=; b=SnSmAJoNNsjvO6NakI9HPPKSqEqdridWQV5jIiC2
	ORl5w7Q1iF8vf4CXqpri7jEMa2iXqduQxmH0c4hRVci49LPmSPhWsDQO+qME/EBj
	IoXOuyQiPOZovAGKmeobFqbmHySlpsYdqjiWheCOyMA3wCIc9gbi60rDOeJzH1Xx
	EmtoSbUOJx9gGIErhfnn6AfgnhAXUPVbbzMHjkFNjLAm1Q80BEN8QTay3kHgcV4v
	awXnnKhDVlrtkuOKkRYNJ9Ek50eaJgX7DSqbZTwScIduGHDDqYheiL4n7C9sju4Y
	IULBTLKS2ldAmkYzGnD5+nUhaWhmWOyZBXNp5upfhnGYYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5ggnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 10:35:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so120485285a.1
        for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748082934; x=1748687734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s910d4t3uAcCDBtNH1k1u5woFuAjdXlwK36avK/w0QE=;
        b=XRpiIs8DB5dznB/7M0w+Wxp+SkLmjPb08gmp5WcMs64ToqyizuAC7zDbURgNyqhlCV
         jnS2BhEkBmeI4iGm/Oej+r9cmC0GNA2I1JKjqa79h4HekXcIBSHvMZiDZUuJxnYNq0Se
         nQBNPvibqnI0ezxpryyLpLt4kuZNk8if5v7rGMIh0lagt/zZ0KNw60DYPuAV1arNiziu
         Tl6PHuVx8eRGaYr4EgJnJMB30iFertPp5cYJfcw/Wz22r0I/UN4CsFT+JwmHccUcWIsL
         6PruW2O0uUNWXiHu3IINkzvvnN23Dw4qc1ZiS9MEKMJI/MDAuHFd15Ibmkk5Whe2M7TG
         a/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQXQoU43FkmgJPCp3GzuOYkODqQdu0MpN8GQTFSPfnrON7WUnwQqdHBalyE8YwGHP9uw4LzSjyVYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CqTcBSBLVm97ekgiMzULX8bwcMsQAW/oKocyszjfggUEGJZW
	pImp2R+vxjX/iJVrrmKNxo/ducvLGCYbR1SVEPUd2w9Qu90A0UoVacaAarEUS6QciHZDubsC+e8
	Mj5ExSYLWPMgLvENBfUpJxp1OC6YGLVqtmNvzlQ1U9X2kjf4MZAtxy499nXqdj9k=
X-Gm-Gg: ASbGncuMRFSSi42aGa+1B4vTF5SHZx6IOsHRzu3LIl2JbR3dN1JgiyXf87SjphOOUBT
	uwxuC4wMKvKM1QXQ+ZKVRou1Z1p0Zzo/w0XyBelDXyt1nbroNAeMIlY0CAsuVx6fNRkOqkF7vBp
	SXFjrr2Gv+MvE7/3mk+B3ZmWOcjoQ2zKLGK2JuaVothyra6NirBDWm+0WPD8WUC0BIBZQVNeJS2
	DroMEnSopeIKWCDq/vq2SS0ynguQjZaiNiX6nfLzoQmPL4giBl8RqH7G/ngBGzqpRGVOEYw4tmk
	EK+LWIeh/SsLfdfQ8nR7uXCul6vfc5tenXk/oVfmuQY6PvZjERahcaL3dVuQeb4eBJwPbuDPjcg
	=
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7ceed863eaemr218621285a.29.1748082933591;
        Sat, 24 May 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF54RXqasfEVT4XH9aPqai1f84axB6EddNRJRvq+B+ZJJBfE+JCiW7NP+emGbbWXvQuq8YXA==
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7ceed863eaemr218617985a.29.1748082933254;
        Sat, 24 May 2025 03:35:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fbf4sm4280072e87.70.2025.05.24.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:35:31 -0700 (PDT)
Date: Sat, 24 May 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Message-ID: <5dkielul5ere6rgzog3kch2gtccejrrom5obujnfm7uop3czcz@kyppckmrlqny>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6831a0f7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=GTs9I9JaY0s41QFpxpIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5NiBTYWx0ZWRfXxo4qqYgAXJdq
 ER9VPoaeahM61oBr+mXAend8ofGtQnY09ega0yNAVrP02mXQzyK/vLwYLhboHc1hVRvOZ3d5eDu
 1qc8ETQsau141DgHUsRJtpt4V1iIvrbDeTdtdRQKSrZpC7W7euxfxXczBe6CHqFjvbwrtllL6Un
 DhuArXDDRNo/0ulXyaDnDNo2SLVqI7RGbC39pF8LE6ZexzYzjfDjtzGCGeqVwf2zw0FU8jNByKo
 Jax5rZlJhzkQy+NKrBmj098GRtbAtwj03PYGAgrVcUYUEn+jlnIYjfa1sndFxiViqWlEpfy6soT
 QNqJ2FTDCjg78NGYkv9E9+fi7cYo9t+XmYkLJvOYL9HKYUsDMjhe3fSGWZzQv0bblOKODB+0Smq
 GK//+nsHMAmR1Ty0Eye89lPqmDz1lHgSGPFKvdj3WyaUaZoaqSZm0GxrHi4/JK6Vv+Atvnzk
X-Proofpoint-GUID: KGs4JSkqGpqsEV3Yr5RcSkIH-OKh67OH
X-Proofpoint-ORIG-GUID: KGs4JSkqGpqsEV3Yr5RcSkIH-OKh67OH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=784 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240096

On Sat, May 24, 2025 at 11:19:11AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Allow particular machine accessing eg. efivars.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

