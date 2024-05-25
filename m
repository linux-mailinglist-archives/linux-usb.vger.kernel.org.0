Return-Path: <linux-usb+bounces-10554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F018CF14C
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 22:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25B611F21C3E
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 20:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22830128834;
	Sat, 25 May 2024 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W63bCdK6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F1486ACA
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716668192; cv=none; b=TqqvIM4UoidNA1FlKJWmmMExwONkyXIEkX9EnctgDEoKMk0zZ4d85DY9BqEOdAvFvKtnWzR4VD6e9Tdc3xStxjxR6fveetHynNEQkPIxWbxZw1kYnW8kQfZNfUPr00+ugh0eBujAVmUK3WctFUqqSeQIgRAsH3QyCDTCWZWHapA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716668192; c=relaxed/simple;
	bh=yCIqAoL4i2aLqNmiDHrQ2DbhOKgHllglMGMO1a4qBSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDtuakshPZ/N/Rc+RIawbj3oEbBTCXPFQfWI2qUcAgAfAFFjpKLHnFIDe4LkTfD11DxnIWRtSHxAFe60QNOG1MhfQMrMXtoCI02ZApl9Iwry5Mf0SI+M8P5/7ddcEloqW033+okdv8tHW6VNYBLQ9YxETy2qy/VW0h2rKnS1ee0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W63bCdK6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso101889481fa.2
        for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716668189; x=1717272989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujmKICurQfEycTurigYs3rKwdMGIy8Zz163YNLLECwA=;
        b=W63bCdK6dRxhFYrzCoOH1r+bpG+QgfBFtbYvtG6Q0tVkBjCORjghC/giF+ooSb6t8e
         OVGJzig0uLi69ko1cth4k2yT82Yhq8YePjKlQjC7nf44ZIkWG2SbD0D03F1zXJ3UEwJ2
         4RhgNxvH2PuSW+TQ0H1YzKh0+o8OgQIFGLU1uxvUbpA0YQUqO7ybbA9zalc6aP0YCvII
         2wNxLMnSI+qpV7UAejBuef3Vd17OCzeVodqhdbNmnY7lIapwp5Bu+kpaZNM/OzCeRTZ+
         CrjZqGoQQVFH/QgY+WvGeMwhlzIlRDsxfX8fFvRk4zGeYbAiK4GoSdv/EBqNbFCmC58j
         5NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716668189; x=1717272989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujmKICurQfEycTurigYs3rKwdMGIy8Zz163YNLLECwA=;
        b=V8sKrbH4p5Pcx9TXjExJpJvtIeZJB4r0aJi3bvOCduZmPVgbujJo/ZXwoxv256aB/Q
         3Y8W8sKu11poAqE5RtYfcfAd9aa7wE3oLm9XL2XNbXq1RoecKE8ny12974Xe1Db5dECF
         7b6x0FyVS0KnQGihgfRB+A4m0njbTDDkgrZ3b+5Rlk2Ut50aM4lQhHOv34fKboLJYfa7
         MT59IVF0rAdrudxWfv2O6TjQs9dbA18j11reKMEwaeoiqrzyTJDCLTGDJn4EVS4uRMk0
         eJQE90eG9dVAxWY2P4alJq4PSELegry179bNqdJzjnQThN8wuzOXJWZRDRBINPj2tCS3
         7DXg==
X-Forwarded-Encrypted: i=1; AJvYcCWFXXnSXkRBG4Pas4Vux1IIbUa9ch2ML87mrdQ7/wUoIVL/61x28/CMXOIc1rlXDhtE1CmBg12RIN0BNhoURnKBWTOKXV4PPbJZ
X-Gm-Message-State: AOJu0YzWRxV3FPjGCCGLh0p1QrR5Fxh42/lYW7GbTfOHBgQGzsGDLppF
	c+PzQs1oHhuM1BNzMDbE7CjRO7Bra+frzhL2T3KL4DHmT0OhM1rLp/uGlMClUnk=
X-Google-Smtp-Source: AGHT+IHEX5m8aIJJV2uYylk6Oj3Cj2tv3lHqMmUdSSoL1mmdUgmPlnc46wlraEODOjaTm00dK0NeTw==
X-Received: by 2002:a2e:87c7:0:b0:2df:6fd5:1475 with SMTP id 38308e7fff4ca-2e95b0c9dd7mr31747781fa.28.1716668188971;
        Sat, 25 May 2024 13:16:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bd0dc92sm8917711fa.72.2024.05.25.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:16:28 -0700 (PDT)
Date: Sat, 25 May 2024 23:16:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 08/10] arm64: dts: qcom: sc8180x: Add USB MP controller
 and phys
Message-ID: <ld3kemgy6oac26fa47viwdgjaqjkx3qgysp5ughehbmtugoi4f@3bvxzmvhpdxw>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-8-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-8-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:04:01AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X platform comes with a multiport DWC3 controller with two
> ports, each connected to a pair of HighSpeed and QMP SuperSpeed PHYs.
> 
> Describe these blocks.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 146 ++++++++++++++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

