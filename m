Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6350242136
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 22:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgHKUSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 16:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgHKUSG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 16:18:06 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6587AC06174A;
        Tue, 11 Aug 2020 13:18:06 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e4so6199pjd.0;
        Tue, 11 Aug 2020 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zfMPfxlj9mnYSLIV0WYfjRsLk+y/Wj9/5di1DzKlu4A=;
        b=Vo3D3jiZYaRY97UjJMHl5peOZNkjgg0nT5+KrFR/zRvraG+C1vXAfHdHlc/8EXJKwy
         WHW+HELFPyLVZV9mSHq8KC3ZOaaCrRYxaFxINEXN0DGjNZlVRS9jU5PU1ZdWzZ65IRMt
         NKiOVgxjPdOuzSftkW+YCMzpDeDiVJvOzOo76nVtqS+3XopiRAchf2xplIY2JKh530dX
         yHiUXRHv0q49oGMNbI2yWXskvIKqPgqpuOkBVA1WgIahwyevNevHKmcWYvlZfbpYNtkE
         NzOm1REDirZAOMX+yTd7WJ8+3XvKVvJxpQ9K9kehv0Zbnfz6gtW3Xt23dZlUXIyvY41V
         kZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zfMPfxlj9mnYSLIV0WYfjRsLk+y/Wj9/5di1DzKlu4A=;
        b=aFMub2BJ33xldpQ8aaTBd8xGi3zDBx6O4Z4dg/niK0HpKFPkpOZ9+L4SrqS/C+B9O+
         BZWks+HYSH7VfLRSyMDzlmMW8m23AbGY2ThYy2YFn/ZokEtfPj2UYb4ylO5cWMzkZ8JE
         yM+9CUtAjV348iUx7N5YhykbmL4fIR4rhF2dWMZIuFyYSYLRjk9FyH2i6GbuQv4qXmjl
         IbJ9cb6DDclOOXGRDKEUXWpZGv+KEaNmeRPleIKDQBYiEdt3s8ol6eFg8sSDlBd4t0yW
         L89HTM2LikYvPz4cz85aX91Kgwdd8JZbr/5sW0+FHILvURCDZnn7m+PXbQoBLhVH9Kf9
         fyQw==
X-Gm-Message-State: AOAM531wxXwdRqKICc9rjcu3w5OL52ka5uSirhiDugos9JCjGJ2KrCFh
        h3UbbhGYymKXvDyqNPFvwBYIDnm9
X-Google-Smtp-Source: ABdhPJwx+XwIfTUurOq1zzJvgJCvLcB+ntPddzGOQynwee7YXCeD/2OXIsCxxFhtHvLvJYvrsjWVEg==
X-Received: by 2002:a17:90a:230d:: with SMTP id f13mr2571253pje.116.1597177085586;
        Tue, 11 Aug 2020 13:18:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e65sm25749472pfe.91.2020.08.11.13.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 13:18:04 -0700 (PDT)
Subject: Re: [PATCH v1] usb: typec: tcpm: Fix TDA 2.2.1.1 and TDA 2.2.1.2
 failures
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200811011126.130297-1-badhri@google.com>
 <ef32ea96-16c8-772b-2c80-8df43ee8f668@roeck-us.net>
 <CAPTae5Lhty3rJymi-4gANjUoz79_LujdjddS9oT=vpOxTSecdQ@mail.gmail.com>
 <20200811184507.GB86545@roeck-us.net>
 <CAPTae5KFxTS+QPnN1Qt_miOFdVYuyuDD2m=jH_Fo87F_C4tTBw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <8a2e77f4-1470-ebf0-402c-df90ab6332bb@roeck-us.net>
Date:   Tue, 11 Aug 2020 13:18:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPTae5KFxTS+QPnN1Qt_miOFdVYuyuDD2m=jH_Fo87F_C4tTBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/11/20 12:39 PM, Badhri Jagan Sridharan wrote:
> On Tue, Aug 11, 2020 at 11:45 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Tue, Aug 11, 2020 at 11:24:07AM -0700, Badhri Jagan Sridharan wrote:
>>> On Mon, Aug 10, 2020 at 6:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 8/10/20 6:11 PM, Badhri Jagan Sridharan wrote:
>>>>> >From the spec:
>>>>> "7.1.5 Response to Hard Resets
>>>>> Hard Reset Signaling indicates a communication failure has occurred and
>>>>> the Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin
>>>>> and Shall drive VBUS to vSafe0V as shown in Figure 7-9. The USB connection
>>>>> May reset during a Hard Reset since the VBUS voltage will be less than
>>>>> vSafe5V for an extended period of time. After establishing the vSafe0V
>>>>> voltage condition on VBUS, the Source Shall wait tSrcRecover before
>>>>> re-applying VCONN and restoring VBUS to vSafe5V. A Source Shall conform
>>>>> to the VCONN timing as specified in [USB Type-C 1.3]."
>>>>>
>>>>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>>>>> ---
>>>>>  drivers/usb/typec/tcpm/tcpm.c | 16 +++++++++++++---
>>>>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>>> index 3ef37202ee37..e41c4e5d3c71 100644
>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>>> @@ -3372,13 +3372,19 @@ static void run_state_machine(struct tcpm_port *port)
>>>>>                       tcpm_set_state(port, SNK_HARD_RESET_SINK_OFF, 0);
>>>>>               break;
>>>>>       case SRC_HARD_RESET_VBUS_OFF:
>>>>> -             tcpm_set_vconn(port, true);
>>>>> +             /*
>>>>> +              * 7.1.5 Response to Hard Resets
>>>>> +              * Hard Reset Signaling indicates a communication failure has occurred and the
>>>>> +              * Source Shall stop driving VCONN, Shall remove Rp from the VCONN pin and Shall
>>>>> +              * drive VBUS to vSafe0V as shown in Figure 7-9.
>>>>> +              */
>>>>> +             tcpm_set_vconn(port, false);
>>>>>               tcpm_set_vbus(port, false);
>>>>>               tcpm_set_roles(port, port->self_powered, TYPEC_SOURCE,
>>>>>                              tcpm_data_role_for_source(port));
>>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
>>>>
>>>> I am a bit concerned about this. If I understand correctly, it means that
>>>> we won't turn VBUS back on unless a SRC_HARD_RESET_VBUS_OFF PD event is received.
>>>> Is that correct ? What happens if that event is never received ?
>>>>
>>>> Thanks,
>>>> Guenter
>>>
>>> The term PD event is a little ambiguous to me. Trying to summarize the workflow.
>>> Lower level tcpc driver would have to call tcpm_vbus_change which
>>> would in-turn trigger TCPM_VBUS_EVENT
>>> and queries port->tcpc->get_vbus to get the vbus status. It is not
>>> really a PD protocol driven event hence the
>>> confusion.
>>>
>>> "What happens if that event is never received ?"
>>> Yeah TCPM would be in SRC_HARD_RESET_VBUS_OFF till the tcpc calls the
>>> tcpm_vbus_change.
>>> Do you suspect that existing tcpc would not have the capability to
>>> monitor vbus status while sourcing and call tcpm_vbus_change?
>>>
>> That, or the driver might be buggy, or the hardware does't signal a status
>> update, or the update gets lost. I think we should have some backup,
>> to trigger if the event is not received in a reasonable amout of time.
>> I don't know if the specification has some kind of maximum limit. If
>> not, we should still have something
>>
>> Thanks,
>> Guenter
> 
> Got it ! The specification actually has a bound for vbus off.
> tSafe0V  - Time to reach vSafe0V max - 650ms. (PD_T_SAFE_0V).
> So I will bound it to that.
> 

Excellent. Thanks a lot for looking into this!

Guenter

>>From Table 7-12 Sequence Description for a Source Initiated Hard Reset:
> 4.Policy Engine waits tPSHardReset after sending Hard Reset Signaling
> and then tells the Device Policy Manager to instruct the power supply
> to perform a Hard Reset. The transition to vSafe0V Shall occur within
> tSafe0V (t2).
> 5 After tSrcRecover the Source applies power to VBUS in an attempt to
> re-establish communication with the Sink and resume USB Default
> Operation. The transition to vSafe5V Shall occur within tSrcTurnOn
> (t4).
> 
> Thanks,
> Badhri
> 
>>
>>> Thanks,
>>> Badhri
>>>
>>>
>>>>>               break;
>>>>>       case SRC_HARD_RESET_VBUS_ON:
>>>>> +             tcpm_set_vconn(port, true);
>>>>>               tcpm_set_vbus(port, true);
>>>>>               port->tcpc->set_pd_rx(port->tcpc, true);
>>>>>               tcpm_set_attached_state(port, true);
>>>>> @@ -3944,7 +3950,11 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
>>>>>               tcpm_set_state(port, SNK_HARD_RESET_WAIT_VBUS, 0);
>>>>>               break;
>>>>>       case SRC_HARD_RESET_VBUS_OFF:
>>>>> -             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, 0);
>>>>> +             /*
>>>>> +              * After establishing the vSafe0V voltage condition on VBUS, the Source Shall wait
>>>>> +              * tSrcRecover before re-applying VCONN and restoring VBUS to vSafe5V.
>>>>> +              */
>>>>> +             tcpm_set_state(port, SRC_HARD_RESET_VBUS_ON, PD_T_SRC_RECOVER);
>>>>>               break;
>>>>>       case HARD_RESET_SEND:
>>>>>               break;
>>>>>
>>>>

