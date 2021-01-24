Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9FA3018F5
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 00:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbhAWXjF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Jan 2021 18:39:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbhAWXjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jan 2021 18:39:01 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FBCC061786
        for <linux-usb@vger.kernel.org>; Sat, 23 Jan 2021 15:38:21 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id o5so2369146oop.12
        for <linux-usb@vger.kernel.org>; Sat, 23 Jan 2021 15:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=Rlm8XFphD/t2Gle5s8Hwr/AAQgG7hLV82Tqn2NZu6Qg=;
        b=XJqrNgty2eyGWWlLQczKmvOzhfipC+EHiAo88rz+txoH8wuDzBLSGWl+e9Pzvco27P
         7YWaj3kJ5CbLthO2hM0+G+/lilTXKAObwW1iIhC7VsNFpj0BP4EVpBJe7enRXx8+PZ1k
         Ws8N6osNrrudSSRCQg/9W0JZeTDTIW43M3l6XZLXpIGEBVArhZuWvWfWTTCQmhkOG0SJ
         GCrqwF6QgK6a/iGq5SYjew922q9HsjmshqoKEfQ9MbAHiCjr22Pe2CeIq68bBeHXClte
         xd+r0s6feiHuiGP/XH2PnNzqSUjfQuw6Ecz86UYKfp0xWxk0g2jjgqUAx9Cz9I/pXwz4
         sxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=Rlm8XFphD/t2Gle5s8Hwr/AAQgG7hLV82Tqn2NZu6Qg=;
        b=c1OAXQ0TUBNYtX5AWI2h4j7kTfSYDwsxKH3aTAqTZD7sNL8ZWnxKbO6fuZnAbuUIaQ
         pKa2MpcCXs0jGOFeMkup2qve5QGoCha/OErDjGuvevg4mcR+TvGeIlX/jFbpmc+fpAtO
         1tTrq7aZnFPO0k8/HOy7Q4UcfGDREzzNRshKJTVRs9nlylLBmtgjK9PdFQYi/lCI6eyL
         KqxZ3EbykD07398gQ/xJ6zrI1NBlz4yNAe941ABgN0AZD4LkU8xNxtbyPQckaKCg9i4Y
         eVH+CAhxau0CFo6I4J/GLWOycy5AK+T/cHes1DT4xM2keKWX2wiqDZIDCoQ3aTacsyGr
         mtTw==
X-Gm-Message-State: AOAM533C+dbx/BLbc0QC65jnvg4EolNatkFUNsCrqW0sSEpi30RXrTCK
        Mj03qzLsaG04WKiApO8wHFx8ng==
X-Google-Smtp-Source: ABdhPJzGCIfzd8HXcNQwj27/oNpGJb66WYTWgBcl8ogRLmWoXxHlkgNqiRzMdypcuJ2Yb//kU6U1YA==
X-Received: by 2002:a4a:81:: with SMTP id 123mr8283884ooh.46.1611445100271;
        Sat, 23 Jan 2021 15:38:20 -0800 (PST)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id t16sm2583775otq.17.2021.01.23.15.38.18
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Sat, 23 Jan 2021 15:38:19 -0800 (PST)
Date:   Sat, 23 Jan 2021 15:37:30 -0800 (PST)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>, Thierry Reding <treding@nvidia.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-pm@vger.kernel.org
Subject: Re: Infinite recursion in device_reorder_to_tail() due to circular
 device links
In-Reply-To: <X/3kveeVrb35qsvb@kroah.com>
Message-ID: <alpine.LSU.2.11.2101231524290.1540@eggly.anvils>
References: <X/ycQpu7NIGI969v@gerhold.net> <CAJZ5v0gAsZ45O8mv-gz0UvbyxnKA6fQBYvambBYEH6OSk3-m3g@mail.gmail.com> <X/3kveeVrb35qsvb@kroah.com>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 12 Jan 2021, Greg Kroah-Hartman wrote:
> On Tue, Jan 12, 2021 at 03:32:04PM +0100, Rafael J. Wysocki wrote:
> > On Mon, Jan 11, 2021 at 7:46 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > Hi,
> > >
> > > since 5.11-rc1 I get kernel crashes with infinite recursion in
> > > device_reorder_to_tail() in some situations... It's a bit complicated to
> > > explain so I want to apologize in advance for the long mail. :)
> > >
> > >   Kernel panic - not syncing: kernel stack overflow
> > >   CPU: 1 PID: 33 Comm: kworker/1:1 Not tainted 5.11.0-rc3 #1
> > >   Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > >   Call trace:
> > >    ...
> > >    device_reorder_to_tail+0x4c/0xf0
> > >    device_reorder_to_tail+0x98/0xf0
> > >    device_reorder_to_tail+0x60/0xf0
> > >    device_reorder_to_tail+0x60/0xf0
> > >    device_reorder_to_tail+0x60/0xf0
> > >    ...
> > >
> > > The crash happens only in 5.11 with commit 5b6164d3465f ("driver core:
> > > Reorder devices on successful probe"). It stops happening when I revert
> > > this commit.
> > 
> > Thanks for the report!
> > 
> > Greg, please revert commit 5b6164d3465f, it clearly is not an
> > improvement, at least at this point.
> 
> Now reverted, thanks.
> 
> greg k-h

I think that there has been a misunderstanding here: although
5b6164d3465f ("driver core: Reorder devices on successful probe")
has been reverted from linux-next (thank you), it has not yet been
reverted from 5.11-rc, and still causing problems there (in my case,
not the infinite recursion Stephan reported in this thread, but the
ThinkPad rmi4 suspend failure that I reported in another thread).

Thanks,
Hugh
