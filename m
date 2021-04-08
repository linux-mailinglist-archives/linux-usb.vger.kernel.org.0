Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEED358E36
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 22:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232273AbhDHUSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 16:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhDHUSG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 16:18:06 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9852CC061760
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 13:17:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u17so5161420ejk.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 13:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NomHNmsSZfslpVtHa7c3E1FFCWsAUNauLsX+RzsA3Jo=;
        b=d+8Ig6KJHVo60J5xAxAxgITJ15iQ+yv7XASchocZlMTJ6XuGAzJ2kEBNiXWA7R4XyA
         UqVGkrNmiU8JaGikxbPlrRw34CU54qulM8cqJWFxOuZp6GzzarGzwy0AmAas1kV8jlBW
         vJsN69q8qK+EpGXuMy3FesrKoHmDw8QUnAVeQ+7kYNTu91uct5MJxJ49lEa2P5ntelad
         7XQy1pt/ZxnmCt7LPmnagZJgq+6LW5qP5wKaJTwKKD/CdeCHhwNWhyfYVncuzHyY2RE5
         R0uZcWY7oXH67dCPQVaPpR9iKNDCw2i9LDj1lOmXaCu7IZXJ4her9z9KoBrGmHrTFt6s
         eEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NomHNmsSZfslpVtHa7c3E1FFCWsAUNauLsX+RzsA3Jo=;
        b=o2JVSypyi68ZTt/kJx7iT3eeiOdmCUonbmURZQQ9Ygmsylab6ahAaSIZEn0jcptTya
         SYiGSakCrBCQYBNrnZFDatZQu41OweeGdFhWBrPLI8D9vUooWQMX4Q6EOW3fO8w31S0M
         FkA/YTFd4TO14be65P4EUi08MoIEIcqfYrEgyHXz3gBes7C/R2lwkxQiCYCTxReAZXlo
         w2Z+vR/FRPRxy3QtN5Kpd72/q8kec4xOYvUYl13eBb4AlvtH7zZb1Nsedt/StAGVQWeI
         ImYHiJ8zabxJZXqqMP14bGxneq2slNs6ePI/mSXu6wTOi1Uw0DxjU8ZZU+jyNmBS7HJ9
         Xoxw==
X-Gm-Message-State: AOAM530tPDLVr45bO1nAoZpI1xyOKfbh1dhBCnS42cMjfUwu7jOyyfrR
        BdZi+JbTDnI7TbJLcXKpkNvxPzu1uMqy0Q==
X-Google-Smtp-Source: ABdhPJxEkFhMyjE+PwYtC//1iy5CnFBiICk/tyWXq1ko/x+mhSY2ItqjHItssdUCdLp+pPf9KMjDcg==
X-Received: by 2002:a17:906:b353:: with SMTP id cd19mr4408523ejb.253.1617913072308;
        Thu, 08 Apr 2021 13:17:52 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:14f5:51f8:6673:6e7c? ([2001:981:6fec:1:14f5:51f8:6673:6e7c])
        by smtp.gmail.com with ESMTPSA id s7sm188114ejd.106.2021.04.08.13.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 13:17:51 -0700 (PDT)
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
Message-ID: <bdc5093b-0673-ff3b-fef9-4577aa3549a9@gmail.com>
Date:   Thu, 8 Apr 2021 22:17:51 +0200
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
Ok thanks all. Here is what I tried:

Another computer (Acer 720P brainwashed chromebook), I tried both full 
speed and high speed. Still throttling but less bad.

Then on desktop, with Edison kernel 5.12-rc5 as above + this patch:

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c

index 4c5c6972124a..a9268c085840 100644

--- a/drivers/usb/dwc3/dwc3-pci.c

+++ b/drivers/usb/dwc3/dwc3-pci.c

@@ -122,6 +122,7 @@ static const struct property_entry 
dwc3_pci_mrfld_properties[] = {

PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),

PROPERTY_ENTRY_BOOL("snps,dis_u3_susphy_quirk"),

PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),

+ PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),

PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),

{}

};

This fixes the throttling but reveals I had actually at least 2 bugs:

1) throttling due to LPM, this seems solved now, thanks to much!

2) a problem with usb plug detection

When I unplug/replug the gadget cable I need to do that at least another 
time before gadget is detected. So unplug/replug/unplug/replug seems to 
work.

Also this platform has a HW switch to select host/device mode, with 
separate connectors for host and device.

When I flip the switch to host it immediately changes to host.

Flipping to device leaves the LEDs on my connected usb hub on, so it's 
still powered (but not operational).

Flipping fast host/device (within 1/2 sec) hub LEDs turns off. But I 
still need to additionally unplug/replug the gadget cable to get that to 
work.

