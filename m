Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AB32423F0
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 04:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHLCER (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 22:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgHLCEQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 22:04:16 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3388CC06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:04:16 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id g11so178535ual.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 19:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n4534WVfwtYILd0kDXgE1s8p0HFb/iqe5lFVW/x7HYk=;
        b=IKf1A7uH52OPGehWEpED5AkCkL4zOEG3tTiTlxNacw9w3OstUOrxwpJfPyCWahbDST
         R0KqBAQOh8IrJ7chFno4IlJMA1MIABC88eQpuVPVejbMwNHgYaj9ox4jmOgYmiV6asdc
         sQyzLeDLT2O31ISy2GzWBXc7slzBExHqsFcygckPTIBs27T5KIwObJGooIpIIAUP0cG1
         FipE1ngHE5JtewIk1xpVkdxewJSbn9XBlTCvitAyfxryt78rWAvBA5Ndpj9yX1KGGrnS
         jaBgH9Xf9xE9x+rWFi+s27lB/sEHTJkwV7nK96lPah9vEJ3z/Z3vLo2iV045Yv+LnzkB
         DhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n4534WVfwtYILd0kDXgE1s8p0HFb/iqe5lFVW/x7HYk=;
        b=jbWKfKM/hL0iciX9SVFzGI7ZP8hmw4v9QVwjGkGZcu7m9ghQfMP6MaXdwiwHK4DdSA
         w/2UlFX162cT7v3gt58sH4iJ1BFIze79zdec2FMrdrXKtWbZ7d/xbxuOFq6bd+yFolvM
         V9OgZensTqskVefIi2U94HKmsJBGl66lFB67i7EWH7dysoQZ8NJgKvXVsSMDZchCNP3P
         dh/QutgRkxi8y5HluIwguxVlwUYO+L/MR8spOA/F+j9jYLQMGpi0IRapVNGJgLlgT0bR
         TEERdXLSb3XYl9x8pHPVKAFxHzUhF8Xsy//XFxGUBw636fPut12KsopiB+Xw42a1dOeV
         kWAg==
X-Gm-Message-State: AOAM532RQANuVWdg9+UGU33xWZWHb8JPUZSJJO69W9rmqqPCYMEDL4lH
        q80qDOQLO7pg2KxW2kIPABdC1GYS+t4IqYC8xyjhBw==
X-Google-Smtp-Source: ABdhPJygaxrt9U+3sxyR7iT3p2Mr6w7ztTvhYFjhPLuKGfb2idPZEzqtJFj/PJR35v4KmdvTS4SiDg06KwwwiBF53HA=
X-Received: by 2002:ab0:69d6:: with SMTP id u22mr25938205uaq.65.1597197853120;
 Tue, 11 Aug 2020 19:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200811011126.130297-1-badhri@google.com> <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
 <CAPTae5Lhty3rJymi-4gANjUoz79_LujdjddS9oT=vpOxTSecdQ@mail.gmail.com>
 <20200811184507.GB86545@roeck-us.net> <CAPTae5KFxTS+QPnN1Qt_miOFdVYuyuDD2m=jH_Fo87F_C4tTBw@mail.gmail.com>
 <8a2e77f4-1470-ebf0-402c-df90ab6332bb@roeck-us.net> <CAPTae5J9qfJzkqykYJyM=FNHb2qdW6CJ2sNJmXCe9hbfE+o0Kw@mail.gmail.com>
 <ccfa822c-bbd7-7894-8d33-b8d25814b042@roeck-us.net> <CAPTae5LBW=4bYkP2kaRTmdd0EcVxHD8PNVxpX7S6D4GCmVS4bg@mail.gmail.com>
 <5461f039-ca37-daaa-78c1-d6fc69d17004@roeck-us.net>
In-Reply-To: <5461f039-ca37-daaa-78c1-d6fc69d17004@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 11 Aug 2020 19:03:36 -0700
Message-ID: <CAPTae5JVzQqVhHK+eNx=mR1TG4PB9zZgDUdp+DAxquFWDTEcDA@mail.gmail.com>
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

On Tue, Aug 11, 2020 at 6:44 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/11/20 6:08 PM, Badhri Jagan Sridharan wrote:
> > Yes I did ! https://lkml.org/lkml/2020/8/11/788 !
> >
> > For me gmail is grouping V1 and V2 patches in the same thread so
> > thought you saw the v2 patch :P
> >
>
> You copied me on v1, but not on v2. I am not on any of the mailing lists
> you sent v2 to, so I did not see it.
>
> Guenter

My bad ! Apologies Guenter ! Screwed up while performing the git
send-email command.
Will make sure that I double check next time.

Thanks,
Badhri

>
> > Thanks,
> > Badhri
> >
> > On Tue, Aug 11, 2020 at 5:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 8/11/20 4:21 PM, Badhri Jagan Sridharan wrote:
> >>> Thanks Guenter ! However I don't see a reviewed-by tag :)
> >>>
> >>
> >> Confused. Did you send a v2 with the changes we discussed ?
> >> I didn't see that.
> >>
> >> Thanks,
> >> Guenter
> >>
> >>> On Tue, Aug 11, 2020 at 1:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>
> >>>> On 8/11/20 12:39 PM, Badhri Jagan Sridharan wrote:
> >>>>> On Tue, Aug 11, 2020 at 11:45 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>>>
> >>>>>> On Tue, Aug 11, 2020 at 11:24:07AM -0700, Badhri Jagan Sridharan wrote:
> >>>>>>> On Mon, Aug 10, 2020 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>>>>>
> >>>>>>>> On 8/10/20 6:11 PM, Badhri Jagan Sridharan wrote:
> >>>>>>>>> >From the spec:
> >>>>>>>>> "7.1.5 Response to Hard Resets
> >>>>>>>>> Hard Reset Signaling indicates a communication failure has occurred and
> >>>>>>>>> the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
> >>>>>>>>> and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
> >>>>>>>>> May reset during a Hard Reset since the VBUS voltage will be less than
> >>>>>>>>> vSafe5V for an extended period of time. After establishing the vSafe0V
> >>>>>>>>> voltage condition on VBUS, the Source Shall wait tSrcRecover before
> >>>>>>>>> re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
> >>>>>>>>> to the VCONN timing as specified in [USB Type-C 1.3]."
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >>>>>>>>> ---
> >>>>>>>>>  drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++---
> >>>>>>>>>  1 file changed, 13 insertions(+), 3 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> >>>>>>>>> index 3ef37202ee37..e41c4e5d3c71 100644
> >>>>>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
> >>>>>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
> >>>>>>>>> @@ -3372,13 +3372,19 @@ static void run_state_machine(struct tcpm_port *port)
> >>>>>>>>>                       tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
> >>>>>>>>>               break;
> >>>>>>>>>       case SRC_HARD_RESET_VBUS_OFF:
> >>>>>>>>> -             tcpm_set_vconn(port, true);
> >>>>>>>>> +             /*
> >>>>>>>>> +              * 7.1.5 Response to Hard Resets
> >>>>>>>>> +              * Hard Reset Signaling indicates a communication failure has occurred and the
> >>>>>>>>> +              * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
> >>>>>>>>> +              * drive VBUS to vSafe0V as shown in Figure 7-9.
> >>>>>>>>> +              */
> >>>>>>>>> +             tcpm_set_vconn(port, false);
> >>>>>>>>>               tcpm_set_vbus(port, false);
> >>>>>>>>>               tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> >>>>>>>>>                              tcpm_data_role_for_source(port));
> >>>>>>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >>>>>>>>
> >>>>>>>> I am a bit concerned about this. If I understand correctly, it means that
> >>>>>>>> we won't turn VBUS back on unless a SRC_HARD_RESET_VBUS_OFF PD event is received.
> >>>>>>>> Is that correct ? What happens if that event is never received ?
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Guenter
> >>>>>>>
> >>>>>>> The term PD event is a little ambiguous to me. Trying to summarize the workflow.
> >>>>>>> Lower level tcpc driver would have to call tcpm_vbus_change which
> >>>>>>> would in-turn trigger TCPM_VBUS_EVENT
> >>>>>>> and queries port->tcpc->get_vbus to get the vbus status. It is not
> >>>>>>> really a PD protocol driven event hence the
> >>>>>>> confusion.
> >>>>>>>
> >>>>>>> "What happens if that event is never received ?"
> >>>>>>> Yeah TCPM would be in SRC_HARD_RESET_VBUS_OFF till the tcpc calls the
> >>>>>>> tcpm_vbus_change.
> >>>>>>> Do you suspect that existing tcpc would not have the capability to
> >>>>>>> monitor vbus status while sourcing and call tcpm_vbus_change?
> >>>>>>>
> >>>>>> That, or the driver might be buggy, or the hardware does't signal a status
> >>>>>> update, or the update gets lost. I think we should have some backup,
> >>>>>> to trigger if the event is not received in a reasonable amout of time.
> >>>>>> I don't know if the specification has some kind of maximum limit. If
> >>>>>> not, we should still have something
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Guenter
> >>>>>
> >>>>> Got it ! The specification actually has a bound for vbus off.
> >>>>> tSafe0V  - Time to reach vSafe0V max - 650ms. (PD_T_SAFE_0V).
> >>>>> So I will bound it to that.
> >>>>>
> >>>>
> >>>> Excellent. Thanks a lot for looking into this!
> >>>>
> >>>> Guenter
> >>>>
> >>>>> >From Table 7-12 Sequence Description for a Source Initiated Hard Reset:
> >>>>> 4.Policy Engine waits tPSHardReset after sending Hard Reset Signaling
> >>>>> and then tells the Device Policy Manager to instruct the power supply
> >>>>> to perform a Hard Reset. The transition to vSafe0V Shall occur within
> >>>>> tSafe0V (t2).
> >>>>> 5 After tSrcRecover the Source applies power to VBUS in an attempt to
> >>>>> re-establish communication with the Sink and resume USB Default
> >>>>> Operation. The transition to vSafe5V Shall occur within tSrcTurnOn
> >>>>> (t4).
> >>>>>
> >>>>> Thanks,
> >>>>> Badhri
> >>>>>
> >>>>>>
> >>>>>>> Thanks,
> >>>>>>> Badhri
> >>>>>>>
> >>>>>>>
> >>>>>>>>>               break;
> >>>>>>>>>       case SRC_HARD_RESET_VBUS_ON:
> >>>>>>>>> +             tcpm_set_vconn(port, true);
> >>>>>>>>>               tcpm_set_vbus(port, true);
> >>>>>>>>>               port->tcpc->set_pd_rx(port->tcpc, true);
> >>>>>>>>>               tcpm_set_attached_state(port, true);
> >>>>>>>>> @@ -3944,7 +3950,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
> >>>>>>>>>               tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
> >>>>>>>>>               break;
> >>>>>>>>>       case SRC_HARD_RESET_VBUS_OFF:
> >>>>>>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
> >>>>>>>>> +             /*
> >>>>>>>>> +              * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> >>>>>>>>> +              * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> >>>>>>>>> +              */
> >>>>>>>>> +             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >>>>>>>>>               break;
> >>>>>>>>>       case HARD_RESET_SEND:
> >>>>>>>>>               break;
> >>>>>>>>>
> >>>>>>>>
> >>>>
> >>
>
