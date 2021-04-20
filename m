Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C76365301
	for <lists+linux-usb@lfdr.de>; Tue, 20 Apr 2021 09:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhDTHPl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Apr 2021 03:15:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60115 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhDTHPk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Apr 2021 03:15:40 -0400
Received: from mail-oo1-f72.google.com ([209.85.161.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lYkbE-0006Za-Sr
        for linux-usb@vger.kernel.org; Tue, 20 Apr 2021 07:15:09 +0000
Received: by mail-oo1-f72.google.com with SMTP id e18-20020a0568200612b02901ec8fefe582so2634398oow.22
        for <linux-usb@vger.kernel.org>; Tue, 20 Apr 2021 00:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Vm9HqK4VJCno1i00etpWVnJOPPZ+kUNXIeSp6fgK58=;
        b=lPlXOWY0gCZNGQEvicERl8PvC6Y7LDEWXCT+RdfO/330z9pBD8Z76GgzK0BqOmCw6o
         4qFJblCbayuMtqMpZ2k8w3OMGUihP7u0s8y9+rMqescEo9LYVpMEbBblhwf+ENIZI8x2
         vdqhNlmya8b5gowoPBzNBvY7MqFPPep5sl9LI8x53c72oDT0CEm9v8jwq/knlyejS6II
         jr1pUT22hiXk5MxMvvfyQGfDcvuFhu+naQlQXwPh/4L9OcfZUx3jI4vU3OC/N2685grr
         Y3P8GhN44h5hcE9Tut5ZT17/9Sjpe6mIzl62LfgXXWa11A4Nt/Cx2shrGVuZcujFW57H
         qgnA==
X-Gm-Message-State: AOAM533h6nnYr43m3PXKVO/J5MgIgRLHh/WWF4tMNeyb+rTGfR4nBs8u
        BeG9Ri3uWNtgYKv4uuzFcAUbBiPKB8Ip8w212hzeMrqj4Hls26LRP8MbjS1ZLaoxv7p0iWnyNaT
        shQCpF9SyZsFlRtQzcnRClp6RQfelwdw1JZkV+Y27RIcZC+eNOQlzDg==
X-Received: by 2002:aca:4a97:: with SMTP id x145mr2019003oia.177.1618902907785;
        Tue, 20 Apr 2021 00:15:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzEj3KUQVzC+qNXGRSob3MUa5ih59s+TNG7jqZK7XLXFlzb7PYwJ6db2WySV7+GM+Xt/LEV/vTQFvgD4k30pU=
X-Received: by 2002:aca:4a97:: with SMTP id x145mr2018989oia.177.1618902907623;
 Tue, 20 Apr 2021 00:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210415114856.4555-1-chris.chiu@canonical.com>
 <YHgyP8tGNM1Wi5dJ@kroah.com> <CABTNMG0MuaSkWZhiTwtWjPTg5WZ-Vdt9Ju9-RzBke9JjCBJo8Q@mail.gmail.com>
 <20210415184637.GA15445@rowland.harvard.edu> <CABTNMG3aweq43eQcONif2_M4JF3ARmBgOKE18v7vzHvaJnjrtA@mail.gmail.com>
 <20210416153932.GD42403@rowland.harvard.edu> <CABTNMG25qPvVu7+EsvEgaUsU_v6jKkSKCaU5VR8CiX3oLQ4VFg@mail.gmail.com>
 <20210419141921.GA133494@rowland.harvard.edu>
In-Reply-To: <20210419141921.GA133494@rowland.harvard.edu>
From:   Chris Chiu <chris.chiu@canonical.com>
Date:   Tue, 20 Apr 2021 15:14:56 +0800
Message-ID: <CABTNMG0hnfXH8yqd6Zbk3EiZtg4JUpJomn180NHUyAdgZjL7pA@mail.gmail.com>
Subject: Re: [PATCH v3] USB: Don't set USB_PORT_FEAT_SUSPEND on WD19's Realtek Hub
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, m.v.b@runbox.com,
        hadess@hadess.net, linux-usb@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 19, 2021 at 10:19 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Apr 19, 2021 at 01:11:38AM -0400, Chris Chiu wrote:
> > Sorry that I didn't make myself clear. I found that if I applied RESET_RESUME
> > quirk on the problematic hub, the Set-Port-Feature(suspend) timeout error
> > disappeared. SInce the timeout is not happening for each suspend by default,
> > I suspect maybe reset-resume take everything back to clean state for the hub
> > and the Set-Port-Feature(suspend) can be taken care of w/o problems.
>
> Okay, that's a good solution for system suspend.
>
> > I didn't like RESET_RESUME because runtime PM would not work on the quirked
> > device.
>
> A more interesting question is whether it will work for devices plugged
> into the hub.  Even though the hub won't be runtime suspended, the
> things attached to it might be.
>
> >  But if the Set-Port-Feature(suspend) can't be handled and
> > skipped, I can't
> > expect the runtime PM to work for all devices connected to the hub either.
> > Is that right? If what I proposed in the patch can not get better
> > result than existing
> > quirk, I think using the RESET_RESUME would be a better option. Any suggestions?
>
> Try the RESET_RESUME quirk and see how well it works with runtime
> suspend.
>
> Alan Stern

[  453.064346] usb 3-4: finish reset-resume
[  453.192387] usb 3-4: reset high-speed USB device number 2 using xhci_hcd
[  453.339916] usb 3-4: USB quirks for this device: 2

Seems that even w/ the RESET_RESUME enabled, the connected device still
can runtime suspend/resume. That's acceptable to me. I'll send the patch
with the reset-resume quirk later.

[  626.081068] usb 3-4.3.1: usb auto-suspend, wakeup 0
[  632.552071] usb 3-4.3.1: usb auto-resume
[  632.617467] usb 3-4.3.1: Waited 0ms for CONNECT
[  632.617471] usb 3-4.3.1: finish resume

Chris
