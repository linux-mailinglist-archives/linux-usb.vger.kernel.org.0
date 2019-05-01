Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999B3103C0
	for <lists+linux-usb@lfdr.de>; Wed,  1 May 2019 03:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbfEAByt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 21:54:49 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38459 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfEABys (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 21:54:48 -0400
Received: by mail-ua1-f65.google.com with SMTP id t15so5472475uao.5
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 18:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EPFH/dG04j+rqUCAW/imjVQGg7OalOJ23sZCt8aTzU4=;
        b=Pt1bgp+S2eEobE2GJgME6aIpXaYfOQcR+gFlezw0VyNb5nbmn7l0BkcvXDbm1/nyeL
         3Zymg8XlQZlHyURNxyaSq3H1nsAV0Qa/9ZkNQ7RlGtSPlmWBWRl9FuHnang/MXN7EKiL
         fxY6JYy44ciCywQStwgk2k+6Lyl3EZxk2iZhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EPFH/dG04j+rqUCAW/imjVQGg7OalOJ23sZCt8aTzU4=;
        b=MuakjfCWMV5HhbIVLHMljlYFVJ32L0KeW227VXn4+0V6CgKMo0QxGcYR9d8SUGEvzh
         CExm5zRu2iGCpsyRcblAl+9g02cx/edYiYyzeU7tefBgaqpWKS/pUHSefOlN0bdBCF+7
         rqL7OBnxFF9K2otWVwOLKuajuGsasnDv0YTGyiYTFKvu0H9E1LcRlbIxlfFvOLda16rZ
         lOmqqtMeWTJhowXrPKHIAzMtTVVFrdsVCd4yx9h+4G8FUcmbivz339pH2BcBq1AIiPa1
         REWOWP/T1NRthfKkaqTpPTDR5AzFonO9maJlbD4fhqSZMTTZ7V7GefyEGZRW0j65fZum
         2iJg==
X-Gm-Message-State: APjAAAWvqARLtZdPWXScYkLcxpKcn78fM82cR6IU7+9fuGmQv2LsNIyi
        b/v/nFhwpHTRCymPdoo97NnSiUoECfc=
X-Google-Smtp-Source: APXvYqzPg40ZjY8JnGkhNIpFbIM2UuCBd+izQtGznbKsMdVt2stKyb3jJwSe7qZCDh+l/6I5uZIQqQ==
X-Received: by 2002:ab0:2b19:: with SMTP id e25mr3495896uar.68.1556675687080;
        Tue, 30 Apr 2019 18:54:47 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id p8sm9437772vsd.14.2019.04.30.18.54.45
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 18:54:45 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id s11so9225202vsn.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 18:54:45 -0700 (PDT)
X-Received: by 2002:a67:79ca:: with SMTP id u193mr8906840vsc.20.1556675685387;
 Tue, 30 Apr 2019 18:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
 <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com>
 <SN1PR12MB24316A556FF0EC6E7899A9F0A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=UdKhbgG6r+xNUx9e+2quXi_vN7NwDBxPHs-0hKmSJKzQ@mail.gmail.com> <SN1PR12MB243146421A3AFF32CCC341EAA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB243146421A3AFF32CCC341EAA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Apr 2019 18:54:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6d6ZZnqV5kH3G_dML83LGYu-b2K4+dnVdr=+SaRCjHg@mail.gmail.com>
Message-ID: <CAD=FV=W6d6ZZnqV5kH3G_dML83LGYu-b2K4+dnVdr=+SaRCjHg@mail.gmail.com>
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

On Tue, Apr 30, 2019 at 12:11 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hi,
>
> On 4/29/2019 21:35, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Apr 29, 2019 at 4:03 AM Artur Petrosyan
> > <Arthur.Petrosyan@synopsys.com> wrote:
> >>
> >> Hi,
> >>
> >> On 4/27/2019 00:45, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan
> >>> <Arthur.Petrosyan@synopsys.com> wrote:
> >>>>
> >>>> - In dwc2_port_suspend() function added waiting for the
> >>>>     HPRT0.PrtSusp register field to be set.
> >>>>
> >>>> - In _dwc2_hcd_suspend() function added checking of
> >>>>     "hsotg->flags.b.port_connect_status" port connection
> >>>>     status if port connection status is 0 then skipping
> >>>>     power saving (entering partial power down mode).
> >>>>     Because if there is no device connected there would
> >>>>     be no need to enter partial power down mode.
> >>>>
> >>>> - Added "hsotg->bus_suspended = true" beceuse after
> >>>
> >>> s/beceuse/because
> >>>
> >>>>     entering partial power down in host mode the
> >>>>     bus_suspended flag must be set.
> >>>
> >>> The above statement sounds to me like trying to win an argument by
> >>> saying "I'm right because I'm right."  Can you give more details about
> >>> why "bus_suspended" must be set?  See below also.
> >>>
> >> There is no intention of winning any argument.
> >
> > I was trying to say that your statement does not convey any
> > information about the "why".  It just says: "I now set this variable
> > because it needs to be set".  This tells me nothing useful because
> > presumably if it did't need to be set then you wouldn't have set it.
> > I want to know more information about how the code was broken before
> > you did this.  What specifically requires this variable to be set?
> Specifically that variable is set when core enters to hibernation or
> partial power down.
> >
> >
> >> Are you familiar with "bus_suspended" flag ? have you looked at what is
> >> it used for ?
> >>
> >>    * @bus_suspended:     True if bus is suspended
> >>
> >> So when entering to hibernation is performed bus is suspended. To
> >> indicate that "hsotg->bus_suspended" is assigned to true.
> >
> > Perhaps you can help me understand what the difference is between
> > "port suspend" and "bus suspend" on dwc2.  I think this is where my
> > confusion lies since there are functions for both and they do subtly
> > different things.  ...but both functions set bus_suspended.
> dwc2_port_suspend() is a function which is called when set port feature
> "USB_PORT_FEAT_SUSPEND" is asserted. Yet, bus_suspended is a variable.
> That variable should be set any time that host enters to hibernation or
> partial power down.
>
> >
> >
> >>>> @@ -4514,6 +4519,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
> >>>>                   goto skip_power_saving;
> >>>>           }
> >>>>
> >>>> +       hsotg->bus_suspended = true;
> >>>> +
> >>>
> >>> I'm a bit unsure about this.  Specifically I note that
> >>> _dwc2_hcd_resume() has a special case "if (hsotg->bus_suspended)".
> >>> Does that now become dead code?
> >> No it doesn't became a dead code.
> >
> > Can you explain when it gets triggered, then?
> _dwc2_hcd_resume() is triggered by the system.
> As an example lets assume you have hibernated the PC and then you turn
> the PC on. When you turn the PC back on in that case _dwc2_hcd_resume()
> function is called to resume from suspended state (Hibernation/partial
> power down)

I think you are still not understanding my question here.  Please
re-read it again.


-Doug
