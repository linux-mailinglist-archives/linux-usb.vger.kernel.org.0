Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB963365DF3
	for <lists+linux-usb@lfdr.de>; Tue, 20 Apr 2021 18:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhDTQze (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Apr 2021 12:55:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49946 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTQzd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Apr 2021 12:55:33 -0400
Received: from mail-oi1-f200.google.com ([209.85.167.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lYteO-0003pl-Vr
        for linux-usb@vger.kernel.org; Tue, 20 Apr 2021 16:55:01 +0000
Received: by mail-oi1-f200.google.com with SMTP id y16-20020a0568080610b0290183b8aab7c3so6676821oih.14
        for <linux-usb@vger.kernel.org>; Tue, 20 Apr 2021 09:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n++Oew9D1ON0+YhUSGRk9qScTAC0hur2GzZ6XD9RR8w=;
        b=gJbk3lP3ms6BEPF07i3DCPhBKPPxBzsAru+S5Pol/ueWIWtU6taI3Bm8jLBXioKMnk
         7LDZhlPakGSrO6YLpjAGK8H8d5xuIOtcsYSaK2rJ0p9UnzUqDlOI1I9KsB6H9wUOxpt8
         DLt38dCokDJ3ZMnj8hDWItMPcvydUeDNlLXtp45oFZgz925xIHIrQ9uSWMjvzCaUHbPH
         gxntrYsaoptwtTB3yHlF3mnMJQEs3YQzSnv3MzhInaOSjAG1TiMSbeK0o5j0Cs7opkQ9
         w++hWzOdbYshj+H6vs+qYAimkEo8QYRkpFJ6jgpn5GnnVxviXi/lR70sj9HQOxb48Jla
         vIpw==
X-Gm-Message-State: AOAM530IhgCVpmbcLbxwLJnExpvOUF8fOnL/ycwKCpgxuAWu8CUYftAi
        a2BWAm7JZQwxrX5m4srpsTT4MkbcdT1xuhS9y1f/+ZQ8s2roCPI00RifS0kotqiGElH23AZ5SJt
        JT9Jk4cFyL+NegpnXdkg3EoE4alZoagEXOpRedG3xao0FIlVfl0O2qQ==
X-Received: by 2002:a9d:7ad7:: with SMTP id m23mr13985840otn.347.1618937699950;
        Tue, 20 Apr 2021 09:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy/q01C83/Q77gJZTPSeVzIZcftn9kMkGeldA4Ls+qTYxPcdCqawe5S2H8ErjY+SrOOcJwWxSYawdUDMBpb2g=
X-Received: by 2002:a9d:7ad7:: with SMTP id m23mr13985821otn.347.1618937699626;
 Tue, 20 Apr 2021 09:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210415114856.4555-1-chris.chiu@canonical.com>
 <YHgyP8tGNM1Wi5dJ@kroah.com> <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
 <20210415184637.GA15445@rowland.harvard.edu> <CABTNMG3aweq43eQcONif2_M4JF3ARmBgOKE18v7vzHvaJnjrtA@mail.gmail.com>
 <20210416153932.GD42403@rowland.harvard.edu> <CABTNMG25qPvVu7+EsvEgaUsU_v6jKkSKCaU5VR8CiX3oLQ4VFg@mail.gmail.com>
 <20210419141921.GA133494@rowland.harvard.edu> <CABTNMG0hnfXH8yqd6Zbk3EiZtg4JUpJomn180NHUyAdgZjL7pA@mail.gmail.com>
 <20210420152848.GC170810@rowland.harvard.edu>
In-Reply-To: <20210420152848.GC170810@rowland.harvard.edu>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Wed, 21 Apr 2021 00:54:48 +0800
Message-ID: <CABTNMG0ye+APQA-vMpyfDhSOWdKtXD5BT=gBYYNXmfa_fiFfuA@mail.gmail.com>
Subject: Re: [PATCH v3] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, m.v.b@runbox.com,
        hadess@hadess.net, linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 20, 2021 at 11:28 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, Apr 20, 2021 at 03:14:56PM +0800, Chris Chiu wrote:
> > On Mon, Apr 19, 2021 at 10:19 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Mon, Apr 19, 2021 at 01:11:38AM -0400, Chris Chiu wrote:
> > > > Sorry that I didn't make myself clear. I found that if I applied RESET_RESUME
> > > > quirk on the problematic hub, the Set-Port-Feature(suspend) timeout error
> > > > disappeared. SInce the timeout is not happening for each suspend by default,
> > > > I suspect maybe reset-resume take everything back to clean state for the hub
> > > > and the Set-Port-Feature(suspend) can be taken care of w/o problems.
> > >
> > > Okay, that's a good solution for system suspend.
> > >
> > > > I didn't like RESET_RESUME because runtime PM would not work on the quirked
> > > > device.
> > >
> > > A more interesting question is whether it will work for devices plugged
> > > into the hub.  Even though the hub won't be runtime suspended, the
> > > things attached to it might be.
> > >
> > > >  But if the Set-Port-Feature(suspend) can't be handled and
> > > > skipped, I can't
> > > > expect the runtime PM to work for all devices connected to the hub either.
> > > > Is that right? If what I proposed in the patch can not get better
> > > > result than existing
> > > > quirk, I think using the RESET_RESUME would be a better option. Any suggestions?
> > >
> > > Try the RESET_RESUME quirk and see how well it works with runtime
> > > suspend.
> > >
> > > Alan Stern
> >
> > [  453.064346] usb 3-4: finish reset-resume
> > [  453.192387] usb 3-4: reset high-speed USB device number 2 using xhci_hcd
> > [  453.339916] usb 3-4: USB quirks for this device: 2
>
> Here 3-4 is problematic RealTek hub, right?
Yes.

>
> > Seems that even w/ the RESET_RESUME enabled, the connected device still
> > can runtime suspend/resume. That's acceptable to me. I'll send the patch
> > with the reset-resume quirk later.
> >
> > [  626.081068] usb 3-4.3.1: usb auto-suspend, wakeup 0
> > [  632.552071] usb 3-4.3.1: usb auto-resume
> > [  632.617467] usb 3-4.3.1: Waited 0ms for CONNECT
> > [  632.617471] usb 3-4.3.1: finish resume
>
> Then 3-4.3 is another hub plugged into the Realtek hub, and 3-4.3.1 (the
> device being suspended and resumed) is plugged into that other hub.
>
> I'm concerned about devices that are plugged directly into the Realtek
> hub.  For example, did you try allowing the 3-4.3 hub in the experiment
> above to suspend and resume?
>
> Alan Stern

The WD19 dock has 2 hubs 0bda:5487 (USB3.0) and 0bda:0487 (superspeed).
There're 5 exposed USB ports (3 Type A + 2 Type C). Lower speed ports
connect to a sub-hub (3-4.3) of the problematic hub (3-4).

The other ports such as HDMI/DisplayPort, Gigabit Ethernet and Type C ports
are connected to 0bda:0478. So I can't connect any USB devices directly to hub
3-4. I'm only certain that the direct child (3-4.3) of the hub
0bda:5487 can't runtime
suspend. But what really matters to me is that all connected devices
(3-4.3.x) can
runtime suspend.

Chris
