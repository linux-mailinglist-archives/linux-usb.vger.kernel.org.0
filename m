Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F26FF78025E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 02:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356316AbjHRACr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Aug 2023 20:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356466AbjHRACU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Aug 2023 20:02:20 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F8426AA
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 17:01:53 -0700 (PDT)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 426FE3F206
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 00:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1692316854;
        bh=MgI2PRVnPPIqpyWV48eHEkuJncT3yXRY6vb0xWqE9Dk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=ivW9XRO4Gns+lFAITGFIsbIMv+bVtzI8HBVYJ+BNUqdFPRyK60vCUIq6e1ATXp5Hm
         NWjGj6clDMtNIBslTgyXPJWtqeHnquJfgexFA3WrUQouMn6v92tRhvH8fLZdVgtVb5
         Byfba0azlNt4WtzDGRWf9xXCu4tKkwZDOtJu03ZvPt2BLvG5dsmAlhqlOvcQNGogCs
         0un0VMqG/5nngkLlCXEoWJBwKacZaf+IcpXs6742J2q8Tnu0SLirdaa7FmtDkKju25
         9Rq17wD40NYMby3JiA8ZK0zKNPzWoI2o3O7Gv2DVhgg0UKEHeBc9WUggQuciHi69ra
         cLWwx45HO5veQ==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-26b67f0a773so454749a91.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Aug 2023 17:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692316852; x=1692921652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgI2PRVnPPIqpyWV48eHEkuJncT3yXRY6vb0xWqE9Dk=;
        b=YqwIRFMuHBMn3A1ZBUyN3xA419RtDAfyPib1Lupx809JpxwJ3HU3umTcY5/pbX1dJB
         ZgBaWJ1og2D9caV3ux4Ekfy1p2BHhgeWbpSv/ZUNC5D61dAmR276nXUABMv2sXPNyCgL
         kow1VEgfyquKDgQyQkS46AEAcyD1fw4uBb1W9K0XOcPXSS7kb9mc9wCaeNidI7B6yHDB
         uXJdaIglSDhqsM4KqpRZKcpemWyc06mShJ32IkGvxJof77W2i7CX55EvJx9wcVpZtr4m
         IQPkPBiVfb6cmFwbo/nO6+7udMjsreO61NhqPrygRdumiOUzwR8UF105n6gTsy5LHUne
         K3BA==
X-Gm-Message-State: AOJu0Yz4TKhO0zaQ7unMXlTf4dsBWRDOh96mUwXg1LLeXzI3el061FXa
        GmBwwrD6Q7sntND7G67lZVFecxpnM5I8c6friMmCe/kJOyTWF++BOz/oDSQxJyAkbJZD7EzLYVH
        ZRnesCMDBvFENyVtEoxj+jICQYHK01vrUDKXfEjPIpYMhgPszbl0JzIETqbiHgA==
X-Received: by 2002:a17:90b:4ac5:b0:26d:355a:47e3 with SMTP id mh5-20020a17090b4ac500b0026d355a47e3mr962805pjb.38.1692316852436;
        Thu, 17 Aug 2023 17:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT61noyF8VX+CBukJ+VPqfLrzxYVc2aGtZTNJpUW0OSKe2zr9MkdvE1/spDh/dbnvIQbRhhtopupghu+xLLN0=
X-Received: by 2002:a17:90b:4ac5:b0:26d:355a:47e3 with SMTP id
 mh5-20020a17090b4ac500b0026d355a47e3mr962783pjb.38.1692316852122; Thu, 17 Aug
 2023 17:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230817093305.212821-1-kai.heng.feng@canonical.com> <cab8a29b-816c-41c7-8d2a-418f787e406e@rowland.harvard.edu>
In-Reply-To: <cab8a29b-816c-41c7-8d2a-418f787e406e@rowland.harvard.edu>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 18 Aug 2023 08:00:39 +0800
Message-ID: <CAAd53p7HZk5tTvT=dhSk01KSW4W3vCi+hY8aFYRoFzxs8YiiYA@mail.gmail.com>
Subject: Re: [PATCH] xhci: Disable connect, disconnect and over-current wakeup
 on system suspend
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     mathias.nyman@intel.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 17, 2023 at 10:07=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Thu, Aug 17, 2023 at 05:33:05PM +0800, Kai-Heng Feng wrote:
> > HP ProOne 440 G10 AIO sometimes cannot suspend as xHCI wakes up the
> > system:
> > [  445.814574] hub 2-0:1.0: hub_suspend
> > [  445.814652] usb usb2: bus suspend, wakeup 0
> > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, p=
ortsc: 0x202a0
>
> What is the meaning of the 0x202a0 bits?  What caused this wakeup?

The USB touchpanel is disconnecting from the USB bus. CCS is 0.

>
> > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> > [  445.824651] xhci_hcd 0000:00:14.0: handle_port_status: starting usb1=
 port polling.
> > [  445.844039] xhci_hcd 0000:00:14.0: PM: pci_pm_suspend(): hcd_pci_sus=
pend+0x0/0x20 returns -16
> > [  445.844058] xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_su=
spend+0x0/0x1c0 returns -16
> > [  445.844072] xhci_hcd 0000:00:14.0: PM: failed to suspend async: erro=
r -16
> > [  446.276101] PM: Some devices failed to suspend, or early wake event =
detected
> >
> > The system is designed to let display and touchpanel share the same
> > power source, so when the display becomes off, the USB touchpanel also
> > lost its power and disconnect itself from USB bus. That doesn't play
> > well when most Desktop Environment lock and turnoff the display right
> > before entering system suspend.
>
> I don't see why that should cause any trouble.  The display gets locked
> and turned off, the touchpanel disconnects from the USB bus, and then
> the system goes into suspend.  Why would there be a wakeup signal at
> this point?

The disconnecting can happens during the system suspend process, so
the suspend process is aborted.


>
> > So for system-wide suspend, also disable connect, disconnect and
> > over-current wakeup to prevent spurious wakeup.
>
> Whether to disable these things is part of the userspace policy.  The
> kernel should not make the decision; the user does by enabling or
> disabling wakeups.

The power/wakeup is already disabled.

The disconnecting event is from roothub and if roothub wakeup is
disabled, other USB devices lose the ability to wake the system up
from system suspend.

Kai-Heng

>
> Alan Stern
>
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/usb/host/xhci.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index fae994f679d4..dc499100efa6 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/module.h>
> >  #include <linux/moduleparam.h>
> >  #include <linux/slab.h>
> > +#include <linux/suspend.h>
> >  #include <linux/dmi.h>
> >  #include <linux/dma-mapping.h>
> >
> > @@ -789,7 +790,7 @@ static void xhci_disable_hub_port_wake(struct xhci_=
hcd *xhci,
> >               t2 =3D t1;
> >
> >               /* clear wake bits if do_wake is not set */
> > -             if (!do_wakeup)
> > +             if (!do_wakeup || pm_suspend_target_state !=3D PM_SUSPEND=
_ON)
> >                       t2 &=3D ~PORT_WAKE_BITS;
> >
> >               /* Don't touch csc bit if connected or connect change is =
set */
> > --
> > 2.34.1
> >
