Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D6648D236
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 07:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiAMGFL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jan 2022 01:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbiAMGFK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jan 2022 01:05:10 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD46FC06173F
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 22:05:10 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso5142143otf.12
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 22:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BChg/ZjGSmVo+tNZuM4tHfafJLsJ0QETebSKjrXSb6E=;
        b=WVP226Sb+7X3GV+0qfSDvegvefPLZrSZ2h5gBw/WTeQg3kczSdEn8aZuxxrRZ+a8s3
         L6QfQxGS5OT3dXJ08gae1305WAXTK7BL4YWcevgoEzpxSnXPNFUtvD6yUAVvTYIptK6i
         6FaXPveVWrAEP1IxsCs35+g7ChbhqD6pLqjR/6qxm1Fa9K7/4E/IhRxS7RdJyW/ZQWS0
         G8Z5y+x34SwsH4R1hkocGszE0mAv30+q7Fpk4hJIqgPXq8A8EiwdvKAOE82S0FwYx/ka
         D17oY3M57+bAcR1GMlufK+wPtiMPeuLOOE5CFOvCwJYAUAm50RdWSflNNR/Hl2oeNKXl
         JaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BChg/ZjGSmVo+tNZuM4tHfafJLsJ0QETebSKjrXSb6E=;
        b=JWeYQk5euJIAH1ouTQ8t+9/XTmwh2vCUUAgeD96kWcDWzV6OpEe8GtwLiM7m9qjcQ2
         pTIqof+DBhXgN6h31xVkku2PenXo5CHfkI5q8KVa8E6o7u4maraIGWaIPjDLjd3e2T0j
         YDqkhkpeqHcm5aUNkJhnoWX1CvRiUASkwrVBDQVaukOEIub3JFTz0KV21BdYccsgYZaw
         g8THQ7a6Wqwta83Wd2SFMUGDrkdC0T0WCPOuJjNTplLSMydKc7p4cgjEiL0RtzBITaGU
         oglK9tavyiymF2IKazJeZjSHfk7U0QT9Ktb8+/86NjMyI6hIm272k25oYxyl9gR0qzMd
         sSZA==
X-Gm-Message-State: AOAM532MSjoy2RVyb3Bx20XxO2KU/ZOaxkwOpXFEuycp/XZsSTmZS355
        GvXrJ+GV6AjqscPduy542Ltg2amvR2NcpKrbQFk=
X-Google-Smtp-Source: ABdhPJzgN2IT5FdPRU2DBtSjQPmCvytXJNQo+rgPXP73008JUKTZalX9LlPthVvHFQ68/Ys8bj98SK19uAxv+CDz0/4=
X-Received: by 2002:a05:6830:2366:: with SMTP id r6mr2170020oth.376.1642053909932;
 Wed, 12 Jan 2022 22:05:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6830:1008:0:0:0:0 with HTTP; Wed, 12 Jan 2022 22:05:09
 -0800 (PST)
In-Reply-To: <03f5743d-0aa5-7006-be67-0598f909eeac@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com> <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
 <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com> <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
 <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com> <CAOzgRdZ7ME2AY4iJq6mXb8TyBcrJLYHEKSAteTVjDPjPRcF9Hg@mail.gmail.com>
 <03f5743d-0aa5-7006-be67-0598f909eeac@synopsys.com>
From:   youling 257 <youling257@gmail.com>
Date:   Thu, 13 Jan 2022 14:05:09 +0800
Message-ID: <CAOzgRdajcFuX+k=9OAMpnsTak0vWttMD4k4G0bXJdw8GexVaOQ@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

2022-01-13 9:41 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
> youling 257 wrote:
>> 2021-12-31 15:02 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
>>> youling 257 wrote:
>>>> 2021-12-31 11:46 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
>>>>> Hi,
>>>>>
>>>>> youling 257 wrote:
>>>>>> test this patch, cat /sys/bus/usb/devices/4-1/speed, 10000
>>>>>> [   74.694284] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
>>>>>> 2 using xhci_hcd
>>>>>> [   74.750329] usb-storage 4-1:1.0: USB Mass Storage device detected
>>>>>>
>>>>>> but speed, pcie to usb3.2 gen2x2, WRITE: bw=642MiB/s (673MB/s),
>>>>>> 642MiB/s-642MiB/s (673MB/s-673MB/s), io=1000MiB (1049MB),
>>>>>> run=1557-1557msec
>>>>>> READ: bw=467MiB/s (490MB/s), 467MiB/s-467MiB/s (490MB/s-490MB/s),
>>>>>> io=1000MiB (1049MB), run=2140-2140msec
>>>>>>
>>>>>> the mainboard usb3.2 gen2x1, WRITE: bw=838MiB/s (878MB/s),
>>>>>> 838MiB/s-838MiB/s (878MB/s-878MB/s), io=1000MiB (1049MB),
>>>>>> run=1194-1194msec
>>>>>> READ: bw=753MiB/s (790MB/s), 753MiB/s-753MiB/s (790MB/s-790MB/s),
>>>>>> io=1000MiB (1049MB), run=1328-1328msec
>>>>>>
>>>>>
>>>>> Let's avoid top-post.
>>>>>
>>>>> Some comments:
>>>>> 1) Just because the host is capable of gen2x2, it doesn't mean it will
>>>>> run at gen2x2 speed. Your device can only operate up to gen2x1 speed,
>>>>> so
>>>>> that's the limit. The test speed for gen2x1 above is not unreasonable.
>>>
>>>> my device can only operate up to gen2x1 10gbps speed on window, only
>>>> 5gbps on linux kernel 5.16rc7.
>>>
>>> With the change I provided, you were able to run test at gen2x1, albeit
>>> slower than expect. (i.e. write speed at 673MB/s for ASmedia host must
>>> be SSP). The issue with device unable to operate at SSP is at least
>>> answered.
>>>
>>> If you're looking to find out why the performance is slow, confirm these
>>> items first:
>>>
>>> 1) Are you using the same application to test on Linux to compare with
>>> Windows? (Looks like you're using CrystalDiskMark for your Windows test)
>>>
>>> 2) If you're using the same application, are you using the same test
>>> parameters and version?
>>>
>>> 3) Is your device operating in BOT or UASP in Linux? UAS Protocol is
>
>> my kernel config #CONFIG_USB_UAS is not set.
>
> Ok.
>
>>> generally faster. Newer device generally uses UASP, and I assume yours
>>> is a newer device (check your enclosure). Make sure there's no quirk
>>> preventing the device operating in UASP.
>> CONFIG_USB_UAS=y
>> [  524.630081] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
>> 5 using xhci_hcd
>> [  524.747496] scsi host9: uas
>> [  524.757580] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device
>>   1.00 PQ: 0 ANSI: 6
>> Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 20000M/x2
>>     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=uas, 10000M
>>
>> windows fat32 speed,
>> https://urldefense.com/v3/__https://imgur.com/a/eq9qhKj__;!!A4F2R9G_pg!OkYlXXf1Zw-EMemp22NTRgqOnOxlP-Xp95WYBJvguF9b4iyS4SX_y4Z5pAe_IaB7ZNtb$
>>
>> linux ext4 speed,
>> https://urldefense.com/v3/__https://imgur.com/a/tUAskgV__;!!A4F2R9G_pg!OkYlXXf1Zw-EMemp22NTRgqOnOxlP-Xp95WYBJvguF9b4iyS4SX_y4Z5pAe_IcQVJqNn$
>>
>>
>
> I can't view the "windows" image, but it seems like it's running in high
> performance in Linux as UASP device now right? (I see ~1GB/s)

right.

> BR,
> Thinh
>
