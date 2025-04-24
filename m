Return-Path: <linux-usb+bounces-23390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED5A9A2D1
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 09:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C48473AC617
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 07:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730D01EDA24;
	Thu, 24 Apr 2025 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgJUaZ3P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7A1DB346
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478260; cv=none; b=HfaLj/+d9r7rDs+v2N69J0xcHVrVo84s6RqnE6ICeNiRTomdsW/VpgMQr2qdESas9yFDlVT5Y7xCCLNUvCqtZ6wdNtWeKumwUVz4UcxWfxNFV+7/Pu0yYPS6shcLh9q3Ko9jvkJRGwmlw6i4bVL0mLCo0cYBe1v4IA2chQ4XmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478260; c=relaxed/simple;
	bh=SvckNjKAAS7pT0RVb3J0/SrYkdOGfTe2ytVtg9wz3bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGnqpGtAifCrOnpphhGrf47qGhj+MKnJ0b0i5i8qmj91APyRxVFShWWlPvDJxqRCbuwj0C823W8FbFyWyFVRkgM22kERgQMRPUoONXffvixYoIgvjScllJQSr5wl/hxDeC4rgW/i6EraY0aGFmb9o6hE/bwk4TGFJTzYqIyVseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgJUaZ3P; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac29fd22163so97959966b.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 00:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478254; x=1746083054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D1iRaF8DEz7JFVtNCWSp0T0HzrBBP76McD5zA/V6IhY=;
        b=XgJUaZ3P2rJEUz2ZRkeP4ecUt6k3Vmz6VJNC8emBdPOfEwVU3CQEf5w40241IiY1dH
         biz6pY7EMA32SRpmFqI9JILY55qFBeJRMYoZxx1h3Qjx71hbOQEaaBNZyEdcLNoa95TB
         csBgH4lsGaZmi2udRjn1dbu0UlxFT0Z/Zzg1d+WN0pwgVtQA+PIIEZDWlO7vc1vo6tln
         3Qbm3uvlKRQm61Bjw1YF5qfCH/TKJ0kfjvgvNrqFSEULlwrcMG9YcYSuVAG7QscjPXnl
         SgyvqvlWGejsBlz/YwKYEv4y9eZurRAyv8GkfCbtTIs0CsI7uulJirZiiRfYRKQlwbVI
         mzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478254; x=1746083054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1iRaF8DEz7JFVtNCWSp0T0HzrBBP76McD5zA/V6IhY=;
        b=u7+nGOkUIolowkIAfphR5v9TlQEcj1OAUX2qr7rM9WGwgUvqySD0jwQSA1SVYExivX
         VmaJmfHTOi1ZGClpexdDvG+LADpPYVtTLEx5hk/hxibRtMTeEW9RQxsKe9aR34mTEu7g
         0UDVXS95imYr+uNQOa6Q0Z1J1Gsri2w+kiYml6xuQT1AF+XqYjW6wohtrOJcCg1jhMBw
         1K3zHM7mLXckWfEhW88pj6akyKRuuTlYMYvlspTMTRLndVwza5ganYjO7z9Gj2RA2gDh
         Qk4aVMjaXeqT9OfVpEgqdfHlNlAwZ4MJQztUJ6fY1J0Leh3JHVQqhn4OWqpVcdUHAJDa
         /Jfg==
X-Forwarded-Encrypted: i=1; AJvYcCUuOKwwIEt+k9vixJKV4bYR+ylPPFBICjsS7UhV0aZzAnfs+qG70zCI9JK8CB5uxDlwOJGNeWKTfCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywavc9DYI8PjOzlf/cT+Je7DUaVxBL39jRzAtXSlvKbbZejG/lH
	esBLpy0v0f85FnsDRp/ihMsebXjjSQSMWOajEltzl6r7K0dB6uQXdIcHhA87Kp4=
X-Gm-Gg: ASbGncvD1Zn7CSX1Jpln2AupdpgzbDZ3ar5nnGXZxhclqpT3RyEBefJ0gEUhH1Zwh/P
	MeI9bBbxl3/IvUz3rmomS+pBnajh+6M84n3Zv2f3tFaPpDr6Mq5zT5RoM5pyxDJ70bbDgv6bNEV
	Ma1+i2zv4lK54A661996Cb41Tnr37wAUmVNFUM3wHxuYqPTXaZ0b4lgkh9t4DUE1DxSMKgjoWrS
	S1V3DtuL763pMxlPm9zd934kp3gG+t1hQ+us1bePYX6PKFDY8BL7joP+DdqXkvAhB0snxpMSZXf
	GiLjCiWewZvIYMk6zYWQXxghoyeT/mISpQUkWw==
X-Google-Smtp-Source: AGHT+IE/3mNCR4/4NZlHXiIHHU6zr3VRymMPMYgsCSGHm3hUjKJCoLnIAqlX7BK+6k+UO9+ZElCHuA==
X-Received: by 2002:a17:907:728d:b0:ac7:d0fe:e9e4 with SMTP id a640c23a62f3a-ace5725cefemr166986266b.19.1745478254508;
        Thu, 24 Apr 2025 00:04:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace5982cc9dsm59444366b.18.2025.04.24.00.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:04:13 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:04:12 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: use modern PM macros
Message-ID: <aAnibPAln1kS+KHO@linaro.org>
References: <20250423162613.2082417-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423162613.2082417-1-arnd@kernel.org>

On 25-04-23 18:26:09, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The use of the old SET_SYSTEM_SLEEP_PM_OPS/SET_RUNTIME_PM_OPS macros
> without __maybe_unused annotations causes warnings when build testing
> without CONFIG_PM:
> 
> drivers/usb/dwc3/dwc3-qcom.c:421:12: error: unused function 'dwc3_qcom_suspend' [-Werror,-Wunused-function]
>   421 | static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>       |            ^~~~~~~~~~~~~~~~~
> drivers/usb/dwc3/dwc3-qcom.c:457:12: error: unused function 'dwc3_qcom_resume' [-Werror,-Wunused-function]
>   457 | static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> 
> Change these to the modern SYSTEM_SLEEP_PM_OPS/RUNTIME_PM_OPS/pm_ptr
> macros, which avoids the warnings and improves readability at the same
> time.
> 
> Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

