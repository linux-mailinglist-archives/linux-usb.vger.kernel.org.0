Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 787D9E95B
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 19:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbfD2Rkh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 13:40:37 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38585 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2Rkh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 13:40:37 -0400
Received: by mail-vs1-f65.google.com with SMTP id s2so6409505vsi.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YqeYR8BHi6e2nYbZ0JtDVuDtXVxEemhz8ckz0C4ye8=;
        b=iGtCYbxfGMURLhY6nNYPv17tjN3enKlDHxiv+2k1dQgGHU3B8nPork7lVlvUF39QZ+
         DgIJyP4na21RkFHDd9XNiwt1uom0DqhXF2z9N/mc51yMznt/H0jQaxzrHzgo9GrEBZVx
         7ALU5ZjfW5Q4mbZlKQ4E5OxQyPeND6E6peMCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YqeYR8BHi6e2nYbZ0JtDVuDtXVxEemhz8ckz0C4ye8=;
        b=SGDZYO6R7WcpOIHGv8xBWFEM/2e4tUFVovSzjJUB0QPbsUaK+oor62O44Zz4FDIU9u
         Blk3nE4mOsglvD1EUaDZFmwRrJcUBfxMEW5o9smIku0oGukNzqGVdKqP8E3gNVPSRCHt
         NUEH6Va+Nlc8V5nJC757xGVurnEGA3YmVsKLQziEI2KP7D33pelaZVVpk1Nv6VVTzV+8
         h037m2fbFhhsVXMAqqqWNjx4x8nHhL/lILPyMoaEx1+xeyBl+yYVaB3nEMzEcmQdn9LG
         XLRy4GmuWcpdVm1mwMkWMeWjkF8TllE1CbbwYl2mcw9D1KgBiGorqve7PEc/aPyvfCaR
         GQ+Q==
X-Gm-Message-State: APjAAAUkSvseObnaLrb8XFcj+oRMmH4ddbVg+eIda93auybrZ28xW8P1
        M3xrrvY9ONV4YC+F7KvWiUx5iaFA6mY=
X-Google-Smtp-Source: APXvYqxY9AWlL51tQgJ5lq9Ih/z7TEfAVFD6J9ye9hy/dGIH2mu97lEOqCQxOdIunHm3XbX1gZ/U8A==
X-Received: by 2002:a67:bd01:: with SMTP id y1mr31077903vsq.167.1556559635429;
        Mon, 29 Apr 2019 10:40:35 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id p44sm4255651uae.7.2019.04.29.10.40.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 10:40:34 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id y196so287163vsc.10
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 10:40:34 -0700 (PDT)
X-Received: by 2002:a67:ffce:: with SMTP id w14mr11636268vsq.111.1556559633924;
 Mon, 29 Apr 2019 10:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <15bba89b920e29e27de4cfaac546834fba5d1a76.1555672441.git.arturp@synopsys.com>
 <CAD=FV=U4BXuT1rM--UBo6vTfCHpm=qsWydoO_bNXYRDxu22twA@mail.gmail.com> <SN1PR12MB2431B8BC296AF49152702868A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2431B8BC296AF49152702868A7390@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Apr 2019 10:40:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFd-Uk_beUr+5djbi-93eWENGu5z5td7V3KPqpuoeiig@mail.gmail.com>
Message-ID: <CAD=FV=XFd-Uk_beUr+5djbi-93eWENGu5z5td7V3KPqpuoeiig@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] usb: dwc2: Add default param to control power optimization.
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

On Mon, Apr 29, 2019 at 4:30 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hi,
>
> On 4/27/2019 00:46, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan
> > <Arthur.Petrosyan@synopsys.com> wrote:
> >>
> >> - Added a default param "power_saving" to enable or
> >>    disable hibernation or partial power down features.
> >>
> >> - Printed hibernation param in hw_params_show and
> >>    power_saving param in params_show.
> >>
> >> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> >> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> >> ---
> >>   drivers/usb/dwc2/core.h    |  3 +++
> >>   drivers/usb/dwc2/debugfs.c |  2 ++
> >>   drivers/usb/dwc2/params.c  | 19 +++++++++++++------
> >>   3 files changed, 18 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> >> index 30bab8463c96..9221933ab64e 100644
> >> --- a/drivers/usb/dwc2/core.h
> >> +++ b/drivers/usb/dwc2/core.h
> >> @@ -373,6 +373,8 @@ enum dwc2_ep0_state {
> >>    *                      case.
> >>    *                      0 - No (default)
> >>    *                      1 - Yes
> >> + * @power_saving:      Specifies if power saving is enabled or not. If it is
> >> + *                     enabled power_down functionality will be enabled.
> >>    * @power_down:         Specifies whether the controller support power_down.
> >>    *                     If power_down is enabled, the controller will enter
> >>    *                     power_down in both peripheral and host mode when
> >
> > Why are you adding a new parameter?  power_saving should be exactly
> > the same as "power_down != DWC2_POWER_DOWN_PARAM_NONE".  Just use that
> > anywhere you need it.
> Customers should have a parameter using which they will disable entire
> power saving hibernation and Partial Power Down support.
>
> power_down is used to see which power saving mode we got
> (hibernation/partial power down).
>
> >
> > Having two parameters like you're doing is just asking for them to get
> > out of sync.  ...and, in fact, I think they will get out of sync.  On
> > rk3288, for instance:
> >
> > -> dwc2_set_default_params()
> > ---> power_saving = true
> > ---> dwc2_set_param_power_down()
> > -----> power_down = DWC2_POWER_DOWN_PARAM_PARTIAL
> > -> set_params(), which is actually dwc2_set_rk_params()
> > ---> power_down = 0
> Setting power_down = 0  is a wrong and old option of disabling power
> saving feature because if we set power_down = 0 then it shows that there
> is no support for any power saving mode. That is why this patch is
> introduced to provide an easier way of disabling power saving modes.

If setting "power_down = 0" is wrong then please update your patch to
remove all the mainline code that sets power_down to 0.  Presumably
this means you'd want to convert that code over to using "power_saving
= False".  Perhaps then I can see your vision of how this works more
clearly.

NOTE: I'm curious how you envision what someone would do if they had a
core that supported hibernation but they only wanted to enable partial
power down.  I guess then they'd have to set "power_saving = True" and
then "power_down = DWC2_POWER_DOWN_PARAM_PARTIAL"?  I guess your
vision of the world is:


// Example 1: Core supports power savings but we want disabled
// (no code since this is the default)

// Example 2: Pick the best power saving available
params->power_saving = True

// Example 3: Supports hibernation, but we only want partial:
params->power_saving = True
params->power_down = DWC2_POWER_DOWN_PARAM_PARTIAL


My vision of the world is:

// Example 1: Core supports power savings but we want disabled
params->power_down = DWC2_POWER_DOWN_PARAM_NONE

// Example 2: Pick the best power saving available
// (no code since this is the default)

// Example 3: Supports hibernation, but we only want partial:
params->power_down = DWC2_POWER_DOWN_PARAM_PARTIAL


I like that in my vision of the world "pick the best" is the default
(though I suppose we need to fix the driver so it actually works) and
that there's only one variable so you don't have extra confusion.


> > ...so at the end of dwc2_init_params() you will have power_saving =
> > true but power_down set to DWC2_POWER_DOWN_PARAM_NONE.  That seems
> > bad.  ...and, in fact:
> >
> > # grep '^power' /sys/kernel/debug/*.usb/params
> > /sys/kernel/debug/ff540000.usb/params:power_saving                  : 1
> > /sys/kernel/debug/ff540000.usb/params:power_down                    : 0
> > /sys/kernel/debug/ff580000.usb/params:power_saving                  : 1
> > /sys/kernel/debug/ff580000.usb/params:power_down                    : 0
> >
> >
> > ...so while you could fix all of the various set_params() functions,
> > it seems better to just drop this patch since I don't think it buys
> > anything.
> I don't think we should drop this patch. Because, it is introducing the
> correct way of disabling power saving (hibernation/partial power down
> modes). Explanation is listed above.

I personally see no benefit still.  It's just as clear to me for
someone to set "power_down = DWC2_POWER_DOWN_PARAM_NONE" as it is to
set "power_savings = False".

-Doug
