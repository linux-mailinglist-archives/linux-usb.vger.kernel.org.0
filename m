Return-Path: <linux-usb+bounces-28527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19185B95635
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 12:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0229F19044E8
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 10:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092F03195F5;
	Tue, 23 Sep 2025 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+qWWHXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB32BE7AC
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758622064; cv=none; b=KHSL0JV/Shq2R/MQ1AVJL6UHOYuM/a9Z/b676vs/DED70f5mNbZdme2ZPgIKI4okaO+Q+0V4z0QDY3JfaiKhsgO2ipyEvpN7TafpwrAXwyI27/v7Hb+peaYZVMjoss6M1oal/FkcVAhfqFpkqO5eCBUMbcYv0wQAG+AoBAi4a+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758622064; c=relaxed/simple;
	bh=bQOqaLJR5zKAy/fphonDt42OLEIusrKcvB8c/rOq52M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3pFmwK2ivyHOtW83lPh3qR1H7sDNuOYyxS45mEb6q+I4mvadjRUWl536HP5jzhLJ5xOEvTo6K4U4UNw+O+BG96TiGuM972RtSIeyj2/mRrxyU7xiiETP5TLu8h+qk1zdj5fj49UQxmk6+3dGiXQI/m1B08TsINGtZagcgtpFrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K+qWWHXB; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e94d678e116so5836332276.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758622061; x=1759226861; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=;
        b=K+qWWHXBMQaYzAIUXkIxapWaHkR27ysWbvbKESnmywjuZuaOXB5X1vHBrggACr+G6U
         l7YKWKgSyrpyDx4LkWxlnle6qh9KCkhsFIdkE1a08/VNNPkLvJoJK/07yz3ti7fWXh5m
         1LoCN6uK4V2v8GlzqvxIONVc6GnhAU2ywjghjax6J7cz1u7wiw3ZKvzL9zVMUqxqiHpc
         yPtdr146JvnY1BhUgoJswmQjjVWh1PyawOCCg5o/0AT82uGUeVCs7Xw3i9X1QUTSgulW
         bFlKy+lMEqXXBjlxFAuDth+04YoJoV7FE1FHHAYzPRcSmzVYGpzagaOcKhn3r+Gsx8ls
         PkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622061; x=1759226861;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojpUE/397K3hT2SeOTA7WD+7AwLIZpK/S+c+xT7IPV8=;
        b=SehAEBGD9GEKvHnIw8mvz+zAC/d2wXei8tzq55FqiRXbO0yybAUZWWwRKd/L0C2It2
         fKNzMDy+uG2o76sd84pt1rV/iu4BkRokxkr5PjP0EhfWpUI/nwA0W9YzQYdK91ku5XAE
         vU7hB4Bn0p+8bbq+aARBtH+rXCMKel1zgmWGLj0pp8m2wqyCHLwAs0uzuKB1m0XHCY4R
         Vu32I/cbuVWZh0+jK6FMwA2KJ2uAu9iQ9k9sxjzNAPOkPEZ1JRNII973ld7MUulVzpev
         mQTBUg3tsJsVpyODI++94W67UGw5BchURJGZR3wxmA0sNHH/9RNL3NKlbf4qQmn8rtsh
         2jKg==
X-Forwarded-Encrypted: i=1; AJvYcCViNh9/hvixPfq0f8gCU8CW0DC8hwl4aZYgsd5KwPg8WvH+IJJfrTQ91iFfGe2Yg4VFG3eqEPTvL2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tBMdB66l+E5CBxqqAEeTHXH6sszmajwCUCfkgHzjOtfMCNAi
	3E0yNuM232R7va53FXsWEzEjzI/rTzO/9Nl7j72MQeCewkTXIWjVJruzROcEnPcObea8p+vAqea
	cc1S9HhJVCC1Ap4+nCttPuLjLC8aCoqMZwsHLweLWhw==
X-Gm-Gg: ASbGncumWBYOxQ7RsWI/bvTDqb1uN46OO6nY9RucqLpqHvkhOhSjZgF/8HkYrIMUMiy
	QFyxeMIVWw7mBc+X+kj//7y/yQNEW3Yg8GjlFbHfx15jBK2IeE1bsaQzvzwQk0gYe4oWYEtFz1B
	0mzlmaLfiRTjkxai5z1q6/r354KkqrVt3jhd03wXhi4tvcT13ONroF7x6/63inS74dCt2IlQEsd
	eK0o38In0LFGlFkA/0jSHvXXlA=
X-Google-Smtp-Source: AGHT+IFhxlf86kDMDK+HylKCRC/N5p3zMoJoowC3FVqGT2cdilfpDV8hTWNbOBBgYUOugMrwO5a4530QKfNhuWHjCzs=
X-Received: by 2002:a05:690e:1585:10b0:635:4ecf:bdcd with SMTP id
 956f58d0204a3-6360465937bmr1446230d50.47.1758622060562; Tue, 23 Sep 2025
 03:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
In-Reply-To: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 12:07:02 +0200
X-Gm-Features: AS18NWDUj1MIxdJxsyJdieUpTgmYfT34J9KGqEYqJqgWA33koJyrgJvf8IadiiQ
Message-ID: <CAPDyKFqQgS9j4uGkTL_taPTL96su1tqpyoek1cpZgTiaaBMpCA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: "Rafael J. Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 04:21, Peng Fan <peng.fan@nxp.com> wrote:
>
> To i.MX95, USB2 and USB3 are in HSIOMIX domain, but there is always on logic
> to make USB2 and USB3 has wakeup capability when HSIOMIX power domain
> is in off state. So when in system-suspend state, USB2/USB3 could wakeup
> the system even the USB2/USB3 HSIOMIX power domain is turned off. This
> means USB2/USB3 has out-of-band wakeup capability to wakeup system from
> suspended state.
>
> Without this patchset, if USB2/USB3 are configured with wakeup enabled,
> the HSIOMIX power domain will not be turned off. This leads to more
> power consumed in system suspend state.
>
> This patchset introduces device_set_out_band_wakeup and
> device_out_band_wakeup two APIs to set out-of-band and query the flag.
> In genpd_finish_suspend, there is a check, if out-of-band is set,
> it will continue to turn off the power domain. In genpd resume flow,
> there is a similar check to turn on the power domain.
>
> Patch 1,2 introduces device_set_out_band_wakeup and
> device_out_band_wakeup
> Patch 3 and 4 are drivers changes to use device_out_band_wakeup
>
> More old discussions:
> https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> This is pick up of [1]
> This V2 patchset
> - includes usb driver changes to give people a full picture on how it is used.
> - Rebased next-20250729 to resolve conflicts
>
> [1]https://lore.kernel.org/linux-pm/20250311083239.3336439-1-peng.fan@oss.nxp.com/
>
> Changes in v4:
> - Split device_set_out_band_wakeup API and pmdomain changes into patch 1
>   and 2 and clear the flag in device_prepare (from Ulf)
> - Add R-b in patch 2
> - Move the call of device_set_out_band_wakeup to system suspend
>   callback in patch 3 and 4. (from Ulf)
> - For patch 3,4, I still keep the Tags, since compared with V3, it is quite
>   small changes.
> - Link to v3: https://lore.kernel.org/r/20250902-pm-v3-0-ffadbb454cdc@nxp.com
>
> Changes in v3:
> - Add a new patch from Xu Yang to detach power domain for ci hdrc
> - Add A-b for patch 4
> - Link to v2: https://lore.kernel.org/r/20250801-pm-v2-0-97c8fb2a433c@nxp.com
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       PM: wakeup: Add out-of-band system wakeup support for devices
>       PM: domains: Allow power-off for out-of-band wakeup-capable devices
>       usb: chipidea: ci_hdrc_imx: Set out of band wakeup for i.MX95
>       usb: dwc3: imx8mp: Set out of band wakeup for i.MX95
>
> Xu Yang (1):
>       usb: chipidea: core: detach power domain for ci_hdrc platform device
>
>  drivers/base/power/main.c          |  1 +
>  drivers/pmdomain/core.c            |  6 ++++--
>  drivers/usb/chipidea/ci_hdrc_imx.c | 11 ++++++++++-
>  drivers/usb/chipidea/core.c        |  3 +++
>  drivers/usb/dwc3/dwc3-imx8mp.c     |  9 +++++++--
>  include/linux/pm.h                 |  1 +
>  include/linux/pm_wakeup.h          | 17 +++++++++++++++++
>  include/linux/usb/chipidea.h       |  1 +
>  8 files changed, 44 insertions(+), 5 deletions(-)
> ---
> base-commit: 8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
> change-id: 20250919-pm-v4-1879568de500
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>

Rafael, I intend to pick up this series via my pmdomain tree shortly,
unless you have some objections, of course.

Kind regards
Uffe

