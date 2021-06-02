Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3559398F84
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 18:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhFBQFb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 12:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhFBQFa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Jun 2021 12:05:30 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FEDC061574
        for <linux-usb@vger.kernel.org>; Wed,  2 Jun 2021 09:03:47 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id z26so2549765pfj.5
        for <linux-usb@vger.kernel.org>; Wed, 02 Jun 2021 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8lcG++fvJz38aA7Gh3cCknC2dof37Dqpe9qRNYbf/fM=;
        b=vh5BJRnL5t8CNtKM5y9D7W8s48c6327Bv6pQbsDgct3j52gwwBTwIQmmg5S82i6fgK
         46NHHQBXPWnu3dWt+jbU5ZzYczdaX2XI1yMXOXlYez/hnDrYSGX47QSUnop6ML9OztAb
         Rkcpsyq322IRJSzFRb2CbN1NOGPGONn8m4TgdXdqiTzG/odymbA0utxGaKH4okAYblDW
         ISIke4GKslrDhBzmMqTrQWwmd2+L8Ekvryc5hc1hevJfaUQQvVG0Tc4PI9O/+kau1K3j
         zofhH6RbVvjn8HYweM9KamIoA/OO1wWGPc6qqoystSncotfVGXtyyVJdY680q8jgu5hH
         4haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8lcG++fvJz38aA7Gh3cCknC2dof37Dqpe9qRNYbf/fM=;
        b=qPxt7N9lWUQ1KYKvPhUnToLOqE/NHhAqMxHG4/E855yvwPwUOabqmBIqcAp0sznRw9
         yHjkR8oW7JWmXzjgfzaX8wAWiev7eoQ9Rb0iUVaMm4hltxoYg/KXwxavnmNztrD89r7K
         Cx9vabfhjPAxxGos8R5GP+PbnXwhRpNuf1zNrh9Qq+Ykqh7Rb4LJqqlEDLLPQHug30cl
         VGGM0zhThJMYPlLjEYrCLuy6pIKzevRPnMBZF9Ga59Yf+MtMc9ErfRjU0Ylf8ZfKWcpS
         MTdDeEbS0jX3iJ1iKQ8639sZwETxvaEaKtgxXRkUTr6nuWKocI0uE05nLUCWDneOaX0z
         uNGA==
X-Gm-Message-State: AOAM532tvNEYJMuCTl8XtIxn8MxKq5uISPKk5uFRhS/nZmqHK7HBrySE
        pzsYPIw7jL7RH5lpkuEm1gMPxydq3FLhbtu7+4B6YWDWCns=
X-Google-Smtp-Source: ABdhPJxpWes6TAvw4qpryvvl8C/RGyrokV4x8FEIKm5foUhMD0hAdxevk2T4RF5L+ZSZ83Cp75UUznNuTQre7DP06QI=
X-Received: by 2002:a63:79c3:: with SMTP id u186mr34792428pgc.203.1622649826704;
 Wed, 02 Jun 2021 09:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vd-5U5zgtDfM5C3Jsx51HVYB+rNcHYC2XP=G7dOd=cdTg@mail.gmail.com>
 <YLYLv+ozHCHhkfUM@kuha.fi.intel.com> <CAHp75VeHwNh1fxjXLObO+KJG+5eY5jRxT7r7g4BmxPSbyq4Hmw@mail.gmail.com>
In-Reply-To: <CAHp75VeHwNh1fxjXLObO+KJG+5eY5jRxT7r7g4BmxPSbyq4Hmw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Jun 2021 19:03:30 +0300
Message-ID: <CAHp75Vdftvnv3yNx2OWLW2quSHRHrwknWjPC0zSPkx=roa6m_Q@mail.gmail.com>
Subject: Re: DWC3 (PCI) software node double free on shutdown
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 1, 2021 at 5:57 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jun 1, 2021 at 1:28 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Tue, Jun 01, 2021 at 12:50:18PM +0300, Andy Shevchenko wrote:
> > > >From time to time I see this on shutdown.
> > > I suspect this happens due to the device core trying to remove
> > > software nodes when it should not.
> >
> > Yes, this is caused by the device_remove_properties() call in
> > device_del(). We can't remove that quite yet unfortunately.
> >
> > Can you test if this fixes the problem:
>
> Thanks, I have pushed it to my repo and will monitor the behaviour for
> a few days or so.

Unfortunately it does not prevent the issue from happening. Till now I
have got it already twice (for dozen or so reboots).

-- 
With Best Regards,
Andy Shevchenko
