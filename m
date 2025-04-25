Return-Path: <linux-usb+bounces-23471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4926AA9D115
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 21:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACB663AEF6F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 19:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ECD21ABB7;
	Fri, 25 Apr 2025 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCHPGRR/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD321882B
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607890; cv=none; b=gCEQGlCwsWOBMbNcXm/7hSqE89EngXWWe866L5/s7jMYBejGp8HWXujexU/7YyLFp6GAKbAOQjmjC8jPKl/wVjdZBFP0xXvdVo9eANUQ6M21/rpDKGyOmdYHphZHRc0oIFXujk3guP0cm6mYS7ObiaKsgCyC5pPM89Vszvf2Xis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607890; c=relaxed/simple;
	bh=E2hjGvLcucqnKXKjuuQ3CnCnwsMBcS9NdWsLIqt6V98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGAXrZNvDsdpJS4H8GSn/17sw1MkHpD34NdkuovcNt5sn1hPS5SUMkF6CT3WDj5S/8q/PksUhvA1eNgNJ+OVhiHyKn0HZvD5fhp81Y1Aa6iz8gCEF6knT0SvNrT2LW6Vh/cDrCHZ2V4r2T1v8qTJn5GcGwu0v/VhSO4ieyTY6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCHPGRR/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJq4n012805
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UTzHeXKj2eXf87DCvDjyBajj
	xp2tDmChSLk0o/h0qAs=; b=JCHPGRR/gTZ/Wbpy1Pb6ekIKGy49k3oWOTDpjlcz
	LLTDWFmK2hB2OlQgCIClXBBqylqPKgw8odjcbQgGvqZGmghUWSrEUMTuX/DjUulm
	iBhzM9SjJSih1Uba3Gk1a1FN0VXGz0xp8C73GY/lLEMm002lY4bwBIUHSXddSX1+
	G8ILPR2jdROKKx3oYKxDBOufXnahF6qjq0Fzj0P4yNaNNXSstekcncRoRw/YDHXX
	x8JOXVsN5fP/RGo27C078sbIrUZFWbizUXm8S6yeuA5trY2uQm1WDpdP1VL+ySrO
	j4bVpg4Zm4D1hp1mOU//L3Pz07JxTPcbimlJeuoo858xWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t3qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:04:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so728895585a.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 12:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607887; x=1746212687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTzHeXKj2eXf87DCvDjyBajjxp2tDmChSLk0o/h0qAs=;
        b=XmedvR2jZhvjzqAz9wAXxHNmeBW9hmNbqNy+fkUGHzhmicLm4PwcsDVvskdlakC2j2
         Gg+F61hOh7Bhb4NGHAFFd8GL9U3g73L+T4aLhsgF6djxWQSlBAxa0mB20H0CCWc3Y0ws
         H3oWp3WsMlMoP8R3ggq4cV0V1JUc5nGpowHhv12569UjKpHVsHDDQi5vwpF9EHbgXQo6
         3rTkcAzQK0NfsG5UMnAJC6YkH78CZlPRgvdfjJ1zPac4Sxf7sRCBluBcKgr4FE6FDuXK
         JV1wzQcYjMF9n8eiD8rYJCEs5v0mCCrpeRw15McLGAclITPODxkdwlQr1LrKlR38NKlh
         Xkxg==
X-Forwarded-Encrypted: i=1; AJvYcCUlkB+S6AqPmpySKedPjtfcA7pJYSUb48KiCp6Aq1urE7QCmenzxiNSe6EbFcalrvqfwNOrg0DH4s0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuF6XI/jk/qO/1xaBIgZqEPKswRIyd+ZAyi9wysKIlCERF4l8Y
	71pcvCARAm49xTQrzW5qcN/KgKoMZKSTrot0h/lBdQukGFOMYpFfpeA+NQkp3emL+v4ApTW+CQK
	0HH4Hxz8bN9C1lWIl1bpsYSceaPEYW787kw9MH74Y6NC/pfKFsxVWTs2/+MI=
X-Gm-Gg: ASbGnctMABBWnvZIslEAbikOpHTewm0hAJPaX9T2CHF3XfQaDMXtOW+FwIMWJ2X0d8K
	LhvDw1G5U8yD2T8+n/HEw7Cxqq2ZiCaCkzJq1AykvP+yG2aZVmYSgfRebjL0DaHkvBwreBmxuaR
	r9GY8TOVaVUpaamhoamOt9oVyL9olv6H5oXGEmEOGwgvq8AjFsfY4PYcS8RAhhXZAbK4IR9E3xD
	iXW6zp3jjA0U15IQ5KydJFiewE+VZ7WOssAuSAWx9MhljuKjG8VtP+SdpJw3VCZccvZCSEmlgJX
	pgWH0+/u/HFnrxGZ+2tQzRQfszVNqy8knZWme3nHC3/DXuPmZe12Emphx7gmKh2ifPQsBBpKH7Y
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr114287785a.58.1745607886779;
        Fri, 25 Apr 2025 12:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJuNtckHYkPs0zr/QJ4//NPzQGJTdxk1+Bm0d3d8S6mcxCa4hGs/NU9dIoIE3YcXQ7Drt/qQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr114280585a.58.1745607886221;
        Fri, 25 Apr 2025 12:04:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7cdesm697699e87.210.2025.04.25.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:04:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:04:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
Message-ID: <gbys5x5qefrep3igd6wwcxqycmvjzsceqt2d5p64znbtjj4iyd@up4fq2cib3tu>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
X-Proofpoint-GUID: ZXat_NgSWcJwIti7VyVww16q3R5CkTDB
X-Proofpoint-ORIG-GUID: ZXat_NgSWcJwIti7VyVww16q3R5CkTDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX3THy0kZEF4/O Et1lyQ8G3TotsD2aZPlZrbkEpm5yUN6H714ozRJIHdE6m1DErrQiDx67FGjH1exLK04c1PGW9kO ebIyGAcyvyiyxAXSa2JiNNrTgvEnv/5WpSXD5SLtddy0V1na2mequxeGhON+YbkkULT2XA/efO4
 ahD1YimneKtuNmS1r+LtZymA5S5Ps0pXgI3T0o/pifNa2yoAHes2brlXNaYhcsyxb8tF1yIjeAe EluWmQlnHfdKYRAuY+Dke4v+RrL4OHpyfqpH2R5XE7QacBQL7bttkizACHR/WC+g5Bc7Cs8l8l2 rboz1REXaXLy8/363w6oc0G9zrLtwQ5khIAB15+LzheGuCrdOaFSktNvjSTsg7yerzGox9qIYjB
 an+xI7Sq1FNYOIuRBtbWRffmzr+g5ATE4REmXovjE83aNf/8I7B9RnlKITGPayqeML6vxGg3
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bdcd0 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=-qJDoccVa5BqKm_QHDoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=864 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:56PM +0200, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no interrupts should
> appear on the xhci-hcd interrupts during playback, instead the ADSP will
> be handling the playback.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi              |  3 ++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 37 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

