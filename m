Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61410E936
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 19:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfD2Rf1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 13:35:27 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38282 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728839AbfD2Rf1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 13:35:27 -0400
Received: by mail-vs1-f66.google.com with SMTP id s2so6399223vsi.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGcKmHmoHhH7w+k85P8y65zqU9P6f6SiYpVWe4wDZSk=;
        b=Ba9rwZNQkcNzVGaKPKsTjwBZvG/uw0dCPJEjMM+QoprufEm7tw2tE2PSFqRo2TQZHD
         wEGfGlVJCyx1qoxtIOuTIU0/yNbcsupeguY6xHarPyWG+36+J7TaTBg7QYgX3Tm8UCeP
         APspBgE7y4rBinLEFCRTRzKYGAEO9mw3uQ+F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGcKmHmoHhH7w+k85P8y65zqU9P6f6SiYpVWe4wDZSk=;
        b=kdFT3pvav6ndHvCwxlpIQtvgjhkvo18nhP9Wdndj0ST3Dhq3x8Qcy8ZecDD+VjtkW1
         VCw5PHqpnyPWUngUPF3p458BjbD3A22Q7HzQolSs69mPLyHGmcAyZfrxBLjM516pQDyP
         W/2ODf2mdXfo0AUUFBI/Jgqb2aI9AgiU0MFfT3eVrkPkojKXeyk1I57KyL6hu49Stf6a
         rIIOLI5sK4DwTh9xQZeNDpwDzAInYULXUMVjE8Epj4+SBa9LXigHpzFIirDu2VMymn5v
         ISdSRAjozmXM0AnDpawMHbw/Wj5Td4xwZyaGyF6kuo6QamkXyIYJFlndiWe+aG17fA0e
         PFow==
X-Gm-Message-State: APjAAAUCcAeOtS67nHmi6PM5XXeI8gUY2r7DAGRhjvXvinJg/r6XwvPY
        HuLeLwRJ4YP4IOyOxjrDPYlD89aS2Nc=
X-Google-Smtp-Source: APXvYqzelEasLPuLVV834mCr+KEjcXA0BislbceGj5TFQ40sqZtNAyTy/Ttu4hkp9xMQEChCl6VBpg==
X-Received: by 2002:a67:8117:: with SMTP id c23mr4081898vsd.78.1556559325740;
        Mon, 29 Apr 2019 10:35:25 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id u10sm15662131vku.34.2019.04.29.10.35.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 10:35:23 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id e2so6358348vsc.13
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:35:23 -0700 (PDT)
X-Received: by 2002:a67:e88c:: with SMTP id x12mr8028284vsn.87.1556559323186;
 Mon, 29 Apr 2019 10:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
 <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com> <SN1PR12MB24316A556FF0EC6E7899A9F0A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB24316A556FF0EC6E7899A9F0A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Apr 2019 10:35:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdKhbgG6r+xNUx9e+2quXi_vN7NwDBxPHs-0hKmSJKzQ@mail.gmail.com>
Message-ID: <CAD=FV=UdKhbgG6r+xNUx9e+2quXi_vN7NwDBxPHs-0hKmSJKzQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Apr 29, 2019 at 4:03 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hi,
>
> On 4/27/2019 00:45, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan
> > <Arthur.Petrosyan@synopsys.com> wrote:
> >>
> >> - In dwc2_port_suspend() function added waiting for the
> >>    HPRT0.PrtSusp register field to be set.
> >>
> >> - In _dwc2_hcd_suspend() function added checking of
> >>    "hsotg->flags.b.port_connect_status" port connection
> >>    status if port connection status is 0 then skipping
> >>    power saving (entering partial power down mode).
> >>    Because if there is no device connected there would
> >>    be no need to enter partial power down mode.
> >>
> >> - Added "hsotg->bus_suspended = true" beceuse after
> >
> > s/beceuse/because
> >
> >>    entering partial power down in host mode the
> >>    bus_suspended flag must be set.
> >
> > The above statement sounds to me like trying to win an argument by
> > saying "I'm right because I'm right."  Can you give more details about
> > why "bus_suspended" must be set?  See below also.
> >
> There is no intention of winning any argument.

I was trying to say that your statement does not convey any
information about the "why".  It just says: "I now set this variable
because it needs to be set".  This tells me nothing useful because
presumably if it did't need to be set then you wouldn't have set it.
I want to know more information about how the code was broken before
you did this.  What specifically requires this variable to be set?


> Are you familiar with "bus_suspended" flag ? have you looked at what is
> it used for ?
>
>   * @bus_suspended:     True if bus is suspended
>
> So when entering to hibernation is performed bus is suspended. To
> indicate that "hsotg->bus_suspended" is assigned to true.

Perhaps you can help me understand what the difference is between
"port suspend" and "bus suspend" on dwc2.  I think this is where my
confusion lies since there are functions for both and they do subtly
different things.  ...but both functions set bus_suspended.


> >> @@ -4514,6 +4519,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
> >>                  goto skip_power_saving;
> >>          }
> >>
> >> +       hsotg->bus_suspended = true;
> >> +
> >
> > I'm a bit unsure about this.  Specifically I note that
> > _dwc2_hcd_resume() has a special case "if (hsotg->bus_suspended)".
> > Does that now become dead code?
> No it doesn't became a dead code.

Can you explain when it gets triggered, then?


-Doug
