Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A881BF51F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 12:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgD3KPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 06:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726405AbgD3KPf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 06:15:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434AFC035494
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 03:15:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f13so6124463wrm.13
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5pQJEnxi1ZD+zVU+9wcTIUMU9jsK5QVaYW3YwxeiYoA=;
        b=Z4jK5/Q2+yoNtPe/piK7UBqVqFGX3OQ89ytUfl7UNsG1b3m1ifHBlWIPg/YkRSxjdB
         c0wRXwmsaIE9EL6X0sMWhLn22ryuw+Yru4vK+o1MRzuIGNaz6bzvJgzvLU5tnlsn2SJP
         Gz9PSWgIGheg8T4zZsrhNkB3BJRfmwKnuSqwEOQ9jQGiUlwtEg9H7V2mSJDRYr23yNmW
         xJmhQbv9+ySDyAv8C9XOL6EgJOSfI2RLCD9WSz9uz2R4gDiIzJ2NzLohL5lkIUaJBeUK
         FjBEJ/K4dTqsQUzR2zJz3S6KzDrKLAAHq6Ucq/K1BiCYSgkFdxdHZq8wobW2E2nvcWbs
         Jpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5pQJEnxi1ZD+zVU+9wcTIUMU9jsK5QVaYW3YwxeiYoA=;
        b=WbU9FmUWMnydWShdpp+b7duyZh5mV9fUbZzmnsZX5Li7eVeEwI6Ygkzq/IjZWdf8Bd
         JzW582mR8/ot/TM8TI9mvpBcaiU9xKF8H2bRJK4ooeamhM75eC50mgdJTB/DDaqaGsdt
         nObvCaY6g/UJwD8zSONOexwbsR4H98Oqyo34EkMXVH9Bn6x/SlC18jowWjMjUTR1uRUj
         xJp2xouYFrJr2sMZjBoRJwUx+E4PRNetNl6MtPh23j399QUMoBEXmzZMKKaQio2wPY5o
         KzZwtUZW2oBx5pIggZjaLSGOlTNJrjY+ZPWMWw6PBbgbOt900hRC/EDrjiQUsByI2rRW
         /Q/g==
X-Gm-Message-State: AGi0PuYp3rHw97y4ObFXV2Mc3hOPn6HvVggYrnwCH0qc1h7Jw/Oi5Wfp
        NhpfEsZl2yFLR1v5tFM/AZe3ocYD6IE=
X-Google-Smtp-Source: APiQypKyDzrfbAtIeZ2On3yC+hU2HnQ8q4rO6XTcJ+rJCMBGwEiDGDglmxTwGckDzQa3DmceDN9vbQ==
X-Received: by 2002:adf:f1c5:: with SMTP id z5mr3261383wro.100.1588241734021;
        Thu, 30 Apr 2020 03:15:34 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id h1sm12675147wme.42.2020.04.30.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 03:15:33 -0700 (PDT)
Date:   Thu, 30 Apr 2020 11:15:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200430101529.GB298816@dell>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org>
 <20200430083219.GC3118@dell>
 <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 30 Apr 2020, Noralf Trønnes wrote:

> 
> 
> Den 30.04.2020 10.32, skrev Lee Jones:
> > On Wed, 29 Apr 2020, Noralf Trønnes wrote:
> > 
> >> Add a way to lookup a backlight device based on its name.
> >> Will be used by a USB display gadget getting the name from configfs.
> >>
> >> Cc: Lee Jones <lee.jones@linaro.org>
> >> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> >> Cc: Jingoo Han <jingoohan1@gmail.com>
> >> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> >> ---
> >>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
> >>  include/linux/backlight.h           |  1 +
> >>  2 files changed, 22 insertions(+)
> > 
> > Once reviewed, can this patch be applied on its own?
> > 
> 
> If you can apply it for 5.8, then we're good. DRM has cutoff at -rc5 and
> the driver won't be ready for that. This patch has this dependency
> chain: usb -> drm -> backlight. So if you can apply it for 5.8, things
> gets easier.
> 
> > My guess is that it can't, as the other patches in this set depend on
> > it, right?  If this assumption is true, you need to send me the rest
> > of the set.
> > 
> > FYI: It's normally better to send the whole set to everyone, as it
> > provides visibility on current review (or lack there of) status of the
> > other patches and allows each of the maintainers to discuss possible
> > merge strategies.
> 
> dri-devel is the ML for backlight so I assumed you got the full set.

dri-devel isn't the ML for Backlight.  It's an interested party.

I certainly have no intention of subscribing to it.

> I have had trouble in the past with my email provider dropping parts of
> a series when I had to many recipients.

Without visibility into the other patches in the set, things become
more difficult.  Maybe use a different/better email provider.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
