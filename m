Return-Path: <linux-usb+bounces-6861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14585E737
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 20:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB9F1C24811
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 19:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BED8613B;
	Wed, 21 Feb 2024 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZi07Wty"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3885941
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708543456; cv=none; b=ZF8VzH5/BCo2FZ6yw21WhciwbxSk33qz4vUfV66zEujZ1rKvd0Oh8P95c+Wa4+utBIr4v8rlXEEWXtirtPDwOw/J8X0QJp1GY+DlsazMqgMeScmTPows0MgXs21alYtrnE5Vl1+RQsliDnUYhLOvtvXDJfwVYnY4/H9n6s5YjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708543456; c=relaxed/simple;
	bh=3T+4Sowq+/a2cVZqSXKH4sBJEPnTUsRKB2xiZ30Hff4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGUgoQsEk2n2p9/QqZYrli8OtWG60J7Jph0HtDtXMtDK/DrCFQ4dELydeW7KpQgkuG1Hi5bIGXkNt4aa0tQ3SJ1lAFhihQ86zQZo0e/BTYMSnxFgsKoSSdNuFtDp1LAU371Z6ktCTjM9ZXXrRGw7Ui1veOD0lD11B57GUACiL6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZi07Wty; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7c488a5af5eso3165939f.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 11:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708543454; x=1709148254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yFTzTjr3GTZORxDHTHVOaXJnjBMrs5r+BDpbCsO/O0=;
        b=PZi07WtySJY7RDcpykVgk8yCt4XeyzKR4b/MLOYnEfo/9gsVh9c06tUTGt7UZ0N25Q
         pzn2QrHpjg5szoyuYmHF6ymWPS4VT00vRRlFybrI6xhOHm8IJZYCkNDb/yvGiS1tpfoW
         wgFZpy/LFhQJKLzlVa43vbIRQ/PfhGi6Urqc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708543454; x=1709148254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yFTzTjr3GTZORxDHTHVOaXJnjBMrs5r+BDpbCsO/O0=;
        b=f9Uj7LCXnGL33MFIHU9v1hZfIOuUjCustFr/46B8tshFRjpTaxBDChjCpkaIyMB6OE
         c1P3leUIDpQ4X6Q9pFiaxb5XlN76QtCc9R7yYR6s09OSf7CIE/9MkWderoFNhZnz8NiV
         ZsSJAjqqxrr93AGWz4O9+7maP9TsXFFWBZ2fv2B+iDOPgNHWLGm0HdBAAHtLNuD7qnCI
         T2eQZHZLhIM/GiJb5kDOzNmNTkGxPsRtG9ohtnHOXHuJw2hMZ40QIERbeVkktKDarRhW
         BT7OpMGchIHokwaY/SV7/Hbcyey6qKu8sOs5qsArg+5TRYwM8Fwc2wY/DgX4dYRL8zHb
         9HNA==
X-Forwarded-Encrypted: i=1; AJvYcCU7UhZLSt6nIHZf1CCcgOFoasPRU85cJSQLpk6ZM8dhqpfDBdeMg/HYKnJ5+LDYrb7QbSECe3WoBM+1vurF3/bDeG0p6bG18uor
X-Gm-Message-State: AOJu0YxK8jdMOqJsTpZKlUSgAo1slLxYPLPKJyqnnlc22IR1iPW/vRhT
	B5ENOVY6shXXdmmrKG89LB6Ow46MQKQlSNCv7618UyoZ/6DlhrwKT3BpFwk1lg==
X-Google-Smtp-Source: AGHT+IE291cBjzdobD8lyxusA74siOxGXcy/qiDGaMre5yQogt2xjfceKZiBvFi5jaiIFeXbw+8BWA==
X-Received: by 2002:a6b:e519:0:b0:7c4:89b2:8084 with SMTP id y25-20020a6be519000000b007c489b28084mr423301ioc.1.1708543453597;
        Wed, 21 Feb 2024 11:24:13 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id x17-20020a02ac91000000b00473f31f96desm2836260jan.90.2024.02.21.11.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 11:24:13 -0800 (PST)
Date: Wed, 21 Feb 2024 19:24:12 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <ZdZN3FIS4zcKe4Kw@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-2-dc1617cc5dd4@wolfvision.net>

On Tue, Feb 20, 2024 at 03:05:46PM +0100, Javier Carrasco wrote:
> Most of the functionality this driver provides can be used by non-hub
> devices as well.
> 
> To account for the hub-specific code, add a flag to the device data
> structure and check its value for hub-specific code.

Please mention that the driver doesn't power off non-hub devices
during system suspend.

> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c |  3 ++-
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 2103af2cb2a6..f43130a6786f 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -129,7 +129,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>  		if (!device_may_wakeup(node->udev->bus->controller))
>  			continue;
>  
> -		if (usb_wakeup_enabled_descendants(node->udev)) {
> +		if (usb_wakeup_enabled_descendants(node->udev) ||
> +		    !onboard_dev->pdata->is_hub) {


This check isn't dependent on characteristics of the USB devices processed
in this loop, therefore it can be performed at function entry. Please combine
it with the check of 'always_powered_in_suspend'. It's also an option to
omit the check completely, 'always_powered_in_suspend' will never be set for
non-hub devices (assuming the sysfs attribute isn't added).

>  			power_off = false;
>  			break;
>  		}

Without code context: please omit the creation of the 'always_powered_in_suspend'
attribute for non-hub devices. As per above we don't plan to hone it, so it
shouldn't exist.

