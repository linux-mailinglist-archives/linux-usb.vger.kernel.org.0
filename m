Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C6B3060C7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 17:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343956AbhA0QPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 11:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343662AbhA0QOE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 11:14:04 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773F0C061573
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 08:13:24 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id o10so3599550wmc.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 08:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Eb7sLjN+Y9Ss6oMnkExpYMqyva1tVQLoNcD1qYBJPYk=;
        b=N6ub1XjAtQx7WmiG4vrpAQirtSWSUAMcjbeqPVR0QUemZKeLHTSnd/q3txovfURo7K
         Yd+rQV9Ya9qo3jAEDYnh6LPckR+wg+iOFPHO1u0Vnxa/enIttLVAdbv8oNHbbbhOm2Ho
         +qycK05etzRVLlDBT4zPdhd4fmmWPjcB+uDVhTpN+AtKJu7XRY4kpbgTVi1iHW2AIkn6
         tpj3iTM8fUTBupWHyh/lRS53aJxXJUfCL3wlDKheaZ21Sce9wGEbrM7WPSy2e03FmYzH
         LkjuPBPFucObSzkHOVMPAaUEGHtd3cK5FM4Wm4VWNVzQlhAV6OFHqngCe0sQxWeD6ndw
         Ta6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Eb7sLjN+Y9Ss6oMnkExpYMqyva1tVQLoNcD1qYBJPYk=;
        b=TJvadjb2NnE19jFZZz69HrUYBzmv5TH69RmrkPTFx3321Me+ts3kMcqLXN6LgeDvrg
         KteTsWx2NIbKyZLdf3Fue7YlcvTa/ShRQET7HbXX+kUfGMh9D4HUOcY+3Vq7wU0u9GMM
         NUZYkaNL6M2eAGEoMJhY1SNwkwOXFBeBMVFtuTAdIEFUpUFrEXuR3BKNdREfihKniDaO
         rL4DzzW9KxXC2DKzbDn9FIep/FkbACu9KYcbbihu6N4zuiV0vZewwHAE76AHYAYiVrWu
         BwTvEjygDAF9OkotGTuwwna8l2e1Sw4VBG02Mjf+8V5WegJv6ZfBneMcvVtrJXj+hLwe
         j08g==
X-Gm-Message-State: AOAM5303GwFP4FEurE5xBQPPV3HWtck9mOGx9Wg0oVH7bMdR/2B/uF56
        rwkXd1ns86Wn3aCnCr+yGegko97ARdM8wIaL
X-Google-Smtp-Source: ABdhPJzbMMGbN5e0ZaCk6x3GmeJosmPXN5IJRaPjZdcCOUI+L431yoTD4b8/uWDViNe853x5jjGI5Q==
X-Received: by 2002:a1c:7914:: with SMTP id l20mr4993637wme.85.1611764003161;
        Wed, 27 Jan 2021 08:13:23 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id h16sm3495413wrq.29.2021.01.27.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 08:13:22 -0800 (PST)
Date:   Wed, 27 Jan 2021 16:13:20 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 05/12] thunderbolt: pa: Demote non-conformant kernel-doc
 headers
Message-ID: <20210127161320.GK4903@dell>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
 <20210127112554.3770172-6-lee.jones@linaro.org>
 <CAHp75VcFSQqDqjKCiCxdWyRpDDeMo4H6ELMHX15JSPfpt7nGHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcFSQqDqjKCiCxdWyRpDDeMo4H6ELMHX15JSPfpt7nGHQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 27 Jan 2021, Andy Shevchenko wrote:

> On Wednesday, January 27, 2021, Lee Jones <lee.jones@linaro.org> wrote:
> 
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/thunderbolt/path.c:476: warning: Function parameter or member
> > 'path' not described in 'tb_path_activate'
> >  drivers/thunderbolt/path.c:568: warning: Function parameter or member
> > 'path' not described in 'tb_path_is_invalid'
> >
> >
> I think the intention was to describe them in kernel doc format, perhaps
> you need to add descriptions of the fields?

For changes like this, I've been working to the following rule:

 - I'll provide fix-ups; if and only if the author has had a
 reasonable attempt at providing a conformant kernel-doc header.

So if the headers are just suffering from a little doc-rot i.e. the
API has changed, but the doc update was omitted, or most of the
parameters/members are documented, but some were forgotten about etc,
or if there are formatting issues, I'll happily take up the slack and
polish those up a bit.

However, if no attempt was made, then they get demoted.

I don't want to get into a situation where authors delicately provide
weak documentation with the expectation that someone else will come
along and turn them into conformant docs.

If authors wish to come back, provide proper descriptions &
formatting and subsequently re-promote them again, then all power to
them.

> > Cc: Andreas Noever <andreas.noever@gmail.com>
> > Cc: Michael Jamet <michael.jamet@intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/thunderbolt/path.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
> > index ca7d738d66dea..758b5fa0060c6 100644
> > --- a/drivers/thunderbolt/path.c
> > +++ b/drivers/thunderbolt/path.c
> > @@ -464,7 +464,7 @@ void tb_path_deactivate(struct tb_path *path)
> >         path->activated = false;
> >  }
> >
> > -/**
> > +/*
> >   * tb_path_activate() - activate a path
> >   *
> >   * Activate a path starting with the last hop and iterating backwards. Thee
> > @@ -559,7 +559,7 @@ int tb_path_activate(struct tb_path *path)
> >         return res;
> >  }
> >
> > -/**
> > +/*
> >   * tb_path_is_invalid() - check whether any ports on the path are invalid
> >   *
> >   * Return: Returns true if the path is invalid, false otherwise.
> >
> >
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
