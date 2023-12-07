Return-Path: <linux-usb+bounces-3843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B6808726
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91DF61F22410
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835A39AD1;
	Thu,  7 Dec 2023 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2yHZ8On"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545B61AD;
	Thu,  7 Dec 2023 03:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950252; x=1733486252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1KMl9XjHFBBJ8+redolqRS6hLCA9TkPnhiPY6uCIwU=;
  b=H2yHZ8On0z4AlvvaEo16gXNJxQKAx441LHelpJ1tMe5FcjFbm9nVxaFH
   U3UBWUsfe53vCSLc3RsUmfQg/VnaYGDEBGGbt5+f3kayLxN6I8mqThl3u
   Wr7tXyzfhzEqn0uP/Ytc/wHuTaZj1DksLbn855YpEgoawXcquQFAptuuj
   0w7Vr/KkG/lAtbItTUVXU3+n5wSd9ePppsryhbz1/k/MEAIFLnq8gUi4Q
   EXExDoLj7V1EsxaiDhfkobNgRziiiNr+Q1NA10w9N2g60wGBQuhOCZnkK
   e0GKChe3QEo0WvbE3YOV1XiDIjnY/aZB+OkgARDZirt/ryc93bIEPj0D0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12932769"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12932769"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 03:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="915554318"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="915554318"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 07 Dec 2023 03:57:27 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 07 Dec 2023 13:57:26 +0200
Date: Thu, 7 Dec 2023 13:57:26 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
Message-ID: <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com>
References: <20231206123828.587065-1-arnd@kernel.org>
 <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
 <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>

On Thu, Dec 07, 2023 at 01:55:06PM +0200, Dmitry Baryshkov wrote:
> On Thu, 7 Dec 2023 at 13:53, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Wed, Dec 06, 2023 at 01:38:14PM +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > DRM_AUX_BRIDGE depends on CONFIG_OF, so the same dependency is needed
> > > here to avoid a build failure:
> > >
> > > WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
> > >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
> > >   Selected by [y]:
> > >   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
> > > aux-bridge.c:(.text+0x13b): undefined reference to `auxiliary_device_init'
> > > x86_64-linux-ld: aux-bridge.c:(.text+0x14d): undefined reference to `__auxiliary_device_add'
> > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
> > > aux-bridge.c:(.init.text+0x15): undefined reference to `__auxiliary_driver_register'
> > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
> > > aux-bridge.c:(.exit.text+0x9): undefined reference to `auxiliary_driver_unregister'
> > >
> > > Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  drivers/usb/typec/mux/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> > > index 5120942f309d..818624f59120 100644
> > > --- a/drivers/usb/typec/mux/Kconfig
> > > +++ b/drivers/usb/typec/mux/Kconfig
> > > @@ -40,6 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
> > >       tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
> > >       depends on I2C
> > >       depends on DRM || DRM=n
> > > +     depends on OF
> > >       select DRM_AUX_BRIDGE if DRM_BRIDGE
> > >       select REGMAP_I2C
> > >       help
> >
> > Shouldn't DRM_BRIDGE depend on OF instead?
> 
> No. DRM_AUX_BRIDGE depends on OF, DRM_BRIDGE framework doesn't.

Okay, so this probable should also be

        select DRM_AUX_BRIDGE if DRM_BRIDGE and OF

No?

thanks,

-- 
heikki

