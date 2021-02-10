Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06F3316F66
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 20:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbhBJS7r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 13:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234411AbhBJS5n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 13:57:43 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2FDC06178A
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 10:57:02 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id u66so3191810oig.9
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 10:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bkp2B9buNUd2R4MwP22SzoD89Af1VRonca+aGPvTVAM=;
        b=XZmKlRwqBRfl3vj90AZg8SZ/p/WgkxRwZRoMznOaDnSPCe8FH5BSR/oSHASBqyV+LK
         Wgz0PXwIzFQuuTCXKmy6BgWZaE5vYziHTMPA8F8CXj631uNwOy/Kzhn5NqTBpL6D8HWz
         IxDk9GDhJHEWluAqDgUmml6HLAs1E03jk0D4+jHoatIzJUFkPg2AZpWJW3tdzwid9TvY
         8QoLd80AtZvtzp+E2IApXsxQ8UeentIjxU1jopYW7hckah39dkRS98HZVRKKcD9jJkfC
         n5NH4SV63QWh8RryU8Ky48MErSeZQzYo4q8QwPB0gv94TNB66KF6BSYFyoavQg4yC/tA
         +fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bkp2B9buNUd2R4MwP22SzoD89Af1VRonca+aGPvTVAM=;
        b=Zv5EHpNH4P6XvcGkMSOeNnT4HCtZv1rypaZhWmbaovTRAv0hYAAHsl7G8n7XglDKt1
         cXWN8Cs0cMZRUOniLKU9B4YIV+5HBIx0jZxgR6buEuCaa1E4+0srAEdWeLMjwvPMGaDU
         dmu4z04M1omaxpzzTQVPZ1QF/kSG7nNA72xhD4QwDHPYfrRrqEwNiOBXqBO2gen9jS+x
         bypkKQNTnmbpcpxzqKh4wr1ABwyIhI48lU85HjIzQGjiIiHF+5ADxxFb9pRj752to9Hz
         Bi9P93MGte5uDeNdXBeIvsZjBC+Tsdzdq3UL+aVLfZvjjZXJCx881kh/2UYGtJOKzeSR
         Ms3g==
X-Gm-Message-State: AOAM532QY0dSTvmaK7TTqY8MioN2ZeeYMJlH/7CWfsxUh9meSBhcBiPq
        QMXvx2XqRYCrqWV8iccpnpPOKQ==
X-Google-Smtp-Source: ABdhPJxTQUanvr6NVDmymhAJQN9m3BNjh4gp1tV5Wen8hgMuiwhv5d/plkiv7mZHa1MQg1J41M9aLA==
X-Received: by 2002:aca:4717:: with SMTP id u23mr310399oia.2.1612983422201;
        Wed, 10 Feb 2021 10:57:02 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y5sm536082oti.59.2021.02.10.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 10:57:01 -0800 (PST)
Date:   Wed, 10 Feb 2021 12:56:59 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <YCQse9EtEHtLVe9A@builder.lan>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
 <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
 <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com>
 <20210210184051.ncvvs5xgyo7o3uzq@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210184051.ncvvs5xgyo7o3uzq@mobilestation>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 10 Feb 12:40 CST 2021, Serge Semin wrote:

> On Wed, Feb 10, 2021 at 12:17:27PM -0600, Rob Herring wrote:
> > On Wed, Feb 10, 2021 at 11:29 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:
> > >
> > > In accordance with the USB HCD/DRD schema all the USB controllers are
> > > supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> > > existing DT-nodes will be renamed in a subsequent patch let's first make
> > > sure the DWC3 Qualcomm driver supports them and second falls back to the
> > > deprecated naming so not to fail on the legacy DTS-files passed to the
> > > newer kernels.
> > >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index c703d552bbcf..49ad8d507d37 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> > >         struct device           *dev = &pdev->dev;
> > >         int                     ret;
> > >
> > > -       dwc3_np = of_get_child_by_name(np, "dwc3");
> > > +       dwc3_np = of_get_child_by_name(np, "usb") ?:
> > > +                 of_get_child_by_name(np, "dwc3");
> > 
> 
> > Is there some reason using compatible instead wouldn't work here?
> 
> I don't know for sure. The fix has been requested in the framework of
> this discussion:
> https://lore.kernel.org/linux-usb/20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru/#t
> by the driver maintainer Bjorn. To get a firm answer it's better to
> have him asked.

My feedback was simply that it has to catch both cases, I didn't
consider the fact that we have a compatible to match against.

> As I see it having of_get_compatible_child() utilized
> here would also work. At least for the available in kernel dt-files.
> See the affected dts-es in:
> https://lore.kernel.org/linux-usb/20210210172850.20849-11-Sergey.Semin@baikalelectronics.ru/
> 
> A problem may happen if some older versions of DTS-es had another
> compatible string in the dwc3 sub-node...
> 

Afaict all Qualcomm dts files has "snps,dwc3", so you can match against
that instead.

Regards,
Bjorn
