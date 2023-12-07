Return-Path: <linux-usb+bounces-3846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7380873A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 13:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D66E1C215F6
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6366A39ADF;
	Thu,  7 Dec 2023 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBZ59ry5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DB1AA;
	Thu,  7 Dec 2023 04:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701950509; x=1733486509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=APk8BnUEAD3kMbuSbw1mcu8TmnFWgLBT+IUePjKQZeE=;
  b=CBZ59ry5/leUv5Bs39R3nlDHhmUTWqKko5nQ+EewLX2HwHM18DDD24mN
   7P8pFG2uRdD2gwYeILqO8Rmsx5WqiuH2nB/fWtF0B6bfjP1pYBiFtpRCe
   5htZQPHmy6dHqvTXzfAR/o0t8kiTNA5bEi/aqXuRJ1P4IBo2Fl58GOYRo
   if4iCPnX7Lrcb4Hw8eRHABjBWYgDZNckzeLsAC5BXCq16l7a0s7tHBEZp
   4HCtLyDmMtDGG1M+PWa7DzQ8uT5Tgvw/eYwgh1cDIuAQnYKIOLUQGGSCR
   QYv1Tjxz8RXtRT83FXfyed4zMBcxcnPZbtozL2JVHVwjQBw29xv/29Q60
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1100881"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1100881"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:01:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862452336"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862452336"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by FMSMGA003.fm.intel.com with SMTP; 07 Dec 2023 04:01:46 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 07 Dec 2023 14:01:45 +0200
Date: Thu, 7 Dec 2023 14:01:45 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
Message-ID: <ZXG0Kc0HmSAoTNx+@kuha.fi.intel.com>
References: <20231206123828.587065-1-arnd@kernel.org>
 <ZXGySCtdsxW4qCel@kuha.fi.intel.com>
 <CAA8EJprV3O24V0+MnPK1OdQZQ_7F2aMfN1Um13eH9ux4J+ucMw@mail.gmail.com>
 <ZXGzJlv9C3Z9lMeI@kuha.fi.intel.com>
 <CAA8EJpphJwfL-ZBOirzezBkBQ4E0RhhugtJh_jM0aHsHgp0D8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpphJwfL-ZBOirzezBkBQ4E0RhhugtJh_jM0aHsHgp0D8g@mail.gmail.com>

On Thu, Dec 07, 2023 at 01:58:31PM +0200, Dmitry Baryshkov wrote:
> On Thu, 7 Dec 2023 at 13:57, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Thu, Dec 07, 2023 at 01:55:06PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 7 Dec 2023 at 13:53, Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > On Wed, Dec 06, 2023 at 01:38:14PM +0100, Arnd Bergmann wrote:
> > > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > >
> > > > > DRM_AUX_BRIDGE depends on CONFIG_OF, so the same dependency is needed
> > > > > here to avoid a build failure:
> > > > >
> > > > > WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
> > > > >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
> > > > >   Selected by [y]:
> > > > >   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> > > > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
> > > > > aux-bridge.c:(.text+0x13b): undefined reference to `auxiliary_device_init'
> > > > > x86_64-linux-ld: aux-bridge.c:(.text+0x14d): undefined reference to `__auxiliary_device_add'
> > > > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
> > > > > aux-bridge.c:(.init.text+0x15): undefined reference to `__auxiliary_driver_register'
> > > > > x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
> > > > > aux-bridge.c:(.exit.text+0x9): undefined reference to `auxiliary_driver_unregister'
> > > > >
> > > > > Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> > > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > > > ---
> > > > >  drivers/usb/typec/mux/Kconfig | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> > > > > index 5120942f309d..818624f59120 100644
> > > > > --- a/drivers/usb/typec/mux/Kconfig
> > > > > +++ b/drivers/usb/typec/mux/Kconfig
> > > > > @@ -40,6 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
> > > > >       tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
> > > > >       depends on I2C
> > > > >       depends on DRM || DRM=n
> > > > > +     depends on OF
> > > > >       select DRM_AUX_BRIDGE if DRM_BRIDGE
> > > > >       select REGMAP_I2C
> > > > >       help
> > > >
> > > > Shouldn't DRM_BRIDGE depend on OF instead?
> > >
> > > No. DRM_AUX_BRIDGE depends on OF, DRM_BRIDGE framework doesn't.
> >
> > Okay, so this probable should also be
> >
> >         select DRM_AUX_BRIDGE if DRM_BRIDGE and OF
> 
> Yes, this is what a patch from Nathan does:
> https://patchwork.freedesktop.org/patch/570638/?series=127385&rev=1

Ah, sorry about the noise.

thanks,

-- 
heikki

