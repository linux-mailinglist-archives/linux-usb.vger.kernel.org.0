Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D6F3EFEF4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 10:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239781AbhHRIQ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 04:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239761AbhHRIQ4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 04:16:56 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DF3C061764
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 01:16:22 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id j18so1627783ioj.8
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f48NsyL/6lBTgOt6O/gcWmcOZcZD8/9FqEZ4in00SX0=;
        b=JUy67IxFGnoaupRUG2Efz9os2KiHbI3Mx1V3htAXK3kE3CTfoWWiptq8Yl+J5kQPhD
         ahZrJTBKbibelEXbzzIiDGWVZbJzavqojQgQRanNAa/NLBRkXBvSKICbKh+kimp0d5Dn
         QqidOVoEz/mhh9G6T+wW615f+g2PXMHz3AKR4P4n0LeSopeGqXNJwXP6/Zz65mkdY8i1
         JUKDyEIJAo0sw3xwK3u2DhdAZ+n3ejksC1uZSLtXJpUeMTRyAWG8oYm1uwPSpp28ztaf
         Yaei1fGBH1n5teTcSy+tOYN4sVgfaD29a88MLDVEs8RibeRv29OeYL6KB20ynX/7EJnG
         pj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f48NsyL/6lBTgOt6O/gcWmcOZcZD8/9FqEZ4in00SX0=;
        b=GYTKfyijIo58RuNwNj8vw+sxSlWFhkfbKdEdGLDyPN3ofvLbqDvG1KMvWIJRZisWt5
         9JamFvoncYF6i/ZD1RXAmTYyczMSy/ksSXDquKYrsRyd99Av3hCjnlcDeUEyJMUw9AH7
         z2IK2NVkeTaCC0doRQn7/pScH6zEIkwKDc5aUjp7vv1Rn2w/0N3vN+olhzNFDIFNuWqI
         HVV53YIFDUG2XqkMMDD3sn+1CxQvsonNOCbWWPzLbVXK7Vzik8VA5HXjruUnU6M/9evi
         NoY53I/2Ln/y+bLvXwlN3+LEVq6c9zu04sWdf5Re0ueacBsefzSskqcobywzRkEIDHFp
         tiNA==
X-Gm-Message-State: AOAM533c3sp3sgftEo3bsBLFgEqne3rK5D0g7hZHLDl35ZwgI5N/bSFL
        Px9JRlhMuuf8BAHrAidxeY0po9TYxjTAlYKFCXEiEw==
X-Google-Smtp-Source: ABdhPJyNjC3MX+dxkWyWoTUqfpgFxU5x6fxv2FBDOVf1GsOPr00KpoZuui8RzZx80Qm1K1xtIezOZC0P3PulKjUy9xE=
X-Received: by 2002:a6b:6a14:: with SMTP id x20mr6466949iog.177.1629274581427;
 Wed, 18 Aug 2021 01:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210813043131.833006-1-icenowy@aosc.io> <YRuDG78N2mB5w37p@kuha.fi.intel.com>
 <58034df4-f18c-ab3e-1fcc-dc85fc35320f@roeck-us.net> <CAGZ6i=1s9X58tOwoiGAxMkMVBTyGTjysOSe9bP8Q4WosmCtymw@mail.gmail.com>
In-Reply-To: <CAGZ6i=1s9X58tOwoiGAxMkMVBTyGTjysOSe9bP8Q4WosmCtymw@mail.gmail.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Wed, 18 Aug 2021 16:16:05 +0800
Message-ID: <CAGZ6i=0d8vHjvR9o+KCvaFGkiY4MBp7SySxHrzYEBb0LhHkC1A@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: always rediscover when swapping DR
To:     Guenter Roeck <linux@roeck-us.net>, Icenowy Zheng <icenowy@aosc.io>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 18, 2021 at 4:02 PM Kyle Tso <kyletso@google.com> wrote:
>
> On Tue, Aug 17, 2021 at 11:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 8/17/21 2:36 AM, Heikki Krogerus wrote:
> > > On Fri, Aug 13, 2021 at 12:31:31PM +0800, Icenowy Zheng wrote:
> > >> Currently, TCPM code omits discover when swapping to gadget, and assume
> > >> that no altmodes are available when swapping from gadget. However, we do
> > >> send discover when we get attached as gadget -- this leads to modes to be
> > >> discovered twice when attached as gadget and then swap to host.
> > >>
> > >> Always re-send discover when swapping DR, regardless of what change is
> > >> being made; and because of this, the assumption that no altmodes are
> > >> registered with gadget role is broken, and altmodes de-registeration is
> > >> always needed now.
> > >>
> > >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > >> ---
> > >>   drivers/usb/typec/tcpm/tcpm.c | 9 ++++-----
> > >>   1 file changed, 4 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > >> index b9bb63d749ec..ab6d0d51ee1c 100644
> > >> --- a/drivers/usb/typec/tcpm/tcpm.c
> > >> +++ b/drivers/usb/typec/tcpm/tcpm.c
> > >> @@ -4495,15 +4495,14 @@ static void run_state_machine(struct tcpm_port *port)
> > >>              tcpm_set_state(port, ready_state(port), 0);
> > >>              break;
> > >>      case DR_SWAP_CHANGE_DR:
> > >> -            if (port->data_role == TYPEC_HOST) {
> > >> -                    tcpm_unregister_altmodes(port);
> > >> +            tcpm_unregister_altmodes(port);
> > >> +            if (port->data_role == TYPEC_HOST)
> > >>                      tcpm_set_roles(port, true, port->pwr_role,
> > >>                                     TYPEC_DEVICE);
> > >> -            } else {
> > >> +            else
> > >>                      tcpm_set_roles(port, true, port->pwr_role,
> > >>                                     TYPEC_HOST);
> > >> -                    port->send_discover = true;
> > >> -            }
> > >> +            port->send_discover = true;
> > >>              tcpm_ams_finish(port);
> > >>              tcpm_set_state(port, ready_state(port), 0);
> > >>              break;
> > >
> > > Why is it necessary to do discovery with data role swap in general?
> > >
> > > thanks,
> > >
> >
> > Additional question: There are two patches pending related to DR_SWAP
> > and discovery. Are they both needed, or do they both solve the same
> > problem ?
> >
> > Thanks,
> > Guenter
>
> Hi, I just noticed this patch.
>
> Part of this patch and part of my patch
> https://lore.kernel.org/r/20210816075449.2236547-1-kyletso@google.com
> are to solve the same problem that Discover_Identity is not sent in a
> case where the port becomes UFP after DR_SWAP while in PD3.
>
> The difference (for the DR_SWAP part) is that my patch does not set
> the flag "send_discover" if the port becomes UFP after PD2 DR_SWAP.
> That is because in PD2 Spec, UFP is not allowed to be the SVDM
> Initiator.
>

"in PD2 Spec, UFP is not allowed to be the SVDM Initiator."
Sorry this is not correct. The exception is for the cable discovery.
But it doesn't matter here because tcpm.c doesn't support cable
discovery.

thanks,
Kyle

> This patch indeed solves another problem where
> tcpm_unregister_altmodes should be called during PD3 DR_SWAP because
> the port partner may return mode data in the latest Discover_Mode. For
> the PD2 case, I don't think it needs to be called because PD2 DFP will
> always return NAK for Discover_Mode. However it is fine because it is
> safe to call tcpm_unregister_altmodes even if there is no mode data.
>
> In fact, when I was tracing the code I found another bug. PD2 UFP is
> not allowed to send Discover_Identity and Discover_Mode. I can send
> another patch to address this problem.
>
> thanks,
> Kyle
