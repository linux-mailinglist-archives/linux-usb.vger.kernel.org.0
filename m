Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483793A6C86
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jun 2021 18:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbhFNQ63 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 12:58:29 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:42838 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbhFNQ63 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 12:58:29 -0400
Received: by mail-qk1-f174.google.com with SMTP id q16so13075065qkm.9
        for <linux-usb@vger.kernel.org>; Mon, 14 Jun 2021 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hfu5NgIFq40kou8ktsFsyPT/u47drua/EV+uEvms0as=;
        b=HnpHr2U1MP8yIo85BrYggYWtKZJus8H1lq8WqBycD55gusAbGkldquOHYzTo2orNff
         es6qhxSgit//W+yb/kv1IXKQ7nrXkxUIDwtMgVu/37Ogo6XNhr5ASPracLuDIP0LQbWt
         X470xjDxEpzvvM0I+EhweILqwlMeNty+LfQGv2u2iRMy06e7gKbBh1lB+HKZ/EGGdfkW
         1ZF8o1bFcC3F0pLMIfXvINVQyfMMrvF5m9yEvOKGqXTbJ9kj/Id6LjWTTZC2Pu5UJguQ
         ELHboDHLTcccOdYUU3KPQHNktD1z0f0Z5Sf6Nhjb9Eghhu6+NzVVjuRLQMIS7QD2VtI9
         Udhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hfu5NgIFq40kou8ktsFsyPT/u47drua/EV+uEvms0as=;
        b=IDqNiYQymangsS8QR2ToffpsPdFJE6acujlzi+tnKLVGJHDvhOTdtj9ma2deXp4H+3
         zW55hJ8P1JmBlyYjf0xZZojxL4w9SmIz8vW6f/imoVOZFf2dppiL/ioPMvGrxuUmDebX
         Vjw1Dqc/9OEDyv2bkH5R6ZLERt6s+oAaVXja/u9u8OuZ51BNiy5MOSDiPUo+XZufw+aT
         vPITmLKtFCXlodB6Tqa9fNFRazuhESx7HQ9Xoenud0VHlIVRZU4fptubK8oJOdlMpYI9
         QjL9C+FgbYUnnd6aSn+bQNrj3kPWtAK0nJTyO2hcfIymGw11Ed/1C8dPgrYPVVjmaQAn
         Oe9w==
X-Gm-Message-State: AOAM533Kawwkphf1lqxAG5Cr1Fh3MKVw1KPTZgwFjpnraqBn9pVsRCrZ
        XtCX4ytXP4gyXZua6sNY4bCfj2LJgLYTqR632BBJyg==
X-Google-Smtp-Source: ABdhPJxn1vVW7p1bMRAUcIQAB7lJ029yoBGWJmOAWhzPUraeipD3orNbM7YU3pInKfcEmnM8oNsDbhrcYBiZ8b3qlfk=
X-Received: by 2002:a37:8d82:: with SMTP id p124mr17120811qkd.212.1623689725823;
 Mon, 14 Jun 2021 09:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210613151223.563736-1-kyletso@google.com> <CAPTae5JHHYO=y7279pFcHrt1oD3HHU8m3qkdb1vmNkbf6rLpqA@mail.gmail.com>
In-Reply-To: <CAPTae5JHHYO=y7279pFcHrt1oD3HHU8m3qkdb1vmNkbf6rLpqA@mail.gmail.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Tue, 15 Jun 2021 00:55:09 +0800
Message-ID: <CAGZ6i=37OKFC6TPuhzHxAFPxrCqgybF9R_3gwA22JoJUCYAzug@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Relax disconnect threshold during power negotiation
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 15, 2021 at 12:52 AM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> Hi Kyle,
>
> The change doesn't seem to handle the cases where the partner does not
> accept the request i.e.
>        "case PD_CTRL_REJECT:
>         case PD_CTRL_WAIT:
>         case PD_CTRL_NOT_SUPP:"
> We should fall back to the disconnect threshold based on the
> previously negotiated voltage levels in those cases.
>
> Regards,
> Badhri
>
>
> On Sun, Jun 13, 2021 at 8:13 AM Kyle Tso <kyletso@google.com> wrote:
> >
> > If the voltage is being decreased in power negotiation, the Source will
> > set the power supply to operate at the new voltage level before sending
> > PS_RDY. Relax the disconnect threshold for Sink after receiving Accept
> > Message to ensure the relaxed setting is enabled before the voltage
> > collapse. And the real threshold will be set after Sink receives PS_RDY
> > Message.
> >
> > Fixes: f321a02caebd ("usb: typec: tcpm: Implement enabling Auto Discharge disconnect support")
> > Cc: Badhri Jagan Sridharan <badhri@google.com>
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 0db685d5d9c0..9f3f37da71b6 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -2646,6 +2646,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
> >                 switch (port->state) {
> >                 case SNK_NEGOTIATE_CAPABILITIES:
> >                         port->pps_data.active = false;
> > +                       /* Voltage is going to be at new level. Relax the threshold here. */
> > +                       tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, 0);
> >                         tcpm_set_state(port, SNK_TRANSITION_SINK, 0);
> >                         break;
> >                 case SNK_NEGOTIATE_PPS_CAPABILITIES:
> > @@ -2656,6 +2658,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
> >                         port->req_supply_voltage = port->pps_data.req_out_volt;
> >                         port->req_current_limit = port->pps_data.req_op_curr;
> >                         power_supply_changed(port->psy);
> > +                       /* Voltage is going to be at new level. Relax the threshold here. */
> > +                       tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, 0);
> >                         tcpm_set_state(port, SNK_TRANSITION_SINK, 0);
> >                         break;

Yes, Badhri you are right.

And it's still too late for PPS power negotiation. The Source begins
to lower it's Vbus level just after Accept Message.
I will send patch v2 to fix these problems.

thanks,
Kyle

> >                 case SOFT_RESET_SEND:
> > --
> > 2.32.0.272.g935e593368-goog
> >
