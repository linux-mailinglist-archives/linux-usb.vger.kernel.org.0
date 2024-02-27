Return-Path: <linux-usb+bounces-7151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99C869EAE
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 19:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE3841F296C5
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 18:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF081487C6;
	Tue, 27 Feb 2024 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eyUIl0H7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA575145354
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709057567; cv=none; b=NwQhyqlt5+zxLAmRzUSfK9aQwSCyts0m4E95RxItJH/qMMKB6Qz4VYMxekaOFPh6zbnvG6K+NOZbr8iYwmAEuOkMCCvHBuxCmML+AmbuNhtZW6IwmOGlKo0Yg1IEbdtN56PBTP7zBJ3Q133MlR+yq94DL0mEyQ9wQxWSGbKlzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709057567; c=relaxed/simple;
	bh=cg9qu1nZlxnC68Ueeoocn/P6r5hs5t9MDoe/bzmk888=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R51450x7kCjzUFLN0SkykrAoDAWxQB48KbUMc9p7WeO9SUYtYN2hxt3fWjLq2ttMTwGxJk3wurEagKss86i+1akIUbB48I/MECZnWbD4tz6QoFtnE+Qk3hdvT36dwadWoKsTnvOan0Ly/ScBsi3SH9ahntVDiO4mmDs0VJGqQcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eyUIl0H7; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3657c37f72cso174165ab.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 10:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709057565; x=1709662365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9xo3DafYnz7qDd1iyNarBE0C+acGQnxfRXgU4VP6u+M=;
        b=eyUIl0H7ncs3ylQqTu0mSwGbC82HxXtlkyrkqFfGcpyR2+v3Btg6IxUiNmsjjX3n3u
         XVK1keJtroTd/pSf1TVj58vuG3el2WjFuos4d/z1+qCNkdyB7dxdget3J41HlqPdLx7P
         aJTrDFzRIouwfVNPGPxRo+oToe/7+a9UBOdQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709057565; x=1709662365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xo3DafYnz7qDd1iyNarBE0C+acGQnxfRXgU4VP6u+M=;
        b=SsUgkC7AAZ/Pl8AwA+IwrfSaC4iTXdvNfWEDie6OPNh1Q5cF8sh55s6PIsiNtX96am
         XSZ6DjyNwxHvpDtnodmsnXNtVBtRfYd7K7BZWmDyMLL/pa+LixtRu0K0pybg0Lq8gB64
         nmdD0TBlg7DncmH1igyrZ4NOMo3uzSUFy/pibwKihK9p8pItP3fnCCB8iP6ICwXcf7xh
         RTiK2UUf++oXD6byuW8jNZ7Rf8O3DfIayb0YsV3wGLayS6ZIfCStA9RQAc1zy8lsBFpS
         oWb67IZYuw+d5l+gAi6GnGlN4/fYPbyveejb7j8E5jKwT1K0uQzf/Q4xiiK7m/N4e3y2
         levQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYsFHXltg4vjpW99gavnA3Ig2uV5awsA1jz9bw1vYP6tkqiiJ7E6UybhmcMgXiDFv85aFDdrk+HtQ+CAM5wLUeL5XMzrp3xXa+
X-Gm-Message-State: AOJu0Yzrf/PewqEndmQfIDi7mOtg+kLYc74EEM1bDQc6O7V+M12PhKil
	3gJG0pqVC7Qzv9/kT/piH0kCdqlNSeUYj2nk//AHSbpeqO8I1XR01i0UH7824Q==
X-Google-Smtp-Source: AGHT+IGjrhhbq3O4yJbGQNPJHVvQDH/cLI79okVS/czvt6vJUsosc4jtEJE++l5mG9grtKNLuUoKMw==
X-Received: by 2002:a05:6e02:1aae:b0:365:b00e:c3cc with SMTP id l14-20020a056e021aae00b00365b00ec3ccmr105566ilv.2.1709057565143;
        Tue, 27 Feb 2024 10:12:45 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id br17-20020a05663846d100b004742452a382sm1963310jab.45.2024.02.27.10.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 10:12:44 -0800 (PST)
Date: Tue, 27 Feb 2024 18:12:44 +0000
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
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Message-ID: <Zd4mHOEs6tHELUXl@google.com>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>

On Tue, Feb 20, 2024 at 03:05:50PM +0100, Javier Carrasco wrote:
> The current mechanism uses generic names for the power supplies, which
> conflicts with proper name definitions in the device bindings.
> 
> Add a per-device property to include real supply names and keep generic
> names as a fallback mechanism for backward compatibility.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

For v5 you could consider making this [1/8] (i.e. before the renaming
of the driver). That way support for new hubs doesn't necessarily have
to wait for the entire series to land. Since this series is underway
I think new bindings shouldn't use 'vdd-supply' but the device
specific name of the supply.

