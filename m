Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E311724239D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 03:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgHLBJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 21:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgHLBJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 21:09:12 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E26C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 18:09:11 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id r197so149219vkf.13
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 18:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=88cHwPtOJkpAP2QyOkJeOazTV9eGumo2+yPMAU17QNo=;
        b=hWeDtV4Q0cxaQl5eDiVXgQPH8JPCVHEBulIJJLuPHISI1cTruMzZudIjl9aHanvhvt
         FsKwgJlZv915btRTXrDqH+bjSt6gf70n++ff8TCjI/KaEsU1ADN90ZMvEBgpLCsexEdI
         3FbvBq4RhhHEH1KH6ietq1pq2137rpYlwNXXizbkaeaKB1s6xFYUbA4emZXzNPpS+MMF
         pagYEMBtLaZXAQoEMn477n4mRSxRBIIfLXqS7xLmzVVmAt90CEtbbpgYmPbL+GJi5IYs
         EUVruAke2qDcld5xAb+En1XDrSe45bexUj5mdEmqISIkBnk1FdP1rh6Y1JHL7nH1LJH/
         5X9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=88cHwPtOJkpAP2QyOkJeOazTV9eGumo2+yPMAU17QNo=;
        b=h97mZ+U/S5NOGrj0Gz6HM9sP5dJQFjcM5P/EdFIBerUBNiwkDvebxsLW+8MD4cWkaS
         lmEAV7HYtKELKf8tBZiNukbO9IReWcsv3QMnXTbZeclBwGQqR06TJoPAg5uK0eZTowui
         5cYv10Dx8nidLfYVzipZ3Voct0nkxbiC4CAVVj67GOidR1x+lpjwKPUFREUV6h/cYpFF
         2+gnta+y8gm8Q7ONdZabUZo+0HH+3duvDngcU5WKr6Hl6lAkqfYqbi1qPZ0A4sZF1zm8
         sJrc6TUV8TcwblO4pDnNqt0xbTS1auBr5RGtYnGZPahjV/ypjxTOtU8oOTCGkVhy7d1I
         z/9A==
X-Gm-Message-State: AOAM532MBiYrgSBwTwxVnePG5MS5+/h2UqqGfTWJe3XFXiLmdlp5yfKc
        e8M9jPiIQd3hLSPyslRM+pAu1FsoMgoY0HQxXnAbv/t2Yep/3A==
X-Google-Smtp-Source: ABdhPJxmuQuQpYXondOloFtrJcG+LYXTBQnMOKOThFTfIekMcG9eoSrQDAkhsdoQJKgBe+kqaUQFdKmoe+lmGAi6HbE=
X-Received: by 2002:a1f:206:: with SMTP id 6mr27879524vkc.79.1597194550083;
 Tue, 11 Aug 2020 18:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200811011126.130297-1-badhri@google.com> <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
 <CAPTae5Lhty3rJymi-4gANjUoz79_LujdjddS9oT=vpOxTSecdQ@mail.gmail.com>
 <20200811184507.GB86545@roeck-us.net> <CAPTae5KFxTS+QPnN1Qt_miOFdVYuyuDD2m=jH_Fo87F_C4tTBw@mail.gmail.com>
 <8a2e77f4-1470-ebf0-402c-df90ab6332bb@roeck-us.net> <CAPTae5J9qfJzkqykYJyM=FNHb2qdW6CJ2sNJmXCe9hbfE+o0Kw@mail.gmail.com>
 <ccfa822c-bbd7-7894-8d33-b8d25814b042@roeck-us.net>
In-Reply-To: <ccfa822c-bbd7-7894-8d33-b8d25814b042@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 11 Aug 2020 18:08:33 -0700
Message-ID: <CAPTae5LBW=4bYkP2kaRTmdd0EcVxHD8PNVxpX7S6D4GCmVS4bg@mail.gmail.com>
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

Yes I did ! https://lkml.org/lkml/2020/8/11/788 !

For me gmail is grouping V1 and V2 patches in the same thread so
thought you saw the v2 patch :P

Thanks,
Badhri

On Tue, Aug 11, 2020 at 5:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/11/20 4:21 PM, Badhri Jagan Sridharan wrote:
> > Thanks Guenter ! However I don't see a reviewed-by tag :)
> >
>
> Confused. Did you send a v2 with the changes we discussed ?
> I didn't see that.
>
> Thanks,
> Guenter
>
> > On Tue, Aug 11, 2020 at 1:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On 8/11/20 12:39 PM, Badhri Jagan Sridharan wrote:
> >>> On Tue, Aug 11, 2020 at 11:45 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>
> >>>> On Tue, Aug 11, 2020 at 11:24:07AM -0700, Badhri Jagan Sridharan wrote:
> >>>>> On Mon, Aug 10, 2020 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >>>>>>
> >>>>>> On 8/10/20 6:11 PM, Badhri Jagan Sridharan wrote:
> >>>>>>> >From the spec:
> >>>>>>> "7.1.5 Response to Hard Resets
> >>>>>>> Hard Reset Signaling indicates a communication failure has occurred and
> >>>>>>> the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
> >>>>>>> and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
> >>>>>>> May reset during a Hard Reset since the VBUS voltage will be less than
> >>>>>>> vSafe5V for an extended period of time. After establishing the vSafe0V
> >>>>>>> voltage condition on VBUS, the Source Shall wait tSrcRecover before
> >>>>>>> re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
> >>>>>>> to the VCONN timing as specified in [USB Type-C 1.3]."
> >>>>>>>
> >>>>>>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >>>>>>> ---
> >>>>>>>  drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++---
> >>>>>>>  1 file changed, 13 insertions(+), 3 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> >>>>>>> index 3ef37202ee37..e41c4e5d3c71 100644
> >>>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
> >>>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
> >>>>>>> @@ -3372,13 +3372,19 @@ static void run_state_machine(struct tcpm_port *port)
> >>>>>>>                       tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
> >>>>>>>               break;
> >>>>>>>       case SRC_HARD_RESET_VBUS_OFF:
> >>>>>>> -             tcpm_set_vconn(port, true);
> >>>>>>> +             /*
> >>>>>>> +              * 7.1.5 Response to Hard Resets
> >>>>>>> +              * Hard Reset Signaling indicates a communication failure has occurred and the
> >>>>>>> +              * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
> >>>>>>> +              * drive VBUS to vSafe0V as shown in Figure 7-9.
> >>>>>>> +              */
> >>>>>>> +             tcpm_set_vconn(port, false);
> >>>>>>>               tcpm_set_vbus(port, false);
> >>>>>>>               tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
> >>>>>>>                              tcpm_data_role_for_source(port));
> >>>>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >>>>>>
> >>>>>> I am a bit concerned about this. If I understand correctly, it means that
> >>>>>> we won't turn VBUS back on unless a SRC_HARD_RESET_VBUS_OFF PD event is received.
> >>>>>> Is that correct ? What happens if that event is never received ?
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Guenter
> >>>>>
> >>>>> The term PD event is a little ambiguous to me. Trying to summarize the workflow.
> >>>>> Lower level tcpc driver would have to call tcpm_vbus_change which
> >>>>> would in-turn trigger TCPM_VBUS_EVENT
> >>>>> and queries port->tcpc->get_vbus to get the vbus status. It is not
> >>>>> really a PD protocol driven event hence the
> >>>>> confusion.
> >>>>>
> >>>>> "What happens if that event is never received ?"
> >>>>> Yeah TCPM would be in SRC_HARD_RESET_VBUS_OFF till the tcpc calls the
> >>>>> tcpm_vbus_change.
> >>>>> Do you suspect that existing tcpc would not have the capability to
> >>>>> monitor vbus status while sourcing and call tcpm_vbus_change?
> >>>>>
> >>>> That, or the driver might be buggy, or the hardware does't signal a status
> >>>> update, or the update gets lost. I think we should have some backup,
> >>>> to trigger if the event is not received in a reasonable amout of time.
> >>>> I don't know if the specification has some kind of maximum limit. If
> >>>> not, we should still have something
> >>>>
> >>>> Thanks,
> >>>> Guenter
> >>>
> >>> Got it ! The specification actually has a bound for vbus off.
> >>> tSafe0V  - Time to reach vSafe0V max - 650ms. (PD_T_SAFE_0V).
> >>> So I will bound it to that.
> >>>
> >>
> >> Excellent. Thanks a lot for looking into this!
> >>
> >> Guenter
> >>
> >>> >From Table 7-12 Sequence Description for a Source Initiated Hard Reset:
> >>> 4.Policy Engine waits tPSHardReset after sending Hard Reset Signaling
> >>> and then tells the Device Policy Manager to instruct the power supply
> >>> to perform a Hard Reset. The transition to vSafe0V Shall occur within
> >>> tSafe0V (t2).
> >>> 5 After tSrcRecover the Source applies power to VBUS in an attempt to
> >>> re-establish communication with the Sink and resume USB Default
> >>> Operation. The transition to vSafe5V Shall occur within tSrcTurnOn
> >>> (t4).
> >>>
> >>> Thanks,
> >>> Badhri
> >>>
> >>>>
> >>>>> Thanks,
> >>>>> Badhri
> >>>>>
> >>>>>
> >>>>>>>               break;
> >>>>>>>       case SRC_HARD_RESET_VBUS_ON:
> >>>>>>> +             tcpm_set_vconn(port, true);
> >>>>>>>               tcpm_set_vbus(port, true);
> >>>>>>>               port->tcpc->set_pd_rx(port->tcpc, true);
> >>>>>>>               tcpm_set_attached_state(port, true);
> >>>>>>> @@ -3944,7 +3950,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
> >>>>>>>               tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
> >>>>>>>               break;
> >>>>>>>       case SRC_HARD_RESET_VBUS_OFF:
> >>>>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
> >>>>>>> +             /*
> >>>>>>> +              * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
> >>>>>>> +              * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
> >>>>>>> +              */
> >>>>>>> +             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
> >>>>>>>               break;
> >>>>>>>       case HARD_RESET_SEND:
> >>>>>>>               break;
> >>>>>>>
> >>>>>>
> >>
>
