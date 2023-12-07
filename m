Return-Path: <linux-usb+bounces-3842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FF8808719
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F8FF1F22504
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CACF39ACA;
	Thu,  7 Dec 2023 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GRX4SxXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B979919A
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 03:55:18 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d8d2b5d1b5so5551037b3.0
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 03:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701950118; x=1702554918; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F/q6TRKeG5wf/WNF8oKO4x0xnN5GpvnAL5Al210CdFM=;
        b=GRX4SxXQkB+6+W9DXR4iUGyfV/07y4Rqu94u7S/y9+xVP/d11HZZ8yb6k1p3TRI2wA
         Py0jnAhlYMwwX3pw5hZDU03SrU/lwU/CxFHaLmjsfD6EW96vz2gYu4i+wMCLTGSJ3DQ/
         4rrXAyHG4S82K4F+TJLD10ECSCenq+KBLCbgXIG/5oMJQ2OjfLpuP6TybyibO75NLWiG
         rUTXj898OF0polYr5qnHeh0Zh5Xx0OLCHpc01nkVT7lOeGlqCYzrNwJCKhvG/cwuyvE6
         3tzemw/Y5HjDkWyOFasVQalU2Uy0a3If3M0Z85wI+DwBXlDO/mZg1Z8NEgLjzutG/HG7
         QUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950118; x=1702554918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/q6TRKeG5wf/WNF8oKO4x0xnN5GpvnAL5Al210CdFM=;
        b=NWTaL0jFSTAAmWNy1gh50g+4tC8E1hYfR0rMIPBJKG3gCPK8dRj5xE6vG7EjBkqozU
         5Ovv1KzgBCjwhoYKDMWpPIlCrV3EQ5Gkhfsm3/w3AIJ/iMrSCVsvUizuXK6x4NIFSm9n
         6x5Rhiz1EJwwoM4tOpJAIw5GX/ps7CzQz/FI4/HlsyP0BPTjwyX2MhHIHMmLN4ZwFqsw
         50+OcdBPNDZ9jKfbOyBL/ANU9eHbMJOZHdzqRSPF1lyOCCysMwSYN9bSKvaUdMwzKiAB
         fgr0svyHG3evbpDRp42zq3p4ijLiSLbEbPjGCxwGbNOXraNrmq3chUL/8OrHvbpd+Gid
         iUog==
X-Gm-Message-State: AOJu0YzcG3u/f3svfPYJM1Bw9CBWNpU/+FyVXdV3n0T5w6U1dYEeepmH
	NUhulR+4gCa7c9CefyTiocrjGaaIdes7y2cpWEnV+Q==
X-Google-Smtp-Source: AGHT+IHVT1d6I3NT15slfWj2OyLzxCga6bksIcWJ0Ex4SeTvFw8STagdoTadd/IyScYtLxzKq6+8sFaTXZxksDGB968=
X-Received: by 2002:a05:690c:360a:b0:5cc:29fc:9b38 with SMTP id
 ft10-20020a05690c360a00b005cc29fc9b38mr2021839ywb.35.1701950117961; Thu, 07
 Dec 2023 03:55:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206123828.587065-1-arnd@kernel.org> <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
In-Reply-To: <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 13:55:06 +0200
Message-ID: <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 13:53, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Dec 06, 2023 at 01:38:14PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > DRM_AUX_BRIDGE depends on CONFIG_OF, so the same dependency is needed
> > here to avoid a build failure:
> >
> > WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
> >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
> >   Selected by [y]:
> >   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
> > aux-bridge.c:(.text+0x13b): undefined reference to `auxiliary_device_init'
> > x86_64-linux-ld: aux-bridge.c:(.text+0x14d): undefined reference to `__auxiliary_device_add'
> > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
> > aux-bridge.c:(.init.text+0x15): undefined reference to `__auxiliary_driver_register'
> > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
> > aux-bridge.c:(.exit.text+0x9): undefined reference to `auxiliary_driver_unregister'
> >
> > Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/usb/typec/mux/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> > index 5120942f309d..818624f59120 100644
> > --- a/drivers/usb/typec/mux/Kconfig
> > +++ b/drivers/usb/typec/mux/Kconfig
> > @@ -40,6 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
> >       tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
> >       depends on I2C
> >       depends on DRM || DRM=n
> > +     depends on OF
> >       select DRM_AUX_BRIDGE if DRM_BRIDGE
> >       select REGMAP_I2C
> >       help
>
> Shouldn't DRM_BRIDGE depend on OF instead?

No. DRM_AUX_BRIDGE depends on OF, DRM_BRIDGE framework doesn't.


-- 
With best wishes
Dmitry

