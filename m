Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BDC30C291
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 15:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234459AbhBBOyG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 09:54:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhBBOxY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 09:53:24 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6EBC061788
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 06:52:38 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id u20so5939060qvx.7
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gHYghtKgrrWF03mk9TitT4grGLLx+SPuNZIfRbTgwjs=;
        b=EDkwE2MIBgfcCVyclcD1ro/CbUNsnvbLiSvMmF6GYFKIdZ+tHW80JZzcPprPQfu/56
         Gap6aPwG6at8Wuxk+GOFrjhPbQOJvV4s4eATU0XLHv2u925tjQeEHpyesey3aK94nOh5
         Q3zExIAYjogRb0HB+fitmbovUkJjB8CDbtFUx/QXDdulecqqiaEvM3FgRuRWJ/XvUXvW
         t4Kq6yhXP6MII+Zsoy/Ehz1BMfBzMnRM4GMQU8ZhUFnL7HITwhB25tZwpo/rm2ElkwWk
         ClwbEsGdBeKBMgKuZT7dPJ9h/JzdQjTtqKbNsEfC1rzhCG58lSbfi5JRHlATmYiwVBcC
         Vpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gHYghtKgrrWF03mk9TitT4grGLLx+SPuNZIfRbTgwjs=;
        b=tAi+DTBBdXNLfxsCVydJOpQ2nyB9opaTovVJBUe++tKZ+vxHIUhb2Rn61ZBsL28SpW
         KqFSlI/V8B2iaxd4EToguMVsfMRutORCWo2+qOA8UzYVelFvvizcrLxzKU6DbKHOuj+d
         YbQaI+Qkqsgbw/dHjAwmRy/O1R16LsHGDfL73IqMJEhscEk8fenq3qb8s3JnhxcUwMFZ
         nZBNDRuqPTMoPObtp7IXrcXYphBQzWAJu/QM49Tp56qDgrMoDbCSm9w3BKVxcDeL7CDX
         WZrcCvl/KlpqGgrPUrMkZlEgKyeNhBMMzkoaRaW8forbFPc5PFYGeaPLWvMxggt799TZ
         92Dg==
X-Gm-Message-State: AOAM532Vp/vlK4I+RHl+ERz5xyx+G+MaG1zXhWxiwAu8SzJFiDcR1yVi
        vV8pv8AxmF0GWECGBIEdfKxINfjPknbhmZvorADSCg==
X-Google-Smtp-Source: ABdhPJza+1g64XyZy4xiMZ4LGVCInev5SV0wGZG03qN07O7bnY8bhuW1nAPtgxWkJ9AeouksqQ0K33Fc+O0DI5WxDe4=
X-Received: by 2002:a05:6214:11ab:: with SMTP id u11mr20540119qvv.17.1612277557310;
 Tue, 02 Feb 2021 06:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20210202093342.738691-1-kyletso@google.com> <20210202093342.738691-4-kyletso@google.com>
 <029f8d48-8932-8a2c-4edf-df73d66b21b5@roeck-us.net>
In-Reply-To: <029f8d48-8932-8a2c-4edf-df73d66b21b5@roeck-us.net>
From:   Kyle Tso <kyletso@google.com>
Date:   Tue, 2 Feb 2021 22:52:21 +0800
Message-ID: <CAGZ6i=1dQrT89GpC=zxRnUae1ee40djiqYRWwQu9irheJuCcsQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] usb: pd: Make SVDM Version configurable in VDM header
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 2, 2021 at 10:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/2/21 1:33 AM, Kyle Tso wrote:
> > PD Rev 3.0 introduces SVDM Version 2.0. This patch makes the field
> > configuable in the header in order to be able to be compatible with
> > older SVDM version.
> >
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> > ---
> >  include/linux/usb/pd_vdo.h | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
> > index e9b6822c54c2..69ed6929ce6e 100644
> > --- a/include/linux/usb/pd_vdo.h
> > +++ b/include/linux/usb/pd_vdo.h
> > @@ -21,22 +21,24 @@
> >   * ----------
> >   * <31:16>  :: SVID
> >   * <15>     :: VDM type ( 1b == structured, 0b == unstructured )
> > - * <14:13>  :: Structured VDM version (can only be 00 == 1.0 currently)
> > + * <14:13>  :: Structured VDM version
> >   * <12:11>  :: reserved
> >   * <10:8>   :: object position (1-7 valid ... used for enter/exit mode only)
> >   * <7:6>    :: command type (SVDM only?)
> >   * <5>      :: reserved (SVDM), command type (UVDM)
> >   * <4:0>    :: command
> >   */
> > -#define VDO(vid, type, custom)                               \
> > +#define VDO(vid, type, ver, custom)                  \
> >       (((vid) << 16) |                                \
> >        ((type) << 15) |                               \
> > +      ((ver) << 13) |                                \
> >        ((custom) & 0x7FFF))
> >
>
> Yu have to fix all users of VDO() as well, or the code will
> no longer compile after this patch.
>
> Guenter
>
That's right!
Fix incoming...

thanks,
Kyle
