Return-Path: <linux-usb+bounces-34043-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCJ0CUs3qWlk3AAAu9opvQ
	(envelope-from <linux-usb+bounces-34043-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 08:56:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650720D043
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 08:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAB8C3038517
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 07:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DEF337BBC;
	Thu,  5 Mar 2026 07:56:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B2336EEE
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697377; cv=none; b=MJbz/Vmj2mkIvl6PaEMnkXXXaiIsrogZYOxx3+jySoGnVED97nBb1ziJvbId7DluELIpHJzjw9h/h2WkeCRKgaFh2HJvPDL+elsUhVzY+aElXMvz1DCNK0htFVUYA93e5hlZyVitFEnADb+C89DGukf4a69EQo7WJn4IEXTFb94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697377; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GPdQq9ETX9FTFOqmjVUBP1yI5VMTzpc+n/NJcxsB54gaTK8R31dGUo0rWM5YepXOdUmyVl6rqFTWwtbUWoBusbyvJQf2IQReEC+5JUPUjgNQZMVmFEdcmN/2+4WQKcsqvuRcC4i+A3KXWhS2paX8eXFOq0pz3DZYrWBz6DSmEdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45effa36240so5775799b6e.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 23:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697375; x=1773302175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=LYIhYLDIL+hUlHhvZMaSJZFTnrGg8wLFbPeV9lK4ZcCJHRxQdo5MiITsncPXKKEpbc
         E6e69GyDTYBq7MzrJVk+QfZVQm3YsTTZ1O3htB4X3G7JXH0V9FvpZzN6YsYgj2URO4rg
         F6oarYZ7F0nFvJK/EDDzes2MtXK9KUVqeAaX1yu44xHGAOh/px87Q3xqxPNDcclAojqP
         Z8YfvQGnlQH1JuO5OZICliGpNxUkU1WeT5rvycW/9xYXAu1nYtvA/FenpSbhW2fMbq6c
         NXekEA+8/C5T/POvM/bnotht4U6OJOYN5qFB/zSKvLSMD+uJ588z5CBd0A1ZWPIJEMRR
         EHOA==
X-Forwarded-Encrypted: i=1; AJvYcCXAP4yFWMxv3c/HqvAlwEZBHzygjDLAIPygLUCF42sXZiydYCI+LE6FuLRIThjvFo62GCeWHUi1jUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyYIYJ0S3erneVofXBkOzhg21GU5TDtIUsLLfifrKh3kEttmGa
	bayJadR2r5V43Mbq0/t6r+R124ykB34Uy7z3eHPNUnmU6/ChV68JwUcbZveopKPW
X-Gm-Gg: ATEYQzxUfQdyx6NrMtDrmyANjGuKHYqsLE/edqZBlAIGNKYD3yOqq6HJOlTpVuoGMwo
	6dQ94ftSqBssm8tQoSx11xgIZK2NwTX2rCDSmddFyxki/ICuEP47MhSy1XUspezdLkzG17aSOK5
	lP59yF5BKknBGtPc7fcgv8IicB7ZQdtVwYOwf/w6efFv4NN9fJCPp5N/NMBR8JROZ4gNd8S6TtK
	Y9az6U1ASnGTnBWQQlCjlYcKCbAKiUAcbWWGidpG/7XjXiQJzjeak0ViICY2I6Y/QHXYftuV560
	5OqMvxIddKDuNrUCjjDIAywqP34UmHMxqig6a8r38UZ63gUQE1Cjy3A25Mhbx9B9B79HgIbZzcl
	gC/51Owwl/YVL/gZbK40LSD5ZR4k4JlBVBTmaQXwp8LVjJyVX81tQvW9dXEw5UIpi1c55toFsyc
	gu8umq/3FyWH079yrDZMf7iPbnCti72GGehsb553YoPPcCAK9hSMpUAywu/uhtQaTK1v4hZZs=
X-Received: by 2002:a05:6808:2202:b0:463:bef4:c9d5 with SMTP id 5614622812f47-4651ab4e034mr2525497b6e.6.1772697374988;
        Wed, 04 Mar 2026 23:56:14 -0800 (PST)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb605f15sm13235667b6e.20.2026.03.04.23.56.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:56:14 -0800 (PST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40438e0cba6so1931030fac.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 23:56:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVBJokIAqTwixNiFBgK7acEPOu4zyXEfPimL98PgPcdNvrfjx5zlkhJFN/UhB3w5XrPkh3ToVnpsAw=@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
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
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7650720D043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com];
	TAGGED_FROM(0.00)[bounces-34043-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-usb];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,nxp.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

