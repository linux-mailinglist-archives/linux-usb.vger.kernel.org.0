Return-Path: <linux-usb+bounces-24328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90486AC54BC
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 19:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D0A1BA53A7
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 17:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A0D27CB04;
	Tue, 27 May 2025 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R9+gYJCf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F6427A115
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 17:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365379; cv=none; b=SzGYXUezHWu88BdDiLGr8XU4RJRPQFYBmvG0RKHs+nTA0wmAk8zR/Z+RUACdBZQuTlqEpdUeob5uRly6Zpo9pkqEI3Sz9GRKPJoh5T6tvTcMd2XniQ5YAWghOF0gz6pbITR571G/LUMi/KfSu0ozy0ry/4cYIcxSnfGzkRhSgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365379; c=relaxed/simple;
	bh=aVeuz6U3ZP8Pi2cSgrUYzQBvgbejSBQthrlVk69LKvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUzjwWPZ8E4bf64UaA6ooHOET9/ZbrmI3bqFL8VPjsnRc4GFElMLR1lFVz37QhdHDZWkek1s7FocZ9ZoXMeZmWekSEnNHf51kdgdHIEBqqwlYpERVQ9tthZZ+ObIF6aD+m+cLNDvl7ddAzN3Y1Qfi5l3tB8417lJBlsC9Oek8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R9+gYJCf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2747855b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748365374; x=1748970174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
        b=R9+gYJCfyt+qC0bTyyNlsxMYATiu0AIXzVcthGoYk5F/D0dmysQrlOkVaikxWlN8Kw
         +Z3IhN9o4753xIkEKL4bbyQtNy5K8wV64TriZI/dlcuZhVMM7nRBwJbSQlZEwRGJCwDe
         Ncu3PB78RvmAwbA+SqrmaIWjOH8Cs3jQlqXUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365374; x=1748970174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1cD0wSUoGRAfow7hZRrSlocwlqH/rpj2EVVATTYGe4=;
        b=T0QmlG+6CnZ8yUK0zCyDaYnN2GXhF9q3qb7sRGdah75vM/gTgcFxoc6vAgigmOaJx9
         izUG353GyzoRP9tawpR14w93ii0cbygjGFAh9xBdNhrod0QF/VUn9S6mTiSkxW2i1SR6
         sEUuYaI/q0lsCMS9YAuJogJR/JUAzVj0o3tybtzaRlqWjICLjvEWwuzIypgOGWL6APRX
         KYdO+tFHYxDorRYYli2nyuoZDFADFkqTQXNdVPIrXxOGJGpV2QpiVMJ+luhPkM/Z+cBP
         GDyJtvCuz3R7xBoBS/XjGsRvPHlIsmz7mMiV4Tu+O/JsfvOM+LTTTV0TIRpGAg6Z9QTA
         TKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYZFcTuLAl1AEYISuesqkp4ItB1R8brlcYWfE0L6bfeIkiMhmCAetEKtzdqPWAQqmAi1RCAsIu4V4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywciu/EkFDkViXTGGmUrAb56YxqlRwi/koamqR4hou7CF8gGtMX
	HxAK7MknnhDZK9wak05nFyOh0ff6uyyMO1+b/Zpto/YEex5s95dAXoBbDsyfcMDX5urWruAEUl/
	wFrM=
X-Gm-Gg: ASbGncv1ouDVJIvwwisYxaA5X2dOAd7Kr1vUayIz5bDzAqPMGyqzSiG2IFisdMFbL4p
	WSH+hQvTcVI97AI9n7hVdaDsg49JgWJ0kPSMNqSz4XdKCOiSonlx8cFzquC5mp1dYHFWcNvg4GS
	tSs3UyR3b2i13kkzbANnPmiLcqiQG+pzmAL97m/nzZ4A1bQAf9QVsS/zyQqds2npvprAmW98C2j
	tktQxT9B0TOs+2J/sK9kfSrXHnf/0bNcUb8Q2nC6jLKjQbFdns729KoSYUKnZw6Kr/7Of1tkfZK
	0+Lx9bJmnshsFfuxJPxN4RH3nCpWgBe1ipIACbwItZInYmDdavAOIz6RGciBIYf7beKlLl6mJ6/
	ucg67aWjoQgdjryUPO4c=
X-Google-Smtp-Source: AGHT+IEe4Wtmu+XCx1UIDEIu+pkeIR9dl/vmzw3G9zcUS6mzPZxuWaZSMMDJa1zKpRRIDa9bzu50Fw==
X-Received: by 2002:a05:6a00:2287:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-745fde779e7mr18567531b3a.5.1748365374322;
        Tue, 27 May 2025 10:02:54 -0700 (PDT)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74624264eb5sm1879149b3a.171.2025.05.27.10.02.52
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:02:53 -0700 (PDT)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c41acd479so838148a12.2
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvI7MbhUclvVWj+U0MWC98+y9cx78DRCnM3dK8wSw9BR3GqDXHVqLA8Uw4FhzeU9mcwvq+Awc+rmI=@vger.kernel.org
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr23039125a91.10.1748365371916; Tue, 27 May 2025
 10:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz> <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
In-Reply-To: <20250524-tb16-dt-v4-2-2c1e6018d3f0@oldschoolsolutions.biz>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 May 2025 10:02:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
X-Gm-Features: AX0GCFuyCqgo7k3OkEiBoeoIIm92d204Z5xqTgDrr1m_iEfNQkkSSlBFML6TL54
Message-ID: <CAD=FV=V1-xhzWjftAkSiwTR5AE=2nGxFSaiv18_KXFJkKL1USQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/panel-edp: add N160JCE-ELL CMN panel for
 Lenovo Thinkbook 16
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, linux-usb@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, May 24, 2025 at 4:48=E2=80=AFAM Jens Glathe via B4 Relay
<devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
>
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>
> Panel is widely used in 16" laptops, and also in my Thinkbook 16 G7 QOY.
>
> CMN N160JCE-ELL EDID
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 2b 16 00 00 00 00
> 20 20 01 04 a5 22 16 78 03 28 65 97 59 54 8e 27
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
> a6 00 58 d7 10 00 00 18 35 30 80 a0 70 b0 24 40
> 30 20 a6 00 58 d7 10 00 00 18 00 00 00 fd 00 28
> 3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 36 30 4a 43 45 2d 45 4c 4c 0a 20 00 95
>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/5] drm/panel-edp: add N160JCE-ELL CMN panel for Lenovo Thinkbook 16
      commit: 126bf397bf58485cdd631824190cdcfeb86f5d9b

