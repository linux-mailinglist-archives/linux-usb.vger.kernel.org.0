Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987FC1C3352
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 09:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgEDHK2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 03:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726625AbgEDHK1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 03:10:27 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B245DC061A0E
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 00:10:25 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so523509wrt.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PG6BwDAPcL8wb4HpwlS4YSmvTNTE6ibzVKQn+MZi8Es=;
        b=LkM38JAq4noGtfOnmF87UfUXUnx6MfQgOywDyS/n35EYboeqiGo2aRfDc8mXTnwM5w
         CPXlcI8M5+UniPHP9U8mAy6J6HNBwBJBxlJUZ70R0THyb75LvqPSiTOxHAEq+XclvRZ+
         Cs4PSD7jw3rXiWEvuQicaqtfskfu/SsE8N//AJugm+JvRey12eitbIz3Vbw0QSYHHO33
         738FUZBMV0R+7+ccdZClm7k0b5FVLgHBo2QbawaJeeDYBCyb1od0JYkd9NxKojoufQiU
         Qyx56CKXSBdBgNIZdHSrW77VUg5t4F4oI5lrot6S6VGQll+BGG9+x7cvPpn4scU/0aj/
         Vr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PG6BwDAPcL8wb4HpwlS4YSmvTNTE6ibzVKQn+MZi8Es=;
        b=lJM/1y/yyM8rUkSMSl9TlyZUvog6LK+pamTfOJWBfAe0dg/Ze8VzRk5DWg5e5PdJKf
         6u3I11m/JHsmF9vtte+eKWwZvvwz0R8BEDcssUAs2TvRKSVm4GMsbSI3SRNxM7olKFlX
         NIZZvbSAe2S4WijiaQg8pnazrK77A0PkK/SaRS43KU34lmoUdag3JloLDWX8uHzVcW1K
         k9HIXM2dKgwv+pxGaAqytXUiykKznu9X2l3ExBD/Vgkm1V/nPpL7OnBziMSEEVtLAJx+
         nJ4QXNC2KUcmMgRtpVSje++LvKclbUb4tZqf8Fon43TgRQ/VQLJHDu8Zz2qG/Q+curGc
         l8Gw==
X-Gm-Message-State: AGi0PuZ+5EjJ+m3GHwQieh5Epv7o6yQJL+HIuMmumPSPaMCBpMZZspi/
        Jzn9B84CmoDMu4zWPtwqtjAjW0Ryk3Q=
X-Google-Smtp-Source: APiQypJJ8tWv285WswOjJBC9z1LmXOMpX5hXpKi/l41oV/Xikfp3MSONQbmU+rPwn7cBbxCVScdgeQ==
X-Received: by 2002:adf:f5c4:: with SMTP id k4mr17360658wrp.294.1588576224290;
        Mon, 04 May 2020 00:10:24 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id l15sm11423844wmi.48.2020.05.04.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 00:10:23 -0700 (PDT)
Date:   Mon, 4 May 2020 08:10:21 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200504071021.GC298816@dell>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
 <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
 <20200430101529.GB298816@dell>
 <20200430140242.GF10381@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200430140242.GF10381@phenom.ffwll.local>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 30 Apr 2020, Daniel Vetter wrote:

> On Thu, Apr 30, 2020 at 11:15:29AM +0100, Lee Jones wrote:
> > On Thu, 30 Apr 2020, Noralf Trønnes wrote:
> > 
> > > 
> > > 
> > > Den 30.04.2020 10.32, skrev Lee Jones:
> > > > On Wed, 29 Apr 2020, Noralf Trønnes wrote:
> > > > 
> > > >> Add a way to lookup a backlight device based on its name.
> > > >> Will be used by a USB display gadget getting the name from configfs.
> > > >>
> > > >> Cc: Lee Jones <lee.jones@linaro.org>
> > > >> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > >> Cc: Jingoo Han <jingoohan1@gmail.com>
> > > >> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> > > >> ---
> > > >>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
> > > >>  include/linux/backlight.h           |  1 +
> > > >>  2 files changed, 22 insertions(+)
> > > > 
> > > > Once reviewed, can this patch be applied on its own?
> > > > 
> > > 
> > > If you can apply it for 5.8, then we're good. DRM has cutoff at -rc5 and
> > > the driver won't be ready for that. This patch has this dependency
> > > chain: usb -> drm -> backlight. So if you can apply it for 5.8, things
> > > gets easier.
> > > 
> > > > My guess is that it can't, as the other patches in this set depend on
> > > > it, right?  If this assumption is true, you need to send me the rest
> > > > of the set.
> > > > 
> > > > FYI: It's normally better to send the whole set to everyone, as it
> > > > provides visibility on current review (or lack there of) status of the
> > > > other patches and allows each of the maintainers to discuss possible
> > > > merge strategies.
> 
> Unfortunately this doesn't hold universally, since once you cc too many
> people smtp servers start throwing your mails away. Generally only happens
> for bigger refactorings, so pretty much anyone working cross-tree doesn't
> do this because it doesn't work.

I haven't experienced issues with SMTP servers.  Although I am aware
of a few mailing lists that are configured to require moderator
intervention if the recipient list reaches a given length.

> > > dri-devel is the ML for backlight so I assumed you got the full set.
> > 
> > dri-devel isn't the ML for Backlight.  It's an interested party.
> > 
> > I certainly have no intention of subscribing to it.
> 
> dri-devel is on lore so that you can grab missing patches. No need to
> subscribe. I've only manged to get this sorted recently (last autumn or
> so), but it's finally done.

This is helpful.  Thanks for doing the work required to make this
happen.  It's still infinitely more convenient to have the full set
in my inbox available for review.  As someone who works cross-
subsystem a lot, I can tell you that it works well in the vast
majority of cases.

Maybe just add the listed (in 'MAINTAINERS') maintainers and possibly
the reviewers.  Obviously all of the secondary interested parties that
get_maintainer.pl recommends should be omitted.

> > > I have had trouble in the past with my email provider dropping parts of
> > > a series when I had to many recipients.
> > 
> > Without visibility into the other patches in the set, things become
> > more difficult.  Maybe use a different/better email provider.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
