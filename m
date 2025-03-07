Return-Path: <linux-usb+bounces-21483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5CAA5604F
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 06:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30AA93B412C
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 05:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1885219B3CB;
	Fri,  7 Mar 2025 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWxqQWM6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069771917F9
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326546; cv=none; b=p7qltqBEyXi3fcKe5K/1Eby+a+W5fQudgNBA4/4SyFB39ULccgGJqfEH+XXkfWOr4gv/oaGjvEIDgGPH8zAI0K3gtr3IkeLfu01Goep3exxrKDoCAAZZM5h4coJQhNl6zT5y+Dgu8c1tBvZB2j4Qia6vrZUHeqePm/cfu7vdPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326546; c=relaxed/simple;
	bh=cqj6ewJym1miHgUZm8iH3RiovqQFuy/3bRNULbbMasU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj6wbxzBBuYg1ZdFEVJobDx+0qmjcAM8lNn/sYBYJnDMa4XnNJKuiVQDRcCjNpJ00osft3VEN37gGH/EVwn9LRqK3HcuEVfJYta/43yldRPauGS5VRMuUfUQygetKkxc+7xx9AKGUUl+jjRQ25ZSL9o0hpIAi/QXh/Sd+a5ih3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWxqQWM6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30615661f98so14774931fa.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326542; x=1741931342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
        b=NWxqQWM6YG8OVHHmKHX7IVQHC7xeBlj51ltje4EYuxLu5RzF5furpRRIWYpbCzeOmg
         9x41xRCNLY30pvK05qs9XuhqdtgWukdb8uVR6zdYPz/Il3R4zzSzzypLiIiE5zKNUxRS
         j1SyRkoExLEblfB/2WHoQe8o8b8sBmYJcy2UCdXULTEOKYLewZOqV1piigT7VrDVXZ51
         JaYJ+BnCSdhwabeuinA8y/JV0VDr1Own2VmF6/eowK9w01JxgIvffOwraixjsuE4Yx0E
         mWsfrXDscjYYvkxZsnyR9q8GE3WuNyLCxxhaI9cOmmxUF707shkEVDtbKpJUhrnevUEK
         CR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326542; x=1741931342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
        b=bYhBBOjFL52jg3I0+iM3VeeAaZUrK6U6CdsnSgqVdKI7c5yQ6SBrnnNO8eu7vGYgiJ
         vL2bHRJhBA1RY4QwGGiu3PXAr+Geb8u/SHXYgFlo4TG4CyxeXWkiy591s5VtuBdFolX0
         BfGVNUR/ci7jItvzvJ3qQ/39a3dnttufgrC5cK/XkDmZDWHU+7ht1bD5U2pkv5bQCvSe
         Yk5P0Ae7yI1l8gc3dxnNmG/BqUUr7nAvb0b6sMjJDvmcci9/OplhDLyuq8EnRegBskSC
         Bzy7FsxzVrlr1SVE2xIJHueiNljQmd05278+G/HsqzQ03uRUbCTO51lVJU+JC6BsV9US
         ZXVA==
X-Forwarded-Encrypted: i=1; AJvYcCXlcN+ANXrm2flD1XXYVg3sIaKS+EzXtSbJV8etvvFOyYjDIbKZjy1UYZXsMIH1UYcSwT7gA0v53XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnyL9GjNlMLweP3kJRqA9J/d8K8JGPdZQ7JEQv4mPESyX/Iar
	rN2eAPOat0PVcLuazmJyzMe7uV38gyqITVpEPkmxS71gLQTf9OpwHUQYsWKmYtA=
X-Gm-Gg: ASbGncumtOH1siiQ5YF8l01JsCZ3bQ4iRbVSasliJZlVRhL1Nwg1DBXcDl3O6hm5G0N
	/X2vZOoL7jmvx8bICFB6UYJQ62XH4+4T0P6zbGfoJ8rzOKWcXd6ejg4ZLzmA1pxGLHUKesGT5iM
	Gti1M83pQTx8g7zK8iPdMB3qu7KlVL2x7tYm6scDSOEidl9SdotQ563TDMteZ355a9hpvSOYYWV
	GTSOF+moIBf7mWuI+UYV7OQYSMm7HRGxTdc4wEAt7pMKmiLr1tQYei0DgHRj5wSdCMEP7jqEf6c
	TT4H+Vumm7lKdIxR+9upGt8mNI4LbN/WCdZyiFMUCqtoRO8Ajk1CEaoKTC3TP3ddSu/+g9MPDOQ
	/RFQF1Q4S0jzPi4JfBmuJ9ArV
X-Google-Smtp-Source: AGHT+IEQXgwPTN0zWE14o/eWd+esiKQ+JOKkgZz1V9e0jKN/Xjh/s0kS262qvqbdXkWzD17f+19+eQ==
X-Received: by 2002:a2e:b88b:0:b0:30b:cceb:1e9a with SMTP id 38308e7fff4ca-30bf451104amr5734371fa.14.1741326541966;
        Thu, 06 Mar 2025 21:49:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be98ec3f5sm4209511fa.28.2025.03.06.21.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:49:00 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8180x: Rename AOSS_QMP to
 power-management
Message-ID: <6fqpulpczqnzabdnpckd2rtrcdhxryydhkuou7vdhmsftquckt@wzuoxvhyep5d>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node is currently named power-controller, which requires the device
> underneath is a power domain provider. Rename it to align with other
> SoCs and resolve this sort of warnings:
> 
> power-controller@c310000: '#power-domain-cells' is a required property
> 
> Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

