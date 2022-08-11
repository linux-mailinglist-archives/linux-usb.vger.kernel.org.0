Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1525903AB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Aug 2022 18:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238117AbiHKQZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Aug 2022 12:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237714AbiHKQY0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Aug 2022 12:24:26 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D04F31AF25
        for <linux-usb@vger.kernel.org>; Thu, 11 Aug 2022 09:06:07 -0700 (PDT)
Received: (qmail 8212 invoked by uid 1000); 11 Aug 2022 12:06:06 -0400
Date:   Thu, 11 Aug 2022 12:06:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YvUo7ukc8xKxKLZt@rowland.harvard.edu>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
 <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
 <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
 <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
 <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
 <febf579a-6451-1dc6-b583-0ba1a76344a6@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <febf579a-6451-1dc6-b583-0ba1a76344a6@samsung.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 11, 2022 at 09:31:34AM +0200, Marek Szyprowski wrote:
> Hi Alan,
> 
> On 10.08.2022 21:33, Alan Stern wrote:
> > On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
> >> On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
> >>> This patch landed recently in linux-next as commit 2191c00855b0 ("USB:
> >>> gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it
> >>> fixes the issue by introducing another one. It doesn't look very
> >>> probable, but it would be nice to fix it to make the lock dependency
> >>> checker happy.
> >> Indeed.
> >> I suspect the problem is that udc_lock is held for too long.  Probably it
> >> should be released during the calls to udc->driver->bind and
> >> udc->driver->unbind.
> >>
> >> Getting this right will require some careful study.  Marek, if I send you
> >> a patch later, will you be able to test it?
> > Here's a patch for you to try, when you have the chance.  It reduces the
> > scope of udc_lock to cover only the fields it's supposed to protect and
> > changes the locking in a few other places.
> >
> > There's still the possibility of a locking cycle, because udc_lock is
> > held in the ->disconnect pathway.  It's very hard to know whether that
> > might cause any trouble; it depends on how the function drivers handle
> > disconnections.
> 
> It looks this fixed the issue I've reported. I've checked it on all my 
> test systems and none reported any issue related to the udc.
> 
> Feel free to add:
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for the quick testing.  I'll submit the patch when the current 
merge window ends.

Alan Stern
