Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF4961D962
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 11:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiKEK2l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 06:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKEK2k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 06:28:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0670027CED
        for <linux-usb@vger.kernel.org>; Sat,  5 Nov 2022 03:28:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C29260AC7
        for <linux-usb@vger.kernel.org>; Sat,  5 Nov 2022 10:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57966C433D6;
        Sat,  5 Nov 2022 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667644118;
        bh=GN97Kw1uGyzyWNhKvb9z7TnY6FZ+U+AtnFxOCK03J1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EQp6l59nPIyAvhL64cGdk4UDez/Mjo6ORl3/3/UzzlRRYNxP7GgIURkG6Z/R2iyGH
         DiwR6eWdtaIhofeuVZ+bg1iKnHVkukfYzcI1fpWHtT/8XfFAKT0JoQOC3bEzvDpvQT
         C5kEPlH2GgmqnoHqIpE2DM7+6YpIZca9L9ToqNmg=
Date:   Sat, 5 Nov 2022 11:28:35 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Albert Zhou <albert.zhou.50@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] Update R8152 module to v2 obtained from the
 Realtek website, included in a comment in r8152.c. The only other
 modification to r8152.c is amending netif_napi_add, see comment for
 explanation.
Message-ID: <Y2Y606QMyZRErKA4@kroah.com>
References: <20221104132526.64530-1-albert.zhou.50@gmail.com>
 <20221104132526.64530-3-albert.zhou.50@gmail.com>
 <Y2UkZpD+xeShM+jc@kroah.com>
 <98df4ca9-082c-ca31-a72a-5fbd62f26d9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98df4ca9-082c-ca31-a72a-5fbd62f26d9a@gmail.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 05, 2022 at 08:46:25PM +1100, Albert Zhou wrote:
> Hi Greg,

Hi!

Some meta-comments, please don't top-post and try line-wrapping your
emails at 72 columns to make it easier to respond properly.  See the
mailing list archives for examples.

> I realised several things. Firstly, when I initially contacted you, it was simply based on looking up who maintained drivers/net/usb in the MAINTAINERS file, however when running scripts/get_maintainer.pl, I realise that there are many other people who maintain drivers/net/usb/r8152.c. Should I include them in future submissions? Or should I just stick to you for now?

Yes, include everyone that get_maintainer.pl tells you to, that's what
it is there for.

> Secondly, running scripts/checkpatch.pl on Realtek's code gives many warnings and errors. E.g. the code is written to be compatible
> for old versions of the kernel, whereas checkpatch.pl insists that each kernel version should have dedicated code for itself.

And that's not needed for in-kernel drivers at all, which is why it is
complaining.  You should remove all of that compatibility cruft as it
just clutters up the code and is not needed for obvious reasons.

> I am hesitant to edit the original code more than I already have, but if necessary, I can make another patch when I resubmit to iron out all the trivial style issues. However I may need some guidance, e.g. on the use of the volatile keyword; since I am not the original developer, it will be difficult for met to judge whether its usage is critical for the code.

Look at how it is being used and see if it is required.  For a USB
driver, volitile should never be used as it makes no sense at all,
right?

> Thirdly, if I do remove all of the macros for backwards compatibility, (# if LINUX_VERSION_CODE >= KERNEL_VERSION(a,b,c)), it will be difficult for distros like Ubuntu to incorporate the updated module into their older kernels.  How can the version-two module also be included in the other stable/longerm kernels?

We do kernel development for the latest release only.  If distros want
to backport things, that's up to them to do on their own.  For
stable/long term kernels, see the stable documentation for what is a
valid acceptable change (hint, bug fixes and quirks and device ids only,
not new features or new drivers.)

So all of that code for old kernels needs to be removed.  Do that and
you will end up with a much smaller and actually maintable codebase, so
that's a good thing to do.

hope this helps,

greg k-h
