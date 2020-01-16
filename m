Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2579D13ED24
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 19:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394930AbgAPSBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 13:01:14 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:39567 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394685AbgAPSBN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 13:01:13 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id DAF5E3C0579;
        Thu, 16 Jan 2020 19:01:10 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id q7C202YH4ZyQ; Thu, 16 Jan 2020 19:01:04 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AB6783C04C0;
        Thu, 16 Jan 2020 19:01:04 +0100 (CET)
Received: from lxhi-065.adit-jv.com (10.72.93.66) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 16 Jan
 2020 19:01:04 +0100
Date:   Thu, 16 Jan 2020 19:01:01 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     David Howells <dhowells@redhat.com>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: Do you have a sink for USB notifications?
Message-ID: <20200116180101.GA22765@lxhi-065.adit-jv.com>
References: <8232.1579184201@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8232.1579184201@warthog.procyon.org.uk>
X-Originating-IP: [10.72.93.66]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi David,

On Thu, Jan 16, 2020 at 02:16:41PM +0000, David Howells wrote:
> Hi Eugeniu, Spyridon,
> 
> Greg pointed me at your patch:
> 
> 	https://lore.kernel.org/lkml/20190605090556.17792-1-erosca@de.adit-jv.com/

I remember this thread.

> Do you have a consumer program for USB notification events? 

As you might expect, looking at the above patch, we are using
'udevadm monitor' in the development environment. The end user is
making sense of the notifications either via udev daemon or via
a custom libudev-linked application.

> I'm would like to
> get my general notification queue patches upstream in this merge window, but
> it appears that Linus would like there to be userspace consumers first.
> 
> My latest patch set is here:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=notifications-pipe-core
> 
> This provides access to keyring, usb and block device notifications.

It's great to see new and creative solutions being proposed in upstream,
especially if those attempt improving system reliability, robustness and
help standardizing the interfaces.

However, to be honest, I am concerned of below:
 - The amount of code [*] I have to compile/link to enable the feature
   (as opposed to ~15 lines of *.c code in the aforementioned patch)
 - No active users
 - No readily available userspace applications to handle the events
 - No complaints from the customers w.r.t. udevd/libudev (no secret, 
   this is what most of the times funds our work and drives the
   industry forward)

I am still ready to offer any help, if needed. TIA!

> 
> Thanks,
> David
> 

[*] git diff --shortstat v5.5-rc3..linux-fs/notifications-pipe-core
    63 files changed, 2505 insertions(+), 106 deletions(-)

-- 
Best Regards,
Eugeniu
