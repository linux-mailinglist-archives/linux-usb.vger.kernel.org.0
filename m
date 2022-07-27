Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C51582637
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 14:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbiG0MRS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jul 2022 08:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiG0MRQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jul 2022 08:17:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7261E48CBE
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 05:17:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34AD9B82049
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 12:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB65C433D6;
        Wed, 27 Jul 2022 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658924233;
        bh=nFnFY0DspxKWuoD+PgsNRVfsc5CEHnKnrb9+nYCKhQo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FujG9sFgoxJLU5KuoaLvVbBYtvSoWlfuTvx3FIsgA7U3Sv3N6t0mVbdmlS4ySn2/H
         gQwJYjKyUPFMxTtof+XW4nz0NXdB/c0f/Cyqr+tDBiJAhtYpt3I/Z3nlwUEgGj7tfB
         rmaUvfh27lP/ZVqvER+SbpbDCc/S8rWjiSuy3S8g=
Date:   Wed, 27 Jul 2022 14:17:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YuEsxV+qTEqiE38N@kroah.com>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtlrnhHyrHsSky9m@rowland.harvard.edu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 21, 2022 at 11:07:10AM -0400, Alan Stern wrote:
> The syzbot fuzzer found a race between uevent callbacks and gadget
> driver unregistration that can cause a use-after-free bug:
> 
> ---------------------------------------------------------------
> BUG: KASAN: use-after-free in usb_udc_uevent+0x11f/0x130
> drivers/usb/gadget/udc/core.c:1732
> Read of size 8 at addr ffff888078ce2050 by task udevd/2968
> 
> CPU: 1 PID: 2968 Comm: udevd Not tainted 5.19.0-rc4-next-20220628-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google
> 06/29/2022
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
>  print_address_description mm/kasan/report.c:317 [inline]
>  print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
>  kasan_report+0xbe/0x1f0 mm/kasan/report.c:495
>  usb_udc_uevent+0x11f/0x130 drivers/usb/gadget/udc/core.c:1732
>  dev_uevent+0x290/0x770 drivers/base/core.c:2424
> ---------------------------------------------------------------
> 
> The bug occurs because usb_udc_uevent() dereferences udc->driver but
> does so without acquiring the udc_lock mutex, which protects this
> field.  If the gadget driver is unbound from the udc concurrently with
> uevent processing, the driver structure may be accessed after it has
> been deallocated.
> 
> To prevent the race, we make sure that the routine holds the mutex
> around the racing accesses.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+b0de012ceb1e2a97891b@syzkaller.appspotmail.com
> CC: stable@vger.kernel.org
> Link: <https://lore.kernel.org/all/0000000000004de90405a719c951@google.com>
> 
> ---
> 
> As far as I can tell, this bug has always been present.  However, the
> udc_lock mutex used by the patch was added in commit fc274c1e9973
> ("USB: gadget: Add a new bus for gadgets"), so this patch won't apply
> to trees which don't include that commit or a backport of it.  I don't
> know what tag, if any, can express this requirement.

As per the stable_kernel_rules document, you can say:
	cc: stable@vger.kernel.org	# fc274c1e9973

and I should hopefully figure it out :)

I'll add that here and see how well it works...

thanks,

greg k-h
