Return-Path: <linux-usb+bounces-21377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1624DA4F508
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 04:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C70E1885A39
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 03:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3552F15350B;
	Wed,  5 Mar 2025 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hhfcpH3D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D714615D5C4
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143596; cv=none; b=OsbDfzISQvytKF91JkDfuD3kmGsoQ8Sb3UaA6HQegPAviMyNyS/CrIQrg8CUj9IdLyESBhf1jJvNdci0yOHVIIAqxXWFoIR5gnxrXVKHU7vF0XfTRBcQ5u0u7KuZDYsK9CS9VZbETecee+edCE+1SrNYwqDQzZ7+bcoD9oXJ0Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143596; c=relaxed/simple;
	bh=mPfqHmUHSKSQaPUHjpb/9HaN5cORCw2qlntCpea6OSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/3mH0Dh/x/i6taqO/mD8GqnXV15nvHH7qXZ6+mqQFSfx9rMe+05u4XIasVPkb5TQq/rGcpFz8epvhR3yEuXw5+BhblKh1W4FbYdcSnjGn3taamL00qyKwDlYvFqxOc9zzlLVEayN1R15duud9uWxYjI0bwU2b9fRhJg1fkPKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hhfcpH3D; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5494cb8c2e7so5425103e87.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Mar 2025 18:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143593; x=1741748393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=;
        b=hhfcpH3DgQDHlNmLDjqVdm7pv7/hbZyVaAikr+HqQjlP2ZoLaXUf18cpGQerOi0QN9
         rore8oT+1oDsxSwkjZAaKEMyrjAUQrQYvYphBj8GR56FIo/i9hR847DWKW4K31QWh679
         n7bcbLXWNakusR1jNmx4tMDsQuJn4UIraeraHt2wJ/JGvstLOPs7ra6F9L4HwWL4Ve1c
         ncoI+AWZSxl0xYw6emH1iqCPWax4Q6iDaCYLyuMi82i+8a8Z/cgvKuj9eniLF2YygUmU
         ee21AaQnfD9H88fkOA413xZg0K66ZuADh/4YjfLt6hRHOaa9ULx1qlh0LCSSPhRKquI2
         jNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143593; x=1741748393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvKJ68rlC+sLGTBZdabg/gqDqFQctmrcG+n8a+ztWA=;
        b=jIMIbg9M8t8otTuk8N0HsngZCCLV/hv7F/V3yiADVtLx5XbWfLjeUrin/rK83BhM6j
         Uhd5M/prlcI8ZoCX9nzIO5x/Mp2YCfvDj2HtLlJ22+AnvQW16OAw1HQKZ6c9KcwVYN7Q
         s8aZjv4CDtCvq/VdDTDQ2NHkaeMHz/EfNzU+o8gG26rN7weX4QV9EAishvDi0dPF2J3q
         /xdotH1QUF75FpN68xAB20O6kkAYqRRmfjpwQiBMA+/RdCJ30C19Tr99kDkvVGds6Piz
         L/q/M4OAfTlfg3XL3bibmgKMM31zB5Lf4Q9nAydbCDoYWZ9eC7KQLaFP0zwtxS3Pu99T
         okYw==
X-Forwarded-Encrypted: i=1; AJvYcCWl56pTDtT5nkDPUXbjCdLUQZmfaNGvIP+mSrL3FIoEyEfNvxeEKXeJMBnnL1zYaWa4XpVx24Mi5uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YznlNC5oYZCcVA6rR49VRJGkBjmqIkqLlCN/gV7oiUo6DCKRrTW
	3psDTOjdDPfJ1P3DXlCQkDRZQ2ZMlWt/X+5iCBMz+XR/d8kdsPfL1m0NAfATwwU=
X-Gm-Gg: ASbGncsrJsIwwgC2nyzllwKG84oJ14YLd0jzRt+DZ+2var9+Ak2gSnZYsyYPq8ejnW2
	mGbXzpLQmwS79zvgXx9l3/IlZQnLYw/HwoMikbJGITeR5wz9I5y+jf02nDVvsb/vTs4Ly+0E/aB
	KTPg+BGQtkYBZdCwEfQSTt/FPM+vWBh96xqsNLEVJPi3GOi02X6AXjMWENVinSG0YUGUAGM4d0J
	6YW66F8lSg28ee4mpJvohV4t+ZdjEne0C+dfbbvoa2EvolsNjssLSD4Y619SYhipVPIZ/rjQMVb
	TOSgtk4BkznzS15zd4hr9NhcsKe68TRBESVIn4vT3qyRQMXbaG1At7PAbB+IXBbq6b4/0ulJ9n8
	DG9U56/9+YgHbAzbpjkXyiUcY
X-Google-Smtp-Source: AGHT+IGkLyEj88NKFgMk5Dc/qcrMMu5c5mz/edvqKr7cxRFirThc+Fkx33VXvY/6F71lJ9O4B98xLQ==
X-Received: by 2002:a05:6512:ac7:b0:549:39ca:13fc with SMTP id 2adb3069b0e04-5497d382f6bmr469921e87.49.1741143592852;
        Tue, 04 Mar 2025 18:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54962415d13sm925305e87.257.2025.03.04.18.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:59:51 -0800 (PST)
Date: Wed, 5 Mar 2025 04:59:49 +0200
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
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <xgryihmtcbvhimm4fr2pcrhjcwdp6djfrgtwj4a5kl4tukeavb@de5irgx54w5p>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-9-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:42PM -0800, Melody Olvera wrote:
> Add configs for the M31 eUSB2 PHY for SM8750 USB.

Please use git log on the defconfig to check what is usually required
from the commit messages. The defconfig is not Qcom-specific so you can
not expect somebody to know what is SM8750 or why does it require a PHY.

> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 3a3706db29822036d25a7228f8936e2ad613b208..7a7187475a11206e708a5a2c6dd51736e16932e9 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1587,6 +1587,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

