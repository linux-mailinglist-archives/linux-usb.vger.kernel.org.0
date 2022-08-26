Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8066A5A2A02
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 16:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiHZOuP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 10:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiHZOuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 10:50:14 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C2F6B97D50
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 07:50:12 -0700 (PDT)
Received: (qmail 39984 invoked by uid 1000); 26 Aug 2022 10:50:12 -0400
Date:   Fri, 26 Aug 2022 10:50:12 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YwjdpHEfnDaP1w5e@rowland.harvard.edu>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
 <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
 <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
 <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
 <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
 <febf579a-6451-1dc6-b583-0ba1a76344a6@samsung.com>
 <YvUo7ukc8xKxKLZt@rowland.harvard.edu>
 <d174d0cc-464d-7ae0-35e8-bb78c35eac22@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d174d0cc-464d-7ae0-35e8-bb78c35eac22@samsung.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 26, 2022 at 08:30:50AM +0200, Marek Szyprowski wrote:
> On 11.08.2022 18:06, Alan Stern wrote:
> > On Thu, Aug 11, 2022 at 09:31:34AM +0200, Marek Szyprowski wrote:
> >> On 10.08.2022 21:33, Alan Stern wrote:
> >>> On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
> >>>> On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
> >>>>> This patch landed recently in linux-next as commit 2191c00855b0 ("USB:
> >>>>> gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it
> >>>>> fixes the issue by introducing another one. It doesn't look very
> >>>>> probable, but it would be nice to fix it to make the lock dependency
> >>>>> checker happy.
> >>>> Indeed.
> >>>> I suspect the problem is that udc_lock is held for too long.  Probably it
> >>>> should be released during the calls to udc->driver->bind and
> >>>> udc->driver->unbind.
> >>>>
> >>>> Getting this right will require some careful study.  Marek, if I send you
> >>>> a patch later, will you be able to test it?
> >>> Here's a patch for you to try, when you have the chance.  It reduces the
> >>> scope of udc_lock to cover only the fields it's supposed to protect and
> >>> changes the locking in a few other places.
> >>>
> >>> There's still the possibility of a locking cycle, because udc_lock is
> >>> held in the ->disconnect pathway.  It's very hard to know whether that
> >>> might cause any trouble; it depends on how the function drivers handle
> >>> disconnections.
> >> It looks this fixed the issue I've reported. I've checked it on all my
> >> test systems and none reported any issue related to the udc.
> >>
> >> Feel free to add:
> >>
> >> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>
> >> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Thanks for the quick testing.  I'll submit the patch when the current
> > merge window ends.
> 
> Gentle ping for the final patch...

On its way.  It turns out that the hardest part of this patch is writing 
up the descriptions and justifications in the Changelog.  :-(

(Part of the reason for the delay is that I usually wait until the -rc2 
or -rc3 release before starting to work on a new kernel version...)

I think in the end there is more work still to do.  In particular, the 
gadget core doesn't seem to be careful about not connecting (i.e., not 
turning on the D+ pullup) when no driver is bound to the gadget.  Those 
actions need to be synchronized somehow.

Alan Stern
