Return-Path: <linux-usb+bounces-14294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C447964EFE
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 21:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510861C2138F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 19:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A2B1B8E86;
	Thu, 29 Aug 2024 19:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QzW2R68/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA041898E0
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960025; cv=none; b=nLvZtEtunoX6nUGzvW9BiW300JUwZc/Qv1RLqT7Wbk9agDkr+LdmGX8xlMIKlAXJJHbf49Cuon/nTuQkirkRdoLUxlx9C2ZJB8xrOjKxdvjQXhggNtJ89o8kcqUtOZJ6Zvi3Ex4dkvihfnEFUUxj95sQ25rWC7SV88UEaUBpGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960025; c=relaxed/simple;
	bh=PrBn1mpQDMnlrgLBKDe4p8Ampi+IFTnW39FupGagWho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhsFqCHumAU/0dmlU+d1DBgEGhIt0IMiziHMFUnKiWuYmcWSI3DSEdKpcXsNcybxcyOGPGMpw/PGYWlGEGDZWq7E1QYuTQxpygTt5RdL7zdPwsf2es2FnliPjD0CEa1+MwYhpb97axi0b5r0CVwrKHz8tqGBVNvSOxoO4hFlS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QzW2R68/; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2704d461058so584244fac.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724960023; x=1725564823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+89V/Pkw0eErHNWTJZLzdCFWIv36uJ87GHJgsJod6mk=;
        b=QzW2R68/NYdjaOXf0mQbv6augq7I0xl4QRW9ekcjvXW+nfPNgWk1yIOVel42LlPTS5
         PSUAHF/BUe2Z70bD4cEq4AbpMMyj4Fx18/H1cc737mUxRrYSTUSWe34HQU7uu/QNz4Ks
         RoP1tzAHwJs8xfv2Ut85EThLNhZW1KB30vJH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960023; x=1725564823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+89V/Pkw0eErHNWTJZLzdCFWIv36uJ87GHJgsJod6mk=;
        b=hZagnczB9/KBwnUM4JztOcl1W/+0xDrlWkkUflQrkbFNc+qN8wIaNWWAcIhQs/Hvh+
         AlUIs8xyAxk3pBhr7+jZ61Tl2IXBjLiri5FIMQIddmRm7IgvLLw4i5rOsDDf2Me7sl3w
         RBUElVVZ2dZ5za0Te8yzb1pX5rxKVHCq2fqvNIuA9pR0f6GuIxKACtQEvoCqyjCWqVcc
         bjqLIf0pDaULy7T9BuVlDnaIFx/ZvyemS8AO9w3xfEbttQyWVSd0JeJoOsSbOpB7NoWY
         VwluM40tfAHCI4f3bYUWvw7pfIPMJCLjE3ODxu65tUGUSUv67t6Q17xPk1V7imXn80kh
         IDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDwsLSY2AEwKPcPFOKgYBK+9i9QfrUqDdbN7tbSoUohPgBNhC098oMcGCxOp2RSZmorMoNtbIk13s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwL6lzOoFjhqwJfhl8/FcfWPHAoGWOr5y8yg2xNPCHK6hWv9d
	M2IXhZivp2CCWEaSY9UUstVbi976gqvp+fi+xgyGvX7dTu81E7wPHebYcBRV02xRMVS6JHYp75Y
	=
X-Google-Smtp-Source: AGHT+IGxTg3ZVqSgVk8z6mI7c/DCgw7c38tCNjXkNUL6c3fdxea1rO4O4oxf0JKFzowu4unJbeNEBA==
X-Received: by 2002:a05:687c:2c26:b0:270:2e17:a0c1 with SMTP id 586e51a60fabf-277900d20c5mr4052392fac.13.1724960022939;
        Thu, 29 Aug 2024 12:33:42 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-277abb5a2b8sm56104fac.19.2024.08.29.12.33.42
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 12:33:42 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70f6732a16dso71871a34.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 12:33:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaAImnKjXFFcHEfbVQcBTDEd2XJtsmR9f60F0Qq/Po+8ATmiTIenp6ag/YHopjitVK2byyoZ3RvNM=@vger.kernel.org
X-Received: by 2002:a05:6830:b85:b0:70c:aceb:c6c4 with SMTP id
 46e09a7af769-70f5c21e47dmr4373135a34.0.1724960022060; Thu, 29 Aug 2024
 12:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821214052.6800-1-wahrenst@gmx.net> <20240821214052.6800-9-wahrenst@gmx.net>
In-Reply-To: <20240821214052.6800-9-wahrenst@gmx.net>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Aug 2024 12:33:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+VbFmzMk8mHy6HGf5+W-7YQjTEDPqiJXs0hecbZ_T9Q@mail.gmail.com>
Message-ID: <CAD=FV=X+VbFmzMk8mHy6HGf5+W-7YQjTEDPqiJXs0hecbZ_T9Q@mail.gmail.com>
Subject: Re: [PATCH V3 RFC 8/9] usb: dwc2: Implement recovery after PM domain off
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <hminas@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, 
	Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, Peter Robinson <pbrobinson@gmail.com>, 
	dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 21, 2024 at 2:41=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> According to the dt-bindings there are some platforms, which have a
> dedicated USB power domain for DWC2 IP core supply. If the power domain
> is switched off during system suspend then all USB register will lose
> their settings.
>
> Use GUSBCFG_TOUTCAL as a canary to detect that the power domain has
> been powered off during suspend. Since the GOTGCTL_CURMODE_HOST doesn't
> match on all platform with the current mode, additionally backup
> GINTSTS. This works reliable to decide which registers should be
> restored.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/usb/dwc2/core.c     |  1 +
>  drivers/usb/dwc2/core.h     |  2 ++
>  drivers/usb/dwc2/platform.c | 38 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> +static int dwc2_restore_critical_registers(struct dwc2_hsotg *hsotg)
> +{
> +       struct dwc2_gregs_backup *gr;
> +
> +       gr =3D &hsotg->gr_backup;
> +
> +       if (!gr->valid) {
> +               dev_err(hsotg->dev, "%s: no registers to restore\n",
> +                       __func__);

nit: IMO "__func__" should not be in dev_err() messages. The message
plus the device should be enough. If __func__ should have been in
dev_err() messages then the Linux kernel would have automatically put
it there.

Aside from that, this looks reasonable to me and discussed previously.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

