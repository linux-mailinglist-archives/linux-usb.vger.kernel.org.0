Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EAF4822D5
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 09:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhLaImr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 03:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhLaImq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 03:42:46 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722C5C061574
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 00:42:46 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id g79-20020a9d12d5000000b0058f08f31338so35126653otg.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qTOytUq473R+pBT7+h/tdWFbanHJjfdgyn0SV70ZLxw=;
        b=WAk7AEt47k53kbweFFrPi1oBrHdpUvcBQK7pCuRV2Cr3a0x69eXfJlHANjRH7g+2pW
         OMAMZcQFHJ6DZkgMezCNOdBir+/7eU+KeNh9IPAkrccTo80tpDq3v/wibvj4lkOdbrEA
         FYUDYXrOirpFGw0Qbucm83F9QhUa8smYC19jKaxH04hksSdanKN73YRAENsnMZniA/bd
         +xNXi9XueAGk60Vfe+WarAg9G+Tak21DAJf33yO5pcVUZdatsKRUgVBPn2ePARvKzhwG
         uCI8YM84YlFcYzVvAlZtmMfHgUIvXyipUIvH4Ua6Qox7xoqIbtWr2zvumRcWdezJlH/7
         1Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qTOytUq473R+pBT7+h/tdWFbanHJjfdgyn0SV70ZLxw=;
        b=JYrJf5h1V4Fqo8vI2fM2p3uL3mMKwiIhjNvTup3V+pUjaQQ/XQMrB5NN+g8FuoPMCB
         IADCW8hht0eBP3VWm7HiiM08NI6pV11pV/X3Adi6uLUXTpXeX1mnF/GslbhSRFfx3tAr
         6GtgLQpltUscQf7xI2V63BE0hwcQG1he86+5eiXdJzgAi6vFAWZA9MihOyXg5jL3jN9h
         duqQZBx3obmMp8ehA3yBzvWq+7i1fki6ALm/ehmyxoddYhb3pfnmGTa/XD/9sNA5366L
         LsTG/XtouslGxaRyegJHnhYss9/tXsZVHWKD3bYl7wt9QRUICiDMfReUMSTNlVHyOcJP
         Zt9g==
X-Gm-Message-State: AOAM530175qKHNAeRWPbhuQXXX1MT/MlbPjxH9BPsuYBdtalsXToMbjW
        15gb0VZlQXdngRdOSIkVKWDsFBlV+CgR5WIyO8I=
X-Google-Smtp-Source: ABdhPJzNtzO0eqOqFQneCpbuVimy+226rZotvDg7XkhVnoYHP9RcfsniekvKqCYVnMtqiNobFqUbfoA3WYIDodrMh6w=
X-Received: by 2002:a05:6830:18e5:: with SMTP id d5mr22719216otf.170.1640940165516;
 Fri, 31 Dec 2021 00:42:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4007:0:0:0:0:0 with HTTP; Fri, 31 Dec 2021 00:42:44
 -0800 (PST)
In-Reply-To: <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
 <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com> <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
 <1d63d954-13fb-f9c6-b2e7-d350ace2aa5a@synopsys.com> <CAOzgRdbgepUHKCmg8wR0s0bvYyuWNachi_EP6c9n_mRvQkXmGw@mail.gmail.com>
 <ae6d47c7-68f2-e482-c6ef-d2c63e2a9057@synopsys.com>
From:   youling 257 <youling257@gmail.com>
Date:   Fri, 31 Dec 2021 16:42:44 +0800
Message-ID: <CAOzgRdZ7ME2AY4iJq6mXb8TyBcrJLYHEKSAteTVjDPjPRcF9Hg@mail.gmail.com>
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

2021-12-31 15:02 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
> youling 257 wrote:
>> 2021-12-31 11:46 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
>>> Hi,
>>>
>>> youling 257 wrote:
>>>> test this patch, cat /sys/bus/usb/devices/4-1/speed, 10000
>>>> [   74.694284] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
>>>> 2 using xhci_hcd
>>>> [   74.750329] usb-storage 4-1:1.0: USB Mass Storage device detected
>>>>
>>>> but speed, pcie to usb3.2 gen2x2, WRITE: bw=642MiB/s (673MB/s),
>>>> 642MiB/s-642MiB/s (673MB/s-673MB/s), io=1000MiB (1049MB),
>>>> run=1557-1557msec
>>>> READ: bw=467MiB/s (490MB/s), 467MiB/s-467MiB/s (490MB/s-490MB/s),
>>>> io=1000MiB (1049MB), run=2140-2140msec
>>>>
>>>> the mainboard usb3.2 gen2x1, WRITE: bw=838MiB/s (878MB/s),
>>>> 838MiB/s-838MiB/s (878MB/s-878MB/s), io=1000MiB (1049MB),
>>>> run=1194-1194msec
>>>> READ: bw=753MiB/s (790MB/s), 753MiB/s-753MiB/s (790MB/s-790MB/s),
>>>> io=1000MiB (1049MB), run=1328-1328msec
>>>>
>>>
>>> Let's avoid top-post.
>>>
>>> Some comments:
>>> 1) Just because the host is capable of gen2x2, it doesn't mean it will
>>> run at gen2x2 speed. Your device can only operate up to gen2x1 speed, so
>>> that's the limit. The test speed for gen2x1 above is not unreasonable.
>
>> my device can only operate up to gen2x1 10gbps speed on window, only
>> 5gbps on linux kernel 5.16rc7.
>
> With the change I provided, you were able to run test at gen2x1, albeit
> slower than expect. (i.e. write speed at 673MB/s for ASmedia host must
> be SSP). The issue with device unable to operate at SSP is at least
> answered.
>
> If you're looking to find out why the performance is slow, confirm these
> items first:
>
> 1) Are you using the same application to test on Linux to compare with
> Windows? (Looks like you're using CrystalDiskMark for your Windows test)
>
> 2) If you're using the same application, are you using the same test
> parameters and version?
>
> 3) Is your device operating in BOT or UASP in Linux? UAS Protocol is
my kernel config #CONFIG_USB_UAS is not set.
> generally faster. Newer device generally uses UASP, and I assume yours
> is a newer device (check your enclosure). Make sure there's no quirk
> preventing the device operating in UASP.
CONFIG_USB_UAS=y
[  524.630081] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
5 using xhci_hcd
[  524.747496] scsi host9: uas
[  524.757580] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device
  1.00 PQ: 0 ANSI: 6
Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 20000M/x2
    |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=uas, 10000M

windows fat32 speed, https://imgur.com/a/eq9qhKj
linux ext4 speed, https://imgur.com/a/tUAskgV

> If all of those are checked out, you can start capturing logs so others
> may look into it.
>
> BR,
> Thinh
>
> (btw, I'll be on vacation for a week, maybe others can help while I'm
> away.)
>
