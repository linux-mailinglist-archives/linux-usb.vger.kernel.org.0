Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7725019601B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 21:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgC0U42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 16:56:28 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46322 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbgC0U42 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 16:56:28 -0400
Received: by mail-io1-f65.google.com with SMTP id i3so2115797ioo.13
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ztGuxpPnwvopwN5V9PVOVG8WbS48IkxJwK5yNOJbS/4=;
        b=kk4DJRXeua8mYMBDP+GRp9tHtJck3RUJSwFqQrAq8iKRbpQzeCkIHxitXXXMjjardd
         9HPHPp5glgAKLZjQsOpctpJg3tGx0HoHiVyPnCc7XiAD43XVZwV7kj6Py6xqSD4ZXxcK
         hFoKn9qs/860vY1JwUPWyGrmZ/Ctn6YMVm67QUmV+4WIyiYqARwFWVtF8fc2kNHCyUQJ
         QdShJlknFUYwi0mBUC6I6q+5M2O4S0czDl3QIupoIzh+oLQ08IkSmnsEz9ri1f5ZUP0I
         EaXmswVIEsMnRpVOCo9/IrdNVI2p1mrbrU1H4ll+YRevccoA7Va/xdM6YQ99j4p90DBV
         TkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ztGuxpPnwvopwN5V9PVOVG8WbS48IkxJwK5yNOJbS/4=;
        b=BS5lV4Iz+z73Nf4Vgcw+Rvq915q6G1YetmRXEoZMLVk+mBaSU+TU3+0DhAV/2Miun8
         JgnTWnT9G22XYd1dYbzfojPFsWymyalKm16rkrxla3mHAKDjXCJTC8bgAGc2CqfWwuj5
         THL52tOB+w637RUhkSf6cY/y/1AFEamfBa5gGdhPa+R3VA1uTuUsXpKulTuN0iyaJ/pf
         NVb8Ou8ULLEhrs+plxT7RhzghIRlHj4aPT9f6QmMUPx7XcKN4lzrUl5dM4Qgl445LQvs
         oQMtkjIKBxez5ya4gs8CuJH4auN26eYCLk1U3ON2l5vVRzpXG47Iv9smsszlBNnkKvo3
         L1aw==
X-Gm-Message-State: ANhLgQ1F3Go9Z9Okr+9h1jC2OUZSOlmxjP8R9ykeQMQ2AITdfau9eiAZ
        5OsqZ0s+m93G1d3HdRvqtSA3QrhfLYh9Y2UReD6y3Q==
X-Google-Smtp-Source: ADFU+vseq/HdLAf4EOrqJpck+RxYilPAE2LGU2Kp9kY/klJ+BUbD3xh/tGjfw+LbfOLztQaDQYPf5L1Af64ZI2Vx1CE=
X-Received: by 2002:a02:304a:: with SMTP id q71mr724974jaq.123.1585342587677;
 Fri, 27 Mar 2020 13:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALAE=UDvPU-MBX5B7NU1A7WPq1gofUnr8Rf+v81AxHLLcZhMvA@mail.gmail.com>
In-Reply-To: <CALAE=UDvPU-MBX5B7NU1A7WPq1gofUnr8Rf+v81AxHLLcZhMvA@mail.gmail.com>
From:   Bobby Jones <rjones@gateworks.com>
Date:   Fri, 27 Mar 2020 13:56:17 -0700
Message-ID: <CALAE=UCG52nM8MJx2F+GyEoN7gLs2z6GpJZ27zQ9akUfjRb==Q@mail.gmail.com>
Subject: Re: Toby MPCI - L201 cellular modem http hang after random MAC
 address assignment
To:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steve Winslow <swinslow@gmail.com>,
        =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org, modemmanager-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 23, 2020 at 10:21 AM Bobby Jones <rjones@gateworks.com> wrote:
>
> Hello net-dev,
>
> I'm diagnosing a problem with the Toby MPCI-L201 cellular modem where
> http operations hang. This is reproducible on the most recent kernel
> by turning on the rndis_host driver and executing a wget or similar
> http command. I found I was able to still ping but not transfer any
> data. After bisecting I've found that commit
> a5a18bdf7453d505783e40e47ebb84bfdd35f93b introduces this hang.
>
> For reference the patch contents are:
>
> >     rndis_host: Set valid random MAC on buggy devices
> >
> >     Some devices of the same type all export the same, random MAC addre=
ss. This
> >     behavior has been seen on the ZTE MF910, MF823 and MF831, and there=
 are
> >     probably more devices out there. Fix this by generating a valid ran=
dom MAC
> >     address if we read a random MAC from device.
> >
> >     Also, changed the memcpy() to ether_addr_copy(), as pointed out by
> >     checkpatch.
> >
> >     Suggested-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> >     Signed-off-by: Kristian Evensen <kristian.evensen@gmail.com>
> >     Signed-off-by: David S. Miller <davem@davemloft.net>
> > diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.=
c
> > index 524a47a28120..4f4f71b2966b 100644
> > --- a/drivers/net/usb/rndis_host.c
> > +++ b/drivers/net/usb/rndis_host.c
> > @@ -428,7 +428,11 @@ generic_rndis_bind(struct usbnet *dev, struct usb_=
interface *intf, int flags)
> >                 dev_err(&intf->dev, "rndis get ethaddr, %d\n", retval);
> >                 goto halt_fail_and_release;
> >         }
> > -       memcpy(net->dev_addr, bp, ETH_ALEN);
> > +
> > +       if (bp[0] & 0x02)
> > +               eth_hw_addr_random(net);
> > +       else
> > +               ether_addr_copy(net->dev_addr, bp);
> >
> >         /* set a nonzero filter to enable data transfers */
> >         memset(u.set, 0, sizeof *u.set);
>
> I know that there is some internal routing done by the modem firmware,
> and I'm assuming that overwriting the MAC address breaks said routing.
> Can anyone suggest what a proper fix would be?
>
> Thanks,
> Bobby

Adding some individuals and lists in hopes for feedback
