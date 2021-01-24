Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6568C301E9D
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 21:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbhAXUHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jan 2021 15:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbhAXUHt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jan 2021 15:07:49 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C50C061574
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 12:07:08 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id s2so8557557otp.5
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 12:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=+wHtxvtC1jI/nW4txRp0ZVFK13xVD/e5tlgnnpJhrT4=;
        b=B/QLKbHQOWdsoFbigku1iPJMvRLlLy+1TmxPksBRa+/6POLJXMaf5d5r6YsgrPiEoo
         7EIQUKkWyEyYrAofrEJUMo5LgTxq9C5ggTi2ZUdomWqah2G2pILJ7/ZzL2SkQHFdnrnU
         KmJX5+7ArMjRrsVwmpma1f6kpwEADEHM5cZ8vJ2cubwQNRuO9FzRld5NVoZmLl1bx64/
         4+LvkXd1VFbh979akhsraEnpq25toxFpyGxoDBY2u5lI3qKDo1HcpCV6JHSMffFXw0AI
         ePvFODKlkCcezc/DrDPL8f1RU+Pn8RU3taLT+iHvlOl4kmH9hcTIBx9Y1iNSMzxrK1/Q
         RiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=+wHtxvtC1jI/nW4txRp0ZVFK13xVD/e5tlgnnpJhrT4=;
        b=LtyiJ9nmJJRKULQrsU4S0b8+Zo2v5aZOwOFQg5iLfKZU+/17flITzKeSz/3rrqKEmj
         I4ApYH6TkLoB5w+b9jRupMckEGX6HlDMPxeTQRe19E2qaJABzOAfQqYJFse1Bh91nNZ4
         bXR1z76V44I+rr5o+2z07NU770pL3n0vU/+W0MkojrKaX00fS7+BlKaCYim9eBbmZfu3
         EpPOqJ85oSNdvMvdjZt/Rfh/SwsrKGha+lT/ZjUrvVfH8mmTUGVfHRKgjFPpwzwyoRw+
         uDcu6I1IoicJBkeYiFCAgu1RsJkSkDKFkkJZ/2tz3ry7rAUjmbCl+Ry6WQtCkAAwKzb7
         OQJw==
X-Gm-Message-State: AOAM533DjXVRsauKsYbxXU8S0XcPG4NyNyBBYbet+i62T10jyGLMfLSc
        Gwp+gM/nnYqtGauZ/QP1kR+gxw==
X-Google-Smtp-Source: ABdhPJwkjeguUQQq8ExODbw+xBALYdofTAdvUgePeXABnj2QpaJq5Qo/5Rp/MaDPboyRQtCXP5fbNw==
X-Received: by 2002:a05:6830:2152:: with SMTP id r18mr10445402otd.296.1611518827927;
        Sun, 24 Jan 2021 12:07:07 -0800 (PST)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id k15sm3058068otp.10.2021.01.24.12.07.06
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Sun, 24 Jan 2021 12:07:07 -0800 (PST)
Date:   Sun, 24 Jan 2021 12:06:54 -0800 (PST)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Hugh Dickins <hughd@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>, Thierry Reding <treding@nvidia.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-pm@vger.kernel.org
Subject: Re: Infinite recursion in device_reorder_to_tail() due to circular
 device links
In-Reply-To: <YA0sOFj6VjQ8LUL2@kroah.com>
Message-ID: <alpine.LSU.2.11.2101241205190.2585@eggly.anvils>
References: <X/ycQpu7NIGI969v@gerhold.net> <CAJZ5v0gAsZ45O8mv-gz0UvbyxnKA6fQBYvambBYEH6OSk3-m3g@mail.gmail.com> <X/3kveeVrb35qsvb@kroah.com> <alpine.LSU.2.11.2101231524290.1540@eggly.anvils> <YA0sOFj6VjQ8LUL2@kroah.com>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 24 Jan 2021, Greg Kroah-Hartman wrote:
> On Sat, Jan 23, 2021 at 03:37:30PM -0800, Hugh Dickins wrote:
> > On Tue, 12 Jan 2021, Greg Kroah-Hartman wrote:
> > > On Tue, Jan 12, 2021 at 03:32:04PM +0100, Rafael J. Wysocki wrote:
> > > > On Mon, Jan 11, 2021 at 7:46 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > since 5.11-rc1 I get kernel crashes with infinite recursion in
> > > > > device_reorder_to_tail() in some situations... It's a bit complicated to
> > > > > explain so I want to apologize in advance for the long mail. :)
> > > > >
> > > > >   Kernel panic - not syncing: kernel stack overflow
> > > > >   CPU: 1 PID: 33 Comm: kworker/1:1 Not tainted 5.11.0-rc3 #1
> > > > >   Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > > > >   Call trace:
> > > > >    ...
> > > > >    device_reorder_to_tail+0x4c/0xf0
> > > > >    device_reorder_to_tail+0x98/0xf0
> > > > >    device_reorder_to_tail+0x60/0xf0
> > > > >    device_reorder_to_tail+0x60/0xf0
> > > > >    device_reorder_to_tail+0x60/0xf0
> > > > >    ...
> > > > >
> > > > > The crash happens only in 5.11 with commit 5b6164d3465f ("driver core:
> > > > > Reorder devices on successful probe"). It stops happening when I revert
> > > > > this commit.
> > > > 
> > > > Thanks for the report!
> > > > 
> > > > Greg, please revert commit 5b6164d3465f, it clearly is not an
> > > > improvement, at least at this point.
> > > 
> > > Now reverted, thanks.
> > > 
> > > greg k-h
> > 
> > I think that there has been a misunderstanding here: although
> > 5b6164d3465f ("driver core: Reorder devices on successful probe")
> > has been reverted from linux-next (thank you), it has not yet been
> > reverted from 5.11-rc, and still causing problems there (in my case,
> > not the infinite recursion Stephan reported in this thread, but the
> > ThinkPad rmi4 suspend failure that I reported in another thread).
> 
> It will be sent to Linus in a few hours, thanks, so should show up in
> 5.11-rc5.  I had other patches to go along with this to send him at the
> same time :)

And indeed it's now in, thanks Greg: I'm sorry for being importunate,
the misunderstanding was mine.

Hugh
