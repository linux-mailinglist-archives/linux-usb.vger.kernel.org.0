Return-Path: <linux-usb+bounces-6824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936885CC78
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 01:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16665B235C1
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 00:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71D126AFC;
	Wed, 21 Feb 2024 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wb2/I4f5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E813D8E
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 00:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473673; cv=none; b=kusFLbS7wbEwZVZk3Yf3NONlZRVT9llCpoaiNOmhudpTpSj2ANTRYBU2gc3eRTD69bt+al+gd3VIRiB1hw92lFG+1NqkJLt2O5C3XDcWPEgqfXP3o7gZjKhAGrMlMj74XMtb4uwWxjBoBZeEzP4pm37GUFy2ocAHg01dZojuLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473673; c=relaxed/simple;
	bh=YT82tQv36KhBq/RLsxxfjh9daYWJeJ/uSm7Nea0KjLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4pnniBSmdDR0VUbegs+wtkk60oj3qRNS6lysZnV3z8/C/sitIQxACzGUKEXRueYsLKFnmcyI0l0czXkXbh/UEZ6L5dwMJUmzVOtS+YMmj6WCObg6D9aCO7biRWZIvEjD9qsEOxCCwj1xqAVpvRCanrmRHonfZKdNH/suLi68A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wb2/I4f5; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc73148611so6952980276.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 16:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473671; x=1709078471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G0oPPjBzy9DSg81CmxxzMOi5kgIq+VDsp6cs8swUMVo=;
        b=wb2/I4f5XUL4eTOtOP890jnCmuLgoL/bM8hfrHnSi1IxZyqp642F3V9p1/8BHoq/ve
         e0vJnrGN6bqe0vbUcviZ33IDir90AEhVRiHs088vfrlZ/SRXBXGn/ZLtdRJoE2UKZSVN
         WvcUEKm+g2x1Hy2jTEM/I6cRo+2JQLc6zKpWuKG4tBgTjbNwtHvZmkuIzQgUe/Y9u86k
         +ZVgomfqCqkVSqxFJo7vZN+DSOdaQP3TabnTVdCaWo7JwEuDaCchmRpZ2hUVqn1fzbEU
         o27ci2Ttzz4b3pxhMbFWUC9qFGg8CNA9c87ioTqPOVUO3mJq+IiOETLzpGF5BeV+Rb/j
         eilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473671; x=1709078471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G0oPPjBzy9DSg81CmxxzMOi5kgIq+VDsp6cs8swUMVo=;
        b=pnn3O9QGg/2UnXbJTAhRzBLaFflRMVse5QQ1MJtr9Yt5AvJy32oMrbsoHE8rGRFge4
         KPlcQjqsR6o9guN2YzGOir6w+4gu6AxoLzPxY1sA2WpoJN1hhLSSblcyABy8/tSdAS74
         5EudwszslkX9l6MBn++jpvmIi6Wqe1W+MSsxBj7mkSiTBDOUnNKbD0tDRWaLb/Sx3TIO
         IkTBjwpYvUnX5iViy8kEi9Ir37yIh6eDwkLawraI45f8QKjlnlmCdADKEzwZTsb+UbmZ
         AnPbhiS8ehwdm23mm2QQhmi0V1D8q5ekXL93OCyqDmZSXP1zq9hAZsLYvN5AMBWNg7iq
         6p/A==
X-Forwarded-Encrypted: i=1; AJvYcCUIOhlb01+oeZOtAgzmuaaD5Cd34I1yYhSYT3+IXqgF1dkf4EzYda6o0qLr5Gyelqs7TZ7A6Huf4FPS6UDaojuSNtP1zEXQ5Yt9
X-Gm-Message-State: AOJu0YwoSAumUmMAKaMO5wdAyXCxaKptR4rMOQlXS80CRXUwRyMeuS3h
	mei5656Z82TlHnNPAQi84K94JOc0xFZYPqB8JoaktmNrsCT8Z6RfbXpM3pwLFImvt63VVizhKFF
	ePFgM/tcGpRcljfkWBBXfdQNJ2K9MjTaqiu2Tfg==
X-Google-Smtp-Source: AGHT+IEqhvu/sPjOF0+od9x3JViU6gBZyp4VAGTIBlbM9Am3DLOO6gj84yHo0rRnj688//9UfY95dj7T/S3qJ8OpFh8=
X-Received: by 2002:a25:cdc7:0:b0:dc6:cbb9:e with SMTP id d190-20020a25cdc7000000b00dc6cbb9000emr14755191ybf.41.1708473671007;
 Tue, 20 Feb 2024 16:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org> <20240221-pm4125-typec-v3-3-fdd0ee0465b8@linaro.org>
In-Reply-To: <20240221-pm4125-typec-v3-3-fdd0ee0465b8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 02:00:59 +0200
Message-ID: <CAA8EJpqMiZDTAkFXuuw0A=-B4jLy_yU2xs4gti_kBcJEgYKmBg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 01:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Plug in USB-C related bits and pieces to enable USB role switching and
> USB-C orientation handling for the Qualcomm RB1 board.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I didn't pick it from v2, please excuse me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 42 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 60 +++++++++++++++++++++++++++-----
>  2 files changed, 94 insertions(+), 8 deletions(-)


-- 
With best wishes
Dmitry

