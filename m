Return-Path: <linux-usb+bounces-10552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3AC8CF143
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 22:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96DD82819E8
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 20:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598421292C4;
	Sat, 25 May 2024 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOFvn8tR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6CB12838A
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667968; cv=none; b=pUSN3ZJHr5bVdABPChGq2bgvLPDsf99GsMTMVn1w0OHhpUY74FyIRrMloBOwjnT5dQjTnecUswHZ29bKGoUh18pA/wREQVwhosEzIU8O+d/2vlaRs35fnM86sqR/5TDOlnoL1V2xa2B7SEUk832eV6gBP4pNM/yw0Ymabscv4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667968; c=relaxed/simple;
	bh=eY5NFdEB4BLrmrsCDSSMoBVFvT1TeVGAQqzQJjG9lgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foFoaABUGCqF5/0MYQulq4mJXOmkNjDSuYc3g/REfP8kBwQhhrRKHkmlkImy4fLa7szTL+etmzia4U6oSu6mAUoLAMpFzp5s3EVFzzoJb+Go5WiYaKhM4MyxyJxw0td4rgoQ5hlmN3CWvzVFyhDLL7dJWLXKuCcBifJ0yRZZqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOFvn8tR; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso24504511fa.1
        for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667965; x=1717272765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6YKAF3uOaRvvdDSRLqD9z7t3ncxonB3HE3QHJTs1EU=;
        b=iOFvn8tR64bqOAW4wLh408BIkhTt9uzBiLrcTFbLo/d97uhLd94dsGZQ8it6r7sos1
         tWkONJ54pSdJtxwS4Ha2xYeLWlGvZwRRz0deUGHuKURCCzXAkFUuKvmQ9UiOOME665yT
         naV0PVRxOwrCxtbEqGbbpJ6X+ZqRtKVOC0yJJHpeqdQWduP/ExMJhoFRvCDmelF1kGcD
         aQeYrEsp3GLeuPRcDKqF6c0XvOdaNbOZIuDnWaAjYTslgGdhiTWEr9/sD+huEvH3UyZz
         rYxDp9za9mgdptSrcAQHFgWTHuQR3tQijxxaoEY7HGXd62NfcpYCb/YEdwvjDNnPQb77
         O0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667965; x=1717272765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6YKAF3uOaRvvdDSRLqD9z7t3ncxonB3HE3QHJTs1EU=;
        b=vQqjuRnF6OsX1BB0EOOxCMVIt66YsphqHPU6zM05MmFR/1kjjOr2mA3O5jDYzvAFEg
         P5fcJLbuqKf3o3fJ2gO3PDL8zebOnx0d3CoiW/poutiWzWiyMZfa7bpJwEu6nYJJonEC
         t1kFcDgLHml6WEWyQgy9/Qwrg0dke47+TteaOmiICTb9D0saCM/FEgLis9UzhkzylOFR
         /2loW1qNyJsNTR23O6j+pWeotldRpmJAtihvvGhkeQfJ+7YE9ez5ZxGvzjwLcuWr2PB/
         JKgSyoPbqjBpRsFYGN6M1vmQFWOO+m+0cwDaihAIL6a1pE4ucxAbq4UQ5KbRRhmp6uWx
         0c+w==
X-Forwarded-Encrypted: i=1; AJvYcCWubAcL+azz7brGi6QCn+7b4BeHai1xDBvW30fUDVkwEyAidvvTJo45p1pKwxb66Q8WMQXbeA3ckWzpp+mvfJNfm873rizbbQ2h
X-Gm-Message-State: AOJu0YwB6y6NWKgZJJIuDWgnW1eVfVnuLQEd9YfdZPrm+tO+ICi+NHU6
	vuJ8ktf5iypV5yu6q7r2PkzL/pjlofAfqRDXUlCqiW18t+dGjuCSVC1seXoss1A=
X-Google-Smtp-Source: AGHT+IHJDobPY5xFq5dvnmXXHNOJaX/jRN/ri7kcyQYhHMcDJUmJpMFwZSjdDHIOoZ0wzgcLMXKknQ==
X-Received: by 2002:a2e:bc08:0:b0:2e9:570e:1cf with SMTP id 38308e7fff4ca-2e95b3089d9mr38786341fa.52.1716667965322;
        Sat, 25 May 2024 13:12:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd152dsm8775351fa.81.2024.05.25.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:12:44 -0700 (PDT)
Date: Sat, 25 May 2024 23:12:43 +0300
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
Subject: Re: [PATCH 02/10] phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
Message-ID: <ynokoy2fh4fwespzfdgo7mpklmy2n76syfyb73bm4m2hp4cftp@am5nldqvj65z>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:03:55AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X platform has two UNIPHY blocks, add support for these in the
> QMP driver.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

