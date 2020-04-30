Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6892B1BFBEE
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 16:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbgD3OCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 10:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgD3OCr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 10:02:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7E4C035494
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 07:02:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id i10so7032016wrv.10
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jiIaYsggpBakhnnkVBGSz6hk94HlfiIOcAoKKv2Pdv4=;
        b=RaBbh1/74+THrE0I7GBYuCU2D2ZyTALWrtlCwS014vR9U2ZTQ2c+yuPlvOa4MW8so8
         pCUHC2hWjhKygyps53np8y5eQme6MKti7DOj+7vWSSaGv06YBGI6zeNNy9AA21lcwQPS
         XT7vKMpETh14bxqnDsLRarkk/S4hiEyCrfd7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jiIaYsggpBakhnnkVBGSz6hk94HlfiIOcAoKKv2Pdv4=;
        b=VZm3oe4EKMXN1bhDsFg/IsKpCmwzb4o8Ys+/TQGo06bVSKdahMbU9XAdY4qaACqNll
         jTC+bV49L0MNI5MTmjjM2UxGJ3raoxMiHocLQh8Uj4beGZawfX1SQc5XdzuTHZUp9kH0
         deqEjBnhGtTRC2Du8om0vxtsHHn2anpuDgWnVcP9MRQ04+LOXN1SKvjZRNof6N4026JN
         f6+in2Zj9XvwwrApgPf7XiB3goRIM9DOhGgfKNBfpdEDaBSKT2XQtZWTwI9GhGbfyAqc
         fyjoRTR3bWWKgSQarUqEMHP7mQztrJ16JDV2vFvKPOtxvvbH5ktS5A0wogxToVqVDYIm
         D/Hg==
X-Gm-Message-State: AGi0PuZdnuoKi0LuqmViga+Cf4wvaBkhYvDC6WTQRU5nQRoPyb7J5+4y
        p1LSwtPby3I3VNTxWQfP1DknLg==
X-Google-Smtp-Source: APiQypJ7g1twD4Ui5as4s0fdrh+ixOi5o4hbJUSnpWbZlMn/6MkO+MKUQclqQkHP4kH2mil3JygLgQ==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr3991201wrq.273.1588255365830;
        Thu, 30 Apr 2020 07:02:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id r18sm4133635wrj.70.2020.04.30.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 07:02:44 -0700 (PDT)
Date:   Thu, 30 Apr 2020 16:02:42 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200430140242.GF10381@phenom.ffwll.local>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
 <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
 <20200430101529.GB298816@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200430101529.GB298816@dell>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 30, 2020 at 11:15:29AM +0100, Lee Jones wrote:
> On Thu, 30 Apr 2020, Noralf Trønnes wrote:
> 
> > 
> > 
> > Den 30.04.2020 10.32, skrev Lee Jones:
> > > On Wed, 29 Apr 2020, Noralf Trønnes wrote:
> > > 
> > >> Add a way to lookup a backlight device based on its name.
> > >> Will be used by a USB display gadget getting the name from configfs.
> > >>
> > >> Cc: Lee Jones <lee.jones@linaro.org>
> > >> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > >> Cc: Jingoo Han <jingoohan1@gmail.com>
> > >> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> > >> ---
> > >>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
> > >>  include/linux/backlight.h           |  1 +
> > >>  2 files changed, 22 insertions(+)
> > > 
> > > Once reviewed, can this patch be applied on its own?
> > > 
> > 
> > If you can apply it for 5.8, then we're good. DRM has cutoff at -rc5 and
> > the driver won't be ready for that. This patch has this dependency
> > chain: usb -> drm -> backlight. So if you can apply it for 5.8, things
> > gets easier.
> > 
> > > My guess is that it can't, as the other patches in this set depend on
> > > it, right?  If this assumption is true, you need to send me the rest
> > > of the set.
> > > 
> > > FYI: It's normally better to send the whole set to everyone, as it
> > > provides visibility on current review (or lack there of) status of the
> > > other patches and allows each of the maintainers to discuss possible
> > > merge strategies.

Unfortunately this doesn't hold universally, since once you cc too many
people smtp servers start throwing your mails away. Generally only happens
for bigger refactorings, so pretty much anyone working cross-tree doesn't
do this because it doesn't work.

> > dri-devel is the ML for backlight so I assumed you got the full set.
> 
> dri-devel isn't the ML for Backlight.  It's an interested party.
> 
> I certainly have no intention of subscribing to it.

dri-devel is on lore so that you can grab missing patches. No need to
subscribe. I've only manged to get this sorted recently (last autumn or
so), but it's finally done.
-Daniel

> > I have had trouble in the past with my email provider dropping parts of
> > a series when I had to many recipients.
> 
> Without visibility into the other patches in the set, things become
> more difficult.  Maybe use a different/better email provider.
> 
> -- 
> Lee Jones [李琼斯]
> Linaro Services Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
