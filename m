Return-Path: <linux-usb+bounces-34044-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKr7DfM+qWnK3QAAu9opvQ
	(envelope-from <linux-usb+bounces-34044-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 09:29:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4B20D755
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 09:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2665E3050D57
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 08:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0224A374745;
	Thu,  5 Mar 2026 08:29:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60545372EF7
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699344; cv=none; b=GECuNY+j/VXgSr0dJDXOTPYzrsN++Qk9pOf+S8koz/ipvtqL/lRdx1G52WYPLS8yh9t0LSHefDuDoaPei/7v4aw8guSfKZVrZdW3zXI3GRLq8wgbdvyQcyvbw5ytniOLB4dBmixWATRF9UkQ3p99+ibmFMaKstwZc+MmjvIkSso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699344; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGzOMc0xW+QboeFQOxhuGqYIKTo5r/ijiRAwr3hgwWJesDSbbLp8PtRovHhSlIisk6NRTJSBoHFHINi0FguSZc6LoDwnp/GuibjVizyBQkS6P1MJrvLOVnyFrkZ3vLSjXq0X6raCNYHy3fNiVyvNALoGUwhYxUg+iNnPXXgE6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a981f44c9so3435364e0c.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 00:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699342; x=1773304142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=AYC9TUeNz9lByAG0szFGEsMO/LcaQFOCUZ+IqAaxxCFYoGMEAYpi2bZRkaF5A/zRH/
         5pKxJCwuaqzqx+XoYqQpada5k2+UoUbovaWjCft/svgjkGNM7+AHjW+StW5+bH9QHzIT
         K4Gy9D7SIbwM+kqJznVu9xVYi4dRDahREFOeOVfZQ6oYkIV4d5uAUJRjBDX8Q/nVjQuB
         ChTbeDRxSqCeOVfh6Zs8CsE3hQUnwq4vno0tLrOjEMqO2WJIgl81aWfmlHm/+XD89x/L
         Xmf/gi7+yTuT68FTYYdvlj6hUDP8xZDAf55AzUgzqk7yH4lLllYUXccEN/CedYzF05uo
         FqoA==
X-Forwarded-Encrypted: i=1; AJvYcCXipIk0GNW+9b6NVBzYWIQ+7H/jmUzlKtUKf4ZFyOPZTRQeStWnVyx72AVPskCpsgtwQtIR9FS+1Ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvqr4x3Hr9F+NIZt/wEwSsVQkvnZgtBK3/u6TCpH0RryFo/jx/
	YGpdmc+0s4hUlvpnTqxO8OFz4zPi+OHx5+FFXO5lbFcVIda/3qLplHoGxbycxc3l
X-Gm-Gg: ATEYQzwCTcPr8JCnZE3b/nrFxGepA1BnTt62+qSSvSPonAhsEdvgSoSGL1nltFpAtYo
	P72SLd3Ph6prUG+avhXZSWC/9K+LzwYYmkKFuh4uAWh1eSf/BRMI/Fd9oCC2TED7BqQ/grTSzsa
	2b2xH19DtSpHsf+jxBFY+AeCxyzTTHT+NDcU72oFQoLjv24tu94H3s2tfPNFQFJQEw3KKffsYMt
	eZf2xREavUurEtG2shJy3Lj51LuGyxU4Ltq1OJziE6iqJ2K2e2Jg4bL0I8DKqdW/vyEuv6hQNxd
	1lQ3gLX7G3rRxOLcDCryQG3gwSGxSUCy+sVYwVlS6P+FNz7glW1DMwDXFGOTZIsAycAR+sIko2U
	hZ5CCP5CkXHZdQs490PEptTZxLu962ks1JUKoc8kUzb+qMXDjw37w5JQWMsIDOg3qoQU3cGKsQ+
	CuZ5Wgd/1Zrb28rPwI9r4h3tprahEzs1Tb2yGAHtCWyUSLy/Y3b4gapjZTLTgz
X-Received: by 2002:a05:6122:2a56:b0:56a:995d:8a55 with SMTP id 71dfb90a1353d-56ae777ec13mr2420704e0c.12.1772699342378;
        Thu, 05 Mar 2026 00:29:02 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df644d593sm20257273241.7.2026.03.05.00.29.01
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso2333504241.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdi33Imj83zxpw2E061Wl6pEn8jHYf8v8+nHohCTWFCCk/tgKttsYDUZ73YMkvQTl9mffnflyZ3Lo=@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 96A4B20D755
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34044-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:url,ti.com:email,linux-m68k.org:email,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

