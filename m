Return-Path: <linux-usb+bounces-22493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CDEA79C2E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 08:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90AF3B4948
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 06:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E4B1C84BA;
	Thu,  3 Apr 2025 06:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n2xxLicc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87D1B0406
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662107; cv=none; b=tJgVsEQ0nqfs7N95raQPy568GiE3U1dncEeE/SAENYZ+ANZLrYyqULer+Q5hxNB8x/lRtnkCgGGJ6j4P/EYLpHZ3nT6StBns+c1cJ67ipZBSeRM5jl11huhZ7XAsRCS5CoMF09v97y8yln7EpgPLXnrxsRyzRue8zT1kmShcnLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662107; c=relaxed/simple;
	bh=1JsCMyMtHNZEI+5vuESB4ZV9tP0Yf/T5eFYH1f3W3iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrzAvXZZ2lhDUhBZ+Lz7qfbuMAKE5vixX6+OB6t1CdUWR3454C1YrpIHqN0S1IP80zqvZ6TnI8sLBYZxEXonYQ73KKlkOIXO57jaj4ocy0jF0ihPGLEZbJlPhPEQzmo1EPaWUjX+7mc+8Fi4aiWyJluz/X5a6aTvIS7X6dNeM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n2xxLicc; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bef9b04adso4592601fa.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 23:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743662103; x=1744266903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=;
        b=n2xxLiccuG8vsJ5RIDzmY5zehOua4Gobkrpe/P4f6ij0V7hQglsX1Eucwu+2udMBtK
         ewVERc5J1qlJOevE6gGfmdEcvFNR5KThK1dVZJcV/yR6vu9FVrvlnDWWKjcnTqmWxot0
         B/nMo56A5UiOeY00bjKachIgRw0UZuhqzhOV6TbqVLEygbcZrSsrziGPfw46tNdtSLZ1
         J9a965UZS7mpTARf3+9zCuc/XsAF1xyYsgpcxE5dRG4lOl/EFA0/98ODiaUQGDFIG3dJ
         9cjAdTnb+xaG3O9P3aHLZLt88JXO8sbW7yUTuyBaAgeisL3nOtDmb0dUpPbbX2tb7HBP
         VNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743662103; x=1744266903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=;
        b=UUncPmx3zfIGQt9xv0vI3VaH+MCF3moKREu3RnJObTY3o+4RDPlMclSApfCiUp6QQd
         UpxoFhiHKwETWvvgWYRR+RNiQ1fTfma/fbb6oGhS3G6tLT2BLcvx8hUUTZjdKehYlxGm
         +K0UXQlgGmHUEGbnlfDyAmDGkNa5PL+/D3hKryiy2FYByYPZ3lrKDVvk4vYRziJXW690
         0Y4TLjM5rsWQenxDdgMaQN0agVXLSg0gCSlIIWe+kLh+Xpiq8ZTlAwK/WuawbwOVE32N
         NDCqlpRO3nN31ZOT9+Qg6/VudBDFj5CY79QTZa2olHF3IshdSnSav19TEryqWIBcuUpt
         3K8g==
X-Forwarded-Encrypted: i=1; AJvYcCUDuuA7ymXGFgtplLp650PDPmlfHtkfygiCVu94V17nPA/f3gpuVsLvEA7cYvw9i7QbLBUH35n3lnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztzzdsKlkKXLvbesV7bvLqa1/+ZB0pRuf+meqKHNzhMpREbYnx
	IQvwADO4ZXXPOR4IaNofcgGjewvzUGZ6mmhDDy5n6wHoFc7mjgsUpOPyVCiIX/MOgLldzBa0UYM
	cbcu/qpOxm9OI3MKBray/4FdkKm1giS6NNZoEvw==
X-Gm-Gg: ASbGncurkdIIiIGpN5CufRyliaBckcI8SHveukoArBL4nXn42owDdloUQWZJHwokN/O
	3rVxdDmltusc/RMq3ZzpdYaHvajrFP+LT98B0cmtBiKfFoG7O1mWg1vMM4aJ/g0aSpU/2thAK/f
	jy9/ZjfydNnwSct7XhNw3bLsCnO8CLlG3j/juUgwloVaUw2r5N5w/8uwr97iTTYbIq/I0=
X-Google-Smtp-Source: AGHT+IEPn2huBHKsqDAGWpve5sAjpBNBnpMsrd2sYo/j2hYHK0dJ1WibZs+8/GvHbHlhvGsJDnxEjzhVpbqKnYaGX7E=
X-Received: by 2002:a05:651c:144b:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30ef90cd023mr19356701fa.2.1743662103234; Wed, 02 Apr 2025
 23:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 08:34:52 +0200
X-Gm-Features: AQ5f1Jo8XE_rqZUxS52BXanujb5HYu0Iq_OMLm_FELFmKt0f3v36UDRWRst9x2c
Message-ID: <CAMRc=Mc2DKnc1AM2WSApZtwOKCFGNZ9WF6LzzkECaV91R5w-iQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
To: Mubin Sayyed <mubin.sayyed@amd.com>
Cc: dlemoal@kernel.org, cassel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linus.walleij@linaro.org, michal.simek@amd.com, 
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org, 
	radhey.shyam.pandey@amd.com, linux-ide@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 8:09=E2=80=AFAM Mubin Sayyed <mubin.sayyed@amd.com> =
wrote:
>
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
>
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
>

