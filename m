Return-Path: <linux-usb+bounces-32935-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMrZLlF5fGmpNQIAu9opvQ
	(envelope-from <linux-usb+bounces-32935-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 10:26:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07333B8E72
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 10:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41151300AEEA
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 09:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F2B34D903;
	Fri, 30 Jan 2026 09:26:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8D2BD597
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765195; cv=none; b=KeQ4A8NW96t84LtgTV0MVNMgpSZd8XtgXeZ5gtbHB4ENDugz/wxGNfKV86yw4R1boOmPGsUn9ZDy9/ZYBdb/WJwmIJqQ54nyIz1SLAw6qI40WaO5LjofLML0pVcEdhYEVEl0zLrUKEgNtGZJoX/lMN5zUsWDXN+qasEEegBQtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765195; c=relaxed/simple;
	bh=rb4EuzCXuTKTVqbpFElzoMQdpdnMXSS0x58YBQfZZgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CeT6Rl81Yr/hTa7L4ebYW69Voz+MdlsDd6RNf+AWLa5dvHFIe5nh/kT/3lXbSgOETo4bY5DFZQSOuqvxnIgueZwsG88kd+1lDHfxhupU2eKONYNo9MvbvB+93/tM7Jn5p0bkQQndqy8Ck2vVDCrhEpzlz2IiBZJ7McKijqyMTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823081bb15fso1064800b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 01:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765193; x=1770369993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV1LMONvjqxJmyWmmePKRhrEiX3yiJWUNyHMjjj9WKE=;
        b=Mghx/ay5AFFdvTYkI/P3O9XjCPJNm9c94pvTLrUNJHBgOtd9Zr6hzslnMtkSIsxj6U
         0Tp02zrxZ4szJnaV5Bfx2QWYFGzj8Kj+6G3gEQTmGG0PG0NgzTDgDaSPYU0JNLguLYfe
         MdKOGciRKPvBMkKMdx0U+kvrdAZwNk5O9Gk0RzrfOqcHlWl52W8YgYsyIDZibugt4or0
         TPxgu6FfpSZFe/Z4aKKhDb4geuaLyEMa670QdHIK/2mS+7XasWzLXcyFLGUOMk8J7aCO
         h5sQvtA92jx1QVRSVRnk9OuA2nttzbYOrZtmQb/ALxVwrIKSdx/9UmcZYcPdmBYI5c5Y
         fR+g==
X-Forwarded-Encrypted: i=1; AJvYcCUdEYQ3MuX1iMPptbhh0ROapLl7q3qSNDi+suWiHZdQqv/Ou50iZ9N54bNwpzGpB9TSmfsSskVQLBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNdoWNvTQkiKkoCcbpVY3JC6q2eTZTzwycscKvm+jFC21sCE6
	L14lWTAg3bm8RMngq2jDhHZgdR1BHq8JHm44v0UKH9izmcgtrXftcn98epmKrxJl
X-Gm-Gg: AZuq6aLuSk3lpfzX203rOdBG+HE/Ftgl6qkw8008T70SoJHCvNBHf1+mmm4lgtziqKq
	aMdmE+h1e4bAdrAM80M9GRtZijMZUP/7bH1Nq0/zcX6DZZQ+2Plr0QyxrrZEFEbGGbLASkgVRbm
	i9pk5Wp78jaJbpBqsYVbwT3Fh+YcWw9YBGnrr1p1StlfP6kQgQgZcZMRJ7kPfhmDskPT9C3sNvl
	N0VA0XYYQIKgnx/1XoDYyLb2wBwIvx6pC7qggcM/7RZ14FMkKHEuEMM0VE58aLM8xpZV520SdWg
	WJ1UHKe+/u9M4UNkqlT8RYAZCXQ59cwPCXD8ZE3CAyVCWP7e90gLzrQeHzhIb86sR5pm4nCtZQc
	GiNq+sbdNTtE2fzTS6FZ1JGz1oFc7AGZmhQdIshkj110Hij3MDx5GHMVuf6gOmWwmgrrEHAJ9oc
	mz3HKq6224XIXwnZxXIXCSapge5RkfeZlgBmjiqx0IpMAlv0bIjKuJ4h9GPw==
X-Received: by 2002:a05:6a00:3026:b0:7e8:4471:ae6d with SMTP id d2e1a72fcca58-823aa7376d1mr2211155b3a.57.1769765192950;
        Fri, 30 Jan 2026 01:26:32 -0800 (PST)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com. [74.125.82.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54ddcsm7324669b3a.64.2026.01.30.01.26.32
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:26:32 -0800 (PST)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-11f1fb91996so307371c88.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 01:26:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUq3NK/IihfyuB/Mc9SDtHBS85ZnY7WkbL5mtNSG1ovL4TSHQDMMRxoadVBOY8Qsl1IqgiyRoeaulw=@vger.kernel.org
X-Received: by 2002:a05:6102:32c3:b0:5ee:a0de:65ea with SMTP id
 ada2fe7eead31-5f8e25fcd99mr682216137.38.1769764782873; Fri, 30 Jan 2026
 01:19:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129165412.557643-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260129165412.557643-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 10:19:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG4o4-3tJNXnLgK6ejopfoN8Kp384my+72vN5Bz1AmXw@mail.gmail.com>
X-Gm-Features: AZwV_QiqqityMJ4wlbQdNw-loL8M4m5eOc3ehO8F7z2M2oZ_zXPwPRLyN4p_l4k
Message-ID: <CAMuHMdVG4o4-3tJNXnLgK6ejopfoN8Kp384my+72vN5Bz1AmXw@mail.gmail.com>
Subject: Re: [PATCH v7] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,linuxfoundation.org,kernel.org,renesas.com,microchip.com];
	TAGGED_FROM(0.00)[bounces-32935-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,linux-m68k.org:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 07333B8E72
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 at 17:54, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
> The USBHS block on RZ/G3E is functionally identical to the one found
> on the RZ/G2L family, so no driver changes are needed. The existing
> "renesas,rzg2l-usbhs" fallback compatible will continue to be used for
> handling this IP.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

