Return-Path: <linux-usb+bounces-9767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D48B1EFB
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 12:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C81E51F25771
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802B8126F05;
	Thu, 25 Apr 2024 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oy+eKMjh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648CE86626
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714040249; cv=none; b=KgPBQ+YoZQBZ7O0DbqHe5sK3Z1u6XPDiu21nm/hsUpT6IRORF/GU8sfx5jCb2ptAzmXD6ecO8THyWxDkYp/Jf7M+ZsblHooOxWhiS1Zl+0yriyQ/r5C5AENld2oc57EIFjLipyLFpw6Bl99EIn60jXQ4ix5A9/jGQWN5bwxia9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714040249; c=relaxed/simple;
	bh=BPeJNPgeuu5yEfnxBU92okYv01EBLJ2vMEzm8JSUpts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIkp90pqu0GbQvGU+VL/2oOVgS5HcDaHbelpMIYbJkZ/wtsVVtqcKb2dIT09V7pY5ZgdnaWjSOIWQD3xLWOYCSjr7RTz3B6BgOvF7cP6b+YzYyZCrWIewS75V+2QFMC1xP6nt9GkZDGjU6zu1pWFeL5Hmv967nv50UzRDIdIsjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oy+eKMjh; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5af2358c7e5so469043eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714040245; x=1714645045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fgWl3/LS6xcTJ1My1IOi3hltkpdLJpEDvFYJw1KZLA=;
        b=oy+eKMjhLlRSjIcb30pEN4R7ya29RGHbBagREnBGXUVYzonkCTxEuxPUGoOe1/jJ2I
         i3iHcMXnc1Uix8dpw7iXDkjMzJU6j1kKwqmx4nX5EwwPJwFzbED6ZngUAhAcOJgKaxL6
         Xqkr1n1HyjUuQfKiUh+aJHZFMOg+9ABtRRhqd9vH2HioBkShVE4wOHj8jqhgjnRHBTgT
         EZ0rJo76U1FLvctqif4uZwf4bxD7nendzevtMeHd3Xom8uP0rFLHjCAOijCKQCSKtaji
         oZ3iGQYPvBfggg40vffxa+NWj6IDnPnrws12CzaNdb0KQp1g75xQ9reJoskBEJE4we0Z
         UoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714040245; x=1714645045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fgWl3/LS6xcTJ1My1IOi3hltkpdLJpEDvFYJw1KZLA=;
        b=Jxdyb/t9qFigbjQ7jDvW3wCW1eOgLiMBEOis9esiU3phHKKjMY2xuh2vK4kwMlegee
         c8BlB+pLuj5JpPVKI2YCUcICh73KnAKLSW7Ie1TaW1SDyPTMBqQ3VRtJmppf6t95c8BF
         5Z09/QBriYyUuNRcTTc/p737bFbG3QWfxPuV7RXKD0JjDuPE8NBsDV3vJmfR0gO3Lpbf
         Pg7bXMOTpfJvFHSwQanfTO03WIvvewJGnBZOtzLIPRMr9p6ZkJdLLT8tsLnyfjlwXzSC
         B548FJTS1pEw2Ahfa6r7yB5ZSA+MK7XCFTmpLocOPxeg4Ojb92/CBmBt6jxYwouxDd+B
         J5+A==
X-Forwarded-Encrypted: i=1; AJvYcCV+Z32/R+Wbq2QLfFxPmmn3hPO3fzlQ5Hwl/U10aLxdyTII3E+/CwR27XLmhmAp03Qr7pdMO8w9KTxMPfo+XfPDhkGwMZq0OXzz
X-Gm-Message-State: AOJu0YwmbiA83lBuKEmcNMArfmIUc0ajSz/r9CutNSN6tLtw1JKijBy2
	ipoBbPNKHoTGN/JxKGyZUAKDL+fAt4n0s4eg7WXLrhfJN9Wwt3Qx8Nbg47JImg+ftwVC71No3VQ
	w91b8rY3atber3vucQodh5/vsJjEV3nAyxHCcYw==
X-Google-Smtp-Source: AGHT+IEtS55U01N1UHgWrnso9WLvSZJG6q6OApUI854HVfe3yLiduHtXnsLcr3c8YSqi3fNxiU17jRDnA4GPIckhyV0=
X-Received: by 2002:a4a:987:0:b0:5ac:9efc:3b02 with SMTP id
 129-20020a4a0987000000b005ac9efc3b02mr5567163ooa.8.1714040245481; Thu, 25 Apr
 2024 03:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org> <20240423-usb-dwc3-gs101-v1-2-2f331f88203f@linaro.org>
In-Reply-To: <20240423-usb-dwc3-gs101-v1-2-2f331f88203f@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 25 Apr 2024 11:17:14 +0100
Message-ID: <CADrjBPoyY2p1pwpO-wgMD_o6o1YjEAt_nmAnaniASHNoimE2EQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: exynos: add support for Google Tensor gs101
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, kernel-team@android.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 at 21:19, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The Exynos-based Google Tensor gs101 SoC has a DWC3 compatible USB
> controller and can reuse the existing Exynos glue. Add the
> google,gs101-dwusb3 compatible and associated driver data. Four clocks
> are required for USB for this SoC:
>     * bus clock
>     * suspend clock
>     * Link interface AXI clock
>     * Link interface APB clock
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

