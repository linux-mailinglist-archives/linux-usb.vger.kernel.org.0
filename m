Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A63E241FA7
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 20:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgHKSYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 14:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgHKSYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 14:24:45 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BED8C061787
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 11:24:45 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id j23so6488400vsq.7
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bbVhUdfyZzfrQXbmgWLydmB0LBLARZ5TVy9YQKsgx0=;
        b=kVR4/Hh27NyUuG4f8zGbtHJDgMKzkYr2Wfjris9a177lbJBd4SK9pY856sHOYHjlWF
         Ii1LXNVWskF7E3g5gYF7IysgSqB0IdrbpHcA0g8ZeYeoqhbS0X5ntXYytrjdUE33WkQ+
         r39kXpLAm1oLmp1Zs/FSUv3RAPju9OzNldQ03V4QHJ64DHyrwNRRFs+W5CK6gDZbzp/S
         5J+NOL3B1jGJ1ITwOm2O5zm5djiqWwgXdQzspvef2O9sWENrGDcAoABWVyLeHE6ZCt8j
         /Kc0IgHdy+pkhUYr+eGVA5MPedWpqUlTaUzH7hRJdC/Tzey9goPXn3iorqn0MiYU6mDK
         n+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bbVhUdfyZzfrQXbmgWLydmB0LBLARZ5TVy9YQKsgx0=;
        b=ohRXB2ERGcvjTzl/WNpF+xh+19yCFsr7fK49fIkfHKacZYmYPWiKEEkDXHzpcesXI3
         roOOdOiQsyzbnRpP838d4Nj3zz73InZx9e1bVj7SStH3iIjT1ZQRi6DG7t7CJB/4WOq0
         7NK2BRFqj0NiTJVbdGdy9mm+aVloihEpyHK4Ni5EJN44kA/SfMbwXdu0z28y2L8Ggo1X
         yfXewPpIQQmz+eqjVJ384+50VCFLDh86JTB6icxXgaJX667LeD15mcyWz0Kz4GYQKZjn
         FsJu4amNGrmGjlC8gbU/YYDV+eUV+delJiJRrDRLs1TccGiquktj4Y5GKP6msCrVzfd+
         am1A==
X-Gm-Message-State: AOAM532RAKLeZZpPVQKV8gL9UCV0iy0lEV0U4VizoEhw9NECgDTMmtgX
        sCB7ycrleolCzn0NE9wH7CYiGs5DuPEMQaruw1PNe3hnWSY=
X-Google-Smtp-Source: ABdhPJyPdoWdzJvqIUBhLpZ2m3/RQ9sPpDgddJNs05BtKbWqMfhfIx6cyGW42JKuVd7/Hs/mRFPk3B+ha+RzscTvclg=
X-Received: by 2002:a67:fbd1:: with SMTP id o17mr24263853vsr.19.1597170283940;
 Tue, 11 Aug 2020 11:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200811011126.130297-1-badhri@google.com> <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
In-Reply-To: <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 11 Aug 2020 11:24:07 -0700
Message-ID: <CAPTae5Lhty3rJymi-4gANjUoz79_LujdjddS9oT=vpOxTSecdQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: Fix TDA 2.2.1.1 and TDA 2.2.1.2 failures
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/10/20 6:11 PM, Badhri Jagan Sridharan wrote:
> >>From the spec:
> > "7.1.5 Response to Hard Resets
> > Hard Reset Signaling indicates a communication failure has occurred and
> > the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
> > and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
> > May reset during a Hard Reset since the VBUS voltage will be less than
> > vSafe5V for an extended period of time. After establishing the vSafe0V
> > voltage condition on VBUS, the Source Shall wait tSrcRecover before
> > re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
> > to the VCONN timing as specified in [USB Type-C 1.3]."
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 3ef37202ee37..e41c4e5d3c71 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3372,13 +3372,19 @@ static void run_state_machine(struct tcpm_port *port)
> >                       tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
> >               break;
> >       case SRC_HARD_RESET_VBUS_OFF:
> > -             tcpm_set_vconn(port, true);
> > +             /*
> > +              * 7.1.5 Response to Hard Resets
> > +              * Hard Reset Signaling indicates a communication failure has occurred and the
> > +              * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
> > +              * drive VBUS to vSafe0V as shown in Figure 7-9.
> > +              */
> > +             tcpm_set_vconn(port, false);
> >               tcpm_set_vbus(port, false);
> >               tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> >                              tcpm_data_role_for_source(port));
> > -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
>
> I am a bit concerned about this. If I understand correctly, it means that
> we won't turn VBUS back on unless a SRC_HARD_RESET_VBUS_OFF PD event is received.
> Is that correct ? What happens if that event is never received ?
>
> Thanks,
> Guenter

The term PD event is a little ambiguous to me. Trying to summarize the workflow.
Lower level tcpc driver would have to call tcpm_vbus_change which
would in-turn trigger TCPM_VBUS_EVENT
and queries port->tcpc->get_vbus to get the vbus status. It is not
really a PD protocol driven event hence the
confusion.

"What happens if that event is never received ?"
Yeah TCPM would be in SRC_HARD_RESET_VBUS_OFF till the tcpc calls the
tcpm_vbus_change.
Do you suspect that existing tcpc would not have the capability to
monitor vbus status while sourcing and call tcpm_vbus_change?

Thanks,
Badhri


> >               break;
> >       case SRC_HARD_RESET_VBUS_ON:
> > +             tcpm_set_vconn(port, true);
> >               tcpm_set_vbus(port, true);
> >               port->tcpc->set_pd_rx(port->tcpc, true);
> >               tcpm_set_attached_state(port, true);
> > @@ -3944,7 +3950,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
> >               tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
> >               break;
> >       case SRC_HARD_RESET_VBUS_OFF:
> > -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
> > +             /*
> > +              * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> > +              * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> > +              */
> > +             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >               break;
> >       case HARD_RESET_SEND:
> >               break;
> >
>
