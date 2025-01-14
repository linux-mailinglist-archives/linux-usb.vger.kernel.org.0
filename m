Return-Path: <linux-usb+bounces-19324-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A16E5A103BE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 11:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D26C81889907
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE851C3BFC;
	Tue, 14 Jan 2025 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i3dWHoVv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429821ADC60
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849548; cv=none; b=I2ZQVu+5s5T7iSCtzme6TO57uXdHVKZ2vI1bk9mWq5Zw0ZCFLKWE4RNH2cG/vQT/xP2GzYuFYgJ6v1RPJaoXy5WqPXy6sQDnGVPjG1k969kQHRZNnivh9STzD3XvMeD8kUBgb2IifozFDcTE0c3//cesz7XriKviXaAxoKX6Dng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849548; c=relaxed/simple;
	bh=tMig/yT4p4lBmM/9IHHaHq3sOjkzmuVCPMQbW0c1APA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eh1/4v0sCeJSwoYzVYKJkeXCO46m39E4FDPmHijPZN6LHtGgY9l9MoGFO34H8+1a9W0evL11wmlAmRFjglkD7RgUjt3MHWjFH81O5IuneyQa4VhXzwNkgm7zygY8uudP5c3i8asVb6/s6LKtVJIGBo0IpxOwEBwc3+rhRPxXCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i3dWHoVv; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30616d71bb0so22951911fa.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 02:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736849545; x=1737454345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=;
        b=i3dWHoVvDG3grs/kTS3HFcqBoqPtT7cXT9CG/VZvcTajfueLyz2pDZ/bkK3U0vYMMA
         xEQWZRe69l4W6IcHborajE2yde/ymZ4KJiH6aDN/D6noIH12q3nJ7+lyWYKtyuzW3Wwv
         ImlgxoB3QcETinU28ux3Ajy8BFem8fXUYO7w5Lfx+IQ5/wee0wBq2lEGAZa5pT6KrVXQ
         izMh74nxUfMyCr4/G2vRjEuytHiEpfld36EynK5JkVr2+7KG15sI9AYijP/Pxar6wdJZ
         mSKie+YxI1O2n+o23Ha5vwMiC+Eu53eRcdQjbR5IUzaVlgvsaghmPAPXLoBRQS/6dahy
         6/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849545; x=1737454345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0Qrzgg2ua23heO+J/1apVMe+JOEnRWPI3Yz+eSCuMc=;
        b=GYB540zmUhh/5EVALW3NnnZxLrF4OAM++3nzl469XAPLxQFru+Z/UJkTWdYUOqIKf3
         nepRWHCmGd7+bZH7IzDmC/9VDabVhniH8BkTPiTPYdCkQS8xlpp5UOTt159du2VzIKWr
         7mOm3DO30lpc1AfebgmH31M6gyUSpc8YE1pOlzLRhet7ALP6U38VKlwuPvnzL0+bXtJT
         e7KPyWYk01+Qt3gymTsjby7eNc55zt6PtpFOQqx8CCV0HztP/YkyCvMLunH6n5aLhZjz
         B3LnYoES+J5y7Zvtz1zEo8zAfnQYpE0uTU4Sy0H9i5cpdyJs/H0IB7YrMpg5ZTosHpx6
         ndTA==
X-Forwarded-Encrypted: i=1; AJvYcCWuS0dE0CCHFz66hspI8DGDigAfsMSzwLATShPubTO0REU1qrYpOWE+KQs8b2cgwN7HIgHHehwSvyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyclc67eNpYi18dQaGkDBvSYNglUYQ/H5qkaei5StuK0Ox2s1iN
	NVDairC0BjI9TXdias1/RA2b4LRYP3nVIoexTJqcIMiuVzxhsr5b6uYAqos4aHA=
X-Gm-Gg: ASbGncuvdn7zUEK920Nlgh1K5lcXyp9EJ92iJErOjgy5cyLAOLqmsxctM4WuYuezgdJ
	oXGO0mUjwuqPGkUrR3c6/3RStVY+3rXtiCHgWZHu3tAhl0sJW1+Y1p/CZGmQV1uXxQdi3ZECx/p
	8b5fbSiMaqg4kXKL6yO50ZuITfKyZe8UoFqIikE+zt+n9woh4yyk85cSEjxmaDDzGPWFHnUSug5
	VGHDh892zXovL3KWrtRJNUpZ+kgOSGaHls3Yqg8WdxKCKLfeUCjlr8qfOeqcL2wSSlFQRw+DXpl
	W5IcXDXVmshrYoraZ+jUdqidVlFTAOYlQK8M
X-Google-Smtp-Source: AGHT+IGvwMKyxTPc6XYDYWpAagsTLJobLBRBIaI1VJFHrDhlbJEBvgyteqb/2DjPirIxW8WefT3Djg==
X-Received: by 2002:a05:6512:31c9:b0:542:7217:361a with SMTP id 2adb3069b0e04-542845af299mr7698904e87.10.1736849545347;
        Tue, 14 Jan 2025 02:12:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49f0bsm1625315e87.36.2025.01.14.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:12:24 -0800 (PST)
Date: Tue, 14 Jan 2025 12:12:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Message-ID: <a42wtus7y72mt5adklbwg2hjbuayxkeucs7t4xuzmxyag2mx7b@6wlsomzj4gha>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:08PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
> binding definition for the PHY driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>

This a typical comment, please actually update your internal
documentation: don't use GCC's and other clock controller's bindings in
examples for other blocks.

> +
> +    usb_1_hsphy: phy@88e3000 {
> +        compatible = "qcom,sm8750-m31-eusb2-phy";
> +        reg = <0x88e3000 0x29c>;
> +
> +        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +        clock-names = "ref";
> +
> +        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +        #phy-cells = <0>;
> +
> +        vdd-supply = <&vreg_l2d_0p88>;
> +        vdda12-supply = <&vreg_l3g_1p2>;
> +
> +    };
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

