Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F110103C1
	for <lists+linux-usb@lfdr.de>; Wed,  1 May 2019 03:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfEAB45 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 21:56:57 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39838 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfEAB45 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 21:56:57 -0400
Received: by mail-vs1-f67.google.com with SMTP id g127so9200885vsd.6
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 18:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=06LICDfjCeCtvVUkBORNi2vtZVpAhIUAW1k7qKawkC4=;
        b=j6fmWbqC7a7BBUo2lPeQez2tJf5Zgp111u3x/f4c4UZKQzbMQLEf3aF5oaD85bXQdb
         t/dAWXeGctu5hwKcP/L+ocQoEikwxwmjBJ2FdoWCGDFdd0/2zAMxOD6oV/7oR8l9OgYn
         zCJFYMTm8yPHu7NOGDd9qCKPnJuut694tNiyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=06LICDfjCeCtvVUkBORNi2vtZVpAhIUAW1k7qKawkC4=;
        b=s6r9TDc8WJWsJUUZ866MHfAd4MAZWP4tOPEfO6I4VRBZD/65GbtOu+AkyQPONDLQIJ
         /4kvRQt7DCkKwTMmvltQCOVL5+3+rTc9GfAh/bkMHfWkz/RRdp/sWkSC0359XAJCukXa
         cbZDAG7JGeyyFF8SRZyFxeOXVqiEwmZNZyh+5MnMGwgF/AwAmV2uRaO4DauZAlSlQSNo
         NwCdqWUK46jxS2bPSS//syUQ7wBEeEluLNy4EytEVMMOqH7fVIgUMui+AAycHvvF/zJy
         wVLFGLhzfMlDA1IXYYAwmRBdKsgKleBvtPkBp+XdVPITTJr6fXx7cTC7+o3U8l3I+WcM
         riaQ==
X-Gm-Message-State: APjAAAWj7UMqOC0vM3qlJXLGqP9DNrxlLYGT9KOapWVlMDLs4A4qUOQG
        AzNCkZiiSgoRq32vQq1nGAcqjaIzEnk=
X-Google-Smtp-Source: APXvYqxaEr7fjYj42H3Q3nDJLEO+7zQJe1Ua/eW6l7kRV5N4lRxNqct8IR0TCDeyqBn8WJJIqIUy8A==
X-Received: by 2002:a67:f6d0:: with SMTP id v16mr13641590vso.142.1556675815635;
        Tue, 30 Apr 2019 18:56:55 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id q128sm10485886vke.2.2019.04.30.18.56.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 18:56:55 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id w13so9210359vsc.4
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 18:56:55 -0700 (PDT)
X-Received: by 2002:a67:7cd1:: with SMTP id x200mr7091738vsc.144.1556675496267;
 Tue, 30 Apr 2019 18:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-2-dianders@chromium.org> <SN1PR12MB243108D1EF3239EC4F730ACDA7390@SN1PR12MB2431.namprd12.prod.outlook.com>
 <CAD=FV=UOmfNeuZPrDcZRdwAkF4yRifCpBGUuZTsmmz0UVEZ+yA@mail.gmail.com> <SN1PR12MB24317F315C5A4DFE70F9CB0DA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB24317F315C5A4DFE70F9CB0DA73A0@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Apr 2019 18:51:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWGOWiCpy5qUY8oFHPyxdYJe7OsdWBDuCNcXBu5BJoGA@mail.gmail.com>
Message-ID: <CAD=FV=UWGOWiCpy5qUY8oFHPyxdYJe7OsdWBDuCNcXBu5BJoGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] usb: dwc2: bus suspend/resume for hosts with DWC2_POWER_DOWN_PARAM_NONE
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        "amstan@chromium.org" <amstan@chromium.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        William Wu <william.wu@rock-chips.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>,
        "zyw@rock-chips.com" <zyw@rock-chips.com>,
        "mka@chromium.org" <mka@chromium.org>,
        "ryandcase@chromium.org" <ryandcase@chromium.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        "jwerner@chromium.org" <jwerner@chromium.org>,
        "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Apr 29, 2019 at 11:06 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hi,
>
> On 4/29/2019 21:34, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Apr 29, 2019 at 1:43 AM Artur Petrosyan
> > <Arthur.Petrosyan@synopsys.com> wrote:
> >>
> >> Hi,
> >>
> >> On 4/18/2019 04:15, Douglas Anderson wrote:
> >>> This is an attempt to rehash commit 0cf884e819e0 ("usb: dwc2: add bus
> >>> suspend/resume for dwc2") on ToT.  That commit was reverted in commit
> >>> b0bb9bb6ce01 ("Revert "usb: dwc2: add bus suspend/resume for dwc2"")
> >>> because apparently it broke the Altera SOCFPGA.
> >>>
> >>> With all the changes that have happened to dwc2 in the meantime, it's
> >>> possible that the Altera SOCFPGA will just magically work with this
> >>> change now.  ...and it would be good to get bus suspend/resume
> >>> implemented.
> >>>
> >>> This change is a forward port of one that's been living in the Chrome
> >>> OS 3.14 kernel tree.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>> This patch was last posted at:
> >>>
> >>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lkml.kernel.or=
g_r_1446237173-2D15263-2D1-2Dgit-2Dsend-2Demail-2Ddianders-40chromium.org&d=
=3DDwIDAg&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBjJhGVrrlYOeOQjP_HlVzYqr=
C_D7niMJI&m=3DMMfe-4lZePyty6F5zfQ54kiYGuJWNulyRat944LkOsc&s=3DnExFpAPP_0plZ=
fO5LMG1B-mqt1vyCvE35elVcyVgs8Y&e=3D
> >>>
> >>> ...and appears to have died the death of silence.  Maybe it could get
> >>> some bake time in linuxnext if we can't find any proactive testing?
> >>>
> >>> I will also freely admit that I don't know tons about the theory
> >>> behind this patch.  I'm mostly just re-hashing the original commit
> >>> from Kever that was reverted since:
> >>> * Turning on partial power down on rk3288 doesn't "just work".  I
> >>>     don't get hotplug events.  This is despite dwc2 auto-detecting th=
at
> >>>     we are power optimized.
> >> What do you mean by doesn't "just work" ? It seem to me that even afte=
r
> >> adding this patch you don't get issues fixed.
> >> You mention that you don't get the hotplug events. Please provide dwc2
> >> debug logs and register dumps on this issue.
> >
> > I mean that partial power down in the currently upstream driver
> > doesn't work.  AKA: if I turn on partial power down in the upstream
> > driver then hotplug events break.  I can try to provide some logs.  On
> > what exact version of the code do you want logs?  Just your series?
> > Just my series?  Mainline?  Some attempt at combining both series?  As
> > I said things seem to sorta work with the combined series.  I can try
> > to clarify if that's the series you want me to test with.  ...or I can
> > wait for your next version?
> As I said this patch doesn't fix the issue with hotplug. With this patch
> or without the hotplug behaves as it was. I have tested it on our setup.
>
> Have you debugged your patch? Does it make any difference on your setup
> ? Does it fix the issue with hotplug?

I think we're still not taking on the same page.

My patch makes no attempt to make partial power down mode work.  My
patch attempts to make things work a little better when using
DWC2_POWER_DOWN_PARAM_NONE.  There is no use testing my patch with
partial power down as it shouldn't have any impact there.


> > I am by no means an expert on dwc2, but an assumption made in my patch
> > is that even cores that can't support partial power down can still
> > save some amount of power when hcd_suspend is called.
> Have you tried to debug dwc2 with power_down =3D=3D DWC2_POWER_DOWN_PARAM=
_NONE ?
> >
> > Some evidence that this should be possible: looking at mainline Linux
> > and at dwc2_port_suspend(), I see:
> >
> > * It is currently called even when we have DWC2_POWER_DOWN_PARAM_NONE
> Currently (without your and my patches) (looking at mainline Linux) the
> function dwc2_port_suspend() is called anyway because its call is issued
> by the system. But it performs entering to suspend only in case of
> DWC2_POWER_DOWN_PARAM_PARTIAL.
>
> This is not an assumption. What I am pointing out is based on debugging
> and before making assumptions without debugging for me seems not ok.
>
> Currently without your patch and without my patches. In the
> dwc2_port_suspend() it will enter to suspend only in case that
> power_down =3D=3D DWC2_POWER_DOWN_PARAM_PARTIAL. Because if you look at t=
he
> code more carefully you will see
>
>         if (hsotg->params.power_down !=3D DWC2_POWER_DOWN_PARAM_PARTIAL)
>                 goto skip_power_saving;
>
> This says if power_down is not DWC2_POWER_DOWN_PARAM_PARTIAL then skip
> power saving.
>
> So but after your patch. If power_down is DWC2_POWER_DOWN_PARAM_NONE it
> tries to suspend.

We must be looking at different code.  I'm looking at Linux's tree, AKA:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/usb/dwc2/hcd.c#n3488

I took a mainline kernel ("v5.1-rc7-5-g83a50840e72a") and added
printouts in dwc2_port_suspend() next to where it set HPRT0_SUSP and
PCGCTL_STOPPCLK in dwc2_port_suspend().

[  454.906364] dwc2 ff540000.usb: I'm setting HPRT0_SUSP
[  454.906367] dwc2 ff540000.usb: I'm setting PCGCTL_STOPPCLK

...and just to confirm:

# grep '^power' /sys/kernel/debug/*.usb/params
/sys/kernel/debug/ff540000.usb/params:power_down                    : 0
/sys/kernel/debug/ff580000.usb/params:power_down                    : 0

So I'm really quite convinced that on mainline Linux with
DWC2_POWER_DOWN_PARAM_NONE that dwc2_port_suspend() sets HPRT0_SUSP
and PCGCTL_STOPPCLK.


> > ...I believe that the net effect of my patch ends up doing both those
> > same two things in hcd_suspend.  That is: when power_down is
> > DWC2_POWER_DOWN_PARAM_NONE I believe my patch is really just doing the
> > same thing that dwc2_port_suspend() would do in the same case.  Is
> > that not OK?
> No if your patch is doing the same thing as it was doing before what is
> the purpose of the patch ?

The purpose is to make _dwc2_hcd_suspend() work more correctly in the
case where power_down is DWC2_POWER_DOWN_PARAM_NONE


> My testes show that your patch doesn't fix the issue related partial
> power down.

Right.  I have been trying to say that my patch doesn't do anything at
all for partial power down.  I am simply trying to make
DWC2_POWER_DOWN_PARAM_NONE work more correctly.

I haven't run all the power consumption tests in quite a long time and
I'll try to get it hooked up tomorrow to confirm that my patch really
truly is still needed to help with power consumption.  I did confirm
that at least there are cases where _dwc2_hcd_suspend() is called and
my patch is what sets the important bits.

-Doug
