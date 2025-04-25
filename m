Return-Path: <linux-usb+bounces-23469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB1A9D108
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 21:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86F6E7B3E02
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 19:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528A8219A94;
	Fri, 25 Apr 2025 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0MPwPKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60A1E5B7B
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607773; cv=none; b=Qt2vMnFYECGrZMjqCVL84NpKi54n3/OCSD7j14brickZE/oS8HvR3H/vqsB8993eGi8mFYbTKhOoAALYMKc4IPKYDg6VeNr8mKApoNoAbF5r+2QnXnJGSYtNI/MZQ/Q2/uApA/s7eXKtzDams1snkqUzuAIrJ7W02UWliJogi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607773; c=relaxed/simple;
	bh=pYCkWUjNE3NuFqcQEgnTKGicdGzX1if1k7WgCb8+6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qta/f5q9npi/rzKyn98ZyZzZZmsKAqz3dkXEcaxU/X24PSRl+KWW6lblS2HPH2mC5Gosm4oTKJV/+/BMIKnle1FpsvOWpol3v5G0gugXjVdkfk6YXDqg9IUAQ9v7NV2y3A3ocKSq3gp/3udLnn3nMxRlxi7LKEbZ+Vh6ydhzNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0MPwPKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwZV011513
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkUUiT3ss6IH9EIAP3uPnI28
	FMp0pQeC3xvyjBzjGrE=; b=A0MPwPKfawqBaD6ROdG6oY3SGx5ZePkWdkE3TOJ+
	6va1AZ8QH/ZtqM+hQXghYzF4Z2Q7sPaxEehgHwvpulGN7AIwHQxsWLnEoXxB+MP6
	FZ4Ia3W9hKe61mUxgbWFGA0Cr5+3QPlZcZmuufEMf0VOE0Du5iPpA95QKmBDJxLG
	w9RYOeck4ixQuldhuL7Q0oxM/giaE423/PyFxK64LL7axYrSZbC9H3QG1NzBtcnF
	pd0yNRAcPMNjvLqf2xCMDjkzelIzveOqxqcuy8sHet3xIyUvO9tADWbOSf0ZI0hu
	XefuWasLyULaY8k5IPIWA1SdXqbHe18ajF9rdRjOfvcjcA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3sys3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so29071475ab.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Apr 2025 12:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607769; x=1746212569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkUUiT3ss6IH9EIAP3uPnI28FMp0pQeC3xvyjBzjGrE=;
        b=en2PGV/3+iip2XNevPc0XtygfW2dmHjr4epExv0EPYksMw438+jdxFcw5I/MWBoDz/
         oNgkt4wN38sy60bpjIlKZmmZ/XGmkgIcSf9r9nK8JOE9S1EguFKN+yRI0CtJDnTlrfYu
         iqJkdYtC14l34Bzxg1hUv9PTPXfvbLE0d+QLhOYqzm8Fi/7o3eZXzqhzDDhzsVpU8GrT
         kFuRHVEv/qx/xcYZMA6lcwwrrCgSeEQQ7lC5b8fE6UxS1/1wRMGTP0mJXu03zT1VHt/L
         ovKCFRJYsrmnA1pU7n7St1HwgwW8MfFg+fRTJuQZYK0bRpLV2h/UDRawZzUSzex5runD
         dkrw==
X-Forwarded-Encrypted: i=1; AJvYcCWi8VqU+KQun81E/IFQR5jfKHE2R9R3yBQG1vCtopQDKYchkX/QjOythRV9GwfGoggz4Kp7aPrpjCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+yk/zUCgd174dvHaJn7XFSPZxq677FQCXiTLJfsaUGUwbV+N/
	3nSVTHUiuxIXgP7PJoLfh7MOzedbIgmacQjbf6zIjziKdFf3ykSI5vJyWvDE1FaWzuYy3dYlbIH
	2dgyJGiJ7Ne6lKpVDxr6wNMm0mfK1jTqLwq7gK9OLWAZyItW3HskhPDlOz4U=
X-Gm-Gg: ASbGnctPiaSJ+pDCQGx6zIL6ANNdMCn3E134pgbZo5IIPU5e8lXadM1L/HP/iWv2QRu
	dIEob4/uZRhAkmydpXz7yqz6nGv4TJ767l1QzrrXpPsiA3tnf250uD8+hki4NHiDpZG8npcRv9p
	j9UWZ07thPm7smmkcluCErFhlCaJWDvN8iDKu5ZhxrDWUvxIWgPBSzmPh+NscRMhh4G+vU3LV5b
	9yBtEjbndY8wXgVCzXbH7Q8rD8/jZR+LTX54Vys3xfjK+edLQWl86lTfrb2VhurorXxrMqyyKvB
	GlORjA9/DEGl//RgB3hxwaEnK8DpGTFJlToaF7Yo916MwgVhSTjk92r0jzjkgOa6fnXsnM9R2xw
	=
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39269185ab.12.1745607769316;
        Fri, 25 Apr 2025 12:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhuXvdR/qmg7RMT82loQhMhHkY1RAz50Xasf3Q8QcQs/adSctEEm2ILPuO8VBKeb6d+RFAAw==
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39268695ab.12.1745607768937;
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm8497861fa.114.2025.04.25.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:02:46 +0300
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
Subject: Re: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Message-ID: <rhfklvynn27x2lwyygk5rpjwvx7p6bhbkmc5jehuy54ilhnzbz@wuhcndngavbp>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
X-Proofpoint-ORIG-GUID: V7gPYulkj7erQ2Zd-KLaPagjhY38-sYq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX+X7f59ruzLwf cF+oIWhfBkvlOBISTlOkCyl/+v2wM+jfyGOcTq6z3YhLEW1gEM0LhtHD31bHph8NBTTSTHmOxdQ Qd36g9ZleHLd6zUSIJybjyVwy5XtXkItJsvo8D5C1xIDFdgPeZiD76fpRnHw/EWO/K81mL2/AEC
 +GCVh7HNNqWdCV60B5i1JfBgwJknEMDyRQ3ebTDfHhHtVD5OH7OaoAvjYXIo1lbYlSP80CAFJKH w8Ln7uTVzyGt2/iJiM/JhK9oOzR0/w6uPMy727evuzYVIZA8Erd0aVJmepXrvUWSUzjfuh6L0et yLLIVA+9aWuXKK+V0yjzGOHk49Ys/7qIqNW7wb7E1yp7jkfv0D5aEjEE0chDgqbe3B63JZQAliG
 Wf9JNjv5s7vnSTuhyeUF3o9T75YS0rZBScEKiZnqXQ4voHbZLCWLys0AfHE3cw1IhlokDaXA
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bdc5a cx=c_pps a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GtLuwp1ogO1-ZJmtaBoA:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: V7gPYulkj7erQ2Zd-KLaPagjhY38-sYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=809 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:54PM +0200, Luca Weiss wrote:
> Add a compatible for the SM7225-based Fairphone 4 which can use this
> machine driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

