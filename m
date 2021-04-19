Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C42F2363AE6
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 07:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhDSFMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 01:12:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46828 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbhDSFMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 01:12:21 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lYMCM-0005Cw-PN
        for linux-usb@vger.kernel.org; Mon, 19 Apr 2021 05:11:50 +0000
Received: by mail-ot1-f72.google.com with SMTP id w25-20020a0568301119b029025c1d152cebso9249307otq.23
        for <linux-usb@vger.kernel.org>; Sun, 18 Apr 2021 22:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tyd+1dQ+ErVKx1JdIk658NVw080X5wV+ShvBB/puUzQ=;
        b=tn4tqX5aTdvX/vQWf/849d59w/9Ql5HR6Ns4S4DgvWqnEZuqVvyChKApUxVKhBIl28
         jvzLoeSMTmTycqITYM2dB3DSOMymiD3tpAWM5K/OGMOpHglze4cGYbMEbmEyu9Q3a5mK
         yDJw459Uf3r2qKrmF/qBhtI3e78fwnul3NRlC3y7zPdkX6TFO1Y6bRemYYKfWGJmXQR8
         AWWFj9ISIYiMrQC1NrSfjmK7wPXtZguyCdr32zOFdzsIYXY1Pq3Dj+5n2nZWGD6Sc30h
         OXsZRV6/dTPIn37UHs3596XpgGNf9wwiQ2o447XIkRDmxyYfwUfUXKwo2BJFXxGPU4Fw
         3kYw==
X-Gm-Message-State: AOAM533FFjLsTZVHQM1YtOTyLtM6530Tp/05x3F2zwkeYvJzRhURdR4E
        L+aEIDfThNFEZr4n0b9g9o+G84us0RDlKBmWngmuJgJfNPQhs/MFI5FivZi0aSLaKceVC9O5pvL
        Q5sQdpYa4XWXyNEE/qvesD3XPSwcLGh5Usc8nX4xfkVMrXsAjIIiN9w==
X-Received: by 2002:aca:4a97:: with SMTP id x145mr5301613oia.177.1618809109752;
        Sun, 18 Apr 2021 22:11:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpJa6ylhblmCS1U6HZP/ShZUCaOgayMXlZjsfRHo8e1chf9R7/IjhN3RhkaSFPWBbv0l5kmU3+dLlUBWDpMMQ=
X-Received: by 2002:aca:4a97:: with SMTP id x145mr5301604oia.177.1618809109571;
 Sun, 18 Apr 2021 22:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210415114856.4555-1-chris.chiu@canonical.com>
 <YHgyP8tGNM1Wi5dJ@kroah.com> <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
 <20210415184637.GA15445@rowland.harvard.edu> <CABTNMG3aweq43eQcONif2_M4JF3ARmBgOKE18v7vzHvaJnjrtA@mail.gmail.com>
 <20210416153932.GD42403@rowland.harvard.edu>
In-Reply-To: <20210416153932.GD42403@rowland.harvard.edu>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Mon, 19 Apr 2021 01:11:38 -0400
Message-ID: <CABTNMG25qPvVu7+EsvEgaUsU_v6jKkSKCaU5VR8CiX3oLQ4VFg@mail.gmail.com>
Subject: Re: [PATCH v3] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, m.v.b@runbox.com,
        hadess@hadess.net, linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 16, 2021 at 11:39 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, Apr 16, 2021 at 09:24:30AM +0800, Chris Chiu wrote:
> > On Fri, Apr 16, 2021 at 2:46 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, Apr 16, 2021 at 12:13:43AM +0800, Chris Chiu wrote:
> > > > One thing worth mentioning here, I never hit the hub_ext_port_status -71
> > > > problem if I resume by waking up from the keyboard connected to the hub.
> > >
> > > I thought you said earlier that the port got into trouble while it was
> > > suspending, not while it was resuming.  You wrote:
> > >
> > > > [ 2789.679812] usb 3-4-port3: can't suspend, status -110
> > >
> > > So if the problem occurs during suspend, how can it be possible to avoid
> > > the problem by taking some particular action later while resuming?
> > >
> >
> > The ETIMEDOUT is still there, but the port can resume w/o problems and I
> > don't really know what the hub did. I can only reset_resume the hub to bring it
> > back if I'm not waking up from the connected keyboard.
>
> What if two devices are plugged into the hub, only one of them is
> runtime suspended, and you need to runtime resume that device?  Then you
> can't do a reset-resume of the hub, because the hub isn't suspended.
>
> > > > But the usbcore kernel log shows me wPortStatus: 0503 wPortChane: 0004
> > > > of that port while resuming. In normal cases, they are 0507:0000.
> > >
> > > The 0004 bit of wPortChange means that the suspend status has changed;
> > > the port is no longer suspended because the device attached to that port
> > > (your keyboard) issued a wakeup request.
> > >
> > > >  I don't know how to SetPortFeature() with setting the status change bit only.
> > >
> > > You can't.  Only the hub itself can set the wPortChange bits.
> > >
> > > > Or maybe it's just some kind of timing issue of the
> > > > idle/suspend/resume signaling.
> > >
> > > Not timing.  It's because you woke the system up from the attached
> > > keyboard.
> > >
> > > Alan Stern
> >
> > Got it. I'm just confused by the USB 2.0 spec 11.24.2.7.2 that
> > "Hubs may allow setting of the status change bits with a SetPortFeature()
> >  request for diagnostic purposes."
>
> Yeah, I don't think very many hubs actually do that.
>
> > So for this case, I think USB_QUIRK_RESET_RESUME would be a
> > better option to at least bring back the port. Any suggestion about what
> > kind of test I can do on this hub? Thanks
>
> I'm not sure what you're proposing.
>
> If (as mentioned above) the hub doesn't handle the
> Set-Port-Feature(suspend) request properly, then we should avoid issuing
> that request.  Which means runtime suspend attempts should not be
> allowed, as in your most recent patch.
>
> Alan Stern

Sorry that I didn't make myself clear. I found that if I applied RESET_RESUME
quirk on the problematic hub, the Set-Port-Feature(suspend) timeout error
disappeared. SInce the timeout is not happening for each suspend by default,
I suspect maybe reset-resume take everything back to clean state for the hub
and the Set-Port-Feature(suspend) can be taken care of w/o problems.

I didn't like RESET_RESUME because runtime PM would not work on the quirked
device. But if the Set-Port-Feature(suspend) can't be handled and
skipped, I can't
expect the runtime PM to work for all devices connected to the hub either.
Is that right? If what I proposed in the patch can not get better
result than existing
quirk, I think using the RESET_RESUME would be a better option. Any suggestions?

Chris
