Return-Path: <linux-usb+bounces-7364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CBB86D3C7
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 20:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C511C22DBB
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 19:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3613813F454;
	Thu, 29 Feb 2024 19:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V1UJeWzV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D07D08C
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 19:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709236481; cv=none; b=QhRSLcNiq/VrSQM+Nl9tTyVRLCeh7gqXUL5qlHpAyndccWvXUo2eEDEcpKOVG13Sj//NxJxOhp6d8vNBctclArXyQiLLpQ6djbjFSy737G7AJciHU+PgrXfSqIjs5BBbpAVlxOUBQlK3dvbCEbhE4rCQW1qbRxddmB/byxaAcRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709236481; c=relaxed/simple;
	bh=V5tqxVF3dkrvK31EtdECnEz+I9bzgrFJSeBVV6ZF86Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/RlBSv9J8Xhv+R6zY9d7ppxwi3Nxk+fMvZRk9YbLw1+MGXXfgazwwjm2WeutOVkAlvcMWoNbzo4oppGDa1qmlL2gORFjXvWJyltLg1jR/OamPk9YoQs0+JvEK6Ec840o9bIpL8nn9+2j+umrx1lF8dAbkLefsJYi/qImawFeWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V1UJeWzV; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-365337ad3e7so4593885ab.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 11:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709236479; x=1709841279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUYjDsz8R+v6rHJ3y7OAU2D1Csa/Qz5IVStrXkn7les=;
        b=V1UJeWzVshJMcHepdfCWJfdWHOR1OnRMF7dr/PosRSsn8+NYDtWwxq42IbT9hLX/Qp
         o7knhdBDcF2MXzcOlgB84TCLg5agWsUHJ8BSlipWoc4dwbZ5MvlhPAyi9P4h7XOqXe/O
         6EITAv6ZPt0faYCo5OGqkLJTqhzb8o2k5Vnrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709236479; x=1709841279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUYjDsz8R+v6rHJ3y7OAU2D1Csa/Qz5IVStrXkn7les=;
        b=tF2yEqylTUKR3NF0YYe0w4rcKCraNxbu0d5NlvgkVtFgVxTwg8GMZuebvBzB21CJul
         4wOUuVj8FW7y2EOGDp6WyYHVKKImGyxBTcOyT7nofQk7g6E1dM6Xu3lQDZ7+Nuj+aQGx
         cHngE0UVFDiJOJOGOpv1JzbgadZ94YfHrutSM2az41LLx+C8WJMVrdfQz1fTmHWVR/w9
         sIgSrlK7BS2l/njzFYxt1FUcQ0I1+WPsx/8Leodxm1E4NyZlsDtkPzFV/oGi4CzAqLOj
         EzM5XNT+TpNmEWxKk6h7FaqBRUBLdVtmWcfa7PSlmvCuSefC4D8tyAwfjtuvm/0zSeEg
         /SXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCzQAyppSBxkeyBNLqfTSfHHwWqUqcKhQnXO/skPzbJ8hjNYOfCihNCK5ah1K8pk3JDdObtmcpxPS2RT2lle8TrmfOqaYzy1+T
X-Gm-Message-State: AOJu0YxH+dVd7vTnFq5M5oi/jgGHUGUQ8rQJkdM3Lg833D6+G76tmqq3
	Uamvbywuhu+8p4DoGMMS8BnaR4Tdlpvw/VBKiPCmE0pPwcpSXeyipBTQAsQ+qA==
X-Google-Smtp-Source: AGHT+IGGZoKxldQ+DP+Axi8YKT3jN9VQUWSq7FAtq78rNujQCKd4lgSM0meggARCt9I6uWVFT1LKHg==
X-Received: by 2002:a92:ca4e:0:b0:365:19f0:f2ae with SMTP id q14-20020a92ca4e000000b0036519f0f2aemr40689ilo.31.1709236479442;
        Thu, 29 Feb 2024 11:54:39 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id l12-20020a056e021c0c00b003657f6b23e4sm497553ilh.68.2024.02.29.11.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 11:54:38 -0800 (PST)
Date: Thu, 29 Feb 2024 19:54:38 +0000
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
Subject: Re: [PATCH v6 9/9] usb: misc: onboard_dev: add support for XMOS
 XVF3500
Message-ID: <ZeDg_s4ob7TVb1wx@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-9-a0aff2947040@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-9-a0aff2947040@wolfvision.net>

On Thu, Feb 29, 2024 at 09:34:52AM +0100, Javier Carrasco wrote:
> The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
> multicore controller for voice processing.
> 
> This device requires a specific power sequence, which consists of
> enabling the regulators that control the 3V3 and 1V0 device supplies,
> and a reset de-assertion after a delay of at least 100ns.
> 
> Once in normal operation, the XVF3500 registers itself as a USB device,
> and it does not require any device-specific operations in the driver.
> 
> [1] https://www.xmos.com/xvf3500/
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

