Return-Path: <linux-usb+bounces-13747-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2357958D3F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 19:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 732232865FB
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 17:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F561C6880;
	Tue, 20 Aug 2024 17:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k7UAdq/0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6491C6897
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174691; cv=none; b=Z2zwkAuIXw0bkXMUnvsJK7DUN2dJM3NquImRZu+JQtP/X9MIWmK78EbIW3UNxxAWHZmkeTfRuEaxABQM6msNPqYYZrqDxhjttDFwBElqz0EwPqtg6bGaGSn6fhIm9G1DEy90zp6x0T21KZvdmwtyU2LuLTwOOoMHuklBU3kHlUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174691; c=relaxed/simple;
	bh=5jI+2p5tO5nOwZs3G8vuy7obODZwjARI/RidWxG+P/0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNHEz5FVnO7ugPwmVQvEQjV1DwpOE9LnijWsLMQxQdv6K+R8Tp68hRoCdjtlxOW60TcaMmFRxnr4BCXNEJUbTpYEXPKhmILArt/8mt35tICsQ40o/xyQgm4XQS8+zpiQ0lsoMzcknj5Eckc3yhEVviZlXtJalENoceBJOA32xKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k7UAdq/0; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a3375015f8so398267485a.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724174688; x=1724779488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kivk6OVMCb2Ic/WQYTSiSJ7knOT9aLnIRhStn7/b1EY=;
        b=k7UAdq/0AOXuatYlkTYVPglCWbt1B8OSBoplCE6KJyj/wrrE68kTwxZFdIkgfVlZmM
         kS19G2FZpoLKMGfKKGkgpGV6shDKpcYOThTTZrugD0BVIHdjeRD1zgKDsZ1oWpRvAWgD
         RQYyvP7n89b5kWxcbU5iZh7a12vX9nZlMefDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174688; x=1724779488;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kivk6OVMCb2Ic/WQYTSiSJ7knOT9aLnIRhStn7/b1EY=;
        b=iFxDxuELoiHBcYsXaOEc8AYsL/mVqK0FnRlp50uumgwhTJGm0RO2sQhBNlArA1eU9m
         B44v+WHBnW8YT1N1ltEmtaP9UQYxK7/pcsN3WDZhk3vIU03GQ2MacgQd4all7BXD77Kn
         +rwdk4Wm4+OsxU6LqmFZlQANwwK/qZf/e8VyXCBOaFAb1UC1mMccbXF9tqV+tvDUd99U
         cuN//r2CVCd1s6izmyPcVf5SO9vDiLallKO6jxQseWwVZhezbWZrLizll63NWPLRyJkV
         wvgbv7Oh9DisO1Y0OR8udAV7RZEMOeDRAyJeyblE/KjcHCqlblc0xuQp6uM4c64nSmWM
         FZkw==
X-Forwarded-Encrypted: i=1; AJvYcCUg87h1La/OycjcK/JRvIcqFca0gA5UNZvJX8f9j1EG2S3AYv9sWiAIoARYggskQAzipX9H/NuGgXiFvOrCW/nYTiUIt25NViH+
X-Gm-Message-State: AOJu0Ywem6YeWS3FQjK51YIJUmj3ziX+swmUdljh5AuNFTaoFsePl2MB
	eXYc5YhC/nRiq1nsBU93Pjyr5zDjzG246KW3Zy+uzbWXy/PlpU/DzlbkyecaoQ2CWwXua6oo1+O
	E/gYvyTJBhHN23CycTrP6enV8bmWCuvGRSbAL
X-Google-Smtp-Source: AGHT+IFPnbaIpKnJbRF0KVl+CpiSvIEMrBAyBLBBnH5HxEKdAtvNgsfFmldfo1C+7jIx6Rn++JaBGcZOF4ZPpQUlOKY=
X-Received: by 2002:a05:620a:319c:b0:7a3:6dd9:efbb with SMTP id
 af79cd13be357-7a50695402emr1528659285a.33.1724174688344; Tue, 20 Aug 2024
 10:24:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Aug 2024 10:24:47 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZsTPuvoTIFVFHw6o@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org> <20240819223834.2049862-3-swboyd@chromium.org>
 <ZsRrWfoPPVGC4Dqy@smile.fi.intel.com> <CAE-0n536OWtoOoRSM=6u=wA75A+0WtBktiY=6Y6VjKKTQWPcNw@mail.gmail.com>
 <ZsTPuvoTIFVFHw6o@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 20 Aug 2024 10:24:47 -0700
Message-ID: <CAE-0n50xcj21WiPHW9ATE7BfxKpOWvdV7of97G_U5ZrMV0zUUw@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] drm/bridge: Verify lane assignment is going to
 work during atomic_check
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Andy Shevchenko (2024-08-20 10:17:46)
> On Tue, Aug 20, 2024 at 10:12:55AM -0700, Stephen Boyd wrote:
> > Quoting Andy Shevchenko (2024-08-20 03:09:29)
> > > On Mon, Aug 19, 2024 at 03:38:16PM -0700, Stephen Boyd wrote:
> > > > +     /*
> > > > +      * Ensure this bridge is aware that the next bridge wants to
> > > > +      * reassign lanes.
> > > > +      */
> > > > +     for (i = 0; i < num_input_lanes; i++)
> > > > +             if (i != input_lanes[i].logical && !num_output_lanes)
> > > > +                     return -ENOTSUPP;
> > >
> > > Besides missing {} this code is internal to the Linux kernel. Is it okay?
> >
> > ENOTSUPP is used by select_bus_fmt_recursive() so I simply followed that
> > style.
>
> Okay, just be aware of that side effect of that code, also checkpatch may
> complain (however it might be false positive).

Yes checkpatch complained but didn't enlighten me. Please tell me the
side effect as I'm unaware!

