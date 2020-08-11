Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB952422D0
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 01:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgHKXWg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 19:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgHKXWf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 19:22:35 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77140C061787
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 16:22:34 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id j23so172118vsq.7
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M8tHIq10qcvL+DPe0+2tp6gdA5jLeIeYfiy2N8zjReI=;
        b=NwTyzfGGVaq1LMhjX+eMHHZ4teSqnqq4A4a9m4XDH7d0CRzMwopcWJusMPKXZwRZoe
         0oPhsf+zgJzXzg1ZTNeE5O08jEmpGcGHBeRHodrkm+1GXjgt0MA47Clg5JRYQlFOlWsz
         P9f50Nvb1Q7cn1fPFnDZ/U8msiM9fzXsga7iJ/VNNKWYw6WOHVICVcq9sx06Oo8rup9K
         3I3PpKiqkVstOGdeYtvsOKlrJyF7NL123816TG9FeZ7SBdvXHl4RqWviKXFK3IQHPJZR
         eXMxnd1/7UYVvFM71w3wjB9NeojTnWaJtwBc/QpS9aEcZfbiuEpS4j5z2NZBHEiYjUpr
         HpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8tHIq10qcvL+DPe0+2tp6gdA5jLeIeYfiy2N8zjReI=;
        b=cWJqL9bJn1Puh487a2IipCfCtuYT/hLM08e1bCTaR9Bs/Wxt/vJ9DK7Pq1zLNEY0WZ
         DGAx5hS9Tjs7uAhpc3O4w2LppN/SCYIkXtbPWP9+ZYhwe0XAp3AekCvMNne9xCFeDdel
         E0zey35+qWtDgjhOgjXWSa+aWz9G1727cWD9kmaN0aNgYlW9HmqdVLb5Q2XW4fq9efvQ
         +/UkqPIwh5F64wxE7R81+obkqNB90Ae/ZwJGeIGG801CQxKicSqo4uCYa2xqjBtwTqu3
         L95IFpWNf2QE5JcAq+bn27g1SsPqYhZQ7Bx3B51saSyhBR8pUBjQ+4sREOh9WQSy8lBD
         wkHQ==
X-Gm-Message-State: AOAM532BawBe7ta53oZCZFY+qApyCTkiTkSP4lG3RWpmnjZsVcu/Kpae
        krUQ69WhiN4SpWDK6O/fJlFHPILfv7v6lMcrHi7ZEQ==
X-Google-Smtp-Source: ABdhPJwekl2Qum8Yq7I+RnVMOd6HHvCiYCBoHr0z+I6Yw/vHPbdxyOfAeQO0cvHyPJsgkDK44muhBYtZoZ3wbYxw4V4=
X-Received: by 2002:a67:ec13:: with SMTP id d19mr23820388vso.28.1597188153223;
 Tue, 11 Aug 2020 16:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200811011126.130297-1-badhri@google.com> <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
 <CAPTae5Lhty3rJymi-4gANjUoz79_LujdjddS9oT=vpOxTSecdQ@mail.gmail.com>
 <20200811184507.GB86545@roeck-us.net> <CAPTae5KFxTS+QPnN1Qt_miOFdVYuyuDD2m=jH_Fo87F_C4tTBw@mail.gmail.com>
 <8a2e77f4-1470-ebf0-402c-df90ab6332bb@roeck-us.net>
In-Reply-To: <8a2e77f4-1470-ebf0-402c-df90ab6332bb@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 11 Aug 2020 16:21:57 -0700
Message-ID: <CAPTae5J9qfJzkqykYJyM=FNHb2qdW6CJ2sNJmXCe9hbfE+o0Kw@mail.gmail.com>
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

Thanks Guenter ! However I don't see a reviewed-by tag :)

On Tue, Aug 11, 2020 at 1:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/11/20 12:39 PM, Badhri Jagan Sridharan wrote:
> > On Tue, Aug 11, 2020 at 11:45 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Tue, Aug 11, 2020 at 11:24:07AM -0700, Badhri Jagan Sridharan wrote:
> >>> On Mon, Aug 10, 2020 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>
> >>>> On 8/10/20 6:11 PM, Badhri Jagan Sridharan wrote:
> >>>>> >From the spec:
> >>>>> "7.1.5 Response to Hard Resets
> >>>>> Hard Reset Signaling indicates a communication failure has occurred and
> >>>>> the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
> >>>>> and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
> >>>>> May reset during a Hard Reset since the VBUS voltage will be less than
> >>>>> vSafe5V for an extended period of time. After establishing the vSafe0V
> >>>>> voltage condition on VBUS, the Source Shall wait tSrcRecover before
> >>>>> re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
> >>>>> to the VCONN timing as specified in [USB Type-C 1.3]."
> >>>>>
> >>>>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >>>>> ---
> >>>>>  drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++---
> >>>>>  1 file changed, 13 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> >>>>> index 3ef37202ee37..e41c4e5d3c71 100644
> >>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
> >>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
> >>>>> @@ -3372,13 +3372,19 @@ static void run_state_machine(struct tcpm_port *port)
> >>>>>                       tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
> >>>>>               break;
> >>>>>       case SRC_HARD_RESET_VBUS_OFF:
> >>>>> -             tcpm_set_vconn(port, true);
> >>>>> +             /*
> >>>>> +              * 7.1.5 Response to Hard Resets
> >>>>> +              * Hard Reset Signaling indicates a communication failure has occurred and the
> >>>>> +              * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
> >>>>> +              * drive VBUS to vSafe0V as shown in Figure 7-9.
> >>>>> +              */
> >>>>> +             tcpm_set_vconn(port, false);
> >>>>>               tcpm_set_vbus(port, false);
> >>>>>               tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> >>>>>                              tcpm_data_role_for_source(port));
> >>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >>>>
> >>>> I am a bit concerned about this. If I understand correctly, it means that
> >>>> we won't turn VBUS back on unless a SRC_HARD_RESET_VBUS_OFF PD event is received.
> >>>> Is that correct ? What happens if that event is never received ?
> >>>>
> >>>> Thanks,
> >>>> Guenter
> >>>
> >>> The term PD event is a little ambiguous to me. Trying to summarize the workflow.
> >>> Lower level tcpc driver would have to call tcpm_vbus_change which
> >>> would in-turn trigger TCPM_VBUS_EVENT
> >>> and queries port->tcpc->get_vbus to get the vbus status. It is not
> >>> really a PD protocol driven event hence the
> >>> confusion.
> >>>
> >>> "What happens if that event is never received ?"
> >>> Yeah TCPM would be in SRC_HARD_RESET_VBUS_OFF till the tcpc calls the
> >>> tcpm_vbus_change.
> >>> Do you suspect that existing tcpc would not have the capability to
> >>> monitor vbus status while sourcing and call tcpm_vbus_change?
> >>>
> >> That, or the driver might be buggy, or the hardware does't signal a status
> >> update, or the update gets lost. I think we should have some backup,
> >> to trigger if the event is not received in a reasonable amout of time.
> >> I don't know if the specification has some kind of maximum limit. If
> >> not, we should still have something
> >>
> >> Thanks,
> >> Guenter
> >
> > Got it ! The specification actually has a bound for vbus off.
> > tSafe0V  - Time to reach vSafe0V max - 650ms. (PD_T_SAFE_0V).
> > So I will bound it to that.
> >
>
> Excellent. Thanks a lot for looking into this!
>
> Guenter
>
> >>From Table 7-12 Sequence Description for a Source Initiated Hard Reset:
> > 4.Policy Engine waits tPSHardReset after sending Hard Reset Signaling
> > and then tells the Device Policy Manager to instruct the power supply
> > to perform a Hard Reset. The transition to vSafe0V Shall occur within
> > tSafe0V (t2).
> > 5 After tSrcRecover the Source applies power to VBUS in an attempt to
> > re-establish communication with the Sink and resume USB Default
> > Operation. The transition to vSafe5V Shall occur within tSrcTurnOn
> > (t4).
> >
> > Thanks,
> > Badhri
> >
> >>
> >>> Thanks,
> >>> Badhri
> >>>
> >>>
> >>>>>               break;
> >>>>>       case SRC_HARD_RESET_VBUS_ON:
> >>>>> +             tcpm_set_vconn(port, true);
> >>>>>               tcpm_set_vbus(port, true);
> >>>>>               port->tcpc->set_pd_rx(port->tcpc, true);
> >>>>>               tcpm_set_attached_state(port, true);
> >>>>> @@ -3944,7 +3950,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
> >>>>>               tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
> >>>>>               break;
> >>>>>       case SRC_HARD_RESET_VBUS_OFF:
> >>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
> >>>>> +             /*
> >>>>> +              * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> >>>>> +              * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> >>>>> +              */
> >>>>> +             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >>>>>               break;
> >>>>>       case HARD_RESET_SEND:
> >>>>>               break;
> >>>>>
> >>>>
>
