Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B021B7576
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 14:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgDXMec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 08:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgDXMec (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 08:34:32 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E83C09B045
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 05:34:32 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id e26so12070507otr.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=86OI2RgVsJxpkILEGqDj2aahSfy5d8G5pns3PwdbWPE=;
        b=S3wedulMW2TBj3eWjMmshLK0TqBYleFo08PoogLRM+0ShA4MQKeqytpCrlFPJlhrIb
         tpN8HrMcVTLj6rXJ7pwcLUU6EJsaghmC5ONqcssJKjrb9sv9+fjStvRDMdnCNZIdW63I
         /sOkb0cClx0seE3E3Gxb3DDGHItdp7MuZsApgj9woVqpcoIc81HXS4nz8bSZS8uYnjvB
         iCFo6B7BKRmOJB4gRf5NDckFUnFnwYIIocIcrxyV126Bj5MSpRh5gMnCGOxWwVEuF70p
         B5HhiRJhcZxPlZ490wXhvYiO8C74DJdDfqlY6lF+Pi+QjpBm2lpk6atcVxPAn3LZcX0B
         DEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86OI2RgVsJxpkILEGqDj2aahSfy5d8G5pns3PwdbWPE=;
        b=GLoP6DGrLWeRcOkqvYr3ZlYG5nU0R7Q2Eij5RoHEHKO1lhlybJteZ1RnR1r+aLERjM
         33/AmeNePpeuMRpSsqNcC6VGacX5AL0O8PQWC210pZ0GFGMRTBLFQv5A6yWzXU719Z+C
         438IRnP4QRlcqsTlcc3Y54KkrzJZoqKBs3p7pNR8sKGZDCeJvbR2CGPNvhqxYgOWLwZK
         gjFRKZNOFsQoryZJrvHZ/LfW/EJlU7XMgkelI5Z1nTdJcrB1DoDeV9S7o5mSuu2zARTa
         lCxPQJyqsb0RanUk//Eg0qXA88GdFvy1TelZFNs2epCyepveM0YgrtwnnAbK9XcXUtgE
         zb1A==
X-Gm-Message-State: AGi0PuYg5U0d2M3UoxeD52diBbfxeqjeZE5Viq/xWC/R8vvmmQDuUQ1n
        TbLHUgGxApxtj2xgeaEpY8DOl9cWMJE3iBF5zduJ2uP6x8U=
X-Google-Smtp-Source: APiQypIJc7KFpszeKkcw+bRfwXa8X/DnW5lcBdiYk95gJNMP9aE8LoJQn/Z/QUYqXxc3qjQ5B3we7HQBNQk+eF/b6M4=
X-Received: by 2002:aca:c0c3:: with SMTP id q186mr7078694oif.174.1587731671613;
 Fri, 24 Apr 2020 05:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
 <CAB=otbRMQ6eCD0U-2zDCQvN37VRhBta_9_+9u4FwEbY4St=AgQ@mail.gmail.com>
 <f3114cb0-dc77-b4a6-f70b-2e72c9e87ce2@ivitera.com> <cf933b39-1d4a-aeff-3db9-5e05da302665@ivitera.com>
In-Reply-To: <cf933b39-1d4a-aeff-3db9-5e05da302665@ivitera.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Fri, 24 Apr 2020 15:34:20 +0300
Message-ID: <CAB=otbQLV1b6mv3n6d0URRM71OnEmwkTSEDuiNW5-rniBzdo1w@mail.gmail.com>
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Linux USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 2:21 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
>
>
> Dne 11. 02. 20 v 20:02 Pavel Hofman napsal(a):
> > Hi Ruslan,
> >
> > Dne 11. 02. 20 v 17:10 Ruslan Bilovol napsal(a):
> >> On Thu, Feb 6, 2020 at 3:35 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> >>>
> >>> .
> >>
> >> Are you working on async feedback EP implementation? I'm interested in that
> >> feature and I can implement it soon but do not want to do double work
> >> if somebody
> >> is already working on it and will send to the community soon
> >
> > I would be happy if you focused on the feedback. I want to solve the
> > g_audio usability somehow first
> > https://lore.kernel.org/linux-usb/df2eeff0-ca9c-35f9-2e72-8426b2cf72c9@ivitera.com/
> > as it would allow easy usage of the existing adaptive gadget version.
> >
> > The feedback - I have been shown a simple implementation which is not
> > public and is not using the g_audio alsa device on the other side.
> >
> > IMO the key issue is designing the async feedback to accept feedback
> > values from userspace as well as from any third-party kernel module. Why
> > userspace? The stream provided by the g_audio capture device  can be
> > output to a real master-clock alsa device (e.g. after synchronous
> > resampling), be sent by network to some master-clock device, many other
> > options possible. Any master-clock output device/ userspace sink should
> > be able to provide data for calculating proper up-to-date feedback value
> > for the slaved UAC2 gadget.
> >
> > I have done a few trials with master alsa output device -
> >
> > https://www.diyaudio.com/forums/pc-based/342070-linux-usb-audio-gadget-rpi4-otg.html#post5909816
> >
> >
> > https://www.diyaudio.com/forums/pc-based/342070-linux-usb-audio-gadget-rpi4-otg.html#post5910911
> >
> > Details for alsa-lib are discussed in
> > https://www.spinics.net/lists/alsa-devel/msg96781.html
> >
> >
> > This is a solution I need - syncing the UAC2 gadget to master clock of
> > real alsa soundcard . But again - I think the solution should be
> > flexible to support any source of feedback information, be it in kernel
> > or from userspace.
> >
>
> Hi, please can we resume this discussion about the feedback endpoint?
>
> Meanwhile a simple method described in
> https://www.aktives-hoeren.de/viewtopic.php?p=137829&sid=0d6cd50e0f58618da33621c62e412ada#p137829
> for obtaining required rate shift from /proc/asound/.../status to keep
> the master side buffer optimally filled was tested. That could be one
> source for the rate shift, to be passed to the driver. Perhaps a control
> element like the "PCM Rate Shift" of the snd-aloop driver could be used.

I worked on this during last moths and implemented feedback endpoint
and other improvements to UAC2 driver.
Currently it's under testing, I do expect to submit patches to community soon.

I used the same idea with "PCM Rate Shift" control to make it work with
existing alsaloop tool, but the in this case I do think it's better to expose
frequency directly to the control

Anyway, let'l look at the patches

Thanks,
Ruslan
