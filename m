Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C409735EA20
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 02:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348910AbhDNA7w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 20:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348901AbhDNA7v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 20:59:51 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53F1C061756
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 17:59:30 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id r18so3598839vso.12
        for <linux-usb@vger.kernel.org>; Tue, 13 Apr 2021 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y/54ILv5Q72An34zKDPTFESYNXFuudb6GNqLTSzT03Y=;
        b=CD8jNA/CwaQxyYuthSMMfMZpaVUZR2GZiWtJsXZ52SSSLXN/jzrZplLASx/kNE/EBM
         Aamv9Y3Sv7LmmjmZ4BSjuqthpjBvgo5eRI0JMRZ+KxbA87zHj1bRYv02e4dO8LHhEeTl
         TMtOpsFlBPmCY7V4UVWS2CMjIDLlzC1MdyqoGTeucbjYZt/q7OFg4+XCl4NJfeeYvMHb
         6yjj7fUpf4vfbSRPpsT81KWrZgXALIw10zseLHdDqAPIhhGOkvBpS5bLv402rzipm85r
         kcCKjrh5NYQSSUCQIaLCIyFjkwNsgwXZGfX0tdUPqe50miff3mdU3UZO8fvAeaUy5WDn
         V/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y/54ILv5Q72An34zKDPTFESYNXFuudb6GNqLTSzT03Y=;
        b=Zu/cSXvdjkzC+ovrgQk4V9TodawNFTbTnDZouQBVpefuK3LsFu/INhlWBePQaMnOxX
         gWNCrvZwr5kU0I9nlSd1PbFtLa/X4frHo8JhURRdUkjRBdDYgbKAtIc1EQbLj6SAYpaa
         iq3y87Px8nRuAR3tKHnRCgmZ8fnGTG+fkYTohmmULFP8yi8K35M183t7aE1+gPszi+aw
         UxRUTcVqpFC/mO8GnU5YYg9EWycC6WCkVFnVE0ZBwqvJ8/tIj0/VEuQzSTpOuCHuxsSZ
         yCP+pAyAvAifSS5MnRqRz6ibUPFjTQjRZYGx/Hmba+iTwE67fCa0yR8i2SKUJAuch1T/
         tWIg==
X-Gm-Message-State: AOAM530wgSrrDN2GtIPVXBM5uEJjtEwWPtrKltJcM5FJVt72jv+0Cbyf
        2XMtWoOoxbCkKkpOWhgtExUj1bnYag1dzjEjqHQBqI2LyHBvSw==
X-Google-Smtp-Source: ABdhPJzoRlLgGDRdvSA7gaqK4TOeAzpTt3J3nsLaQ3IVJCjYTp9P41srxdWa1+FAp4wB+e1i5FracvZv0O6XVGDg48U=
X-Received: by 2002:a67:ee08:: with SMTP id f8mr18327069vsp.58.1618361969412;
 Tue, 13 Apr 2021 17:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210407200723.1914388-1-badhri@google.com> <20210407200723.1914388-4-badhri@google.com>
 <YG61KxWrwaOe0ddL@kuha.fi.intel.com>
In-Reply-To: <YG61KxWrwaOe0ddL@kuha.fi.intel.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 13 Apr 2021 17:58:54 -0700
Message-ID: <CAPTae5Kdsjz64Aj9tejjFYOYWz1WFLNsxEEh-Sc0QExZG8uMtQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] usb: typec: tcpm: Honour pSnkStdby requirement
 during negotiation
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 8, 2021 at 12:48 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Apr 07, 2021 at 01:07:21PM -0700, Badhri Jagan Sridharan wrote:
> > >From PD Spec:
> > The Sink Shall transition to Sink Standby before a positive or
> > negative voltage transition of VBUS. During Sink Standby
> > the Sink Shall reduce its power draw to pSnkStdby. This allows
> > the Source to manage the voltage transition as well as
> > supply sufficient operating current to the Sink to maintain PD
> > operation during the transition. The Sink Shall
> > complete this transition to Sink Standby within tSnkStdby
> > after evaluating the Accept Message from the Source. The
> > transition when returning to Sink operation from Sink Standby
> > Shall be completed within tSnkNewPower. The
> > pSnkStdby requirement Shall only apply if the Sink power draw
> > is higher than this level.
> >
> > The above requirement needs to be met to prevent hard resets
> > from port partner.
> >
> > Without the patch: (5V/3A during SNK_DISCOVERY all the way through
> > explicit contract)
> > [   95.711984] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> > [   95.712007] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> > [   95.712017] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> > [   95.837190] VBUS on
> > [   95.882075] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> > [   95.882082] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AMS]
> > [   95.882086] polarity 1
> > [   95.883151] set_auto_vbus_discharge_threshold mode:0 pps_active:n vbus:5000 ret:0
> > [   95.883441] enable vbus discharge ret:0
> > [   95.883445] Requesting mux state 1, usb-role 2, orientation 2
> > [   95.883776] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> > [   95.883879] pending state change SNK_STARTUP -> SNK_DISCOVERY @ 500 ms [rev3 NONE_AMS]
> > [   96.038960] VBUS on
> > [   96.383939] state change SNK_STARTUP -> SNK_DISCOVERY [delayed 500 ms]
> > [   96.383946] Setting voltage/current limit 5000 mV 3000 mA
> > [   96.383961] vbus=0 charge:=1
> > [   96.386044] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
> > [   96.386309] pending state change SNK_WAIT_CAPABILITIES -> HARD_RESET_SEND @ 450 ms [rev3 NONE_AMS]
> > [   96.394404] PD RX, header: 0x2161 [1]
> > [   96.394408]  PDO 0: type 0, 5000 mV, 3000 mA [E]
> > [   96.394410]  PDO 1: type 0, 9000 mV, 2000 mA []
> > [   96.394412] state change SNK_WAIT_CAPABILITIES -> SNK_NEGOTIATE_CAPABILITIES [rev2 POWER_NEGOTIATION]
> > [   96.394416] Setting usb_comm capable false
> > [   96.395083] cc=0 cc1=0 cc2=5 vbus=0 vconn=sink polarity=1
> > [   96.395089] Requesting PDO 1: 9000 mV, 2000 mA
> > [   96.395093] PD TX, header: 0x1042
> > [   96.397404] PD TX complete, status: 0
> > [   96.397424] pending state change SNK_NEGOTIATE_CAPABILITIES -> HARD_RESET_SEND @ 60 ms [rev2 POWER_NEGOTIATION]
> > [   96.400826] PD RX, header: 0x363 [1]
> > [   96.400829] state change SNK_NEGOTIATE_CAPABILITIES -> SNK_TRANSITION_SINK [rev2 POWER_NEGOTIATION]
> > [   96.400832] pending state change SNK_TRANSITION_SINK -> HARD_RESET_SEND @ 500 ms [rev2 POWER_NEGOTIATION]
> > [   96.577315] PD RX, header: 0x566 [1]
> > [   96.577321] Setting voltage/current limit 9000 mV 2000 mA
> > [   96.578363] set_auto_vbus_discharge_threshold mode:3 pps_active:n vbus:9000 ret:0
> > [   96.578370] state change SNK_TRANSITION_SINK -> SNK_READY [rev2 POWER_NEGOTIATION]
> >
> > With the patch:
> > [  168.398573] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
> > [  168.398605] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> > [  168.398619] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> > [  168.522348] VBUS on
> > [  168.568676] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> > [  168.568684] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AMS]
> > [  168.568688] polarity 1
> > [  168.569867] set_auto_vbus_discharge_threshold mode:0 pps_active:n vbus:5000 ret:0
> > [  168.570158] enable vbus discharge ret:0
> > [  168.570161] Requesting mux state 1, usb-role 2, orientation 2
> > [  168.570504] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
> > [  168.570634] pending state change SNK_STARTUP -> SNK_DISCOVERY @ 500 ms [rev3 NONE_AMS]
> > [  169.070689] state change SNK_STARTUP -> SNK_DISCOVERY [delayed 500 ms]
> > [  169.070695] Setting voltage/current limit 5000 mV 3000 mA
> > [  169.070702] vbus=0 charge:=1
> > [  169.072719] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
> > [  169.073145] pending state change SNK_WAIT_CAPABILITIES -> HARD_RESET_SEND @ 450 ms [rev3 NONE_AMS]
> > [  169.077162] PD RX, header: 0x2161 [1]
> > [  169.077172]  PDO 0: type 0, 5000 mV, 3000 mA [E]
> > [  169.077178]  PDO 1: type 0, 9000 mV, 2000 mA []
> > [  169.077183] state change SNK_WAIT_CAPABILITIES -> SNK_NEGOTIATE_CAPABILITIES [rev2 POWER_NEGOTIATION]
> > [  169.077191] Setting usb_comm capable false
> > [  169.077753] cc=0 cc1=0 cc2=5 vbus=0 vconn=sink polarity=1
> > [  169.077759] Requesting PDO 1: 9000 mV, 2000 mA
> > [  169.077762] PD TX, header: 0x1042
> > [  169.079990] PD TX complete, status: 0
> > [  169.080013] pending state change SNK_NEGOTIATE_CAPABILITIES -> HARD_RESET_SEND @ 60 ms [rev2 POWER_NEGOTIATION]
> > [  169.083183] VBUS on
> > [  169.084195] PD RX, header: 0x363 [1]
> > [  169.084200] state change SNK_NEGOTIATE_CAPABILITIES -> SNK_TRANSITION_SINK [rev2 POWER_NEGOTIATION]
> > [  169.084206] Setting standby current 5000 mV @ 500 mA
> > [  169.084209] Setting voltage/current limit 5000 mV 500 mA
> > [  169.084220] pending state change SNK_TRANSITION_SINK -> HARD_RESET_SEND @ 500 ms [rev2 POWER_NEGOTIATION]
> > [  169.260222] PD RX, header: 0x566 [1]
> > [  169.260227] Setting voltage/current limit 9000 mV 2000 mA
> > [  169.261315] set_auto_vbus_discharge_threshold mode:3 pps_active:n vbus:9000 ret:0
> > [  169.261321] state change SNK_TRANSITION_SINK -> SNK_READY [rev2 POWER_NEGOTIATION]
> > [  169.261570] AMS POWER_NEGOTIATION finished
> >
> > Fixes: f0690a25a140b ("staging: typec: USB Type-C Port Manager (tcpm)")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 17 +++++++++++++++++
> >  include/linux/usb/pd.h        |  2 ++
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index d1d03ee90d8f..770b2edd9a04 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4131,6 +4131,23 @@ static void run_state_machine(struct tcpm_port *port)
> >               }
> >               break;
> >       case SNK_TRANSITION_SINK:
> > +             /* From the USB PD spec:
> > +              * "The Sink Shall transition to Sink Standby before a positive or
> > +              * negative voltage transition of VBUS. During Sink Standby
> > +              * the Sink Shall reduce its power draw to pSnkStdby."
> > +              *
> > +              * This is not applicable to PPS though as the port can continue
> > +              * to draw negotiated power without switching to standby.
> > +              */
> > +             if (port->supply_voltage != port->req_supply_voltage && !port->pps_data.active &&
> > +                 port->current_limit * port->supply_voltage / 1000 > PD_P_SNK_STDBY_MW) {
> > +                     u32 stdby_ma = port->supply_voltage ? PD_P_SNK_STDBY_MW * 1000 /
> > +                             port->supply_voltage : 0;
>
> Looks like unnecessary condition to me. The first condition can not be
> true if port->supply_voltage == 0. So I think that should be just:
>
>                         u32 stdby_ma = PD_P_SNK_STDBY_MW * 1000 / port->supply_voltage;
>
> Or did I miss something?

You are right. That's indeed not necessary. I was wondering whether
port->supply_voltage would be
0 during the swap sequence. It doesn't seem to be. Updating in my next
version - V3. Thanks Heikki !

>
> > +                     tcpm_log(port, "Setting standby current %u mV @ %u mA",
> > +                              port->supply_voltage, stdby_ma);
> > +                     tcpm_set_current_limit(port, stdby_ma, port->supply_voltage);
> > +             }
> > +             fallthrough;
> >       case SNK_TRANSITION_SINK_VBUS:
> >               tcpm_set_state(port, hard_reset_state(port),
> >                              PD_T_PS_TRANSITION);
> > diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
> > index 70d681918d01..bf00259493e0 100644
> > --- a/include/linux/usb/pd.h
> > +++ b/include/linux/usb/pd.h
> > @@ -493,4 +493,6 @@ static inline unsigned int rdo_max_power(u32 rdo)
> >  #define PD_N_CAPS_COUNT              (PD_T_NO_RESPONSE / PD_T_SEND_SOURCE_CAP)
> >  #define PD_N_HARD_RESET_COUNT        2
> >
> > +#define PD_P_SNK_STDBY_MW    2500    /* 2500 mW */
> > +
> >  #endif /* __LINUX_USB_PD_H */
> > --
> > 2.31.1.295.g9ea45b61b8-goog
>
> thanks,
>
> --
> heikki
