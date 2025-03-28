Return-Path: <linux-usb+bounces-22271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E735A744AC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 08:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A12A01B61B96
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C5C212D63;
	Fri, 28 Mar 2025 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yoQpUS5G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86E212B11
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147948; cv=none; b=i/HLLypT0urJxghvI7Sd3fNaWfittepG+z+QcX/WhFCvOJeXeZDXt4ki6WOWU24n612FL/deuMyxexDI8LlmOlmJpSuymfdFQDT3hwjSLS8aXrBxL8qkAICN6MscG5UPu0N8KEF0HgosRQN5SpWf258DKqGR1USKuIEtkZIxKXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147948; c=relaxed/simple;
	bh=jhd8eqeLqKtgOMegJHXn9/RBH+p95nA916u23Bs1/xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcSQcJUlH2eIIMJN2YKcDYPMdaRiDJUvJKuqpDc8c2mcdJufIxft21Zgm1jxToaldH1IVBy5K5NlmFz/9txiL24SQjdmgQQO7bbI9eImV8qc5324iCb0NAIElVQNDEjfZ/nw97II/dsJNk5QBq5ujzG0tABaai9Kxtw9s+rDKQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yoQpUS5G; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2241053582dso50550365ad.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743147946; x=1743752746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cju4PP3BDwNUuGXUxlhnczSfO2O+sRFjPqYxZUsY/Fs=;
        b=yoQpUS5G1WczIvAr6LZUddcvjI2Ojd88Y/vPHrUHg4KODVEnxp4CDjPh5nN/C5lkl6
         4KHSVb6atT653sH9Vet0J5t6AW/HzeLjLJdE+EBhMzxU/DdQ2q9B72iULBdgU51ZTzjF
         MjnZu25rtaYV6ksKxvNcHC4jtyHZ09IJjwk+gEnK60g7mTOvzYvw+DoJV9Mo7RwQQFnM
         GqjPR78lvbPD3S3bAMjUM2cfq4Ibap6ZQMqXPLc1V9swCmoZHXprFEhUKL94KXY/7Qgm
         EKQL6G4LXXkl5lbhnEJGzxH6eRGeFTlWNUiBp+4yHOTz9ZsS05wU4lN7dzTbXJ1M40+3
         RUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147946; x=1743752746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cju4PP3BDwNUuGXUxlhnczSfO2O+sRFjPqYxZUsY/Fs=;
        b=ncwJ+CcyqDXG3Rf+nRsQvViOc2RVTowGIogyix8UR/wocTp/rRWHygwcFuP76ZBrq7
         DMH2J8tBD5wr/MlTMZVcm4Tdw0gc7+JfStTBQPWMiET+pNFCz6FJevTO5hU4QCIezNMB
         cRO+W9rgQHdmyFHFpM/CkyFNGjiuQkrTqvVmLq2ECcRSRLFbpzH74A+xIhOAA4AbhR3b
         OJ4B2T4MWOn2/HHW88LMls1JgyGnMpcJqXLyADHuL9Kc35Wcuy89ODqQEcNLsQOiwRpJ
         ++LmOPmnSNizp64pjjWS78XyqKzu2nykGYgJH5b6eYSNGE3FeFIi27hdynfJPrLK7+hE
         53Og==
X-Forwarded-Encrypted: i=1; AJvYcCXS+GkW8vh0QHzuRsRY4Wn1XayO85ncAJQPdZhwS/iYefhCu4bt+3WjX3AsZX8YSFx17w5RG2i5brk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzIcz0QaBo2AHXMtwhIhYotVzvCibLfoyzZa8AYRsWKPIY3boS
	7RMxQw23cxCp6DX2QHXjP6eBEdAxrgnUbd+CQ0fnNYv8ak3fy+UOn3Do0MIn6h/HmTip4DnS6RS
	hTcmJAHmB1cPP3gH/xVgeukYt6t9fPk7tsUA+
X-Gm-Gg: ASbGncsE/qcGMVQdZ3NM9AfiwRd7S0gc2qvXQOIOlGUneKHwMDrKctx3LcGwAH+rdrf
	q/5TP1PclQU/w2KZ4gh/lNrWvgBrhJTzo+GWdhcFPhzEAxq6ArcdR5tGLNqdOcKXf1PKwBYwFB6
	cQ2W8FRKnK8osS4PbiLPvYRIVnoJ2+AztG4qWWpo+lSEmZXLHluVgtrm5o
X-Google-Smtp-Source: AGHT+IHOrcw9DisHzvvGCzWpEdMq/2DuAlul4EC/64JuosmYAwms2YN5mduIbPIPWnfzDcFKN8g6PnqvAgOWYqzB4tA=
X-Received: by 2002:a17:903:41d2:b0:21f:7e12:5642 with SMTP id
 d9443c01a7336-22804855243mr78114555ad.18.1743147945996; Fri, 28 Mar 2025
 00:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-5-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-5-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:44:00 +0800
X-Gm-Features: AQ5f1JrxKR_5At3wbtVqdesBrs5EjD2B83PPzVhOxlnkDOQEImF4VUCzY3fgoP4
Message-ID: <CAGCq0LYNn6VZwKpvvf=N2ra8ZJcSso80ZDpirByHO9ChBZv3eg@mail.gmail.com>
Subject: Re: [PATCH v36 04/31] usb: host: xhci-plat: Set XHCI max interrupters
 if property is present
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:54=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Some platforms may want to limit the number of XHCI interrupters allocate=
d.
> This is passed to xhci-plat as a device property.  Ensure that this is re=
ad
> and the max_interrupters field is set.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/xhci-plat.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 3155e3a842da..6dab142e7278 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -267,6 +267,8 @@ int xhci_plat_probe(struct platform_device *pdev, str=
uct device *sysdev, const s
>
>                 device_property_read_u32(tmpdev, "imod-interval-ns",
>                                          &xhci->imod_interval);
> +               device_property_read_u16(tmpdev, "num-hc-interrupters",
> +                                        &xhci->max_interrupters);
>         }
>
>         /*
>

