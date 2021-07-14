Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95363C8BDC
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 21:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhGNTj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 15:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhGNTj0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 15:39:26 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F322C06175F
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 12:36:33 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id d9-20020a17090ae289b0290172f971883bso4557562pjz.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wgs9kkOFhLOksYOQRUFBs2GhmvjSObM43DNTw5CUiM8=;
        b=dJkuB4v/y2n+yB0cc2pe+Xv96t+7tZARjCHjk8SsN9L1jPE26ozsWulHDseoq4c4sa
         KNeu5+HxbcIlG/MDEmNWLC9BxgkHHIiEece1trrAUFiAOQ7HH92sQAftyXLgcX/B2B6x
         eAeMTFzlLza23RGEZ5i56uwJEpB/D3/dHooWrKezmaQ3gJoEjkj5N3hNT7SmFO/MAdD2
         C0sC+BtazzG1FSNGEmTewletVqkZcPau4sniBLGOtRH88Ho6Wo051NADKWZWhJQsDMvS
         6980N/aq4JR03rgYoTDrtdU8hyToxSYnHCKd88RFLIdQK161iUlPDFDzSML9P/zEwGW1
         4CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wgs9kkOFhLOksYOQRUFBs2GhmvjSObM43DNTw5CUiM8=;
        b=CTej6F9FQ01RKNnuwKNvCCKF8Pw58ka8aZkTizLKcFYtchmMogVyALTIVba9T9xj1Q
         em26Hzhj9Aw94GNo96iJWgLChKihecnUuLAxnv6y2Gq2UWW763UHRIJZgzQ01qpEJ64f
         oTHpk5PSK6ZVmTWxL9SXrxNfzAHjRngKIx3PyVs125ddSegoJjIgnuPejluQnNwM9p3q
         xsqrcIspksUy8lHu9et+5dp4WpldmZBZvf38Fg2dIEX1wCBW6g4iYOXzwVDZCMzVfr4A
         z0UUjOqWYfNoDKP3Q9ZOLNmvRsDT1qVnuBsl6ibMv4+Pbm9GOu5SUsFxnf4+bdicUlAs
         eOmQ==
X-Gm-Message-State: AOAM530j5STaQM6/UXLNjWysl7+wpsHCbFYPD8cicAMFMD8dcLs273Ft
        mEFIJh/QZLyohGyyuR4U0tyj4PMSUoxDMM6AtNk=
X-Google-Smtp-Source: ABdhPJz1aaYLQRuBtXontkT/hC4OY2/ohO/PBW8rGWtzcR6rV154mt/vJN1fXvAOmBPoyz55kqVUll6sT1O7fk6ICBs=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr5287778pjq.129.1626291393123;
 Wed, 14 Jul 2021 12:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210714140309.GA27799@redhat> <YO70Pf6051RbK7kl@smile.fi.intel.com>
 <CA+-xHTEcJYXCwLdwOzvXQGVfUVr3Ytj9ABEN4psBts=iRxqg8A@mail.gmail.com>
In-Reply-To: <CA+-xHTEcJYXCwLdwOzvXQGVfUVr3Ytj9ABEN4psBts=iRxqg8A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 14 Jul 2021 22:35:56 +0300
Message-ID: <CAHp75VevtQZL2ignf-Zary52KzJ3U_s2tk_aJMdLE5Nm12ifxw@mail.gmail.com>
Subject: Re: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
To:     David Jeffery <djeffery@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        Laurence Oberman <loberman@redhat.com>,
        Ewan Milne <emilne@redhat.com>, apanagio@redhat.com,
        torez@redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 6:55 PM David Jeffery <djeffery@redhat.com> wrote:
> On Wed, Jul 14, 2021 at 10:27 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jul 14, 2021 at 10:03:09AM -0400, David Jeffery wrote:
> >
> > Thanks, I have few minor comments, after addressing them feel free to add
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > > When MSI is used by the ehci driver, it can cause interrupts to be lost which
> >
> > ehci -> EHCI everywhere?
> >
>
> Are you asking for a capitalization change in the text or asking what
> all is affected by the bug?

I'm suggesting to capitalize the abbreviation (maybe not in all cases,
but where you refer to the hardware, for the driver it's called
ehci-hcd).

...

> > >       u32                     status, masked_status, pcd_status = 0, cmd;
> > > +     u32                     current_status;
> >
> > Perhaps
> >
> >         u32                     status, current_status, masked_status, pcd_status = 0;
> >         u32                     cmd;
> >
> > ?
>
> Is this a style preference?  I can change it and just did it in a way
> to minimize line changes.

Yes, I believe it's a preference of having something unified
semantically on one line.

-- 
With Best Regards,
Andy Shevchenko
