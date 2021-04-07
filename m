Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709DF3571D1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 18:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhDGQJz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 12:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbhDGQJA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Apr 2021 12:09:00 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4B7C06175F
        for <linux-usb@vger.kernel.org>; Wed,  7 Apr 2021 09:08:20 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id qo10so18196775ejb.6
        for <linux-usb@vger.kernel.org>; Wed, 07 Apr 2021 09:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hrg41gQkrUgfP3PYFdvbHCDr3ftIh62DD1TSpXqszXg=;
        b=C03pPUaQIHl4xQmQXzQbsln/659VCLrMjQb42DmSu5MqoopADXOIxrycsb2F0ol1eq
         X5clORo99GUNGwAybryEFN085tlF9XyPLzc/bBBIJmEwNR1kW4L3rV3UzOEM12Zk86RL
         7mLwPxc/zVQuorWG+SzfdKxGJcQEQwnJbYQCyJz9AxGJE7TQaFcZzF6cj2/iVodPTtXz
         XdjbdKT92Z9EgyYDDDgCWbHun47Wvhuxgul/OE6m2hayNQrwcIYjvcuES5zRTheNzAi6
         LuJhbqetXfCCXdFzHvOvbaL3K8+bJ6Avn0w+zy40X08AazOwNqGm+lF8AQg4LJZA2Yf3
         eUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hrg41gQkrUgfP3PYFdvbHCDr3ftIh62DD1TSpXqszXg=;
        b=ksD96qwD+QCBvJFv4lPxX2y4zHZSJF0RTZUT1X/ZryhmI34RxrUbJFw7Q+dg1yzBue
         wu3Mo6lyVJ9VKjOm6jugA7shI4KvMrpBbGqJMOKqbiYbhBDM/hEdmjNUqhdtRTL6qlSF
         6ear8lseSxXvaN1PUv7xhNAtbbMa6y3rwKvUjCWs0W7II9pQFdGq//h5V/0U4gBVYWGS
         oI2tlFKYHLPAqUJ61HFHXTyzwHOlGIPBw8QgQQWH5FYAT+i536OoAzwc2flUBDuJd2RC
         4pJDoZoJMlcs4jHJG5KHhaR6UUK+mqOamBrOFLrBRti7xrfk8w2VVrTcd1YuAAqG3ru5
         NahQ==
X-Gm-Message-State: AOAM5307VIeZZ9thao0Sa2xlzM53uempP0rP8/QbNH7VrUT3ge8hgYzp
        ELgLyL56fRYCy6FAkwrQEYCYw6koBtWcfg==
X-Google-Smtp-Source: ABdhPJxSYwyGpJ4HMF65aM+IrgLibtT1D1uiYBY9arWEcG+rF7IPsygxbMN5TMAzke7IFHm106WqzA==
X-Received: by 2002:a17:906:a51:: with SMTP id x17mr4609469ejf.25.1617811698842;
        Wed, 07 Apr 2021 09:08:18 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:221b:f673:e91:2500? ([2001:981:6fec:1:221b:f673:e91:2500])
        by smtp.gmail.com with ESMTPSA id o6sm15500177edw.24.2021.04.07.09.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 09:08:18 -0700 (PDT)
Subject: Re: USB network gadget / DWC3 issue
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
 <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
 <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
 <4a0869c9-6b71-5acd-e670-e4c06b44d62d@gmail.com>
 <5d8459ae-4a4c-7371-6b0a-ed817e898168@gmail.com>
 <7963d464-44c1-f580-398c-775c694664cb@gmail.com>
 <f24b6e66-1fdc-06f0-97b4-f2a9be3eef6b@synopsys.com>
 <e50114a1-f7d3-ad62-fe6d-6b8bb2b1203f@synopsys.com>
 <CAHp75Vf+3aeq8kb2oOO-qjC5jOE7ZWUgs2=MOa4mseOG08c+vA@mail.gmail.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <8eac7e37-d0ab-010b-7a2f-6c3c67083f79@gmail.com>
Date:   Wed, 7 Apr 2021 18:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf+3aeq8kb2oOO-qjC5jOE7ZWUgs2=MOa4mseOG08c+vA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 07-04-2021 om 15:34 schreef Andy Shevchenko:
> On Wed, Apr 7, 2021 at 3:24 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>> Thinh Nguyen wrote:
> ...
>
>>> I took a look at the "bad" and "normal" tracepoints. There are a few
>>> 1-second delays where the host tried to bring the device back and
>>> resume from low power:
>>>
>>>       ksoftirqd/0-10      [000] d.s.   231.501808: dwc3_gadget_ep_cmd: ep3in: cmd 'Update Transfer' [60007] params 00000000 00000000 00000000 --> status: Successful
>>>       ksoftirqd/0-10      [000] d.s.   231.501809: dwc3_readl: addr 00000000d68ecd36 value 0000a610
>>>       ksoftirqd/0-10      [000] d.s.   231.501810: dwc3_writel: addr 00000000d68ecd36 value 0000a710
>>>            <idle>-0       [000] d.h.   232.499418: dwc3_readl: addr 00000000a15e0e35 value 00000034
>>>            <idle>-0       [000] d.h.   232.499423: dwc3_readl: addr 00000000bb67b585 value 00001000
>>>            <idle>-0       [000] d.h.   232.499425: dwc3_writel: addr 00000000bb67b585 value 80001000
>>>            <idle>-0       [000] d.h.   232.499427: dwc3_writel: addr 00000000a15e0e35 value 00000034
>>>       irq/15-dwc3-476     [000] d...   232.499480: dwc3_event: event (00000401): WakeUp [U0]
>>>       irq/15-dwc3-476     [000] d...   232.499492: dwc3_event: event (00000401): WakeUp [U0]
>>>       irq/15-dwc3-476     [000] d...   232.499496: dwc3_event: event (00006088): ep2out: Transfer In Progress [0] (SIm)
>>>       irq/15-dwc3-476     [000] d...   232.499501: dwc3_complete_trb: ep2out: trb 00000000c7ce524e (E179:D170) buf 0000000008273540 size 1463 ctrl 00000818 (hlcS:sC:normal)
>>>       irq/15-dwc3-476     [000] d...   232.499518: dwc3_gadget_giveback: ep2out: req 0000000012e296cf length 73/1536 zsI ==> 0
>>>       irq/15-dwc3-476     [000] d...   232.499562: dwc3_ep_queue: ep2out: req 0000000012e296cf length 0/1536 zsI ==> -115
>>>       irq/15-dwc3-476     [000] d...   232.499601: dwc3_prepare_trb: ep2out: trb 000000008c083777 (E180:D170) buf 0000000002a7e9c0 size 1536 ctrl 00000819 (HlcS:sC:normal)
>>>
>>>
>>> Your device is operating in highspeed right? Try to turn off LPM from
>>> host and see if that helps with the speed throttling issue. (If you're
>>> using xHCI host, then set XHCI_HW_LPM_DISABLE). It may also help with
>>> the connection issue you saw.
>>>
>>> It seems to be an issue from host, but I can't tell for sure unless we
>>> have some USB traffic analyzer that shows what's going on. Have you
>>> tried different hosts?
>>>
>> You can also disable LPM from the gadget side by setting
>> dwc->dis_enblslpm_quirk.
> Ferry, it can be done by adding a corresponding property to the
> dwc3-pci.c for Intel Merrifield platform. I'll check also for my case
> and perhaps I can collect some traces in my case later on when I have
> more time for that.
>
Thanks guys. Indeed is xHCI on the host side. I'll try also from another 
machine later.

I'll try adding a property and report back (but not today, is my wedding 
day :-) )

