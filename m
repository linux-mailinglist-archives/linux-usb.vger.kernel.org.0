Return-Path: <linux-usb+bounces-14809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908B996FE69
	for <lists+linux-usb@lfdr.de>; Sat,  7 Sep 2024 01:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3D3C1C22336
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 23:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA2D1B85DB;
	Fri,  6 Sep 2024 23:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VpJlkyaI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDAD15B137
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725664974; cv=none; b=I3BYy+3f+LgqKpNZJ+vkaRmCMppT0Vjc/Dc/4xlSkmp7Aa9nrgoxweAK2n0ShKiHj4PSQxqmc4RhRX/GnlZ88Z7uxV2kthYjoYmrdakSF02mTi59kyHsofW6WOCH/yaXte75Jp3VPDAajORSuMVVGt+zBNRe6w6cgnqZukXYA1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725664974; c=relaxed/simple;
	bh=v9w2LTcgz/Jme+L6Qh9HHukhqTUREf69GMrFK2MCiXk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QruRw8YkqiB3WfKos28/3I0SJc7G59raRk6JLbP1sHklHVneCscrfa9I9fa63rU0A5T1gZZ+O7FxPGo8dpmhdmst/F9KrVIgDOb1utjsi+Zi5a3/BVNlz5+gThJ2+yrDySIqAPHnTPqCDhabQCk7yIcHMyY3y5hYUkVAsu5vZm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VpJlkyaI; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a7fef9a5fdso257752185a.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725664972; x=1726269772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qy+mSIGNeS58++DzntcZUAiMsB2v+aaTI4VFNn3s3Og=;
        b=VpJlkyaINW1yxAjcq0938EbVpI0kKEW3AIeylD1PLE2glDjHcRfXh5kTIgJjQ88YRY
         zn6+tghLhHe9Yg01stTNe1SJVJ9PibjNediQQ3oOdUjgXy4n1E4ysnssAO8ljj1hFGrU
         lzfgCXcYGaQz56TuIRw9IV/wEygbrborIm3m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725664972; x=1726269772;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy+mSIGNeS58++DzntcZUAiMsB2v+aaTI4VFNn3s3Og=;
        b=lF+2W7+dtiDEcC8GPIQvqUEPj10X/BqB52zDiGOw2nrDqhP4b++I2paJAaD5tIsMC/
         FxRvnbYok7GP+d/ilPnC1atUNc38dbA5t99uv3wFSvIIgImeHp4+A4CDHvZ/3UqGa0j2
         sCtej26VqRonh/Ydz26IJPXLbgDHyiWsyP8A2icdmD81Gc5RxI9fVpRYcWFYk9tp9MEQ
         PfWSZZR3CoBFb+qZI2HX/R5EemcMugI+TCLvNUBOU9GzbcWX2gDpdGxCfEb+sXk138ly
         tHn55t8oIVscGERE6PR1cFKu+QK+2M5nHG6RR3JhGLdIVIeZ56lkqdrgpzJkaeyGxKaB
         eHsw==
X-Forwarded-Encrypted: i=1; AJvYcCVnmBmffNsVAoph5pCVjlt7XDEfEX5iSEZbIYTmk7dSztGoiWYwZBmxVur67zhm9AxFdHalCcUGx8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLIxzoRMEHgHNKwFWmp667O6FksTYmzlBNOJCsWwuoDktwLkiL
	j5zxTNBOVmGp3pMDcyYogmouDuKGbY+tonMo7ER7Czg9jR1tAONQVDZnesAvhyxU1jon4Gd+yf7
	6ofDP4zoXPXXBL5tVot4pRSH/QhMmPUaKxsYU
X-Google-Smtp-Source: AGHT+IGdJ1Cu7WnFiLbpujMlY7s5pDdgGf67TdTERXFuJ3iEOOQRoyH/H06YxaP9An0lzToQtnM4yN/MAX8bQLOzGCM=
X-Received: by 2002:a05:620a:4512:b0:79e:f878:7ffb with SMTP id
 af79cd13be357-7a996bb9ccdmr757628285a.9.1725664971979; Fri, 06 Sep 2024
 16:22:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Sep 2024 18:22:51 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Ztq6zf8n09ZcJNjT@google.com>
References: <20240901040658.157425-1-swboyd@chromium.org> <20240901040658.157425-19-swboyd@chromium.org>
 <ZtgqLZXbJbpG65vD@google.com> <CAE-0n51w3AAtLPq5M-i8F6z2jSOT3xFw3g8HM1h48xXBSeoZnA@mail.gmail.com>
 <Ztq6zf8n09ZcJNjT@google.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 6 Sep 2024 18:22:51 -0500
Message-ID: <CAE-0n52mqK+by7O84fPMsNTfWSYzCwHpRZGi2Epfq0-iM7ysDg@mail.gmail.com>
Subject: Re: [PATCH v4 18/18] platform/chrome: cros_ec_typec: Handle lack of
 HPD information
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Tzung-Bi Shih (2024-09-06 01:18:21)
> On Wed, Sep 04, 2024 at 02:45:36PM -0700, Stephen Boyd wrote:
> > Quoting Tzung-Bi Shih (2024-09-04 02:36:45)
> > > On Sat, Aug 31, 2024 at 09:06:56PM -0700, Stephen Boyd wrote:
> > > > +     /* Inject HPD from the GPIO state if EC firmware is broken. */
> > > > +     if (typec->hpd_asserted)
> > > > +             resp->flags |= USB_PD_MUX_HPD_LVL;
> > >
> > > `typec->hpd_asserted` is shared between all typec->ports[...].  Would it be
> > > possible that a HPD is asserted for another port but not current `port`?
> > > E.g.: cros_typec_inject_hpd() for port 2 and cros_typec_dp_bridge_hpd_notify()
> > > gets called due to port 1 at the same time?
> >
> > I'd like to avoid synchronizing the hpd notify and this injection code,
> > if that's what you're asking. Thinking about this though, I've realized
> > that it's broken even when HPD is working on the EC. Consider this
> > scenario with two type-c ports C0 and C1:
> >
> > [...]
>
> I understood it more: originally, I was wondering if it needs an array
> `typec->hpd_asserted[...]` for storing HPD for each port.  But, no.
>
> What cros_typec_dp_bridge_hpd_notify() get is just a connected/disconnected
> signal.  It kicks off cros_typec_port_work() for finding which port is
> supposed to trigger the event (with some logic with `active_dp_port`,
> `mux_gpio`, and `hpd_asserted`).

Ok, cool. I intend to split this device into multiple devices, one per
DP bridge. I haven't done that though because I don't have any device
that has two independent DP controllers.

>
>
> Curious about one more scenario, is it possible:
>
> Initially, no DP port and no mux is using:
>   active_dp_port = NULL
>   hpd_asserted = false
>   mux_gpio = NULL
>
> CPU A                                        CPU B
> ------------------------------------------------------------------------------
> cros_typec_port_work()
>   cros_typec_port_update(port_num=0)
>                                              [C0 connected]
>                                              cros_typec_dp_bridge_hpd_notify()
>                                                hpd_asserted = true

The work is queued again here because it's already running.

>   cros_typec_port_update(port_num=1)
>     cros_typec_configure_mux(port_num=1)
>       cros_typec_inject_hpd()
>       active_dp_port = C1

Yeah it's a problem because we need to read the mux_gpio to figure out
which way it's steering. We can't recreate the "first to assert HPD"
logic that the EC has because we can't control when the worker runs. At
least we can skip reading the mux if only one port has entered DP mode.
I'm hoping that the scenario where both ports are in DP mode almost
never happens, but if it does then we'll have to read the mux when hpd
is asserted to figure out which port DP is muxed to.

