Return-Path: <linux-usb+bounces-34042-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPDpDKk0qWk73AAAu9opvQ
	(envelope-from <linux-usb+bounces-34042-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 08:45:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51D20CD90
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 08:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C02C3021409
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 07:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B476B329C67;
	Thu,  5 Mar 2026 07:45:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DB26F2A1
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 07:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696738; cv=none; b=QuSc7mHVV8wDNJFAAEeLkI5rlUuuuQkz8DbhZL4HlZqBIryq269RKmP0Iqg8fTSRxody1QNV5VOEPfTYplEtEqDlsJrfk3kCUDt3sEloKMI6ZfzhJGzpebG3Ux6i0NIHK1FnRog3gNi5LTj+1eur+qnTx9UQ1Zh4ifGR70rZF2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696738; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OX94XmptZoSnuM1oDnLJNQAFLiwUu4vgCO7tX+8P4sSSa/etfxj3pV4IG+1ZzvKkuOyYu1Kd9R1c3qNAQhE9V4F1t1gA7FWyy+R2gof3Oz503j6AiWc9e2QxGc9Eo+e/YUyCH7OfFPGoOrVAIn1hNbTy3gwiX+GHsO8ygzw/TJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso801722137.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 23:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772696736; x=1773301536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=LYHaO4QeP4Xmq2DbxbaHM/ZDusbUm95KDvsh583SAcFXhAhfBE0btHldcem0clt+y/
         VXTE8wfiPs6b1mEbaJMA+T0khYAJkjMTdqYJN9yYrD7RY1YreaepqC1DacL4tNbudLsa
         I76AvdCKbpnUD/lf1GLsLwPVONsctrdggX1NbAS0UcyElaV/WcpSft0e+x177NRewDgc
         qiDvuPs6QsnvcBPZivzIHyn3rdJIDfFWkOAbX1oyk0ZYWNhmlAgKQzrSP8xhmw7utqyL
         dGYviwnvPP7yER7ajMV9PYkies2IvWGPnoWeLSeZlMu4k3xjlV3/p/1gyplXQZnVF4a4
         TBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyXEna1kv5EH+R21BEo/ewYQOyKtOBZcuNEi6I1ScrvSe1wmrLAf2/QZUpcq1+HtZgCWg5hNWA0ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlsTnL5GGyJhpjsmfHcxYjhOUkhRSDescPbdmDGwUxpXH+MCFr
	hz70YqAvW82+igvYzWm4NH5sfOh9haJ0krnckzGMYanZtwrTB/lvCrvyaIdovMXN
X-Gm-Gg: ATEYQzyU/T32Ap4LNYzMfTvbofksU35tqTIu1RIpke2JHHFWq9sxbpys6Tv7ZlB5Wlp
	DyKbpXVx1SMa05OdrbeR5j2sHwx7mAcvksZmn8hfQNyqbsToqrFjLTfedB1P5Ld7JUfoyIGT44k
	xKvtmc2SwSRL31yDbGIVlLcRTTQYbOTbnkIY87woUluuC3mAl/uxgwzvcdeT1SV688nFFg8Gh+6
	goY5R0XrfBSlBzQnnItY4H5xBr9h8VcrvcZttrE5aglM7gvsP3UvKYCXtnqKPJtmRD56dX2mOQA
	OVsGnwwKhOeHklU9jJyl2KIeemVbQC/jAqiv5vZDk+VAZmj1jPtHAfgI1hp9IuWA/zKlh8gP1m4
	dYVe7Svd6dhnuy1I+HXEci74y+np/mp31eAhXKNOOV+kOe2SQytsbyLds5z8dcDDu+3X9vWJklN
	kSNxKgEGDyZZTn0VU0qKAzqp0vrYt2GK/USXUKsuWPswpQR0QhyeGG43c3Yp9l
X-Received: by 2002:a05:6102:4194:b0:5ff:d1c8:a85e with SMTP id ada2fe7eead31-5ffd1c8c4famr111808137.32.1772696735975;
        Wed, 04 Mar 2026 23:45:35 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6577a4fsm21589353241.10.2026.03.04.23.45.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:45:35 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso2323252241.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 23:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjbLCZlR45g+z8pQg4zOJGlk2d1IkcBsDYukmyMhoqPCkeoonuq15A/4Yv6YTTT4v4btkhkKhbxp0=@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
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
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CD51D20CD90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-34042-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

