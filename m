Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC04E3071C9
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 09:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbhA1Ijt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 03:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbhA1Ijb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 03:39:31 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67764C06174A
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 00:38:51 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o10so4677372wmc.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 00:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X5K1O0laC0GWRPhovZUx2IQ35yVagR2fxpXVtR2JtM8=;
        b=u5lbCEySh6dGXQYAR8vFEBJGHSvL2srZa2rct5RhH6JUXgDzkQtRb77YbgUfGCLaSw
         nGnk9n+sFisVSOPj51+kVmPJPKwKVE2hlizxU2TcpQqaSHbQALikJdQJea3PbvFZCtGj
         cMw85/cmIEJBqU0SbrvhpWLsqrcO5OkgAfQvsvoj35SQYOgx+jMgtX7ONi3IrcH3jHkA
         I8CIWgReEImKL71hU++wAbolJ+BnOydhf4fdt6tH0ryPNpAcL5vApTQVJUAVQHBFM6++
         s1mJuP8bzplRL8N4kuaFZRHGxirvpepNlbKo3vnytJB2noRyNNdJK9ItW6p3cLYFH/WI
         RnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X5K1O0laC0GWRPhovZUx2IQ35yVagR2fxpXVtR2JtM8=;
        b=PvqTbVEIWkWOMAgbMCM6kXoedW85ElApuNmT2wO6YquMBoomZJTF2Z8XyWrHNJUcLS
         PDvESpacYY9P+h64ABhsQnJfA7EvLnrEnuX0mhiv5czsFXJoxlEzjgzpzHS4NHtZvLSl
         JIdJrTffmetyf9Z5mYAA/JGaEPe8Aq5LEdGPl5O4sakIfn9SVq2inV11Ig1+ghlZngh2
         39hCzllj5XGpANFeALZh4kEROi0WoZ8eh+DIOnFwTzGTNX2ZDiWD4G7degC8lVOWB1kv
         SyRyV6k6p+haRla8zXszCug6IWOEWXRCtRajvv3qs4WeF7k5PeAut1DmukPiwLaFG4Wx
         kbDg==
X-Gm-Message-State: AOAM531rBFRw/ei0dKAf8Q++/nIaJrJ2gJnTf8j9quTL/yvOzhV7Ikcl
        AvYEjYrQ6iSw7ETk2jVlcvW2Xw==
X-Google-Smtp-Source: ABdhPJwB16eblLI9Uj5bR6ggYo7mxxG+y5Z5QXEV6DoFGh2+a6kNj69X4rU88ToH6z6sUdx+CPZakQ==
X-Received: by 2002:a1c:8002:: with SMTP id b2mr7869638wmd.94.1611823130189;
        Thu, 28 Jan 2021 00:38:50 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id l7sm5427197wmg.41.2021.01.28.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 00:38:49 -0800 (PST)
Date:   Thu, 28 Jan 2021 08:38:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 05/12] thunderbolt: pa: Demote non-conformant kernel-doc
 headers
Message-ID: <20210128083847.GD4774@dell>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
 <20210127112554.3770172-6-lee.jones@linaro.org>
 <CAHp75VcFSQqDqjKCiCxdWyRpDDeMo4H6ELMHX15JSPfpt7nGHQ@mail.gmail.com>
 <20210127161320.GK4903@dell>
 <20210127170035.GG2542@lahna.fi.intel.com>
 <20210128082330.GC4774@dell>
 <20210128082743.GP2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128082743.GP2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> On Thu, Jan 28, 2021 at 08:23:30AM +0000, Lee Jones wrote:
> > On Wed, 27 Jan 2021, Mika Westerberg wrote:
> > 
> > > On Wed, Jan 27, 2021 at 04:13:20PM +0000, Lee Jones wrote:
> > > > On Wed, 27 Jan 2021, Andy Shevchenko wrote:
> > > > 
> > > > > On Wednesday, January 27, 2021, Lee Jones <lee.jones@linaro.org> wrote:
> > > > > 
> > > > > > Fixes the following W=1 kernel build warning(s):
> > > > > >
> > > > > >  drivers/thunderbolt/path.c:476: warning: Function parameter or member
> > > > > > 'path' not described in 'tb_path_activate'
> > > > > >  drivers/thunderbolt/path.c:568: warning: Function parameter or member
> > > > > > 'path' not described in 'tb_path_is_invalid'
> > > > > >
> > > > > >
> > > > > I think the intention was to describe them in kernel doc format, perhaps
> > > > > you need to add descriptions of the fields?
> > > > 
> > > > For changes like this, I've been working to the following rule:
> > > > 
> > > >  - I'll provide fix-ups; if and only if the author has had a
> > > >  reasonable attempt at providing a conformant kernel-doc header.
> > > > 
> > > > So if the headers are just suffering from a little doc-rot i.e. the
> > > > API has changed, but the doc update was omitted, or most of the
> > > > parameters/members are documented, but some were forgotten about etc,
> > > > or if there are formatting issues, I'll happily take up the slack and
> > > > polish those up a bit.
> > > > 
> > > > However, if no attempt was made, then they get demoted.
> > > > 
> > > > I don't want to get into a situation where authors delicately provide
> > > > weak documentation with the expectation that someone else will come
> > > > along and turn them into conformant docs.
> > > > 
> > > > If authors wish to come back, provide proper descriptions &
> > > > formatting and subsequently re-promote them again, then all power to
> > > > them.
> > > 
> > > Thanks for pointing these out. I prefer we fix the kernel-docs (add what
> > > is missing) instead. I'll take care of that.
> > 
> > Are you planning on actually using this?
> 
> Yes, eventually :)

:)

> > I don't see a Doc link for these functions in Mainline:
> > 
> >   `git grep kernel-doc:: | grep thunderbolt`
> 
> There is not one now but I would like to have the kernel-docs at least
> in correct format so we can add the link later.

Very well.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
