Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B133C7374
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 17:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237183AbhGMPof (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 11:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237061AbhGMPof (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 11:44:35 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A29C0613DD
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 08:41:44 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id c17so42203400ejk.13
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LuaJ5GLllG494QxL0EIKGjPAtlb/EVRVBUN3vZg7VvI=;
        b=oDMnob9OubSOKZnnM7j7cGbwuYdGekL6cp4+zcYA7czgRdqTFM7s+0NYNsoyUVMn96
         gRRMIxqidoarM+a2FfdLjKNoGQCtF07ysIqI+x4Nmr/BrGgyU3Qdj8bOkiqsAfA/J11i
         g9Amxl+yd5D2foVkNKjQ39bdXdIO4FkluyIrHZsI+0iC/M+c1lxxBmy0hLw9ItFVBpLm
         orEjU72KfsQV05HZRrOAGGAhxlM/03kOVc1JS1UUJMSNSJNqOzghFfYnhK+3ZhNtVphi
         M4RL5dlg2agwhPEApubUldMCB3/Tzx/oMKRbO3tRLbdIPpPGWIbW6Oddq5QCLlYoaGpj
         P1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LuaJ5GLllG494QxL0EIKGjPAtlb/EVRVBUN3vZg7VvI=;
        b=qOkWX0OZA7mBawhiJ1PQU9tZ15O0pEnzego5/b3Dg/Er3yNScFWU2FGT4XqCrf5ZhP
         Ecf5t6pqQ+l4/Fu4F6TAY5/yYxa0jr6jS8P66D0ziXMMgB/NqvYqWFhkINhMjGQYckb3
         ngfbVywVAL8ptgklSzQwuEWmMvewpCPfbDNhMRZOiUx9BjW2GECEPdX9tDZQQ+EL/YXI
         g0aoiO94kc+vhPQjDP0w2lFPv/bywDqGNkvXUZaJCZWJrwBOiasn9MKPnnJ4DbdviXAo
         g4sULyUUT+RoDjUGQmi5Emm+EcEQZz0IbHtJTHCFAcGAP6NKEsxFdHi6KnzqgI6Xp8MS
         b0qg==
X-Gm-Message-State: AOAM5301XuBquNHWmBcL8rppzWJbt1pIXQjAlO3teUIxhrzo0l8/KzqU
        qeq5sJFX4YbHqydBRhlodJYnu15LSZsSIryhpbE=
X-Google-Smtp-Source: ABdhPJypCo7QU++xfY28ypYnSRkDO5ih4AexNdD2LwlDr5e1++4aaurYCcNV1TOkJXT0NB5PgBaceJalvRfLJEVwrwM=
X-Received: by 2002:a17:907:d28:: with SMTP id gn40mr6461110ejc.471.1626190903480;
 Tue, 13 Jul 2021 08:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210628005825.GA638648@rowland.harvard.edu> <e421818c-dea4-ba6b-e737-bb8d99582588@bluematt.me>
 <20210628011628.GC638648@rowland.harvard.edu> <0c62655d-738c-4d71-6b7b-fe7fa90b54e3@bluematt.me>
 <20210628142418.GC656159@rowland.harvard.edu> <CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com>
 <20210629150541.GB699290@rowland.harvard.edu> <CAFBinCCOGJfHSSHgRrOO-FQJZAUB=QuMr=BoddPLt19spp0QBg@mail.gmail.com>
 <20210629161807.GB703497@rowland.harvard.edu> <CAFBinCDsGtQaPLhMAb+A6DBihWzQiU409i2oer_ud5yQBvfM5w@mail.gmail.com>
 <20210630003556.GA718579@rowland.harvard.edu> <CANAwSgQadG+A2Tg2Ok5-Nw4i1a2tenABeyQnyTjzJKGHHw+6aA@mail.gmail.com>
 <CAFBinCC0nfrnQGmrXJ4FDTuy3RGX_FC8egjVaxhKaOSi9q+xzA@mail.gmail.com>
 <CANAwSgRPvTyMaQHWFeXcS-r5jdigSbcP0QvaTyJ1GFfUyPpqAg@mail.gmail.com>
 <CAFBinCCFhK9Nx9ub5h3JctfXCnbrwL7XPV5dvPXWcvWqupnHkA@mail.gmail.com> <CANAwSgQH6HgFQ+xz15AoKhGUF9G18P-cHOVL2FvS_34FrW=bzQ@mail.gmail.com>
In-Reply-To: <CANAwSgQH6HgFQ+xz15AoKhGUF9G18P-cHOVL2FvS_34FrW=bzQ@mail.gmail.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Tue, 13 Jul 2021 17:41:32 +0200
Message-ID: <CAFBinCB_8aFLj2e6aHskbZXmTpe457Z+j9OHo9A5-oAeg9E5MQ@mail.gmail.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Anand,

On Tue, Jul 13, 2021 at 8:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > If you're interested you can look at one of my earlier emails [0] (not
> > sure if you were Cc'ed then) where I was running the cat command as
> > suggested by Alan three times (each time plugging in different devices
> > at different times) and got three different outputs.
> >
>
> Sorry for the late reply, I have submitted small code changes for this.
> [0] https://patchwork.kernel.org/project/linux-amlogic/list/?series=514467
>
> Yes, I have observed the passing usbcore.autosuspend=-1
> with command line parameter help resolve the hotplug issue with USB
> storage device.
Thanks for reporting back.
I just tried your code changes from the series you mentioned above and
it doesn't seem to have any impact on the issue which is described in
this whole thread. Can you please elaborate which change you have seen
on the issue described here (hotplug not working) with the changes
from your series applied?

> Yes it seems that USB hub is entering into LPM
>
> dwc3 has the following quick property to handle these cases.
Minas' last statement was [1]:
"There are couple of transaction errors and some EP stalled. I want to
understand on which device/ep this happen."
I don't know whether transaction errors and EP stalls are related to
LPM, so I cannot comment on this any further.

[...]
> # usbmon
> Earlier my aim was to capture the USB PHY event via usbmon and wireshark.
> so that we could verify the handshake.
> I am attaching the Wireshark capture log using the following command.
I still don't understand how you are coming to the results which you
have attached to your email:
- the dmesg output starts more than 30 minutes after boot
- it's not clear if you ran any "lsusb -vv" command at some point
- which devices were plugged in during boot?
- ...

From my experience at work (where I also do software development and
support) two things are important when reporting and investigating
problems:
- being as precise as possible to make sure everyone is one the same page
- at the same time focusing on relevant parts

Alan has helped us out in the beginning of this investigation so Matt
and I have been providing him with all the information he needed.
Now Minas is the dwc2 expert helping us solve this issue which is why
I am waiting for further instructions from him on how to proceed.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/CAFBinCA9Y16Ej3PEBN1Rsqo=6V1AZXKOpTfc_siHP0rvVo7wWQ@mail.gmail.com/
[1] http://lists.infradead.org/pipermail/linux-amlogic/2021-July/010341.html
[2] http://lists.infradead.org/pipermail/linux-amlogic/2021-July/010343.html
