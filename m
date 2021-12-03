Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624BF4676A8
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 12:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380515AbhLCLnb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 06:43:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbhLCLnb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 06:43:31 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE31C06173E
        for <linux-usb@vger.kernel.org>; Fri,  3 Dec 2021 03:40:06 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id n85so2625733pfd.10
        for <linux-usb@vger.kernel.org>; Fri, 03 Dec 2021 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37YYy+0hUPywYTskHeJHFsyxrQqCgMYdoIaQSnv4VuI=;
        b=XOF5M8YBb3eOOT2L22Wkknu2sO9KgprTbeKUJAsbmBb7+9DYP65JVcxbUXeQdrq8rk
         5y5HhPz/xLEkcT0eX2/i2If5JioPQaKGDOLEmpc7ZMnZ475jwkaYTayegbv5P7rKSFZ9
         sgeQ//4qmzpeln40SLBN4gjuJdMIgK7nEq+KSvQAyLU35G5LYZw1D5LVYeM2sbviMmK8
         qitgIGsBmKD39hn5Nnvqy+cSLsJeu5toCeRddLoLf3Mbsjs2q3N4LYAmgv3weVyRzjKI
         ZoCBYO6SFYJkVzr+CHKoZsNIZxQVT7w04EcvE2RVfe6Bkrv6kFkMWGKO4r0Iwn+FSsHs
         sKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37YYy+0hUPywYTskHeJHFsyxrQqCgMYdoIaQSnv4VuI=;
        b=Wg6iy8AmuGmZBrCM/CuwhYU3cEj5W60zZVhQevmmeRVLQICGvw9A6KC7auSHtxKH6X
         OdiVqroiEVhfxdzmKVgqZkSRsrpJVjMnLz80sPUSWgs3MZPGwNbwEqdnvOSseRL/Qmxb
         0kUTxHutVmAU4objPilE/KzwtXN/D5dt+4EgHW9yvy/+uGJvy3nhDsbar9CdEwPz1R0J
         5l5EcX+9wFYYlc0qg1FINEC6V8trNB7LK+iYIdimEhcNi9tLEEjcNp8mzIjiOR8yyspl
         aMXgcGI0Q8FkJTkh7rHp5B56qnaTEhXFYOing9HcNMajUgswTr0EqoeNzuz9kUyOTY8/
         w+Vw==
X-Gm-Message-State: AOAM531N8zhQRNOMpXWsbA9omXdpKummFV5i+V7s4eEraBwlLVA/BuIf
        ct5HtmYtN4mIoWDtEyQRoEnD6j0vcdfOzNrXSrA=
X-Google-Smtp-Source: ABdhPJyiXNsLmfb68+6cuIeY3G7G9kw33cdRZIdZFdwSi0IUcQFW9H6xCO44QGckIh+dcMEDdDB0xyL6oL49DxivC4U=
X-Received: by 2002:a63:8948:: with SMTP id v69mr4166253pgd.250.1638531605935;
 Fri, 03 Dec 2021 03:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
 <20211125073733.74902-3-mika.westerberg@linux.intel.com> <20211126200150.GA21796@wunner.de>
 <YaRy6+3rwJx6YcKn@lahna> <CA+CmpXug9u2kVgLOgk2WaipQOMWjihYo2OwU61ghopUG1_iHhw@mail.gmail.com>
 <YacaZaTWr3Tyivu8@lahna>
In-Reply-To: <YacaZaTWr3Tyivu8@lahna>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Fri, 3 Dec 2021 13:39:49 +0200
Message-ID: <CA+CmpXsCWknnXfxXo8cnVdk-1rrtbVmJ0J0tVbV2O6+YdWbtEA@mail.gmail.com>
Subject: Re: [PATCH 2/6] thunderbolt: Tear down existing tunnels when resuming
 from hibernate
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Lukas Wunner <lukas@wunner.de>,
        USB list <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 1, 2021 at 8:47 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> > > > > reason we re-use the tunnel discovery functionality and find out all the
> > > > > existing tunnels, and tear them down. Once that is done we can restore
> > > > > our tunnels.
> > > >
> > > > Hm, what if the system is running from a Thunderbolt-attached drive?
> > > > Will the mount points survive tearing down and re-establishing the
> > > > tunnels to that drive?
> > >
> > > Yes, they should. PCI is waiting for the TBT to resume so it should not
> > > notice this, and all the data is at point still synced out to the disks.
> >
> > But the user will notice the screen flashing, probably?
>
> They will notice flashing anyway because we jump from one kernel to
> another (as this is suspend-to-disk which involves shutting down the
> machine and booting to "fresh" resume kernel first). We actually tear
> down all the DP tunnels before we even enter suspend-to-disk (see
> 81a2e3e49f1f ("thunderbolt: Tear down DP tunnels when suspending")).
>

Ah, thanks.

> > Is this because the FW might not support the same set of functionality?
>
> Yes, that too.

OK

> > Maybe we can continue using the already established tunnels after
> > discovering them?
>
> Yes we could but that would require us to map the existing tunnels with
> the ones we had prior, and also indentify any new tunnels or missing
> ones. This makes it more complex, and the approach here seem to work
> according to my testing :) I can look for that solution too if you think
> it is necessary.

Following the previous points, I don't see any value in trying the
more complex solution.
Thanks!
