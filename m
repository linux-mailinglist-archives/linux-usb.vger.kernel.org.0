Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6008368DC8
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 09:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240937AbhDWHTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 03:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236143AbhDWHTD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Apr 2021 03:19:03 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9ACC061574;
        Fri, 23 Apr 2021 00:18:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g5so65703007ejx.0;
        Fri, 23 Apr 2021 00:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DfMreWSM3zttr0vhpYd4OQmo3PEeEklqGs6AWsyszt0=;
        b=lHI4PQRrRh/HmmRmU8nf2PiEqNNMbIiO0lD3OYn44CHXO076XzvQlB6QBVYZqRURlT
         vGRO9+N1h3mHimUR4ZRuuOIg7cB9nIsY1atu2PCqG3xmPJ3zu5/gF/D22Rf0oVvUz1aq
         67cH8xwcPVu2p6BauMEuNx2T9wDng9Q8UtqOUTBdo4JrHTs04cvVbGha/c8pWPbcOpQw
         mjIgGr85S7MN6i9oyq3g2qyR+owaO9qbu2aK8w9GVoFa5A1rxCMgQR/qzXnEHww1roVw
         TTiqoi4L8SHHYCL4xL+K0Vhb3pjeEOD6DPmzmX22gWpL+BJinnd9J1/5lWBeJ+D3WFHU
         wPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DfMreWSM3zttr0vhpYd4OQmo3PEeEklqGs6AWsyszt0=;
        b=aa4NeAYM6a8dICX/YfUZpVTkkHXGqw8yI1IRc4/r25Qiej8V9gDnJI1FA4mAouSaVm
         q0AZ2s+IsmuM/UXBAe/9q+piMT5zuA7DG3FDkNpb2ynHD6qd87ptItj9NxHqCmG0nfas
         h6ZQys5w75L/hIxB+JYVpc4v0lC2rW86JL5OEgsAEwrykuuyySustV9NzGIRWyF5wrvW
         blG9QdDzNAUed08e/XbkAkmdJ6bwiwVM+9XvLgBsQqcjiSSckC2/fec2MPmwGn5Vp/cr
         BdkbgAfiX/JrlH7MY1QVYLXfbcIjX6i2+470rc33E3VnxOxzEMXQ6EPRD/brv3gW3O2u
         TqmQ==
X-Gm-Message-State: AOAM530k9KFRE91Kd9xRNdqmSq/c+dK+Nio+FaHnOOUuJYts1qEhNYoh
        10cY5jUFWgt8mOjRuQ3po3NDA8g8cewAsA==
X-Google-Smtp-Source: ABdhPJzhtCwSZNKEeaOtS9N5UOTZuUPfgN8BEEkQVeb8DdiTfQNSsCMxxTv145ZSxAez+UCUofOkQg==
X-Received: by 2002:a17:906:36d1:: with SMTP id b17mr2783014ejc.235.1619162305116;
        Fri, 23 Apr 2021 00:18:25 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:99f4:80dd:b160:a7f6? ([2001:981:6fec:1:99f4:80dd:b160:a7f6])
        by smtp.gmail.com with ESMTPSA id t14sm3369403ejj.77.2021.04.23.00.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 00:18:24 -0700 (PDT)
Subject: Re: [PATCH v3] usb: dwc3: core: Do core softreset when switch mode
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <2cb4e704b059a8cc91f37081c8ceb95c6492e416.1618503587.git.Thinh.Nguyen@synopsys.com>
 <374440f8dcd4f06c02c2caf4b1efde86774e02d9.1618521663.git.Thinh.Nguyen@synopsys.com>
 <d053b843-2308-6b42-e7ff-3dc6e33e5c7d@synopsys.com>
 <0882cfae-4708-a67a-f112-c1eb0c7e6f51@gmail.com>
 <1c1d8e4a-c495-4d51-b125-c3909a3bdb44@synopsys.com>
 <db5849f7-ba31-8b18-ebb5-f27c4e36de28@gmail.com>
 <09755742-c73b-f737-01c1-8ecd309de551@gmail.com>
 <4a1245e3-023c-ec69-2ead-dacf5560ff9f@synopsys.com>
 <109affec-2e0c-0882-4514-8cab72eec85b@gmail.com>
 <fdaebefd-36c2-84e0-164f-c376483a0db3@synopsys.com>
 <a485bdc8-35e9-d58b-1411-84463274bb6d@gmail.com>
 <d9bca287-92fe-b2c8-511c-0ae89d2745c9@synopsys.com>
 <c9ef4bca-9fad-bb66-5ea3-2bd07b5b4e3e@gmail.com>
 <41664b06-d58b-b5b1-3f1a-02b9d4bcf24c@synopsys.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <14a54afa-62ef-298b-042c-f5683915376a@gmail.com>
Date:   Fri, 23 Apr 2021 09:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <41664b06-d58b-b5b1-3f1a-02b9d4bcf24c@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Op 22-04-2021 om 23:58 schreef Thinh Nguyen:
> Ferry Toth wrote:
>> Hi
>>
>> Op 21-04-2021 om 21:01 schreef Thinh Nguyen:
>>> Ferry Toth wrote:
>>>> Hi
>>>>
>>>> Op 19-04-2021 om 23:23 schreef Thinh Nguyen:
>>>>> Ferry Toth wrote:
>>>>>> Hi
>>>>>>
>>>>>> Op 19-04-2021 om 01:03 schreef Thinh Nguyen:
>>>>>>> Ferry Toth wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> Op 17-04-2021 om 16:22 schreef Ferry Toth:
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> Op 17-04-2021 om 04:27 schreef Thinh Nguyen:
>>>>>>>>>> Ferry Toth wrote:
>>>>>>>>>>> Hi
>>>>>>>>>>>
>>>>>>>>>>> Op 16-04-2021 om 00:23 schreef Thinh Nguyen:
>>>>>>>>>>>> Thinh Nguyen wrote:
>>>>>>>>>>>>> From: Yu Chen <chenyu56@huawei.com>
>>>>>>>>>>>>> From: John Stultz <john.stultz@linaro.org>
>>>>>>>>>>>>>
>>>>>>>>>>>>> According to the programming guide, to switch mode for DRD
>>>>>>>>>>>>> controller,
>>>>>>>>>>>>> the driver needs to do the following.
>>>>>>>>>>>>>
>>>>>>>>>>>>> To switch from device to host:
>>>>>>>>>>>>> 1. Reset controller with GCTL.CoreSoftReset
>>>>>>>>>>>>> 2. Set GCTL.PrtCapDir(host mode)
>>>>>>>>>>>>> 3. Reset the host with USBCMD.HCRESET
>>>>>>>>>>>>> 4. Then follow up with the initializing host registers sequence
>>>>>>>>>>>>>
>>>>>>>>>>>>> To switch from host to device:
>>>>>>>>>>>>> 1. Reset controller with GCTL.CoreSoftReset
>>>>>>>>>>>>> 2. Set GCTL.PrtCapDir(device mode)
>>>>>>>>>>>>> 3. Reset the device with DCTL.CSftRst
>>>>>>>>>>>>> 4. Then follow up with the initializing registers sequence
>>>>>>>>>>>>>
>>>>>>>>>>>>> Currently we're missing step 1) to do GCTL.CoreSoftReset and
>>>>>>>>>>>>> step
>>>>>>>>>>>>> 3) of
>>>>>>>>>>>>> switching from host to device. John Stult reported a lockup
>>>>>>>>>>>>> issue
>>>>>>>>>>>>> seen
>>>>>>>>>>>>> with HiKey960 platform without these steps[1]. Similar issue is
>>>>>>>>>>>>> observed
>>>>>>>>>>>>> with Ferry's testing platform[2].
>>>>>>>>>>>>>
>>>>>>>>>>>>> So, apply the required steps along with some fixes to Yu Chen's
>>>>>>>>>>>>> and John
>>>>>>>>>>>>> Stultz's version. The main fixes to their versions are the
>>>>>>>>>>>>> missing
>>>>>>>>>>>>> wait
>>>>>>>>>>>>> for clocks synchronization before clearing
>>>>>>>>>>>>> GCTL.CoreSoftReset and
>>>>>>>>>>>>> only
>>>>>>>>>>>>> apply DCTL.CSftRst when switching from host to device.
>>>>>>>>>>>>>
>>>>>>>>>>>>> [1]
>>>>>>>>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/20210108015115.27920-1-john.stultz@linaro.org/__;!!A4F2R9G_pg!PW9Jbs4wv4a_zKGgZHN0FYrIpfecPX0Ouq9V3d16Yz-9-GSHqZWsfBAF-WkeqLhzN4i3$
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> [2]
>>>>>>>>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/0ba7a6ba-e6a7-9cd4-0695-64fc927e01f1@gmail.com/__;!!A4F2R9G_pg!PW9Jbs4wv4a_zKGgZHN0FYrIpfecPX0Ouq9V3d16Yz-9-GSHqZWsfBAF-WkeqGeZStt4$
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>>>>>>>>>>> Cc: Ferry Toth <fntoth@gmail.com>
>>>>>>>>>>>>> Cc: Wesley Cheng <wcheng@codeaurora.org>
>>>>>>>>>>>>> Cc: <stable@vger.kernel.org>
>>>>>>>>>>>>> Fixes: 41ce1456e1db ("usb: dwc3: core: make dwc3_set_mode()
>>>>>>>>>>>>> work
>>>>>>>>>>>>> properly")
>>>>>>>>>>>>> Signed-off-by: Yu Chen <chenyu56@huawei.com>
>>>>>>>>>>>>> Signed-off-by: John Stultz <john.stultz@linaro.org>
>>>>>>>>>>>>> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>> Changes in v3:
>>>>>>>>>>>>> - Check if the desired mode is OTG, then keep the old flow
>>>>>>>>>>>>> - Remove condition for OTG support only since the device can
>>>>>>>>>>>>> still be
>>>>>>>>>>>>>         configured DRD host/device mode only
>>>>>>>>>>>>> - Remove redundant hw_mode check since __dwc3_set_mode() only
>>>>>>>>>>>>> applies
>>>>>>>>>>>>> when
>>>>>>>>>>>>>         hw_mode is DRD
>>>>>>>>>>>>> Changes in v2:
>>>>>>>>>>>>> - Initialize mutex per device and not as global mutex.
>>>>>>>>>>>>> - Add additional checks for DRD only mode
>>>>>>>>>>>>>
>>>>>>>>>>>>>        drivers/usb/dwc3/core.c | 27 +++++++++++++++++++++++++++
>>>>>>>>>>>>>        drivers/usb/dwc3/core.h |  5 +++++
>>>>>>>>>>>>>        2 files changed, 32 insertions(+)
>>>>>>>>>>>>>
>>>>>>>>>>>> Hi John,
>>>>>>>>>>>>
>>>>>>>>>>>> If possible, can you run a test with this version on your
>>>>>>>>>>>> platform?
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> Thinh
>>>>>>>>>>>>
>>>>>>>>>>> I tested this on edison-arduino with this patch on top of
>>>>>>>>>>> usb-next
>>>>>>>>>>> (5.12-rc7 + "increase BESL baseline to 6" to prevent
>>>>>>>>>>> throttling").
>>>>>>>>>>>
>>>>>>>>>>> On this platform there is a physical switch to switch roles. With
>>>>>>>>>>> this
>>>>>>>>>>> patch I find:
>>>>>>>>>>>
>>>>>>>>>>> - switch to host mode always works fine
>>>>>>>>>>>
>>>>>>>>>>> - switch to gadget mode I need to flip the switch 3x
>>>>>>>>>>> (gadget-host-gadget).
>>>>>>>>>>>
>>>>>>>>>>> An error message appears on the gadget side "dwc3 dwc3.0.auto:
>>>>>>>>>>> timed
>>>>>>>>>>> out
>>>>>>>>>>> waiting for SETUP phase" appears, but then the device connects
>>>>>>>>>>> to my
>>>>>>>>>>> PC,
>>>>>>>>>>> no throttling.
>>>>>>>>>>>
>>>>>>>>>>> - alternatively I can switch to gadget 1x and then unplug/replug
>>>>>>>>>>> the
>>>>>>>>>>> cable.
>>>>>>>>>>>
>>>>>>>>>>> No error message and connects fine.
>>>>>>>>>>>
>>>>>>>>>>> - if I flip the switch only once, on the PC side I get:
>>>>>>>>>>>
>>>>>>>>>>>        kernel: usb 1-5: new high-speed USB device number 18
>>>>>>>>>>> usingxhci_hcd
>>>>>>>>>>>        kernel: usb 1-5: New USB device found, idVendor=1d6b,
>>>>>>>>>>>        idProduct=0104, bcdDevice= 1.00 kernel: usb1-5: New USB
>>>>>>>>>>> device
>>>>>>>>>>>        strings: Mfr=1, Product=2, SerialNumber=3kernel:usb 1-5:
>>>>>>>>>>> Product:
>>>>>>>>>>>        USBArmory Gadget kernel: usb 1-5: Manufacturer:USBArmory
>>>>>>>>>>> kernel:
>>>>>>>>>>>        usb 1-5: SerialNumber: 0123456789abcdef kernel:usb 1-5:
>>>>>>>>>>> can't
>>>>>>>>>>> set
>>>>>>>>>>>        config #1, error -110
>>>>>>>>>> The device failed at set_configuration() request and timed out. It
>>>>>>>>>> probably timed out from the status stage looking at the device err
>>>>>>>>>> print.
>>>>>>>>>>
>>>>>>>>>>> Then if I wait long enough on the gadget side I get:
>>>>>>>>>>>
>>>>>>>>>>>        root@yuna:~# ifconfig
>>>>>>>>>>>
>>>>>>>>>>>        usb0:
>>>>>>>>>>> flags=-28605<UP,BROADCAST,RUNNING,MULTICAST,DYNAMIC> mtu
>>>>>>>>>>> 1500
>>>>>>>>>>>        inet 169.254.119.239 netmask 255.255.0.0 broadcast
>>>>>>>>>>> 169.254.255.255
>>>>>>>>>>>        inet6 fe80::a8bb:ccff:fedd:eef1 prefixlen 64 scopeid
>>>>>>>>>>> 0x20<link>
>>>>>>>>>>>        ether aa:bb:cc:dd:ee:f1 txqueuelen 1000 (Ethernet) RX
>>>>>>>>>>> packets
>>>>>>>>>>> 490424
>>>>>>>>>>>        bytes 735146578 (701.0 MiB) RX errors 0 dropped191
>>>>>>>>>>> overruns 0
>>>>>>>>>>> frame
>>>>>>>>>>>        0 TX packets 35279 bytes 2532746 (2.4 MiB) TX errors 0
>>>>>>>>>>> dropped 0
>>>>>>>>>>>        overruns 0 carrier 0 collisions 0
>>>>>>>>>>>
>>>>>>>>>>> (correct would be: inet 10.42.0.221 netmask 255.255.255.0
>>>>>>>>>>> broadcast
>>>>>>>>>>> 10.42.0.255)
>>>>>>>>>>>
>>>>>>>>>>> So much improved now, but it seems I am still missing
>>>>>>>>>>> something on
>>>>>>>>>>> plug.
>>>>>>>>>>>
>>>>>>>>>> That's great! We can look at it further. Can you capture the
>>>>>>>>>> tracepoints
>>>>>>>>>> of the issue. Also, can you try with mass_storage gadget to see
>>>>>>>>>> if the
>>>>>>>>>> result is the same?
>>>>>>>>> I have already gser, eem, mass_storage and uac2 combo. When eem
>>>>>>>>> fails,
>>>>>>>>> the mass_storage and uac2 don't appear (on KDE you get all kind of
>>>>>>>>> popups when they appear).
>>>>>>>>>
>>>>>>>>> So either all works, or all fails.
>>>>>>>>>
>>>>>>>>> I'll trace this later today.
>>>>>>>> Trace capturing switch from host-> gadget  here
>>>>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6329600/5.12-rc7*2Busb-next.zip__;JQ!!A4F2R9G_pg!Oa6XGH3IqY3wwG5KK4FwPuNA0m3q5bRj7N6vdP-y4sAY6mya-96J90NJ0tJnXLOiNwGT$
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> (Issue history:
>>>>>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/issues/31__;!!A4F2R9G_pg!Oa6XGH3IqY3wwG5KK4FwPuNA0m3q5bRj7N6vdP-y4sAY6mya-96J90NJ0tJnXNc7KgAw$
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> )
>>>>>>>>
>>>>>>>> On the PC side this resulted to:
>>>>>>>>
>>>>>>>> apr 17 18:17:44 delfion kernel: usb 1-5: new high-speed USB device
>>>>>>>> number 12 using xhci_hcd
>>>>>>>> apr 17 18:17:44 delfion kernel: usb 1-5: New USB device found,
>>>>>>>> idVendor=1d6b, idProduct=0104, bcdDevice= 1.00
>>>>>>>> apr 17 18:17:44 delfion kernel: usb 1-5: New USB device strings:
>>>>>>>> Mfr=1,
>>>>>>>> Product=2, SerialNumber=3
>>>>>>>> apr 17 18:17:44 delfion kernel: usb 1-5: Product: USBArmory Gadget
>>>>>>>> apr 17 18:17:44 delfion kernel: usb 1-5: Manufacturer: USBArmory
>>>>>>>> apr 17 18:17:44 delfion kernel: usb 1-5: SerialNumber:
>>>>>>>> 0123456789abcdef
>>>>>>>> apr 17 18:17:49 delfion kernel: usb 1-5: can't set config #1, error
>>>>>>>> -110
>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks for all your help!
>>>>>>>>
>>>>>>> Looks like it's LPM related again. To confirm, try this:
>>>>>>> Disable LPM with this property "snps,usb2-gadget-lpm-disable"
>>>>>>> (Note that it's not the same as "snps,dis_enblslpm_quirk")
>>>>>> Yes, I confirm this helps.
>>>>>>
>>>>>> Note: on startup I was in host mode, with gadget cable plugged. The
>>>>>> first switch to gadget didn't work, all subsequent switches did
>>>>>> work, as
>>>>>> well as unplug/plug the cable.
>>>>>>
>>>>>>> Make sure that your testing kernel has this patch [1]
>>>>>>> 475e8be53d04 ("usb: dwc3: gadget: Check for disabled LPM quirk")
>>>>>>>
>>>>>>> [1]
>>>>>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=475e8be53d0496f9bc6159f4abb3ff5f9b90e8de__;!!A4F2R9G_pg!Mvz1Am6Ka_pOBfD0TmsA3821I05Ti8stMgh5r4XzMwZ9dy1Wan-il-DB4h50DmbaU4Zw$
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> The failure you saw was probably due the gadget function attempting
>>>>>>> to start a delayed status stage of the SET_CONFIGURATION request.
>>>>>>> By this time, the host already put the device in low power.
>>>>>>>
>>>>>>> The START_TRANSFER command needs to be executed while the device
>>>>>>> is on "ON" state (or U0 if eSS). We shouldn't use dwc->link_state
>>>>>>> to check for link state because we only enable link state change
>>>>>>> interrupt for some controller versions.
>>>>>>>
>>>>>>> Once you confirms disabling LPM works, try this fix:
>>>>>>>
>>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>>>> index 6227641f2d31..06cdec79244e 100644
>>>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>>>> @@ -309,10 +309,14 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep
>>>>>>> *dep,
>>>>>>> unsigned int cmd,
>>>>>>>               if (DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_STARTTRANSFER) {
>>>>>>>                     int             needs_wakeup;
>>>>>>> +               u8              link_state;
>>>>>>>      -               needs_wakeup = (dwc->link_state ==
>>>>>>> DWC3_LINK_STATE_U1 ||
>>>>>>> -                               dwc->link_state ==
>>>>>>> DWC3_LINK_STATE_U2||
>>>>>>> -                               dwc->link_state ==
>>>>>>> DWC3_LINK_STATE_U3);
>>>>>>> +               reg = dwc3_readl(dwc->regs, DWC3_DSTS);
>>>>>>> +               link_state = DWC3_DSTS_USBLNKST(reg);
>>>>>>> +
>>>>>>> +               needs_wakeup = (link_state == DWC3_LINK_STATE_U1 ||
>>>>>>> +                               link_state == DWC3_LINK_STATE_U2 ||
>>>>>>> +                               link_state == DWC3_LINK_STATE_U3);
>>>>>>>                       if (unlikely(needs_wakeup)) {
>>>>>>>                            ret = __dwc3_gadget_wakeup(dwc);
>>>>>>> @@ -1989,6 +1993,8 @@ static int __dwc3_gadget_wakeup(struct dwc3
>>>>>>> *dwc)
>>>>>>>             case DWC3_LINK_STATE_RESET:
>>>>>>>             case DWC3_LINK_STATE_RX_DET:    /* in HS, means Early
>>>>>>> Suspend */
>>>>>>>             case DWC3_LINK_STATE_U3:        /* in HS, means SUSPEND */
>>>>>>> +       case DWC3_LINK_STATE_U2:        /* in HS, means Sleep (L1) */
>>>>>>> +       case DWC3_LINK_STATE_U1:
>>>>>>>             case DWC3_LINK_STATE_RESUME:
>>>>>>>                     break;
>>>>>>>             default:
>>>>>>>
>>>>>> Same (good) result as with "snps,usb2-gadget-lpm-disable". Including
>>>>>> first switch from host->gadget not working.
>>>>>>
>>>>> Great! Not sure why the first switch is not working, but it seems like
>>>>> we were able to eliminate quite a few issues. If you have more dwc3
>>>>> tracepoints, we can take a look further.
>>>> I traced but the file is empty. I captured the registers as well. The
>>>> zip file is here:
>>>>
>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6346271/first-switch.zip__;!!A4F2R9G_pg!KAmPA0Vw1WUiSxdc5-BKNPyD0klvdr5ucZI3E_C2ojho2rNT9wzMs8HG4qCYSDx89HFE$
>>>>
> <snip>
>
>>>> Maybe this issue is due to extcon missing the event?
>>>   From the info here, it doesn't look like the host platform device was
>>> removed on the first switch. Also, as you pointed it out, the extcon
>>> event was not shown on the first switch either. Without a notification
>>> to switch mode, the dwc3 driver won't do anything. You need to check why
>>> that's the case as I can't help much here.
>>>
I was able to resolve this in extcon.
>>>>>> After a 2 - 4 minutes the connection is dropped and reconnected.
>>>>> Does this occur with LPM disabled also? We can review this issue
>>>>> further
>>>>> with more dwc3 tracepoints.
>>>> I captured connection dropping and reconnecting in this fairly long
>>>> trace near the end of the file:
>>>>
>>>> https://urldefense.com/v3/__https://github.com/andy-shev/linux/files/6346323/lost-connection.zip__;!!A4F2R9G_pg!KAmPA0Vw1WUiSxdc5-BKNPyD0klvdr5ucZI3E_C2ojho2rNT9wzMs8HG4qCYSIuUHRz4$
>>>>
>>>>
>>> Nothing obvious stands out as a problem from the dwc3 driver or the
>>> controller. I see a (port) reset after 30 seconds of inactivity, which
>>> is a typical timeout and recovery mechanism in the upperlayer from host.
>>>
>>> * Is this a new issue or was it always there?
>>> * Does turning off LPM help?
>> I reverted my "usb: gadget: increase BESL baseline to 6" and picked
>> "usb: dwc3: pci: Enable dis_enblslpm_quirk for Intel Merrifield".
>>
>> So this is again the big hammer you suggested earlier to turn off LPM.
For future reference: the hammer is not dis_enblslpm_quirk but 
usb2-gadget-lpm-disable. Sorry for the mixup.
>>
>> After 15 min (at least 4x longer then normal to get a port reset) I have
>> still not seen a port reset.
>>
>>
>> So for now I conclude, yes turning off LPM helps.
>>
> Ok. Thanks for the updates. Looks like we may have to use the hammer
> afterall.

Ok, so we leave it at this then. With your fixes all issues seem to be 
resolved. Thanks so much for all your help!

> Btw, earlier I mistakenly say "dis_enblslpm_quirk" will disable LPM
> completely, it only disables the device going into "sleep" state. If you
> want to completely disable LPM, use "usb2-gadget-lpm-disable"
>
> Thanks,
> Thinh
