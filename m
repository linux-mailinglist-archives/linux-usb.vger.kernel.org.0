Return-Path: <linux-usb+bounces-7259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5886B6DE
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 19:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB3FAB232CE
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 18:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1394E79B86;
	Wed, 28 Feb 2024 18:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FEIYouPg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417A79B89
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143849; cv=none; b=Bjh2c3e+6yYLV80P3ADI0PuIoBAZd8MQqMl+f1cI+fu9z3vCh+PG8SW0MOKJ41YMNYLZINh8J9v4LqtbuiGOk2Pxv9T76nqbjxbmLUqlKV5BP4maFEsmIVqPga/tAvZPeYnPcWoUvqODjW0Y7PgFGP4EqyPhMwl1Lt6KHuIiswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143849; c=relaxed/simple;
	bh=ydPMob62Ut9r97Sqx0kikCCPdrTngYvBh6QQJWZzIis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl5e5oeE86k7APPklpO09sDy5OYNLjYirHMbq2uD4pdCdoucTNVHgS3B63gRWu3le+p3+vDaAizRLTotFNNGK8bQoe2Hbk4/FyuvCpc84uFNYyDaqi6ktK6bkRhY7u+6RYjv/D11i8vATG70EbpDyaKtzEwFl6YuXcefpf5xn5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FEIYouPg; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3650dcd38a0so259195ab.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 10:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709143847; x=1709748647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mr+bD36IoIOKszW1o5Rb9R/mzBzmVVAn2qquBqx2Jtw=;
        b=FEIYouPgnFUzrWgIdZQASk0HWhUcQiarax30evBDsqyfoRmttaihpZYlAXELZtupH3
         WLBwen2wkwlwXrRIqLYjRAvbfPShC+vVCVo4S5UFkQLCxPRrjDUvRwqYufqDJ8oZKq/f
         Hh69pt0BOR0N6tTt5CByS7vnCSxNSo5TYHS3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709143847; x=1709748647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mr+bD36IoIOKszW1o5Rb9R/mzBzmVVAn2qquBqx2Jtw=;
        b=diD1vJvF6gMEDNUSmWWjXvdNsI/BuIrMX92wQYvC/AL24l4RKvu7Z9GgDPO36G7qFm
         A+PYNB84VX4ZqcZ+UnFcCymXUqd+k1XDO5EOXT6870Yv+nVj+rPkeYvwY3w4bly0/hce
         6xTVDcnP9v60OzEoot0WBx6g8UDh1b5IQx5LEadVOta3AUiu75qDcZS+B/qeASA4SPvD
         JbikVtON1z07fK4c9/P7eJ/8VxfBPclWOPeqR4YcceKQKAj/p5dlq0LLXa7M637f79UZ
         3oeVcbhWDbKjAwTT0NiZ4ZgaEi3yNsEFDo5LlzjLxN28Z0uq4jJo0vj+4JCi2q2fEBoU
         E0kw==
X-Forwarded-Encrypted: i=1; AJvYcCX8nEgFfz20nBuVpKcjoSmybLSDWOW3imQaip8+EoY8tm4SXfsH6tnWaUFrJD80pbKJQ5bFRu9RS5ZdOykT+f9um6XSQvHpay2k
X-Gm-Message-State: AOJu0Yz6gIOUysiz+7/eL9egh6HVPgMRcqB7Yq3Wq5LKqKLH72RHc474
	2WMWDWWrCDJp8faoCYF76hCij3bgyXx4QCaaaWYgaWskcvuy3luQavFbt510zg==
X-Google-Smtp-Source: AGHT+IEcf57nNkZHLpk4X+rVu40fpnQC+KxfZAodN+3tIS0La+wWipkcmp8niTZkNbjmDf9zGzJZYw==
X-Received: by 2002:a92:dd04:0:b0:365:b9c8:4436 with SMTP id n4-20020a92dd04000000b00365b9c84436mr25912ilm.10.1709143847146;
        Wed, 28 Feb 2024 10:10:47 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id bp24-20020a056e02349800b00363da909ebcsm2915892ilb.56.2024.02.28.10.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 10:10:46 -0800 (PST)
Date: Wed, 28 Feb 2024 18:10:45 +0000
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
Subject: Re: [PATCH v5 6/8] usb: misc: onboard_dev: add support for non-hub
 devices
Message-ID: <Zd93JZTlN4BCxWm7@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228-onboard_xvf3500-v5-6-76b805fd3fe6@wolfvision.net>

On Wed, Feb 28, 2024 at 02:51:33PM +0100, Javier Carrasco wrote:
> Most of the functionality this driver provides can be used by non-hub
> devices as well.
> 
> To account for the hub-specific code, add a flag to the device data
> structure and check its value for hub-specific code.
> 
> The 'always_powered_in_supend' attribute is only available for hub
> devices, keeping the driver's default behavior for non-hub devices (keep
> on in suspend).
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 25 +++++++++++++++++++++++--
>  drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index e1779bd2d126..df0ed172c7ec 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -132,7 +132,8 @@ static int __maybe_unused onboard_dev_suspend(struct device *dev)
>  	struct usbdev_node *node;
>  	bool power_off = true;
>  
> -	if (onboard_dev->always_powered_in_suspend)
> +	if (onboard_dev->always_powered_in_suspend &&
> +	    !onboard_dev->pdata->is_hub)
>  		return 0;

With this non-hub devices would always be powered down, since
'always_powerd_in_suspend' is not set for them. This should be:

  if (!onboard_dev->pdata->is_hub ||
       onboard_dev->always_powered_in_suspend)

Checking for the (non-)hub status first is clearer IMO, also it avoids
an unneccessary check of 'always_powered' for non-hub devices.

Without code context: for hubs there can be multiple device tree nodes
for the same physical hub chip (e.g. one for the USB2 and another for
the USB3 part). I suppose this could also be the case for non-hub
devices. For hubs there is the 'peer-hub' device tree property to
establish a link between the two USB devices, as a result the onboard
driver only creates a single platform device (which is desired,
otherwise two platform devices would be in charge for power sequencing
the same phyiscal device. For non-hub devices there is currently no such
link. In many cases I expect there will be just one DT entry even though
the device has multiple USB interfaces, but it could happen and would
actually be a more accurate representation.

General support is already there (the code dealing with 'peer-hub'), but
we'd have to come up with a suitable name. 'peer-device' is the first
thing that comes to my mind, but there might be better options. If such
a generic property is added then we should deprecate 'peer-hub', but
maintain backwards compatibility.

