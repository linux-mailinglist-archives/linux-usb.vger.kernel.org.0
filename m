Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEF83975E0
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 16:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbhFAO75 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 10:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhFAO75 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 10:59:57 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF21C061574
        for <linux-usb@vger.kernel.org>; Tue,  1 Jun 2021 07:58:15 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id f22so11640635pfn.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Jun 2021 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/SgOv8B3gFukE3eKv/Gf0mV6TeYayMATNW70mMDCkgw=;
        b=Va6UJ3892ZIaIj0JGAIIa5gdwr0UUbduHZD+wx1Vo7l0eXnzenimRUU8qnTz+iDzVP
         f4aB36mVN4R2pFDtxjdECqm7MY724XpYVcWYxIlf6U1M2dBsaw9sAFOqu8Jw1MTYVcK0
         nOD/ebBIJ61qhF1eIe1u4cBsKZypyZ3MkQLSnHjlqupzCrzk3tbvFP1E00cm/swCe6Fe
         b95Uy7Shvf5EPArbg5V1Wc4njKSEWEF7EWtq8muPz4CwfZFbMUHD/HjLWUwpaweTOvnl
         MVi7qimebVd1MavYEbNCP0JSrn28c9I1nRbRpYKE9vjaLobKrTwTl+RneokMejxQqmyC
         8fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/SgOv8B3gFukE3eKv/Gf0mV6TeYayMATNW70mMDCkgw=;
        b=Do0jOl0kPO3xjsgx6Gv3aAWToSMpE49ip+4P14TJ8xI6tPBAC8fd9hoOxomWWlsBFH
         wML2rhu7FwV8dCXPXbo9HgdlJek5Z3LiINOq6p/viMG6azzJFygCG8v8DK20bE0gh1Px
         X19sY6LJqnzMZxiztaHMeiTKW2Dgo4SH5lWQO5sUToVxXxpJ+zD53fFxjQSLuXH0UWP+
         6EgvWyLOIruRkFVJCYCJbCG65JvWh9aBwWHjzVJVspPgcv8yui/AhNvN+ApzoYu+WiFX
         vSemUFCh8QXagK08hKgQtdkHTEFFJYWl7YTwoFdfyUpZkvxQUzu1ci19DSlcrP8PQHSX
         OmoQ==
X-Gm-Message-State: AOAM533npb8JoeseGVuZb9xk56o8Yohcc8/dlodiAnTyVafI2t0cLCWP
        MFmUysx5byEwwKkQ5Pq6IC5LSf4OxzZW8V+NAmg=
X-Google-Smtp-Source: ABdhPJwzCDZPN0g3a4ZC8Zla+E2VyhEhRDSqcbH0LRONWz+yP/Cdk1wM6q7UUALdrJXCUhCCHBVYjYLtQGC6xo4z6oM=
X-Received: by 2002:a63:b507:: with SMTP id y7mr28416109pge.74.1622559495075;
 Tue, 01 Jun 2021 07:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
 <YLYLv+ozHCHhkfUM@kuha.fi.intel.com>
In-Reply-To: <YLYLv+ozHCHhkfUM@kuha.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Jun 2021 17:57:58 +0300
Message-ID: <CAHp75VeHwNh1fxjXLObO+KJG+5eY5jRxT7r7g4BmxPSbyq4Hmw@mail.gmail.com>
Subject: Re: DWC3 (PCI) software node double free on shutdown
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 1, 2021 at 1:28 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Jun 01, 2021 at 12:50:18PM +0300, Andy Shevchenko wrote:
> > >From time to time I see this on shutdown.
> > I suspect this happens due to the device core trying to remove
> > software nodes when it should not.
>
> Yes, this is caused by the device_remove_properties() call in
> device_del(). We can't remove that quite yet unfortunately.
>
> Can you test if this fixes the problem:

Thanks, I have pushed it to my repo and will monitor the behaviour for
a few days or so.

-- 
With Best Regards,
Andy Shevchenko
