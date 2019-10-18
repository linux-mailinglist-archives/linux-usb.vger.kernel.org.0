Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88D95DCFD0
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 22:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440125AbfJRUMd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 16:12:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45308 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437752AbfJRUMd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 16:12:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id q13so2527635wrs.12
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x389mZLGXetFlk8yGllbW5v4Nob+O0GHyuteffuWsmc=;
        b=UXCShMKff3dfekkJDK07Mosf/v3FGsUxpM8MHsFMJt28ppHXP1o2a/SQayUPhfA4ui
         SMbG18EWv2XFgxoO7DDO678BAufx0TS3etwCZ+nPI0vRiWhojnHZe3MGXOvaBcksxBcz
         qsbUEU31/whajAWjSEssU/q8riphAkFvuaOhrnn1iNySQreYGHu0XT+833q9/nxZqFO4
         C7gj8wp7tluw00B667NbPCvdthIDiXHde4W73qqPHS/YTP5o0QA88wmUvOLGQVeXsJKD
         Hg6UtCwEEqeiuwfNvH5IhwTARhuv1ZoXLenunMNzEkbbfx+plJAp4sGvJZTg7gRH1i0c
         dNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x389mZLGXetFlk8yGllbW5v4Nob+O0GHyuteffuWsmc=;
        b=fSrtKsWx1FV/3A1xiEeR7MEMvmJk0TBZ6ae9Xca1CCAexIMgDsqDWGzXYbMo6Rr6ZK
         qkTN40WZ+oNe8IJzqxpyFkhv9zIx2Uutja0TAlxzBXFlhYCbfzE8ezNMOGj/NL2ywl+n
         zwm7ZRXKJy8Fx8m3SWD0imlmzEPGHaKBhQwVMiarEjW/WyZmYORqK+vc8ldo2w2s7pHF
         q0sSssVmzQR8xBibxUyWH75srVPAr8SruT43zY3IKKTc/hAjc91RXSVk6+ozqYeNMK1d
         dMJvN2s+pbvxpbtjhqzuzGmY8/Lh8rlIyl5N60RGSsUtUPeJWMdGFc6ZUe5s9S/fNMll
         aPXA==
X-Gm-Message-State: APjAAAV6LDyCfqS4yAt3XwVVSTl1Kv4EGQvKpe3MKQAVrVUGeq8A2rw/
        d5XdTyN8BZhV0Vz5jizajAzmNmEStwm/HBXwyGMcfw==
X-Google-Smtp-Source: APXvYqwTwdLPBaO/BM+V90ZClXiOqHs9r7Etx4BZoATqavnhQU21JleuKX7nVqy4opGKQjw4sDJyJeSR5b9dq+NYFXs=
X-Received: by 2002:a5d:55ce:: with SMTP id i14mr9094072wrw.169.1571429550545;
 Fri, 18 Oct 2019 13:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com> <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
 <b8695418-9d3a-96a6-9587-c9a790f49740@redhat.com> <CALAqxLVh6GbiKmuK60e6f+_dWh-TS2ZLrwx0WsSo5bKp-F3iLA@mail.gmail.com>
 <648e2943-42f5-e07d-5bb4-f6fd8b38b726@redhat.com> <CALAqxLWh0=GRod5ORpi+ENpWCkmY39mUw_=NV67sKY8qH_otZw@mail.gmail.com>
 <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com> <CALAqxLWHbhst5KXAGCswKVp7ztzFHxdb6nskfze+Jk+xWo2Ssw@mail.gmail.com>
 <7877d69b-b17c-d4a4-9806-3dca98fc9e26@redhat.com> <CALAqxLWE-8YkYmrKoP6-+2xherwsGZ8-CeUyOFe9YPQj6EuSpg@mail.gmail.com>
 <7ea7824f-abc2-4cf6-720a-3668b6286781@redhat.com>
In-Reply-To: <7ea7824f-abc2-4cf6-720a-3668b6286781@redhat.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 18 Oct 2019 13:12:18 -0700
Message-ID: <CALAqxLVrEYT5RbL_R0tx_3jHzt7ZuWHDPuEwt1r2iXgPwR+Czw@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 18, 2019 at 12:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 18-10-2019 21:53, John Stultz wrote:
> > On Fri, Oct 18, 2019 at 12:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> Looking at drivers/usb/typec/tcpm/tcpci.c: tcpci_set_vconn I see that
> >> there is a data struct with vendor specific callbacks and that the
> >> drivers/usb/typec/tcpm/tcpci_rt1711h.c implements that.
> >>
> >> So you may want something similar here. But things are tricky here,
> >> because when nothing is connected you want to provide Vbus for
> >> the USB-A ports, which means that if someone then connects a
> >> USB-A to C cable to connect the board to a PC (switching the port
> >> to device mode) there will be a time when both sides are supplying
> >> 5V if I remember the schedule correctly.
> >
> > Ok. Thanks for the pointer, I'll take a look at that to see if I can
> > get it to work.
> >
> >> I think that the original hack might not be that bad, the whole hw
> >> design seems so, erm, broken, that you probably cannot do proper
> >> roleswapping anyways.  So just tying Vbus to host mode might be
> >> fine, the question then becomes again how can some other piece
> >> of code listen to the role-switch events...
> >
> > So, at least in the current approach (see the v3 series), I've
> > basically set the hub driver as an role-switch intermediary, sitting
> > between the calls from the tcpm to the dwc3 driver. It actually works
> > better then the earlier notifier method (which had some issues with
> > reliably establishing the initial state on boot).  Does that approach
> > work for you?
>
> That sounds like it might be a nice solution. But I have not seen the
> code, I think I was not Cc-ed on v3. Do you have a patchwork or
> lore.kernel.org link for me?

Oh! I think I had you on CC, maybe it got caught in your spam folder?
My apologies either way! The thread is here:
  https://lore.kernel.org/lkml/20191016033340.1288-1-john.stultz@linaro.org/

And the hub/role-switch-intermediary driver is here:
  https://lore.kernel.org/lkml/20191016033340.1288-12-john.stultz@linaro.org/

thanks
-john
