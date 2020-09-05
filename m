Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4F925E8E7
	for <lists+linux-usb@lfdr.de>; Sat,  5 Sep 2020 17:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgIEPv4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Sep 2020 11:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbgIEPvZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Sep 2020 11:51:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEDBC061244;
        Sat,  5 Sep 2020 08:51:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 2so4574559pjx.5;
        Sat, 05 Sep 2020 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dcnuXL77PDQROJJCJt+NKv/jI8/vA5Nzv04MRniWGa8=;
        b=BEeEO9E3fsCZ9J+Bn/HZLo9ZDafuMfz8BRvcTMuuiJgc2TdpVOhKUNhQB8Wo5mf1tv
         L+8IJb2ObwcAmEsuJegUEEVnz/E1B5YV1Z2alX+f7TESOcpgwmTYYaV4Oay2Ux34n4ki
         Ygb+HRNKmaVcT4mjaXnd+7Qrsb3JTWTKXA2nxVXMRUnqLcBozHboSFj72E51/LXF4SyD
         yIPChkFOh0cgVnTpLHzkrXoG4x4zgLA/vPUgTV2YOmw2JuSx65OUppq9/2ubFfRVpit8
         7eXotPUDKpvz1upPCqUC+sg+Bp0uQvaupCs4XiCF7oKKd3mFuZdQKq0Wqn7gF2L56vUA
         yOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dcnuXL77PDQROJJCJt+NKv/jI8/vA5Nzv04MRniWGa8=;
        b=bA2ZNH6jhMHU+wYq+6IOY/6665IguTgT6PelsMRVrsB1yw/+gSspn2BQfBy8dUKFQ+
         3f6q8NVv+H2Wg2YaliTjm0xKxK4oGykQZZCX4XK3UhYMYURk/pY/6fe+XTXREVMQr4Sz
         GY1Zchbh4zT2LtEEOdYWRJDPG2lPUXLrOUByJtHFyUmDo+zdTjQmVPvGsBHhZFs3RjPq
         /Frh+p4CF/cwWyMGo2biqPN35J2luLfuySYwM3b71HYpGi1+pgl5POzJZz2Tg24faODt
         mlcDhhHCu6bclC61v5OWpYYQEV9jTb1SI1V3BdYEkW6S18Zz7zfhvzncMNbNV8DAVOlX
         g0sw==
X-Gm-Message-State: AOAM530pJTZuVa4IggcjJ4oKne16DmltFS97D5tutCb1jooEuoSroh60
        WGY7BiXlpUl2aeVgqYsSEBA=
X-Google-Smtp-Source: ABdhPJy4e5t47UEmcV92tA8/H+MDhj1+ot+ObFAo06NQoPhTzl6GdYAfrH/Qd/MIa3f/qGIpjGI9nA==
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr13095107plp.127.1599321080039;
        Sat, 05 Sep 2020 08:51:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j18sm8696052pgm.30.2020.09.05.08.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 08:51:19 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: tcpm: Fix if vbus before cc, hard_reset_count
 not reset issue
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        cy_huang <cy_huang@richtek.com>
References: <1599060933-8092-1-git-send-email-u0084500@gmail.com>
 <20200902165713.GG56237@roeck-us.net>
 <CADiBU3_iHk4aoM8o6GcaTmWDZT4ymvb0Ff-XeLLZ0C9dhCnLZQ@mail.gmail.com>
 <fd2a33fc-2383-66cb-0fd7-d5aa0cc9111f@roeck-us.net>
 <CADiBU3_vYAmHDCONrExzyM+1CTfqJx_eS1hYG8aHkNWFzTcwfg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <63c7f5e4-eff2-1420-30a5-a0b98a7815e0@roeck-us.net>
Date:   Sat, 5 Sep 2020 08:51:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADiBU3_vYAmHDCONrExzyM+1CTfqJx_eS1hYG8aHkNWFzTcwfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/4/20 6:24 PM, ChiYuan Huang wrote:
> Guenter Roeck <linux@roeck-us.net> 於 2020年9月5日 週六 上午3:41寫道：
>>
>> On 9/3/20 9:21 AM, ChiYuan Huang wrote:
>>> Guenter Roeck <linux@roeck-us.net> 於 2020年9月3日 週四 上午12:57寫道：
>>>>
>>>> On Wed, Sep 02, 2020 at 11:35:33PM +0800, cy_huang wrote:
>>>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>>>
>>>>> Fix: If vbus event is before cc_event trigger, hard_reset_count
>>>>> won't bt reset for some case.
>>>>>
>>>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>>>> ---
>>>>> Below's the flow.
>>>>>
>>>>> _tcpm_pd_vbus_off() -> run_state_machine to change state to SNK_UNATTACHED
>>>>> call tcpm_snk_detach() -> tcpm_snk_detach() -> tcpm_detach()
>>>>> tcpm_port_is_disconnected() will be called.
>>>>> But port->attached is still true and port->cc1=open and port->cc2=open
>>>>>
>>>>> It cause tcpm_port_is_disconnected return false, then hard_reset_count won't be reset.
>>>>> After that, tcpm_reset_port() is called.
>>>>> port->attached become false.
>>>>>
>>>>> After that, cc now trigger cc_change event, the hard_reset_count will be kept.
>>>>> Even tcpm_detach will be called, due to port->attached is false, tcpm_detach()
>>>>> will directly return.
>>>>>
>>>>> CC_EVENT will only trigger drp toggling again.
>>>>> ---
>>>>>  drivers/usb/typec/tcpm/tcpm.c | 3 +--
>>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>>> index a48e3f90..5c73e1d 100644
>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>>> @@ -2797,8 +2797,7 @@ static void tcpm_detach(struct tcpm_port *port)
>>>>>               port->tcpc->set_bist_data(port->tcpc, false);
>>>>>       }
>>>>>
>>>>> -     if (tcpm_port_is_disconnected(port))
>>>>> -             port->hard_reset_count = 0;
>>>>> +     port->hard_reset_count = 0;
>>>>>
>>>>
>>>> Doesn't that mean that the state machine will never enter
>>>> error recovery ?
>>>>
>>> I think it does't affect the error recovery.
>>> All error recovery seems to check pd_capable flag.
>>>
>>> >From my below case, it's A to C cable only. There is no USBPD contract
>>> will be estabilished.
>>>
>>> This case occurred following by the below test condition
>>> Cable -> A to C (default Rp bind to vbus) connected to PC.
>>> 1. first time plugged in the cable with PC
>>> It will make HARD_RESET_COUNT  to be equal 2
>>> 2. And then plug out. At that time HARD_RESET_COUNT is till 2.
>>> 3. next time plugged in again.
>>> Due to hard_reset_count is still 2 , after wait_cap_timeout, the state
>>> eventually changed to SNK_READY.
>>> But during the state transition, no hard_reset  be sent.
>>>
>>> Defined in the USBPD policy engine, typec transition to USBPD, all
>>> variables must be reset included hard_reset_count.
>>> So it expected SNK must send hard_reset again.
>>>
>>> The original code defined hard_reset_count must be reset only when
>>> tcpm_port_is_disconnected.
>>>
>>> It doesn't make sense that it only occurred in some scenario.
>>> If tcpm_detach is called, hard_reset count must be reset also.
>>>
>>
>> If a hard reset fails, the state machine may cycle through states
>> HARD_RESET_SEND, HARD_RESET_START, SRC_HARD_RESET_VBUS_OFF,
>> SRC_HARD_RESET_VBUS_ON back to SRC_UNATTACHED. In this state,
>> tcpm_src_detach() and with it tcpm_detach() is called. The hard
>> reset counter is incremented in HARD_RESET_SEND. If tcpm_detach()
>> resets the counter, the state machine will keep cycling through hard
>> resets without ever entering the error recovery state. I am not
>> entirely sure where the counter should be reset, but tcpm_detach()
>> seems to be the wrong place.
> 
> This case you specified means locally error occurred.

It could be a local error (with the local hardware), or with the
remote partner not accepting the reset. We only know that an error
occurred.

> It intended to re-run the state machine from typec  to USBPD.
>>From my understanding, hard_reset_count to be reset is reasonable.
> 
> The normal stare from the state transition you specified is
> HARD_RESET_SEND, HARD_RESET_START -> SRC_HARD_RESET_VBUS_OFF,
> SRC_HARD_RESET_VBUS_ON -> received VBUS_EVENT then go to SRC_STARTUP.
> 
The operational word is "normal". Error recovery is expected to handle
situations which are not normal.

I don't question the need to reset the counter. The only question
is where and when to reset it.

Guenter
