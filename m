Return-Path: <linux-usb+bounces-36779-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJGMJI9G82kMzAEAu9opvQ
	(envelope-from <linux-usb+bounces-36779-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 14:09:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D50314A2993
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 14:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AB503032F49
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 12:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F00140244B;
	Thu, 30 Apr 2026 12:07:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9083E639B
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550850; cv=none; b=gDrAklwC9uwoWvQadTURBo4F73t9UYl4izwKEZdtDJr47CSWeZC7JuHk1T0BYpPmtdc1Gr4owwztx5IUBrgg11bbQUvgBTiDVwbvz4pLdoL9uFde6Pu+fwHkvNEmqw1zFv5FRnuBSlVZuwGUYMVtPRn1S6r6TA3RAVKGesWT2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550850; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmigCrmq6kx6Fd7iUIyBqdBAVElSA0rSLGnyi+/0LLLKz06HxvCP/hotM/VFAjGNxNgHUxkUG8thQ+T2jlkTQAIUgCTakZHq0SIvTnc2KUoxmv2qsQBhyGkQgYZ1wAEZRVZ1aL/pyUfEmAtzFMf8dg25EDaKqxKkgEl5+gvSq4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4645dde00a7so1352730b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 05:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550848; x=1778155648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=NUKoQt7cc6FKOYwbxXmQTq+M/zpA28x5PbjA2y5lnT4Rl3ajElamfZUXsjYOIyxMYj
         sRD6I0MPne7xyt3SVTGkHxMcRhDtQtus+jTz7XbGOqLPx3BaM/6TEMV7z4b/5XpQJvMp
         M2u7viVIfeOQDkNm+xLfZvFIUsPNisVofssX1FIYoP4s/ce/7HUhTj2Bygcyz+zusjNe
         VIZdsNrJ048kUdIqg0bSgk2rdgnKpDSL4ps/RmsCs0zlnaoc1S3sF+Uf5QWJLzx3FQHE
         iquatdW5VUNky2MhoLmQWWONk7lIoLWbPfR893CWFyG5I1UQxY37FzS01M5pZN4XXvjq
         fG/g==
X-Forwarded-Encrypted: i=1; AFNElJ/mdZ1c23k19R7vMM56tpFv/HBGIcDmTC7UheSvhJYH4pP8Up6LNbaak64EZgAaoJ6zFZ9V2oNk98Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqCnWALcGkJ489n37lKn6SSLB5u9Us9//y08tQWdae3KpiZtj
	anWlwl/htUWYo5bzb09vTqTPBmufVsJ3oir2ZxN/6Cwrd75WSucEIGyhAmbjU6IqYCY=
X-Gm-Gg: AeBDieuivKwYYF3951vJxNkQThildhhh0s8sUUzwCKQ+ydTaEu9x9jnYIDRTZj11Rev
	61X+cOT6QrabcJkyx769U23QCL/UvpU7+9MnsBUHj6KE/MDiEMhdCA3/qibaZUgiyhBdHfL1kZp
	5AYyOyMOgk6M8hgNwReFnRu6g11qiCaalrcjl/mL0I2HcBHsymXgVwq5SUjtIkP+bofAggF9HoP
	eARUBafzVt2924Kg/kMokeJOF2m0Wpqb2XtJUazKggfDxJQ6Ja53TyK2h9ysjW786b3gBHlV9Rf
	ToE1XvOZckRPC4vOtUOB5wGiz1r9jM51vIyHJzd7aYt9qNzYiahD2VNB6D7KTRWp8Q1LtmDh4Tr
	lC6J7QrhTd7qi9+aal7LbkA9C5lsFeymkE0jBFJEbK+sW5MOg122UStX6LkK09/aQ1a+1SvqXSb
	1cQEWGvO9FV6q9rwKJlpQ41is2OUxP37DNVhkbBG1GhIThfwPXUhKbn8wUNrJz5KIE1KRlJ7I=
X-Received: by 2002:a05:6808:220e:b0:450:b249:71bb with SMTP id 5614622812f47-47c620e602dmr775910b6e.19.1777550847979;
        Thu, 30 Apr 2026 05:07:27 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deab839620sm3291243a34.12.2026.04.30.05.07.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:07:27 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dcdd1b492eso901372a34.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 05:07:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/BurWtGUL397SrdNRtsGNldSeopu5OUZaBm+ljXUUagK6JENHV1sJNmZYAWOKNgR2MZPhgs2149Ys=@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D50314A2993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,baylibre.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,glider.be];
	TAGGED_FROM(0.00)[bounces-36779-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,nxp.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:email]

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

