Return-Path: <linux-usb+bounces-3844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1979C80872E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8A81C21CB9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5122939ACA;
	Thu,  7 Dec 2023 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dphjGpT8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DD6AA
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 03:58:43 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5d7346442d4so6161717b3.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 03:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701950322; x=1702555122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5XmsrJXJOel1pOwV1DpetQX2xR+tuD3kF6lMHYEW14c=;
        b=dphjGpT8B0pJZWQ9GX011Eyo/IlJzEf52wVaxN7gZ7iRvfXkfeioR+NlJaawaJqW5J
         gqlf9g/NEaGhT6QEGIq4KH0EdMtgjw7y4+oiFgIN+TzeiTuXg0XV7juaH+8h6oOeTjAg
         +wOtH1WxUOyl4iQltWhIzWwkpmx8ytHaw/Tv14iF+ltiEo2DI9A5Jm/OoL+SejzV9i/Y
         suPfWZIEheLesCZQ0WThFOAmEEwUGganzwXkLxUCwWDXn8edqWSoA7FMJinVooorglBS
         WxGtTDdDAoX3pqsPR8PKY/OnpfWpjHCjdoSxNMkulkHDHzOurYmbs3ALro2CrcoRcBDi
         1h7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950322; x=1702555122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XmsrJXJOel1pOwV1DpetQX2xR+tuD3kF6lMHYEW14c=;
        b=B50AMudbEoKR48r+wiS4dlNCL0dreMI2+6184uOQhNl7Cur1d2+7rzCY0lH2EMQHfy
         Kzd1GANo9Nvk1B/c1cIIGPTrW5YX1C1L7haxbvrajsnnnGCJKzt/Xjz7JODfun2zMHvy
         Hwvm9EP5J+ZVN2rS+vxGm2Cgxgb18+37cLXK1yyjvhgx2FfpevYe2izIpmFbrSiaHlUR
         ZaS1ZJGoAcvkZk+A0jStEVJtTWfaSy0S1sB7LmIseMX+GRlQpILqIXvCh6VQG8AtJEyC
         18NVBl/QU0alsLQFupZIhPg4MAzOWPTaiqrgNzZOrnbgllv1+lKvmtRByZi4dMk2GX6I
         HwQw==
X-Gm-Message-State: AOJu0YzpnYIa69k8L144WQQKT3o/2WxUG+GTXjPmQMb0LQspGbC3QTQT
	kMyyiJn+HguAWhSEDqkzdm4cKjIrImKUnoSAkNTIBA==
X-Google-Smtp-Source: AGHT+IFukjk7+VvB4cAweU10tWIgWIRNcRODLwuYaC54AWvlj03fe3JTz7XnPc9w7cjNwkd5PEZbF2PppX325vcHp0I=
X-Received: by 2002:a81:b702:0:b0:5d7:1941:3562 with SMTP id
 v2-20020a81b702000000b005d719413562mr2376001ywh.73.1701950322250; Thu, 07 Dec
 2023 03:58:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206123828.587065-1-arnd@kernel.org> <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
 <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com> <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com>
In-Reply-To: <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 13:58:31 +0200
Message-ID: <CAA8EJpphJwfL-ZBOirzezBkBQ4E0RhhugtJh_jM0aHsHgp0D8g@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 13:57, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Dec 07, 2023 at 01:55:06PM +0200, Dmitry Baryshkov wrote:
> > On Thu, 7 Dec 2023 at 13:53, Heikki Krogerus
> > <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Wed, Dec 06, 2023 at 01:38:14PM +0100, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > DRM_AUX_BRIDGE depends on CONFIG_OF, so the same dependency is needed
> > > > here to avoid a build failure:
> > > >
> > > > WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
> > > >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
> > > >   Selected by [y]:
> > > >   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> > > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
> > > > aux-bridge.c:(.text+0x13b): undefined reference to `auxiliary_device_init'
> > > > x86_64-linux-ld: aux-bridge.c:(.text+0x14d): undefined reference to `__auxiliary_device_add'
> > > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
> > > > aux-bridge.c:(.init.text+0x15): undefined reference to `__auxiliary_driver_register'
> > > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
> > > > aux-bridge.c:(.exit.text+0x9): undefined reference to `auxiliary_driver_unregister'
> > > >
> > > > Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > ---
> > > >  drivers/usb/typec/mux/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> > > > index 5120942f309d..818624f59120 100644
> > > > --- a/drivers/usb/typec/mux/Kconfig
> > > > +++ b/drivers/usb/typec/mux/Kconfig
> > > > @@ -40,6 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
> > > >       tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
> > > >       depends on I2C
> > > >       depends on DRM || DRM=n
> > > > +     depends on OF
> > > >       select DRM_AUX_BRIDGE if DRM_BRIDGE
> > > >       select REGMAP_I2C
> > > >       help
> > >
> > > Shouldn't DRM_BRIDGE depend on OF instead?
> >
> > No. DRM_AUX_BRIDGE depends on OF, DRM_BRIDGE framework doesn't.
>
> Okay, so this probable should also be
>
>         select DRM_AUX_BRIDGE if DRM_BRIDGE and OF

Yes, this is what a patch from Nathan does:
https://patchwork.freedesktop.org/patch/570638/?series=127385&rev=1

-- 
With best wishes
Dmitry

