Return-Path: <linux-usb+bounces-24283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC1AC301B
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 17:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 839637B26A3
	for <lists+linux-usb@lfdr.de>; Sat, 24 May 2025 15:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9831E5B8A;
	Sat, 24 May 2025 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bF9sn1Ne"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519B1C3C18
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748100113; cv=none; b=TkdUXIU904fVDoqnOddrl2GWoTVGoIGmxIAj327KJFQxLrCVf0OzEYVvwm4CfYHgAOe/KXcksa8+bIRHabfdkTqaVaN7VpJrBI+bLFcoquLvEZfBujC+OkrEzVaiJlVwGxyd9uUiueYW893ei/ze+DDwORt10vc+DyJigOghNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748100113; c=relaxed/simple;
	bh=YaVkfJwtgFdrn5gzuUVtEz4pIzRtElAQPRTQP561ETI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW5nOGu8OvFfRgWPgOClxp9oV+ucOkmoPEeWaclNkGzAzSagb6Rva6lAh7NU8hwUQMBKX4NDBh2GfM2SNdy4Zctw7GH775LFr7vwhS/ouUrsvHjJQZDfB6YM4RiAa2HKy/SUXIlIHqSOvM5mV2B9xoopFnq609GpGAL8m0Umb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bF9sn1Ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O0Lnhh009684
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 15:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nMycBBOQkD6yGLEg4dkgiJz5
	jZsjA/1T0M1HIP25/Us=; b=bF9sn1Ne8KEfOqmWubGcKSmj9OQgwJKoqu/LQbDB
	dRwW+3nnWo/zijqRaiwh69xBREtO/+TNIv4goKwhSU2jAv8XcSOqonCGnHaVsIVJ
	Q+DrfaM+tM56RFQQu10KYgtrqLpUneVOSu6rmv8fVABIqI3IDLxOKnjIJj3u4ypb
	jvjqVXAob54c/GRhV3vAvxWADr+WAhHVu6hHRetguoBsDD9VMtWKyIZ/wxHk28VR
	dBkOsiX+3OdQvplCm386PXL7m6wrTvchTs1kZqV1RxbDP0TAZEpzX5pnZsNQVEwM
	I0DMM5sNfNUMdJfSkM2hP7MfpMg1KimLP1lRAfakQE2yiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq0yhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 15:21:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so17258236d6.3
        for <linux-usb@vger.kernel.org>; Sat, 24 May 2025 08:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748100109; x=1748704909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMycBBOQkD6yGLEg4dkgiJz5jZsjA/1T0M1HIP25/Us=;
        b=wXAF8ssn8SAj7+5SPPhqhNwNvAsHK4cfRH65iyJUvHikFXOSnt/pIcGfp1qPC/NZHQ
         NnKY2xL/2gZzycVVQdB6jfweY/EtlMIxbV5L81rzidQ3a4mR/vqNQe3UVq3jgKoo8H/e
         VzrI+KkL8ikI6wM/xLaMR1m25D2GYXAWUS3RHG2mWI9iBi/F74+cdZg9fGds9hVn9oIN
         DhUFK9vz7bRrVVDWiUmVW4q070b0XrXsN+k9qkOhKQnmu0qDpSqk1ltt/FFGJH1wtMDT
         2j5ceQaIecLfIFoJYbpGX/Ybg7YmoMxzU0ddKaKF4R4EUU4u0YxYwVLaS9/ehmf6B9G8
         BjBg==
X-Forwarded-Encrypted: i=1; AJvYcCWf3PjeaOXOdBpZD1BXwKu2YerkhqY0U2/Q1mASjvcpwawp47jwSy/+JWxLh5wkkAMGDhBaDIUKi9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZUINmdgoSLajnXV2JAVk7oEfjnwn1KxCyMl59sr+TiKrNmM1
	86HTOojVmHvLV865OnqMJ3LXK+R3B98MBb+TmvuVx7tFduA+XH/ND4GVJknCdwhs9bW4JZ1cd9U
	OsVdALo47IZ5nBbUGnxw+/AupzT+FO2b/Iltmy+tBnNEzk4IwSlAZKgRfzSHdndY=
X-Gm-Gg: ASbGncul7EC40EBCzZx43MlOOfXgHa8vwXZefRpz253dQq7nYUYayl1/Az0XJd+pIzI
	IB4f15aDZoM3x2qeu4ij8ZNLncwsh3TXHbTspTpGLPinnFzgaG39FTa9QnNBn9fAEY5M194xSKr
	QJ3IR43FePjQfylSfSEmmv33fT+scQJ5Qfuo7eXkyiOpmZrWPnLTlt705yWi8kjLWV6GyR3GjZO
	Eq3ZPLO8ws7AL3zK7j2oyPP1cZgFH+bPQUH4+aQHpKdAibWpw5TUR78W1OyIcVeaazslDTqLER7
	QEwPC3MM3qSHnhSlwHe1Q37qvTCuJSmFsHzjlWQUx5oIB2p1YsjbGcnT7vOf9fExLNFMuqMR27I
	=
X-Received: by 2002:a0c:f10f:0:b0:6fa:a0ac:8d5b with SMTP id 6a1803df08f44-6faa0ac906dmr20504006d6.3.1748100109259;
        Sat, 24 May 2025 08:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Pn2GzOxsJUXYoGR0GlXygQmdCVrUA/w4oZdQ/mWB8Ob79GsyWPh6gfazt5HkB8buuEfwjA==
X-Received: by 2002:a0c:f10f:0:b0:6fa:a0ac:8d5b with SMTP id 6a1803df08f44-6faa0ac906dmr20503726d6.3.1748100108878;
        Sat, 24 May 2025 08:21:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702f462sm4369553e87.209.2025.05.24.08.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:21:47 -0700 (PDT)
Date: Sat, 24 May 2025 18:21:45 +0300
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
Subject: Re: [PATCH v4 3/5] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Message-ID: <mhgbarjaql2h3tknjem2sia6zpkkbswcriw4k7shjcz3sh4ylr@tsgig42plqob>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
X-Proofpoint-GUID: wVd4upqGr1my2j1pov8NLhEJaLeMjADB
X-Proofpoint-ORIG-GUID: wVd4upqGr1my2j1pov8NLhEJaLeMjADB
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6831e40e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=z0tmLejc3Eo1JMKNyZQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDEzOSBTYWx0ZWRfX2/uHwlaaviku
 8Jwa1UTf9pbUBv61Jc1Hiv+9Fy7XhHiO4Dw0vO4epPUz07ZJxQmtSJPI47NOm54Nv884Y0n8P8y
 NBPGJDYDGWwNEzShyZ/U6dBrGtl7oTAmxKSvb+s7HyV2wn9Me0Q71Qq7XpL90EKhI8NnJBmqPpN
 GFSeOaYrI9mOaHUwQxf49px49uGhaob3jfF/2ITmfbkaizuCXg+WtvW4V9IHEqRqK13DFbL4wpr
 hbYLuLVr3Oe9iI+QdhY9o0w+I7Rr8XcwDHg96nPxM/qlvlCqwV2MXI3pSu4qIcgA2CWHJVGeW+I
 RBGbpz278+UFURC9hkwqGvgUXhTcFDOKjIXVs1P+w4J2sznwAbUiEShB5YM4XVdFMm5EvlHYXgW
 hb68iFRh24euSm63UdaVuWuTI7Dzj2nkli80uHpyHHjmYaAwLpA9lFlqDOnwwScSxI0TpG9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240139

On Sat, May 24, 2025 at 01:48:38PM +0200, Jens Glathe via B4 Relay wrote:
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
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 1048e3912068ced166c76838cf7306d86e192fe4..17b1f345b6b65bf25e68e77b0a345936825e1d04 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -569,6 +569,7 @@ static struct platform_driver onboard_dev_driver = {
>  #define VENDOR_ID_TI		0x0451
>  #define VENDOR_ID_VIA		0x2109
>  #define VENDOR_ID_XMOS		0x20B1
> +#define VENDOR_ID_BISON		0x5986

The list seems sorted alphabetically. Please follow the lead.

>  
>  /*
>   * Returns the onboard_dev platform device that is associated with the USB
> @@ -677,6 +678,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
> +	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */

This one too.

>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index e017b8e22f936be66da73789abb4f620e6af4d6a..816d9ce71eaddc7ab0cb4517558dd44a591d6c28 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -115,6 +115,13 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
>  	.is_hub = false,
>  };
>  
> +static const struct onboard_dev_pdata bison_intcamera_data = {
> +	.reset_us = 1000,
> +	.num_supplies = 1,
> +	.supply_names = { "vdd" },
> +	.is_hub = false,
> +};
> +
>  static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
>  	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
> @@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
> +	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },

And these two.

>  	{}
>  };
>  
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry

