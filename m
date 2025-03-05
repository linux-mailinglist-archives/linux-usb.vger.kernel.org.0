Return-Path: <linux-usb+bounces-21376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE8A4F501
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 03:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6AEA16CBD2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 02:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4084715A843;
	Wed,  5 Mar 2025 02:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIJppOXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC073A95C
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 02:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143516; cv=none; b=bB3oEbp3j2oSSWJ0IRGvGWm708fnmXgMjUwnT7ssoKhcxGbM1fJWm/fAEUYEm9xWVBEkHiFNpNCPIZpUsvLWWBnm0f5O39fRzgkSjU6ucZ2NDfbPvbUi13jcDYk+XY2uFN2n5XN4ZktW/mHVZt6pm3dS8i4hzFAyV8MJhnz2aCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143516; c=relaxed/simple;
	bh=N+nG/bO8D2vXra3mywxjpAtZicuK8zOlM9XvlDtvrXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9oHMlqVURrMP4ZVVrkYg1ykynhMlfAv4qFhUEIg1v+Zoq9/gnHw07+9/HMgCtb3erCe12LXJKtTNUiYTxbY6B3nh+5RlpTzhmGIBXvosPjo84wPS4fPomGUitQyCRHnUaUfbEDBJDgU1OBAxbDycNuGwYZlfb3iMKbpXWPprtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MIJppOXQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so245368e87.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Mar 2025 18:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143513; x=1741748313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=;
        b=MIJppOXQYQrWaUjhTMcdq4Jn1ZXME97jwIkOSN46m1VigYBgs4tWXdzmJTE6/1N2Y9
         xTFUHJnTWGPfwteg+WByQZNGgRAsHzQNvs6Mspicx8OR9S2FQ4H0JvZ2BFXpF+YAzldA
         s1sLTMXTAIvN3COu0MndytJc02mDOafBkx7YGTGiwKaYbVvTzOlkZxCjsrmnSApCIDAh
         sBxiSkY/EJsCU1Y+S1HLAPHUsHbHwKF5pilUedFQBY/y7O7cs+u57RCbcnGc53M1VDNL
         3qGgNp4Te79y0a72WFtAtJwU1JwRhSPidmjSvcDA4cxRNkciCDFJmnpBUMWGtfIwPhnM
         xdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143513; x=1741748313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=;
        b=vYLR/WU+qvfxGryFTG0HNpbVLmVXSR4hYUGu35xxYUKq+wtZRk6kwP1ceZ/AseXMZj
         e0COgblIuTfGrDWipK4j45gmkDsApfM6QC2qGjULzArk28p+WKpY7K+HcwADtSbFdVwu
         5zxidDYdf53B2dSHjJcL97TyHESYBFr847G6/Set9LaNo3PZ/vDWNeDAAD5vGzzVksnE
         3HIWO3AMxs3S4T2K5FufBbdiiNUbjtMTbYtmMePmiCmFESTAxoZduq+a+KpKa23JmXtQ
         nVLPjVw0NS9Q9xZXmkyHSDviBPbJR0P6hLAXG4c+nHn0+xNlwTwmJD/xXWW619mH2tcp
         xV0g==
X-Forwarded-Encrypted: i=1; AJvYcCXRrEDB4hcRvbL8L4tJ9uEgH25EakSEIqnFcySJsP8UBmel+/n+RMBgpNDy7mbt2H2/IEEzhxM6rug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgYmj+IOXaYpwG11MEw7UVGCqUJZ8/PEZZ70cn+Dg7G692gtp
	oHhHFNabJCw+ZB5ceColgWhrXf6tao6F11jO/SM75t+8LGCCE23lCq2vViQ3H98=
X-Gm-Gg: ASbGncse4u4a4O42WqdbgA4ywyvJgei0jMjX1d9MdQn3MP0iMYED7dU52Qzi/CVVd6W
	NXgrGcUr8GOqXVN9bbYPCMQGkGmb9V5QM2FMV0cXEGN+OL4wz9BbHbIUgjn3WlR+XC61gLp/+Xl
	6cSdLDlv5TuWAIHEehaLfA3OZDB9NHimSkDCnehni8HbUwD5A6HhbWT5sCGBiWDtJGtr6fHzjts
	gFAOIHXNorl440YKDfq4nCVpN23hNn5pb4uJM62eRSvjRkD5T1Jg0tgm66FRHSNmAJ/yIU1sk/O
	R0Ex738opqXI6ElLGV8ov3WZsZZa2WKnDpIzyofVgjh+rBK2ccepXlDpe5tWc2HGGHJeGLFBIHO
	ujZ7+39iY3CApGTbn20B3megH
X-Google-Smtp-Source: AGHT+IHEi7gu0pTeyCm6UNSNFzowmosNeq+ixhhTaaSaHiD2yIEwbXWQsqiTh1JFRh+rHJ1Tvh3IUw==
X-Received: by 2002:a05:6512:1156:b0:545:2544:6ae2 with SMTP id 2adb3069b0e04-5497d33624dmr555644e87.16.1741143512917;
        Tue, 04 Mar 2025 18:58:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549579424e4sm1320182e87.118.2025.03.04.18.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:58:31 -0800 (PST)
Date: Wed, 5 Mar 2025 04:58:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP and QRD platforms
Message-ID: <6msx5eontkkunldl45npigj756b5sst7xjhmomlnummbsmncif@ca3hkdvtdo44>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:41PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants.  The current definition
> will start the USB controller in peripheral mode by default until
> dependencies are added, such as USB role detection.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++

Nit: two separate commits please.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  2 files changed, 48 insertions(+)
> 

-- 
With best wishes
Dmitry

