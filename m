Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0411530E061
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 18:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhBCRAV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 12:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbhBCQ7Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 11:59:16 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC7DC06178B
        for <linux-usb@vger.kernel.org>; Wed,  3 Feb 2021 08:58:05 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id lg21so182901ejb.3
        for <linux-usb@vger.kernel.org>; Wed, 03 Feb 2021 08:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLDyMEm2UP0zwRZVWd996U60qpq25KAuH1P6KDwAj2I=;
        b=XtAWFMtjzrKpyWqpgRhroFqCYAvrmouRWrLgNlOezbcr+GHecGDDdz5jOheFXKnfXW
         GWooU3YLvueLAjE7kmJupJeUVcV+aDfm9Tq8TORYctLJ4QRE6Vk/D5KQyG59u3t+iMsi
         8Xkut6Bl820t0RCm7gov5orr5c+Yj35iKZOa1vqU0dNInHEgc5kC7QWA98osRpB+hrYG
         TDA8bDF9wvWIALqS1DgiTie5AzuTKZemoUj+1f/6qvOasa53o6aGyEX/RO8FDsBdBn72
         N18B833TpXfCjlVqY8nf8+qw7eFhkAA8hKsH11jnFxaI+eeafc6x/qxcC6J1WtbFOE06
         t/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLDyMEm2UP0zwRZVWd996U60qpq25KAuH1P6KDwAj2I=;
        b=fWn/qo9JThgDlTwLft+mBa+XUEsw+Wl9ZirEE4PXsN1QUvNxnSb6etgkrQgct1wxjp
         jLSyAT8llAmNzKcSscsnTEoWoLFG5q52LrJAGa0xb7IEKFykKuh0JE7BUdwhTgmL4/wt
         zhwkwbV9hy71ECSIycECjQZNSUmpJxt/DySaLqLKCQChrLRCTFumLKDM0Aq9dqtmESbo
         TpvPlntmLF599brbu2iQkNSy1p1MQpvechxyj62kSf/byOkfscicGteU2Has5S9DODXf
         PqkvYeXLQqhiMofQaGigTjRBQxlMXyl9fSVxP/qGhe11TxCmcQR21UB97ZvgRSJ4iBOj
         U66A==
X-Gm-Message-State: AOAM532hD1PI26XOSEJxqUySZopVsL8Ru/xIsprWaJObkm3DskaSxslM
        x9Vnm3pF5l7HQaxlQ6tGWYPn+AUqqcERHaOhy8VplA==
X-Google-Smtp-Source: ABdhPJxuNzvSRY2DOKPDLMFb730rvon3BH8HH2THgDXMKhIqUliMkAmAcLf9nc6vhXyKSEO9l/3lMUkgXO3tC14ztu4=
X-Received: by 2002:a17:906:eddd:: with SMTP id sb29mr3991401ejb.383.1612371484328;
 Wed, 03 Feb 2021 08:58:04 -0800 (PST)
MIME-Version: 1.0
References: <202102032303.xnvdBAo2-lkp@intel.com> <CAGZ6i=2RTX3O9pLSt8xrnCmmKbVx26nnRN9h_Ci08dzmuJwJmQ@mail.gmail.com>
 <CANLzEktC3gL9vxsFOmQQ=0ymgPB+0AWQ+NL_tQVB3Jvr4B5LCw@mail.gmail.com> <CAGZ6i=0vdPoFCCJrk0a-ZDk7KaaKzHkv+V65T3RUaAgjAi7ZAg@mail.gmail.com>
In-Reply-To: <CAGZ6i=0vdPoFCCJrk0a-ZDk7KaaKzHkv+V65T3RUaAgjAi7ZAg@mail.gmail.com>
From:   Benson Leung <bleung@google.com>
Date:   Wed, 3 Feb 2021 08:57:53 -0800
Message-ID: <CANLzEkv+Zo+z1kzF50X2RicR3kDR0qoC7k4VwqXfrc5hbYAaFw@mail.gmail.com>
Subject: Re: [usb:usb-testing 155/155] drivers/platform/chrome/cros_ec_typec.c:778:8:
 error: 'CABLE_ATYPE' undeclared; did you mean
To:     Kyle Tso <kyletso@google.com>
Cc:     Prashant Malani <pmalani@google.com>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey Kyle,

On Wed, Feb 3, 2021 at 8:48 AM Kyle Tso <kyletso@google.com> wrote:
>
> On Thu, Feb 4, 2021 at 12:40 AM Benson Leung <bleung@google.com> wrote:
> >
> > Hi Kyle,
> >
> > On Wed, Feb 3, 2021 at 7:39 AM Kyle Tso <kyletso@google.com> wrote:
> > >
> > > Hi Prashant and Benson,
> > >
> > > I just got this notification that my patch "usb: pd: Update VDO
> > > definitions" caused this build break.
> > > The root cause is that I removed the definitions of Type-A and Type-B
> > > in Product Type VDOs as they have already been deprecated.
> > > And it's my bad that I didn't notice that someone else uses these definitions...
> > >
> > > I can fix it by simply removing them in the switch case but I am not
> > > sure whether they need to be kept for some reason (compatibility ?)
> > > What do you think?
> >
> > Strictly speaking, Type-A and Type-B definitions here are deprecated
> > in PD 3.0, but PD 3.0 implementations have to be able to fall back to
> > PD 2.0 protocol when the port partner or cable is PD 2.0 only.
> >
> > In the last version of the PD 2.0 specification released, the Type-A
> > and Type-B definitions still remain, so we can't really remove them
> > from the Kernel until all of PD 2.0 is deprecated.
> >
> > They're very rare cables, but I have seen a PD 2.0 cable with an
> > e-marker that indicates Type-B here.
> >
> > Hope this helps,
> > Benson
> >
> > --
> > Benson Leung
> > Staff Software Engineer
> > Chrome OS Kernel
> > Google Inc.
> > bleung@google.com
> > Chromium OS Project
> > bleung@chromium.org
>
> Thanks for the clarification! makes sense to me.
> I will provide the fix as soon as possible.
>
> thanks,
> Kyle

There are actually other fields where this is problematic, if you just
deleted a bunch of options that existed in PD 2.0 but not in PD 3.0.

I posted a response on the list. Short summary: I think we need to
bring back the whole set of PD 2.0 definitions in parallel with the PD
3.0 ones, and put switches everywhere based on pd_revision.

Let me know if I can provide more help here. I saw this coming a
little while ago, which is why I wanted to get the pd revision stuff
in.

Thanks,
Benson

-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
