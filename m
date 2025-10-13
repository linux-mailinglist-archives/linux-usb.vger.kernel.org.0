Return-Path: <linux-usb+bounces-29218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE1BD2BF4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 13:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6627189D54F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 11:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F33024A078;
	Mon, 13 Oct 2025 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hrh5p/A3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B32045B5
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760354150; cv=none; b=p5x5fJMvPdhik/3l5vkQEHrrh6A6NejXFlfiBQfV3JnhT86hUOKGyReUOY60i2JwG/hAs9n5Wri5AUpnAKWHpp4/J3JI9rgNOfgiT1M1S2iiocLAxRqpsNzvB4ACfn9gqKEQpMk7OVkg018/s7jb0BPQM3iJD/yISpKWkGd5aJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760354150; c=relaxed/simple;
	bh=5hp9zUHq0R5HWrspQN9QVS3q1lJNHb6OVnyXINT0IWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7UKRpUlJ5JwbC8OKjpfzdObP4MmWvZL5tbjG7lyZgLAjf6kv0RYTylHiLG5r3XY8U/lUJS55WGIYat2KFGNF7spwbqen9e8qn9GUZ6syTliDU/1jDyWLX8Whazj3Ph+ZhZe8DSxEyjPKhy9Vis4CNFLFDek87nKDwxe2BKlO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hrh5p/A3; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-74435335177so75726927b3.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760354147; x=1760958947; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e3RISinv/bCM0VNwzTFAkKuvG5MysA9cPKKTeSuSvPc=;
        b=hrh5p/A35X0YskjPV8tyZs9aLQO7iYQDj3EPfqgtptC+Pc/1PoZIsPm1ajfDoUDvyL
         PYWGxfl8Q05kuXv/2NMm98fM4ecLFB5ynM3IU91U3IPnp6N1K6+WrZkdXzLv6dnHeRJu
         eC5cnNXNSYrWbqbK64YXWfEXIjTypyIVVAweGPcKG1L8aReBElmthjm841/ftuttkBFT
         w8GIXzdUf0PYHIvwvUnlB+BjOhT8P57D6r7BeH8EJ9Y8hRoKCh4TNKGUj1BkNVdJKzqS
         rbkwivOinGl/DagvGjdlzXdj0hIVySq8w46VN5v9lt2l5nO5GOk6bzSUI9mf2XSTPmSh
         GXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354147; x=1760958947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3RISinv/bCM0VNwzTFAkKuvG5MysA9cPKKTeSuSvPc=;
        b=hrWFgMdYNcMxPCItaB+6nHkK6kec1FbbeIHHFaNP0oVHZrSjL9t3QjDGa/bq8WSdB+
         Qvbz3k+A3/7vijtdOrjTamnJ/P0GIWs2BRN86RaMR7d764vdAH4CbcXgSbDBIfbZbG+J
         rifR2RvnWvRKKSEUFcLkebZtmwhhpZaBQH1NvC2D5tLF+NI5IVLLQ18oXEEIC6Ibhw6N
         qI/5Ul6oDP+Gmao+76p9xFlussipt9o+GGOzyi8f+yTaZC5R+M1huWqFF62uqj8MVOXq
         eoeKVEzpUpqPt50GGfQtyWlExN8kWkKZrorijbj4YiWZKvT87L1UgdO/QK1jPCnRaROH
         NRAw==
X-Forwarded-Encrypted: i=1; AJvYcCVOA/+uUJmfieYL13eNwZSD5TtQFMpY6RJl31p6ryJTC9iNrV5KVUYASpqCUUQ1L5PmHYLDy2hUgEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YycGJ28VlPp98uZxIVpon2n2FsXWUV41HT73drmawrBBcEqszM2
	z2m0aeMB+nU/HRsK1NXb94tggG5amFg63VWCGIzfHqZO0/uszbsICkgwEPAV5yPe/GGFGnzDnyq
	uVxgszACqhY9rorvmG/DkWFaIl7FB5OqkJai2gCH9Pg==
X-Gm-Gg: ASbGncuvZIHJd51y8ZSe3GJXb7MsU9dhKJVotWzUZI8tH/ORM4ne1QUnjzmpzhDTrp6
	GTAaED0PQIzEj0zef8b2IgvYsf1mPCGI/BJFaVCzEVGseu8f9bnC+cRVH0zIpDteDMlOTEZLA/8
	I9RgMiDmkvY7wnhW+zMiHr+TdJmTUNq+SbWDudYRTV7H00X34IoTIlgFbUB+bCmpLOX9w4l58HL
	25m60jYA1wdQKOhzusnykuwEirEbevnJFtP6bEmNhqObLEYUjDm
X-Google-Smtp-Source: AGHT+IHvEZE1RemEWZANjQdcYRJnmpKPuha5Rfx9EE12zd+TvLMKMu2rY0U/r/AG1D8YeV+4gOIdtjWRgw0qDfDMQ+4=
X-Received: by 2002:a53:bc0e:0:b0:635:2bc3:cb6f with SMTP id
 956f58d0204a3-63cbe0f580amr16932597d50.15.1760354147075; Mon, 13 Oct 2025
 04:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
In-Reply-To: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Oct 2025 13:15:11 +0200
X-Gm-Features: AS18NWDCZqKnJMG4N6L-Bv935qiWkmNc8DmpQMLFdUi5NIh87a_dGMaIYkUOIBo
Message-ID: <CAPDyKFrD9wJqu59HXJEnReCk0o74Ag+p987V6z53or0DxQiu0w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] pmdomain: core: Introduce device_set_out_band_wakeup
 and use it in usb
To: Peng Fan <peng.fan@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
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

I have now queued this series (including the acked usb patches) via my
pmdomain tree for next. Please let me know if it's preferred to route
the usb patches via another tree, so I can share an immutable branch
instead.

Kind regards
Uffe

