Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172281E8914
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 22:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgE2Uou (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 16:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgE2Uou (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 16:44:50 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C8FC03E969
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 13:44:49 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id u15so647512vkk.6
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 13:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fWa0+HLWvK3e0bODNo242BKakZe5J2NYfLM0QmZHS/o=;
        b=JGq+X7E9A7cL1/8RH+/sq1bVonoUPDl8kY3V+J/7gAZ9m2xfLXdNwcIL8tvxu2ZNn6
         0lnLDozaNC1JILknIriB21prWnZDQ1obQtwP7JlQqcZFbKpy7bmZiD2Cqkv/VFcqEGF+
         LIbHI305vgd8VRGSu7Q4ViqlWTCz6cMh0EJh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fWa0+HLWvK3e0bODNo242BKakZe5J2NYfLM0QmZHS/o=;
        b=uUMlkfA2DJN9ygHXCSb99mgCaxmCp8dRdUGrLDik0RR2JFlQ7yu60tbXMfw8sqNWp/
         8056wSiCl9PgFYqTDk8WyD943VGOBpwadsUEs5yMJDfhsyUGzRauJxRnP67lda33aehE
         syq76h1zr/nnwnd/QrGRnx1fVSk1e9uWlq+jRr2F5H1O9EI1su6uyH46WCNy5dCykVct
         bPNi27XIbxpLAmwSyMbbNbcT9njjApH8VQe4U9f+Smbg00c+lzYvRaqDy1d+ht1K2wUy
         SyVak73G767h9BGIKHGl2aFKxi6y1fp+FT2HJn/9Ap3gkN5oEBdYmpTYNf6lWnfn+0Tv
         ygxg==
X-Gm-Message-State: AOAM532M1qrW7ezAGvqOD1EUzrBeYtRnYZIbKrRd4QTsBgGCjFrJGbD3
        u6FZot7jkNWr/Y5AcquranCrl7OYQhBiCC2ANNWL8g==
X-Google-Smtp-Source: ABdhPJyOA3FmluwZauqPVOsDxYj6lmgBYLTLx3xZOv9HVDhCNHqkEyAMowp7L/iXFOElKfZZ4sAPL6pnEq1Rldp3Yw4=
X-Received: by 2002:a1f:430a:: with SMTP id q10mr6277098vka.4.1590785088483;
 Fri, 29 May 2020 13:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
 <20200529081243.GA827304@kroah.com>
In-Reply-To: <20200529081243.GA827304@kroah.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Fri, 29 May 2020 13:44:37 -0700
Message-ID: <CAODwPW9=h5wXsFDwWiZcpCBkhxiJ=QJyo5hGHVUcgBL3Q9AxSQ@mail.gmail.com>
Subject: Re: Splitting 1 USB port between 2 devices
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alexandru M Stan <amstan@chromium.org>,
        USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > My question here is: is this legal as far as Linux is concerned? Can 2
> > devices be enumerated under one physical port (even though we're
> > talking about separate usb2.0 and 3.0 bus topologies).
>
> Is it "legal" as far as the USB spec is concerned?  I would try to
> answer that first before worrying about if Linux can handle it or not :)

I don't think the question gets specifically addressed. It does at
least say this: 'A USB hub is the logical combination of two hubs: a
USB 2.0 hub and an Enhanced SuperSpeed hub. Each hub operates
independently on a separate data bus. Typically, the only signal
shared logic between them is to control VBUS.'

> > Is there any weird port reset interaction that might be annoying here?
> > I wouldn't want a reset on the usb 2.0 device to affect the 3.0
> > device.
>
> Which is why I don't think the hub would like this type of
> configuration, as who controls the power connections?  What happens if
> one device is suspended and the other isn't?

USB 3.2 spec also says: 'If either the USB 2.0 hub or Enhanced
SuperSpeed hub controllers requires a downstream port to be powered,
power is turned on for the port.'

Note that since we're talking internal devices only here, the hub
usually doesn't actually supply VBUS to the device anyway. Port power
controls should only matter for whether the port is logically turned
on or not. Suspend signalling uses the data pins so the expectation is
that it should be possible separately for the USB 3.0 and USB 2.0 side
(after all, when you suspend a 3.0 hub, you also suspend both halves
separately -- right?).

Of course since hub manufacturers probably don't expect this use case,
every hub you'd want to do this with would always have to be carefully
tested first. I think the main question here is whether Linux
architecturally assumes that every port on a 3.0 hub *needs* to have a
corresponding 2.0 port and they can't both be used for separate
devices, or whether it's going to add assumptions like that at some
point in the future. Like Alex said, running this seems to work fine
on Linux 5.4 right now. The question is just whether we can expect it
to stay that way and can consider this an allowed use case in Linux
(as long as the hardware supports it) -- i.e. if other changes get
added later that break this in software, could we submit fixes for
this use case or would we be told that device configurations like this
just aren't allowed in the first place?
