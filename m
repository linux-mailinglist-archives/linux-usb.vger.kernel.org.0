Return-Path: <linux-usb+bounces-21497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9210A5663D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 12:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE6871883FC7
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 11:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E982153CE;
	Fri,  7 Mar 2025 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUilmfFz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDFB215197
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741345637; cv=none; b=Vxo2XZdOQIeWphPaPnuSN9M4pF5sdE29KAD02jYtTPNuiRutN4A8urTgSkJdpfqr4DAZCuR7v7HbRqGUNuXiFbNNX28f6H8A30bE8cdsaqcDMmS9onxnav4gLQQgBN9J858MAz/T7qTyfgTNYRIF8GpM5k37Ma3HY1c4iXtcvLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741345637; c=relaxed/simple;
	bh=HPiNzXTTHqoN0cuKMmWCn9O3pvGZPQvws6UsejGOLII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyrAtZ2GY/CNCDYgHD+NbDqYXslrEEQiovtuAhUKwOR/8yuhTnWKm5bF48vg3hfh6utOdcQlV+1PlzItAc0PcQwI7V7S86h2/vVouJN+fvcvrgQT2hxMgz0HVBMQOi/LU5kQFPULyP2J9qWTlu+Aog8ZC0nqBXTpIgwOtQxuVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUilmfFz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbd96bef64so264168766b.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Mar 2025 03:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741345634; x=1741950434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yfDn9FH6gBIL3kasCeeYhlqgNKvkAd8JgXjYP0PTb+0=;
        b=bUilmfFz7vdQaUcWEcIMefdQ8tcllfhalTXjcQuO7pi6omynsQI5WzuXI8lgi0bqpr
         QLT+jnTdMZAwoioFcNhEQ9/0ciVV6NjsV8S3+8eFtvAD03RsHMnh5szl7QH6+10fCUAL
         JEN+GkhItbbSUE4ERU5t0Ru6aSIw7x1t5Tr2A/bD1O/eZthgRjsScDyr7YO4zyHWOJLa
         wxLfM6/QbYCFQhMb0LKdr/2Q09od3wHstqU5ERycaC1JtxQW46LHJlSngNd4JAQO55k3
         8wDc41JRhBs+22/US681irq+C/1SE7hjvwAzI4y6er4ZJYYx+rXIY2wC/XkPgCzRZwHi
         EwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741345634; x=1741950434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfDn9FH6gBIL3kasCeeYhlqgNKvkAd8JgXjYP0PTb+0=;
        b=r11jmtCS5SM6X5Z628bTHmBiNXHRenB/Kig7E8M/xM329E7KrGxkLM/KgsxSKvCW7P
         8f8DnhCHC8sZqHNAOPzmHP/xv4PBAZi/wdel6z1mRZUcf/xVouwpTPpWNDVK7SS8464g
         WcljkxoinzableGauhK5jq2VFI2gAJfll1CxI2HK7CetVjZx5WVQfHyF+N9qhxmN0A1T
         mH+vPaVKK6nUNbn2JGCWSngv+qBnddEpwlOlsV8bT0CGWhzL23dY6VZ9mPtied6KOGPA
         Tx5BXourMhDuAMtqtkNBHBvLwWvjSztVj3ScYDpzA8366N9NQKQ9Oefk7J+En1KcDOjG
         EMwg==
X-Forwarded-Encrypted: i=1; AJvYcCXOClHu8pbUC4raV0FrX2Rxg8MLBsaAVXD8Lry0+hLlJQSzJm+RHDTM7w365IUjlQ6nd4sGq117rFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DYvYJ5JtcC7hWmtg5OJ2U7ZO2/vRfjihmD52cByXD7Yz5Yvh
	DX9GdgTQI9oO+fUcJCmFBkCgI0o3n6Pa6bY80Vyy5bSqsCofB7C9G+UpTZ9Q4wg=
X-Gm-Gg: ASbGncuRqn/ZpbBhGcSkcF7JhqgrsT2vUU5GJSqzKYuA8xWxbrtfMUkRr3U2tEdNIQd
	IEBxXxKH8xdxYTqmPuRltSW6o0PZfGA+z9W1nqSzfNbCKbRApEtg1RFMFwxlzyoAGjTY8JhAy6v
	A7fH1LtTnHPczrPW75I69V6Miy6opKwtNctwPdeo6JaPJIqIusaJdnbf4NJSTWEfzA5KEneyitO
	6veOOvjgVAEKEf3qjZ263v2iB1pIwzoWBYV5vUDWa/drLz9L6T6USEi/cxUrsRLFR2YoDKH9g6V
	8CTPdrZ2o9B5nNgmj2kaNZppknWJDZpS2d7RcKOvxSajpMmfBAcj
X-Google-Smtp-Source: AGHT+IGgkdI1f8j3o1gNtZn8e4RQmGqfj9SGVx8IYAmQaeWhqRp49yPnbjkO8kd42BMMr1gZ+zPEWw==
X-Received: by 2002:a17:906:f59c:b0:abf:fb7b:8d09 with SMTP id a640c23a62f3a-ac252ed8b2cmr349617466b.51.1741345633855;
        Fri, 07 Mar 2025 03:07:13 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:c140:2ce9:b81:70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239481685sm264956366b.58.2025.03.07.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 03:07:13 -0800 (PST)
Date: Fri, 7 Mar 2025 12:07:07 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Robert Foss <rfoss@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Message-ID: <Z8rTW3fQObiZ7del@linaro.org>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
> whom this binding document was created). Add a new compatible for it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> @@ -18,7 +18,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,kpss-acc-v2
> +    enum:
> +      - qcom,msm8916-kpss-acc

Hm, MSM8916 doesn't have a *K*PSS (Krait Processor SubSystem), it has an
*A*PSS (ARM Cortex – A53 SubSystem, or Application Processor SubSystem).

I think this should be either qcom,msm8916-apss-acc, or you just keep
the qcom,msm8916-acc we already use. I'm guessing ACC stands for
"Application Clock Controller", so it would be unique enough already.

There is actually a patch from Rayyan already with a R-b from Krzysztof.
Maybe you, or whoever is responsible, can pick it up?

https://lore.kernel.org/linux-arm-msm/20240710155226.130086-1-rayyan.ansari@linaro.org/

Thanks,
Stephan

