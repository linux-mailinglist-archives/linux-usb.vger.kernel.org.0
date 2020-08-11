Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F204242070
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 21:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgHKTkA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 15:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgHKTkA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 15:40:00 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6144C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 12:39:59 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id l184so2896401vki.10
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AOiSxcuSfZzNv56P2tZSGWJNbgYch9+wEvv742NuBqE=;
        b=cEH19YscT/ZWpvdojxqMu6DwaSPCy6M0c6BUPX2w6cR/lWOe9nBUYwYpX8Y01uETh2
         kyzp4LYgL7gSVq0ntMRO69xt6/rjxRTVjv2bokYEIF7SECO1Cvo/hmXOB9gD0DVxZmCV
         nc8qjgllaELRI2j5lbNuJ5p7t7N+cjEUxsgpLgki3+WEfy2eLQBZ0OCV/NGF23OyEUc9
         ouhKAKyZvGMaA1XmumRkNkOMx1qMikq6sx0qe6HPU2cbqbil+l5vTZTJCRtLK1CqeClE
         mfGaXV+EPyHxReNM55rQfoSj67j95hN5+3LS7LeSsGI/l43u1i/YtM7+33aW7ulHmyzH
         pHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AOiSxcuSfZzNv56P2tZSGWJNbgYch9+wEvv742NuBqE=;
        b=ZPWSKVTKsiS7Npb1TI6KSWnccKayfwdJkBKKg2/+wNO0imOEF/rW2ISLg6YiFas/GT
         4P8d0OBTAh4KcuxGPUSfY3eMAcVc7OqcvxJUTM7y30jDMBSmP5hu1mxIl7dWQmgxWpKC
         gUlCDSSiT5mzTMe5aiGnmcvMcEkCRnXoRwTXwj0vFhLTfFotHm9YMBqOBeKjzANOzb0e
         hYQ2z1HOYmF/8KHjZhx5biGL8pkVqrkYGsXB6PvmQ0MPLV0yvxfdE9geaBI5mvurL0n8
         P4OsBGzAvPMibZ9Cfq7Y1zxOA3TYeAHwWSpv1BwExWP0aM7a6GflSqwipyB5sYg7I6Gi
         b0Rw==
X-Gm-Message-State: AOAM533R/e8in/zbFcTrQ1o5nWzimGe+ozygCuY5I0hL5ONFFiNZRVIe
        eumZIuv8dc7B2SIq+NAzG5w54Qc2w/ncVuE3N/X3Qg==
X-Google-Smtp-Source: ABdhPJwQuDD3bf9gvYIUnNWZG0MGqlAUCFMoZtTuCxU/7Rjfe5ktF9qOoacVv2ix8pdIMOXu67iigYzpYZ/wPFkiC/A=
X-Received: by 2002:a1f:ab02:: with SMTP id u2mr26476383vke.80.1597174798811;
 Tue, 11 Aug 2020 12:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200811011126.130297-1-badhri@google.com> <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
 <CAPTae5Lhty3rJymi-4gANjUoz79_LujdjddS9oT=vpOxTSecdQ@mail.gmail.com> <20200811184507.GB86545@roeck-us.net>
In-Reply-To: <20200811184507.GB86545@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 11 Aug 2020 12:39:22 -0700
Message-ID: <CAPTae5KFxTS+QPnN1Qt_miOFdVYuyuDD2m=jH_Fo87F_C4tTBw@mail.gmail.com>
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

On Tue, Aug 11, 2020 at 11:45 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Aug 11, 2020 at 11:24:07AM -0700, Badhri Jagan Sridharan wrote:
> > On Mon, Aug 10, 2020 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 8/10/20 6:11 PM, Badhri Jagan Sridharan wrote:
> > > >>From the spec:
> > > > "7.1.5 Response to Hard Resets
> > > > Hard Reset Signaling indicates a communication failure has occurred and
> > > > the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
> > > > and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
> > > > May reset during a Hard Reset since the VBUS voltage will be less than
> > > > vSafe5V for an extended period of time. After establishing the vSafe0V
> > > > voltage condition on VBUS, the Source Shall wait tSrcRecover before
> > > > re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
> > > > to the VCONN timing as specified in [USB Type-C 1.3]."
> > > >
> > > > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > > > ---
> > > >  drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++---
> > > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > > > index 3ef37202ee37..e41c4e5d3c71 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > > @@ -3372,13 +3372,19 @@ static void run_state_machine(struct tcpm_port *port)
> > > >                       tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
> > > >               break;
> > > >       case SRC_HARD_RESET_VBUS_OFF:
> > > > -             tcpm_set_vconn(port, true);
> > > > +             /*
> > > > +              * 7.1.5 Response to Hard Resets
> > > > +              * Hard Reset Signaling indicates a communication failure has occurred and the
> > > > +              * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
> > > > +              * drive VBUS to vSafe0V as shown in Figure 7-9.
> > > > +              */
> > > > +             tcpm_set_vconn(port, false);
> > > >               tcpm_set_vbus(port, false);
> > > >               tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> > > >                              tcpm_data_role_for_source(port));
> > > > -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> > >
> > > I am a bit concerned about this. If I understand correctly, it means that
> > > we won't turn VBUS back on unless a SRC_HARD_RESET_VBUS_OFF PD event is received.
> > > Is that correct ? What happens if that event is never received ?
> > >
> > > Thanks,
> > > Guenter
> >
> > The term PD event is a little ambiguous to me. Trying to summarize the workflow.
> > Lower level tcpc driver would have to call tcpm_vbus_change which
> > would in-turn trigger TCPM_VBUS_EVENT
> > and queries port->tcpc->get_vbus to get the vbus status. It is not
> > really a PD protocol driven event hence the
> > confusion.
> >
> > "What happens if that event is never received ?"
> > Yeah TCPM would be in SRC_HARD_RESET_VBUS_OFF till the tcpc calls the
> > tcpm_vbus_change.
> > Do you suspect that existing tcpc would not have the capability to
> > monitor vbus status while sourcing and call tcpm_vbus_change?
> >
> That, or the driver might be buggy, or the hardware does't signal a status
> update, or the update gets lost. I think we should have some backup,
> to trigger if the event is not received in a reasonable amout of time.
> I don't know if the specification has some kind of maximum limit. If
> not, we should still have something
>
> Thanks,
> Guenter

Got it ! The specification actually has a bound for vbus off.
tSafe0V  - Time to reach vSafe0V max - 650ms. (PD_T_SAFE_0V).
So I will bound it to that.

From Table 7-12 Sequence Description for a Source Initiated Hard Reset:
4.Policy Engine waits tPSHardReset after sending Hard Reset Signaling
and then tells the Device Policy Manager to instruct the power supply
to perform a Hard Reset. The transition to vSafe0V Shall occur within
tSafe0V (t2).
5 After tSrcRecover the Source applies power to VBUS in an attempt to
re-establish communication with the Sink and resume USB Default
Operation. The transition to vSafe5V Shall occur within tSrcTurnOn
(t4).

Thanks,
Badhri

>
> > Thanks,
> > Badhri
> >
> >
> > > >               break;
> > > >       case SRC_HARD_RESET_VBUS_ON:
> > > > +             tcpm_set_vconn(port, true);
> > > >               tcpm_set_vbus(port, true);
> > > >               port->tcpc->set_pd_rx(port->tcpc, true);
> > > >               tcpm_set_attached_state(port, true);
> > > > @@ -3944,7 +3950,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
> > > >               tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
> > > >               break;
> > > >       case SRC_HARD_RESET_VBUS_OFF:
> > > > -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
> > > > +             /*
> > > > +              * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> > > > +              * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> > > > +              */
> > > > +             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> > > >               break;
> > > >       case HARD_RESET_SEND:
> > > >               break;
> > > >
> > >
