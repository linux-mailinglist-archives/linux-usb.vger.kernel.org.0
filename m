Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CD1307163
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 09:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhA1IYo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 03:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhA1IYO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 03:24:14 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29A7C061573
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 00:23:33 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y187so3845954wmd.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 00:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ic2oi/5p5noTJe0FAVp45KGMLHVlv0jZIWSpdHeV8as=;
        b=e/xC7u4V3Rx6Zl/WF525sOns6uImABdWm6qW3Ao000qS5vRn003loi7YlD3pwFPEKQ
         oJ6qu6B+h5qZwZApo9ETNVYIyCSHm4dJTOnFRN4ib17SMD/OyaAJFw3lmGT/zb5BfXgW
         qfTXIUU1JijaiHBzKDN+e+aqeS+BTHaQQK/91gQEdK49i5ij2wejj4t6nx5AKI8WlFal
         Exl5IuKpD4D9u3PdNsSbX19Q9/8eoSUMnZs+Zwnxj2MTRVzopgGSfKcwbb3I2VC8evxV
         sTVsD1dVhZX4O9/j/d1RKCyL9JYctwdXWWDeJ4h74EpHDFb3ZzevfIEx9S0waQ8Rwcrw
         JYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ic2oi/5p5noTJe0FAVp45KGMLHVlv0jZIWSpdHeV8as=;
        b=Q5NHCkx57+APltlTfWrvqEPfknYc2uL7jtLc7q3ryS4MCufu6r9wEV3LYAuDkrLJpB
         dH/X1cSxpYyoqSd5QlaAEmm5CpU1GoKyPNC65uLNKYEJys09zbj7RVjnaDBhsrJo8WGr
         AFe5fAynDYQmf4pDBAtx/eEH/sD3Z90Dio01+0FZpmLIgN+qCsAHSD/NdkwX5vyd57h5
         Nh0bLMTX2QThSvBvddeS+TvcVq7vCirjAPtbey0T7EyQD1XVy8SvekHZJKV26F8ng7q5
         M5mfeGgzZtnloUsy5BI7NkOxHP/4BhD2XsnsZh5Du9qCvnBgFwgLurfTBwFLBBmzZwHY
         TL4Q==
X-Gm-Message-State: AOAM5325BSjGjdQOrxQgffjuZ5BgJDj0dCDDe30fF5GnTIqQGJGeaTV9
        PjKQcibBn/A5o/XH+3NI/ea/QA==
X-Google-Smtp-Source: ABdhPJz0NQvHzlKSh2+21HzqwTiasEY4LnRE8UcLaNwhitb45V4qFnyBBUxVZFYn2jFOb5XS6753NQ==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id g6mr7778365wmq.2.1611822212683;
        Thu, 28 Jan 2021 00:23:32 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i6sm5973976wrs.71.2021.01.28.00.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 00:23:31 -0800 (PST)
Date:   Thu, 28 Jan 2021 08:23:30 +0000
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
Message-ID: <20210128082330.GC4774@dell>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
 <20210127112554.3770172-6-lee.jones@linaro.org>
 <CAHp75VcFSQqDqjKCiCxdWyRpDDeMo4H6ELMHX15JSPfpt7nGHQ@mail.gmail.com>
 <20210127161320.GK4903@dell>
 <20210127170035.GG2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210127170035.GG2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 27 Jan 2021, Mika Westerberg wrote:

> On Wed, Jan 27, 2021 at 04:13:20PM +0000, Lee Jones wrote:
> > On Wed, 27 Jan 2021, Andy Shevchenko wrote:
> > 
> > > On Wednesday, January 27, 2021, Lee Jones <lee.jones@linaro.org> wrote:
> > > 
> > > > Fixes the following W=1 kernel build warning(s):
> > > >
> > > >  drivers/thunderbolt/path.c:476: warning: Function parameter or member
> > > > 'path' not described in 'tb_path_activate'
> > > >  drivers/thunderbolt/path.c:568: warning: Function parameter or member
> > > > 'path' not described in 'tb_path_is_invalid'
> > > >
> > > >
> > > I think the intention was to describe them in kernel doc format, perhaps
> > > you need to add descriptions of the fields?
> > 
> > For changes like this, I've been working to the following rule:
> > 
> >  - I'll provide fix-ups; if and only if the author has had a
> >  reasonable attempt at providing a conformant kernel-doc header.
> > 
> > So if the headers are just suffering from a little doc-rot i.e. the
> > API has changed, but the doc update was omitted, or most of the
> > parameters/members are documented, but some were forgotten about etc,
> > or if there are formatting issues, I'll happily take up the slack and
> > polish those up a bit.
> > 
> > However, if no attempt was made, then they get demoted.
> > 
> > I don't want to get into a situation where authors delicately provide
> > weak documentation with the expectation that someone else will come
> > along and turn them into conformant docs.
> > 
> > If authors wish to come back, provide proper descriptions &
> > formatting and subsequently re-promote them again, then all power to
> > them.
> 
> Thanks for pointing these out. I prefer we fix the kernel-docs (add what
> is missing) instead. I'll take care of that.

Are you planning on actually using this?

I don't see a Doc link for these functions in Mainline:

  `git grep kernel-doc:: | grep thunderbolt`
  
-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
