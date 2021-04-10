Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F5935ADF9
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 16:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234548AbhDJOIU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Apr 2021 10:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbhDJOIT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Apr 2021 10:08:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C9BC06138A
        for <linux-usb@vger.kernel.org>; Sat, 10 Apr 2021 07:08:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id g17so10229564ejp.8
        for <linux-usb@vger.kernel.org>; Sat, 10 Apr 2021 07:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uaEzTZsXsaJAc997SbheJG5TKvi42eqeraQwYF/QCsw=;
        b=R/do+pYANII58SpP2fl8RZ5Lx11HXZtqoohkPdiayje5ampqZFyhi5i52/rcNdPVBL
         frd7UOSVrm4b9BSp5mJn3ArmcWSj2n7X9B8d+MQ2y+a3Hft89X+9TcxkTEgScAjHlXFu
         gT33DasWY1edp1be6QlCHUrD+7sRaBuX2L/+/LdgvzX6o2WYnbpzm/gX/Q/nquaJALAi
         cxaq5EfBz32AO9CG3+PoyOuCSRWJYXS14SEhsgfZgEHZkPdPvSmC66lQ1Z7uEjYThshq
         YUhY+YJVskBzBae0xGij69saqFbYWKpIYP3Z54TimQEvYlYvnLg158hOU/lpLAtCECKI
         33cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uaEzTZsXsaJAc997SbheJG5TKvi42eqeraQwYF/QCsw=;
        b=DAvHw9uaMrH+FM3u9bxmWpeOvIfgTEhV6ALLUs9Xi3iAUaT6ymngbBz5lQGMG21nJG
         2uBoGLLpkX3mABdZmIFOwxsI+5m0c1JPXld7kaR94S8nRfS5FVxkfJ3K8gOncr/kr3zw
         je+unzeCCEooBmdiReGUJ8HWz7EtibL4WaI3vFkmE4Oi+7ASOj0qQIe384Qa2DpKwk/T
         JKs5MnKE0PZn20BS1cm0rbU6THkNWDc0ciDEgcIzo4JH6IeJfPsQaFZWbHCa73ZSbhjI
         PVEhAT/JxVIYiQHGcWFzOkVM5AShQs8x2oZQhaunfVYjirUD8JN1iF838+l9bRYwWNcI
         c85Q==
X-Gm-Message-State: AOAM532wM1AZq1V2/T46hNK/G6bUle3wMsh1laS6p/q2M7rsoW2lw+P9
        0PoDai1s+xc2ad59NK3mPR2VQTOj/9mrVw==
X-Google-Smtp-Source: ABdhPJy+o28HFvV4wevAcgmmHatt75Vo5i2joYPGFcX68XVg8Sx+FksSps8DpYsNrjoambXVDmVo6Q==
X-Received: by 2002:a17:906:fccd:: with SMTP id qx13mr20178492ejb.275.1618063681838;
        Sat, 10 Apr 2021 07:08:01 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:fb67:e9be:b40a:f42e? ([2001:981:6fec:1:fb67:e9be:b40a:f42e])
        by smtp.gmail.com with ESMTPSA id o6sm3167493edw.24.2021.04.10.07.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 07:08:01 -0700 (PDT)
Subject: Re: USB network gadget / DWC3 issue
From:   Ferry Toth <fntoth@gmail.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
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
 <bdc5093b-0673-ff3b-fef9-4577aa3549a9@gmail.com>
 <32951a5f-062b-abc9-43a4-0245175423c9@synopsys.com>
 <be6ada9f-bc0a-b367-b69f-c5df3771e879@gmail.com>
 <2c5bf7f3-14b6-797f-ab5d-039081906815@gmail.com>
Message-ID: <0ba7a6ba-e6a7-9cd4-0695-64fc927e01f1@gmail.com>
Date:   Sat, 10 Apr 2021 16:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2c5bf7f3-14b6-797f-ab5d-039081906815@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, some corrections below.

Op 10-04-2021 om 15:29 schreef Ferry Toth:
> Op 09-04-2021 om 15:26 schreef Ferry Toth:
>> Hi,
>>
>> Op 08-04-2021 om 23:12 schreef Thinh Nguyen:
>>> Ferry Toth wrote:
>>>> Op 07-04-2021 om 15:34 schreef Andy Shevchenko:
>>>>> On Wed, Apr 7, 2021 at 3:24 AM Thinh Nguyen
>>>>> <Thinh.Nguyen@synopsys.com> wrote:
>>>>>> Thinh Nguyen wrote:
>>>>> ...
>>>>>
>>>>>>> I took a look at the "bad" and "normal" tracepoints. There are a 
>>>>>>> few
>>>>>>> 1-second delays where the host tried to bring the device back and
>>>>>>> resume from low power:
>>>>>>>
>>>>>>>        ksoftirqd/0-10      [000] d.s.   231.501808:
>>>>>>> dwc3_gadget_ep_cmd: ep3in: cmd 'Update Transfer' [60007] params
>>>>>>> 00000000 00000000 00000000 --> status: Successful
>>>>>>>        ksoftirqd/0-10      [000] d.s.   231.501809: dwc3_readl: 
>>>>>>> addr
>>>>>>> 00000000d68ecd36 value 0000a610
>>>>>>>        ksoftirqd/0-10      [000] d.s.   231.501810: dwc3_writel: 
>>>>>>> addr
>>>>>>> 00000000d68ecd36 value 0000a710
>>>>>>>             <idle>-0       [000] d.h. 232.499418: dwc3_readl: addr
>>>>>>> 00000000a15e0e35 value 00000034
>>>>>>>             <idle>-0       [000] d.h. 232.499423: dwc3_readl: addr
>>>>>>> 00000000bb67b585 value 00001000
>>>>>>>             <idle>-0       [000] d.h. 232.499425: dwc3_writel: addr
>>>>>>> 00000000bb67b585 value 80001000
>>>>>>>             <idle>-0       [000] d.h. 232.499427: dwc3_writel: addr
>>>>>>> 00000000a15e0e35 value 00000034
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499480: dwc3_event: 
>>>>>>> event
>>>>>>> (00000401): WakeUp [U0]
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499492: dwc3_event: 
>>>>>>> event
>>>>>>> (00000401): WakeUp [U0]
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499496: dwc3_event: 
>>>>>>> event
>>>>>>> (00006088): ep2out: Transfer In Progress [0] (SIm)
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499501:
>>>>>>> dwc3_complete_trb: ep2out: trb 00000000c7ce524e (E179:D170) buf
>>>>>>> 0000000008273540 size 1463 ctrl 00000818 (hlcS:sC:normal)
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499518:
>>>>>>> dwc3_gadget_giveback: ep2out: req 0000000012e296cf length 73/1536
>>>>>>> zsI ==> 0
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499562: dwc3_ep_queue:
>>>>>>> ep2out: req 0000000012e296cf length 0/1536 zsI ==> -115
>>>>>>>        irq/15-dwc3-476     [000] d...   232.499601: 
>>>>>>> dwc3_prepare_trb:
>>>>>>> ep2out: trb 000000008c083777 (E180:D170) buf 0000000002a7e9c0 size
>>>>>>> 1536 ctrl 00000819 (HlcS:sC:normal)
>>>>>>>
>>>>>>>
>>>>>>> Your device is operating in highspeed right? Try to turn off LPM 
>>>>>>> from
>>>>>>> host and see if that helps with the speed throttling issue. (If 
>>>>>>> you're
>>>>>>> using xHCI host, then set XHCI_HW_LPM_DISABLE). It may also help 
>>>>>>> with
>>>>>>> the connection issue you saw.
>>>>>>>
>>>>>>> It seems to be an issue from host, but I can't tell for sure 
>>>>>>> unless we
>>>>>>> have some USB traffic analyzer that shows what's going on. Have you
>>>>>>> tried different hosts?
>>>>>>>
>>>>>> You can also disable LPM from the gadget side by setting
>>>>>> dwc->dis_enblslpm_quirk.
>>>>> Ferry, it can be done by adding a corresponding property to the
>>>>> dwc3-pci.c for Intel Merrifield platform. I'll check also for my case
>>>>> and perhaps I can collect some traces in my case later on when I have
>>>>> more time for that.
>>>>>
>>>> Ok thanks all. Here is what I tried:
>>>>
>>>> Another computer (Acer 720P brainwashed chromebook), I tried both full
>>>> speed and high speed. Still throttling but less bad.
>>>>
>>>> Then on desktop, with Edison kernel 5.12-rc5 as above + this patch:
>>>>
>>>> diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
>>>>
>>>> index 4c5c6972124a..a9268c085840 100644
>>>>
>>>> --- a/drivers/usb/dwc3/dwc3-pci.c
>>>>
>>>> +++ b/drivers/usb/dwc3/dwc3-pci.c
>>>>
>>>> @@ -122,6 +122,7 @@ static const struct property_entry
>>>> dwc3_pci_mrfld_properties[] = {
>>>>
>>>> PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),
>>>>
>>>> PROPERTY_ENTRY_BOOL("snps,dis_u3_susphy_quirk"),
>>>>
>>>> PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
>>>>
>>>> + PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),
>>>>
>>>> PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
>>>>
>>>> {}
>>>>
>>>> };
>>>>
>>>> This fixes the throttling but reveals I had actually at least 2 bugs:
>>>>
>>>> 1) throttling due to LPM, this seems solved now, thanks to much!
>>> Now that we can confirm the speed throttling is related to LPM. We can
>>> try to experiment further. (IMO, LPM is an important feature and
>>> totally disabling LPM seems like using a sledgehammer to crack a nut)
>>>
>>> I suspect that your phy/HW has a higher low power exit latency. I don't
>>> think you provided any HIRD threshold property in your setup right? So
>>> by default, dwc3 sets the base line BESL value to 1 (or 150us). Unless
>>> you know what your phy/HW is capable of, try to test and increase the
>>> recommended BESL value. The range can be from 0 to 15 where 0 is 150us
>>> and 15 is 10ms. Maybe try 6 (i.e. 1ms).
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 60e850a395a2..423533df8927 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -2895,7 +2895,7 @@ static void dwc3_gadget_config_params(struct 
>>> usb_gadget *g,
>>>                   * recommended BESL baseline to 1 and clamp the 
>>> BESL deep to be
>>>                   * within 2 to 15.
>>>                   */
>>> -               params->besl_baseline = 1;
>>> +               params->besl_baseline = 6;
>>>                  if (dwc->is_utmi_l1_suspend)
>>>                          params->besl_deep =
>>>                                  clamp_t(u8, dwc->hird_threshold, 2, 
>>> 15);
>>>
>> I will try and report back, hopefully this evening.
> I tried this and it seems to have the same effect as dis_enblslpm_quirk
>>>
>>>> 2) a problem with usb plug detection
>>>>
>>>> When I unplug/replug the gadget cable I need to do that at least 
>>>> another
>>>> time before gadget is detected. So unplug/replug/unplug/replug 
>>>> seems to
>>>> work.
>>>>
>>>> Also this platform has a HW switch to select host/device mode, with
>>>> separate connectors for host and device.
>>>>
>>>> When I flip the switch to host it immediately changes to host.
>>>>
>>>> Flipping to device leaves the LEDs on my connected usb hub on, so it's
>>>> still powered (but not operational).
>>>>
>>>> Flipping fast host/device (within 1/2 sec) hub LEDs turns off. But I
>>>> still need to additionally unplug/replug the gadget cable to get 
>>>> that to
>>>> work.
>>>>
>>> The connection issue can come from different things. Please narrow 
>>> it down
>>> and make sure that you don't use any defective cable or bad hub. 
>>> Even then,
>>> it's difficult to determine whose fault it is from just the dmesg 
>>> and driver
>>> logs alone without looking at the USB traffic at the packet level.
>>>
>>> Btw, is your setup DRD? If you're switching mode, then I know that 
>>> dwc3 right
>>> now doesn't implement mode switching correctly.
>> Yes, we use Extcon driver to support DRD.
>>> You can see the discussion we have here:
>>> https://lore.kernel.org/linux-usb/20210108015115.27920-1-john.stultz@linaro.org/T/#t 
>>>
>> I see, that might indeed be related. I will try the patches to see if 
>> that works and report back.
>
> I applied both patches:
>
> usb: dwc3: Trigger a GCTL soft reset when switching modes in DRD
>
> usb: dwc3: Fix DRD mode change sequence following programming guide
>
> It doesn't have an effect on the need to unplug/replug neither on the 
> problems switch from host/device mode.

When I test the correct kernel it does have an effect :-)

In most cases the need to unplug/replug is removed, but not always. In 
the cases when I need to retry the host journal shows "can't set config 
#1, error -110"

The switch from host->device and device->host mode seems to be resolved.

Strangely, iperf3 now reports 130 Mbits/sec (down from 200 Mbits/sec).

>
> But it doesn't hurt either.
>
>>> BR,
>>> Thinh
