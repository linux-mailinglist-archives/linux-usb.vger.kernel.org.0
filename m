Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A82730B431
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 01:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhBBAc3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 19:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbhBBAc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 19:32:27 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42BFC06178A
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 16:31:28 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id e10so4416005vkm.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 16:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cRfY9yymC1FqHBkn3RUJdOofMf5Mx0Cb8K2kp8nCUFk=;
        b=ut6n8HAljwoT3F8K9mFW5AKoqi+N4P0tVJMl1yrdes34Zwpl5BtzMAa/CF711SbFlf
         P90pD3ydBcD2o8H5+Nc0QfQ+q/01/Bsr3hfRwCu1e0S7M2vXc2LLsWEkwoxanrizDqc2
         4jOtqd7oOEBJ5aomZ1nIZKrTuBZ+7s7Cekd8QXicwwCdvlbq1K8LLcNAYF439EUbZX13
         Cqax3TD4xUh9nZPzhhAr3DB/GpxMKEb9aZp1nuae9IHsHrFNkXBeLVJ5+pf6F5SQMURv
         +qaoJUthKlPknZs64tQJH6tyFRuS/gIfA+HrclKisldZ7CGzhMl8gBkrroA0AqKZwj7K
         Qpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cRfY9yymC1FqHBkn3RUJdOofMf5Mx0Cb8K2kp8nCUFk=;
        b=ZH7SB+I6Z0vI0gKtI2+BzXfehbOhW7nkEIho9x55sCqTmyz18HKPXWcJ2/bvAMM0/d
         SW5g5OnA6ciQB1N6bYehZHjx+383uR0001QVN/8PCHiUe0tIvCKwRY4M1M8Gu8XvsHbe
         fJ6NolCeZE6ebvor4O8j83ZM9R5BQ9vo4Mrsr2ex4COvwN1w6LqmddGHdJ49P0l/8zub
         Q63iCRtG1GOj2mSKCQ+MzTlMlzajWzD36X9zeDlcdnWsu8F8xYVJXiMYGv85EqLFpjUi
         3WKwQAcOtLh/ZyLpU92YoFiXRdzPnxB74amxXu8H9F/Wtr2flNGmVOC0pOhKRlJrfRhH
         egrQ==
X-Gm-Message-State: AOAM531aCZ1m7mhJPoL8bE0Z7kxG3WZSyfhp3oM4amtiXduUdCcpaefe
        poFLQqWUR5zC7J+URhC47OwEgjpqPJryI42/mR1g9A==
X-Google-Smtp-Source: ABdhPJx0Gf9HxU2uyjDQFdbU6rj8ju/V4B81N6W+1rXfacAJuGaAduX9GSF+/vnI4QN3MQzuXPMSYli7m7Wx3bIzP80=
X-Received: by 2002:a1f:6ac3:: with SMTP id f186mr4764475vkc.18.1612225887587;
 Mon, 01 Feb 2021 16:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20210201095309.39486-1-badhri@google.com> <ce97202a-5e94-6abe-d7f2-0e8c50b18eef@roeck-us.net>
In-Reply-To: <ce97202a-5e94-6abe-d7f2-0e8c50b18eef@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Mon, 1 Feb 2021 16:30:51 -0800
Message-ID: <CAPTae5LDSCP4zs0dMwCN-F7w+Qi_cakeuhvrmYZ8dCRRGT1R7Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] usb: typec: tcpm: Add Callback to Usb
 Communication capable partner
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>, USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 1, 2021 at 6:59 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 2/1/21 1:53 AM, Badhri Jagan Sridharan wrote:
> > The USB Communications Capable bit indicates if port
> > partner is capable of communication over the USB data lines
> > (e.g. D+/- or SS Tx/Rx). Notify the status of the bit to low
> > level drivers to perform chip specific operation.
> > For instance, low level driver enables USB switches on D+/D-
> > lines to set up data path when the bit is set.
> >
> > Refactored from patch initially authored by
> > Kyle Tso <kyletso@google.com>
> >
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 16 ++++++++++++++++
> >  include/linux/usb/tcpm.h      |  5 +++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 0afd8ef692e8..96190b4d46a7 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -298,6 +298,7 @@ struct tcpm_port {
> >       struct usb_pd_identity partner_ident;
> >       struct typec_partner_desc partner_desc;
> >       struct typec_partner *partner;
> > +     bool partner_usb_comm_capable;
> >
> >       enum typec_cc_status cc_req;
> >
> > @@ -3429,6 +3430,16 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
> >       memset(modep, 0, sizeof(*modep));
> >  }
> >
> > +static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, bool capable)
> > +{
> > +     tcpm_log(port, "Setting usb_comm capable %s", capable ? "true" : "false");
> > +
> > +     if (port->tcpc->set_partner_usb_comm_capable)
> > +             port->tcpc->set_partner_usb_comm_capable(port->tcpc, capable);
> > +
> > +     port->partner_usb_comm_capable = capable;
> > +}
> > +
> >  static void tcpm_reset_port(struct tcpm_port *port)
> >  {
> >       int ret;
> > @@ -3445,6 +3456,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
> >       port->attached = false;
> >       port->pd_capable = false;
> >       port->pps_data.supported = false;
> > +     tcpm_set_partner_usb_comm_capable(port, false);
> >
> >       /*
> >        * First Rx ID should be 0; set this to a sentinel of -1 so that
> > @@ -3785,6 +3797,8 @@ static void run_state_machine(struct tcpm_port *port)
> >                       }
> >               } else {
> >                       tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
> > +                     port->partner_usb_comm_capable = port->sink_request & RDO_USB_COMM;
>
> That seems to be redundant since tcpm_set_partner_usb_comm_capable() is setting it again.

You are correct. This is redundant. Removing in V2 version.

>
> > +                     tcpm_set_partner_usb_comm_capable(port, port->partner_usb_comm_capable);
> >                       tcpm_set_state(port, SRC_TRANSITION_SUPPLY,
> >                                      PD_T_SRC_TRANSITION);
> >               }
> > @@ -4004,6 +4018,8 @@ static void run_state_machine(struct tcpm_port *port)
> >               break;
> >       case SNK_NEGOTIATE_CAPABILITIES:
> >               port->pd_capable = true;
> > +             port->partner_usb_comm_capable = port->sink_request & RDO_USB_COMM;
>
> Same here. But then I don't really see where this variable is actually used.
> Am I missing something ?

Not used anywhere else. Removing this in V2.
Also fixing the check for this case. It should have been
port->source_caps[0] & PDO_FIXED_USB_COMM

Thanks for the reviews,
Badhri

>
> Thanks,
> Guenter
>
> > +             tcpm_set_partner_usb_comm_capable(port, port->partner_usb_comm_capable);
> >               port->hard_reset_count = 0;
> >               ret = tcpm_pd_send_request(port);
> >               if (ret < 0) {
> > diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> > index 3af99f85e8b9..42fcfbe10590 100644
> > --- a/include/linux/usb/tcpm.h
> > +++ b/include/linux/usb/tcpm.h
> > @@ -108,6 +108,10 @@ enum tcpm_transmit_type {
> >   *           is supported by TCPC, set this callback for TCPM to query
> >   *           whether vbus is at VSAFE0V when needed.
> >   *           Returns true when vbus is at VSAFE0V, false otherwise.
> > + * @set_partner_usb_comm_capable:
> > + *              Optional; The USB Communications Capable bit indicates if port
> > + *              partner is capable of communication over the USB data lines
> > + *              (e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
> >   */
> >  struct tcpc_dev {
> >       struct fwnode_handle *fwnode;
> > @@ -139,6 +143,7 @@ struct tcpc_dev {
> >       int (*set_auto_vbus_discharge_threshold)(struct tcpc_dev *dev, enum typec_pwr_opmode mode,
> >                                                bool pps_active, u32 requested_vbus_voltage);
> >       bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
> > +     void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
> >  };
> >
> >  struct tcpm_port;
> >
>
