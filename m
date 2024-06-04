Return-Path: <linux-usb+bounces-10812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C86348FAB67
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 08:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6673BB22830
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 06:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1861A13F45B;
	Tue,  4 Jun 2024 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NqNM5DeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EBE1DDD6
	for <linux-usb@vger.kernel.org>; Tue,  4 Jun 2024 06:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717483986; cv=none; b=mpUlO0vGzjLAqjY46MO+Dn9sf7GC8S7OYtiX6EROXesdLSwURKu11Pq6yxHbENfi20xzj+wy7YsNUTt3iofR+cKTknSmhrgVepBGO3TVm9VrlG05OR9fuTrgYGZ+Ru7TJaHVMk+jh4YQAEFKL9HKhaOWgB08qYo6keI/W3dCPo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717483986; c=relaxed/simple;
	bh=Q/s+/2HLOEshSXyevA+kwwuV9LKh61E8wNAoTbTnOcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8P5XXjtFry812/AOW1RR9GMwSjeWeXR0lfzaQOtOiDhEcyH6kPQvtVZvykcUEcnrlYxWymuBIawKUCz3FRJPbem8KNILEp+UCLtiEe1UaQnSLmEkQXPeDPEMdC6tT1YuLwNR3C0iVG6RZ9Bcy+/TGpJzh8eE/dym7Wte5XfuJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NqNM5DeU; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eabd22d404so5754071fa.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2024 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717483983; x=1718088783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxQuguER/BLQYm1ZxDJ/qSzZSNtAmQOi2t1QHj9aOVI=;
        b=NqNM5DeUKXfcBuHHiexLviXzsrj8yeBF8DLFI7inoLjekwHDBLbj9KnuG1hjzr/AP0
         dSqCRHsIrGOS5svJcLvUF7Egf2lJa2ybYsGugqXz2n02KLLxw/hKFQuENQ48SjwFbrR9
         Q2y/xw3JYOsHYcrLaAvSvmmGBVkaHzOBKyHatvpVnblES9/YlQGj91HhXPWIEyyeHraA
         sm+y02xkbqc7NBkM+OTdNXlpUq+XH+0vr4aopphqHMrpjLFV1mJwHqekAHoVzjyyYdYy
         Z06dDGmk7dIIu7fD11Iq9j4PHmyX6rH3vGqOvfxTxzuWcnt3zOJHni5hWscUvAu4XWfS
         MH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717483983; x=1718088783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxQuguER/BLQYm1ZxDJ/qSzZSNtAmQOi2t1QHj9aOVI=;
        b=ETxgO60kDdPPVi6bMuJLpB+SgkCVY5NSMtbP7fCy07NSRB2mZmW4oFIPApTZBjEfVV
         JkzyAHwHKcQ9SHR+m9GBTefOysARMV1iUw8YBQQRCtnpiRHiEz8iK8l3z886C5N76cu+
         KJ2SqZXbrckY3wE9rII4c5mRZ+N/JnEXYYUFsjKaLc2RTD+RgbMcFYnJSzGdgRC9tqQ2
         ddiIoKxGOAlPQ+ajHJ2P6iTjYojU9sSNhnNOymAgPjYVfi+pg4M/i6x/WviiGsJSJJLd
         4kGXEAOfOODtwwQvYYjT/ZqdUHW2vBkocM6FsCQKi3sJjzeX8jXcUUXnhaMsDE5/10Al
         bZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3eir4/4oE/4cjYmTDuY3M2mCOhHtnoeEuyCZbBE1CQDOF+HE1CTA64kAl4yiyoBKGnIPj9AAvXb9ByroEUjpnKVxsqC1Yivsz
X-Gm-Message-State: AOJu0YzwBrnz4TvtMewl8hsvnk57LzgzAdwDEROTBE5YOHWoSHZvWfCn
	ezLwHtToEQgYKz/BxKnsIuxCOyGGNiLuwHRE3ju8Dnc321YsXsYSNZQf0uKOFxjxdCMTv22P7EN
	P81D4m5PLO2Q5FXjv8jOXTNUN++b7sK9+oqgBDQ==
X-Google-Smtp-Source: AGHT+IHggwyuAzryxCFutJC1tfJ+3ZKkr//fbN9+PVWQCSu4HBedgiEUAp7ppj5bkGkwiOXOwRFyEwgRUKUmWYk9oag=
X-Received: by 2002:a2e:9016:0:b0:2e6:f1f6:7dbe with SMTP id
 38308e7fff4ca-2ea951e1cccmr71890431fa.34.1717483982951; Mon, 03 Jun 2024
 23:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527144538.155704-1-brgl@bgdev.pl>
In-Reply-To: <20240527144538.155704-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Jun 2024 08:52:52 +0200
Message-ID: <CAMRc=McurmN4Hs2MVGCjF0z_FX+84v0psGuTse0K7caSVF445A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: set minItems for interrupt-names
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 4:45=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's a set of compatibles for which we set a strict list of 5 interrup=
t
> names even though minItems for the interrupts property is 4. One of the
> USB controllers on sa8775p only consumes 4 interrupts which leads to
> dtbs_check errors. Make the last entry optional by setting minItems to 4.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> index cf633d488c3f..4251dc25ee9a 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -468,6 +468,7 @@ allOf:
>            minItems: 4
>            maxItems: 5
>          interrupt-names:
> +          minItems: 4
>            items:
>              - const: pwr_event
>              - const: hs_phy_irq
> --
> 2.43.0
>

Gentle ping.

Bart

