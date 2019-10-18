Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4313EDCFA3
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 21:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443382AbfJRTxs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 15:53:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40470 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440122AbfJRTxs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 15:53:48 -0400
Received: by mail-wr1-f68.google.com with SMTP id o28so7460558wro.7
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 12:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3KqAVxh/H5jpQl7YP1P5BVxZv7QnY/IKmQ+2C63eW48=;
        b=v8KNTh7DuhG0MKiLe5luNuiu7KAhrLPVqMFgRJ8hCekbjvwQac9IPsRYKemoLeZFQZ
         +S9QqFYXXod8F7qDSPi/bsIoMgfAgw+tyd+NeL0XD4g0aAmuoJxmzgWUViPtyTGT9FWE
         g2hn3gMkXrHCJyIjGjweVtdFl6Osq6Y2mUQ2/4FJ26QTfh8Kjjyav938nUnxH1Nl2lNU
         WxE3KJBNtmFyNnFSXoPF8zU6MvjoMdiVrkyJiPF5FsMT7VIzqZ/TP+R4hyfM0BXiFEsG
         DpVpp5yvzcMPN9UO8Qx4H3EG3p2D1yzzOTGIhmuypLZNPA0B6DFBhoLEix4S1gLe+30G
         3FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3KqAVxh/H5jpQl7YP1P5BVxZv7QnY/IKmQ+2C63eW48=;
        b=GsXZsgtGQ4zkA/aut3BLfU9OqzJ46BaITG/A8asoMCdU6qFTK6AuTcl3es9kuKztYJ
         2+JLJuXRzM0j7Zlb9bdvRE/rXbzcVZvzCRHihY3Ob6b1jdeUVPNdW1SIbswjLqtvl339
         8aLCRBSg1ekiUV87dKaVFYPwVwweym7JOx/2wvnABGtq1tgjWYpslwtdwX5KCqo10oyo
         18tm8R4x9n+amItkTwslBasYMhD6yo0Pl+CcWerDlQfTRfRf58oj8A9QW2LS/M9+Cr/M
         mCABni070bIeGmVB9Fv9W2Im4jR1+0+PNtW40pzK2UVSBracSZxNgPv8o4Yr/ZfjxjHB
         TKOQ==
X-Gm-Message-State: APjAAAXwkc5GvOrnGFUmDQN9hClY92I1hnPhHTXHCxiq+5DdI9zpw137
        p6/kfOuuMbRljps//svGTmY2P1kB9dyo3b94QgMH8A==
X-Google-Smtp-Source: APXvYqydNS4dpnOUsvw/+62vkI3l2jIVz/3Fo1Lh33Kgvus/mPxF4eL5MgL+Z0E6soAxCv6h1VMoN95TzjknYyidMMg=
X-Received: by 2002:a05:6000:92:: with SMTP id m18mr6103036wrx.105.1571428425920;
 Fri, 18 Oct 2019 12:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com> <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
 <b8695418-9d3a-96a6-9587-c9a790f49740@redhat.com> <CALAqxLVh6GbiKmuK60e6f+_dWh-TS2ZLrwx0WsSo5bKp-F3iLA@mail.gmail.com>
 <648e2943-42f5-e07d-5bb4-f6fd8b38b726@redhat.com> <CALAqxLWh0=GRod5ORpi+ENpWCkmY39mUw_=NV67sKY8qH_otZw@mail.gmail.com>
 <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com> <CALAqxLWHbhst5KXAGCswKVp7ztzFHxdb6nskfze+Jk+xWo2Ssw@mail.gmail.com>
 <7877d69b-b17c-d4a4-9806-3dca98fc9e26@redhat.com>
In-Reply-To: <7877d69b-b17c-d4a4-9806-3dca98fc9e26@redhat.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 18 Oct 2019 12:53:33 -0700
Message-ID: <CALAqxLWE-8YkYmrKoP6-+2xherwsGZ8-CeUyOFe9YPQj6EuSpg@mail.gmail.com>
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

On Fri, Oct 18, 2019 at 12:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
> Looking at drivers/usb/typec/tcpm/tcpci.c: tcpci_set_vconn I see that
> there is a data struct with vendor specific callbacks and that the
> drivers/usb/typec/tcpm/tcpci_rt1711h.c implements that.
>
> So you may want something similar here. But things are tricky here,
> because when nothing is connected you want to provide Vbus for
> the USB-A ports, which means that if someone then connects a
> USB-A to C cable to connect the board to a PC (switching the port
> to device mode) there will be a time when both sides are supplying
> 5V if I remember the schedule correctly.

Ok. Thanks for the pointer, I'll take a look at that to see if I can
get it to work.

> I think that the original hack might not be that bad, the whole hw
> design seems so, erm, broken, that you probably cannot do proper
> roleswapping anyways.  So just tying Vbus to host mode might be
> fine, the question then becomes again how can some other piece
> of code listen to the role-switch events...

So, at least in the current approach (see the v3 series), I've
basically set the hub driver as an role-switch intermediary, sitting
between the calls from the tcpm to the dwc3 driver. It actually works
better then the earlier notifier method (which had some issues with
reliably establishing the initial state on boot).  Does that approach
work for you?

thanks
-john
